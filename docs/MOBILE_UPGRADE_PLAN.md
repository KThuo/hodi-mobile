# Bringing the mobile app onto the new HODI

The app in this repository talks to the **legacy** backend. Every request it makes goes to
`/api/*`, and the platform it was written against no longer exists in that shape. This is the plan
for moving it onto `hodi-b`/`hodi-f` — what survives, what has to be rewritten, and the handful of
decisions that need an answer before the work is worth starting.

Written after reading the app (173 Dart files, ~28,000 lines) and the new backend's 46 controllers.
Figures here were counted, not estimated.

---

## 0. The move — done

`Personal/hodi-mobile` → `new-hodi/hodi-m`, moved rather than copied, so it is the same working tree
and the same `.git`. `origin` still points at `git@github.com:KThuo/hodi-mobile.git`, the branch is
still `master`, and the two uncommitted files came with it.

Stale build output was removed after the move (`build/`, `.dart_tool/`, `.idea/`, `hodi_mobile.iml`
all carried the old absolute path). `flutter pub get` then `flutter analyze` runs clean — two
`use_null_aware_elements` infos in `metre_repository.dart`, nothing else.

**The GitHub repository is still named `hodi-mobile`.** Renaming it there is a separate decision;
the directory name and the remote need not agree, and nothing here depends on it.

---

## 1. What survives

More than you would expect. The app is not a rewrite candidate — it is a well-structured Riverpod
app, and three things about it line up with the new platform almost exactly:

| Thing | Why it survives |
|---|---|
| **The response envelope** | `{status, message, data}` with `'00'` for success. `ResponseModel` in the new backend is the same shape with the same code. `ApiResponse` needs no change. |
| **The permission convention** | `ROLE_<MODULE>_<ACTION>` strings, gated in the UI by `PermissionGate`. The new backend uses the same convention — the *names* changed, not the mechanism. |
| **The architecture** | Riverpod 3 + go_router 17 + Dio 5 + freezed, feature-first directories, repository per feature. This is the shape the work wants; keep it. |

Also worth keeping as-is: biometric unlock, the refresh-token interceptor, code obfuscation in
`scripts/build.sh`, and the `String.fromEnvironment` build-time configuration that `build.sh`
already injects.

---

## 2. What breaks

### 2.1 Every endpoint

The app names ~40 endpoints in `lib/core/api/api_constants.dart`, all under `/api`. The new backend
serves `/api/v1` and reorganised the nouns. A sample of the renames:

| Mobile calls | New backend |
|---|---|
| `/api/login`, `/api/refresh-token` | `/api/v1/auth/login`, `/api/v1/auth/refresh` |
| `/api/houses`, `/api/my-houses` | `/api/v1/units`, `/api/v1/occupations` |
| `/api/metres/update-reading` | `/api/v1/meters/{id}/readings` |
| `/api/real-estates/all` | `/api/v1/estates` |
| `/api/vacant-houses` | `/api/v1/vacant-units` |
| `/api/estate/payment-types/...` | `/api/v1/payment-types` |

Note `metres` → `meters` in the path while the *permission* stayed `ROLE_METRE_*`. That
inconsistency is the new backend's, and it is a trap worth writing down once rather than discovering
three times.

### 2.2 Every permission string but one

Of the 26 `ROLE_*` constants in `lib/core/permissions/app_permissions.dart`, **25 do not exist in
the new backend.** The rename is mechanical — plural module, singular module:

`ROLE_PROPERTIES_*` → `ROLE_PROPERTY_*` · `ROLE_HOUSES_*` → `ROLE_HOUSE_*` ·
`ROLE_METRES_*` → `ROLE_METRE_*` · `ROLE_TENANTS_*` → `ROLE_TENANT_*` ·
`ROLE_PAYMENTS_*` → `ROLE_PAYMENT_*` · `ROLE_EXPENSES_*` and `ROLE_EXPENDITURES_VIEW` →
`ROLE_EXPENSE_VIEW` · `ROLE_REPORTS_VIEW` → `ROLE_REPORT_VIEW` ·
`ROLE_VACATE_NOTICES_VIEW` → `ROLE_VACATE_VIEW` · `ROLE_ESTATES_VIEW` → `ROLE_ESTATE_VIEW`

`ROLE_DASHBOARD_VIEW` is the only one that still matches. `ROLE_TENANT_ACCESS_{VIEW,NEW,DELETE}`
collapses to a single `ROLE_TENANT_ACCESS`.

**This is the most dangerous item in the document**, because it fails silently. A gate testing an
authority nobody holds hides its screen; the app does not error, it just quietly has no features.
Fix it with a test that asserts every constant in `AppPermissions` appears in the backend's
catalogue, so the next rename is caught by CI rather than by a caretaker.

### 2.3 Identifiers are no longer integers

The new backend encodes ids with `HashIds`, **salted per user** (`username + suffix`). Models
holding `int id` need `String id`, and nothing may do arithmetic on, sort by, or cache across users
on an id. Anywhere the app builds a URL from an id, the hash is what goes in.

### 2.4 Meter photos have nowhere to go

`ReadingRequest` in the new backend (`UtilityModels.java:157`) carries `currentReading`,
`periodMonth`, `periodYear` and `note`. **There is no image field.** The legacy API took a base64
string; the new one does not accept one at all.

This is a real gap. The photo is evidence and has to be stored, so `hodi-b` needs a nullable
`asset_id` on `meter_readings`, a `hasPhoto` flag on the row, and two endpoints — one to receive the
upload, one to serve it back. See §4.

---

## 3. Phases

Ordered so that each phase leaves the app buildable and testable.

**Phase 1 — the contract layer.** `api_constants.dart`, the Dio client, the auth interceptor, the
id type, and `AppPermissions`. Nothing else compiles correctly until this is right, and it is the
phase that benefits most from being done once, carefully.

**Phase 2 — feature by feature.** Dashboard → invoices → payments → meters → tenants → properties/
units → vacate notices. Each is a repository, a set of freezed models and its screens. Take them one
at a time against a running `hodi-b`, not in a big bang.

**Phase 3 — the meter photo.** §4.

**Phase 4 — To Let, Stays and maps.** §5.

**Phase 5 — the look.** §6.

---

## 4. The meter photo (requirement 3)

**The photo is evidence.** It is captured so that a landlord and a tenant can both look at the dial
afterwards and agree about what it said. OCR is only how the number gets typed for you — the number
is corrected by hand when recognition is wrong, and the photograph is what settles the argument the
correction might later cause. Legacy showed it on the web from a meter's history, and that capability
comes across.

So the photo is stored, and the work is making that cheap rather than avoiding it.

### What it costs now

`update_reading_sheet.dart:45` captures at 1024x1024 quality 70, runs ML Kit OCR and `base64Encode`
in parallel, holds the result in a `String`, and posts it inside the JSON body. Legacy then handed it
back the same way — `GET /api/metres/reading-image/{historyId}` returned base64 inside the
`ResponseModel` envelope (`MetreImage.vue:49`). Base64 on the way up and base64 on the way down.

Three costs, none of which the evidence requirement actually needs:

- **33% on the wire, twice.** A 300KB photo is ~400KB of string going up and ~400KB coming back, and
  JSON-escaped on top.
- **Three copies in memory at once** — file bytes, ML Kit input, and the base64 `String`. On a cheap
  Android handset this is where the app is killed.
- **The reading and the photo are welded into one request.** A bad signal in a stairwell loses the
  reading because the photo did not make it, and there is no retry that keeps the number.

### The design

**1. The reading posts alone, first.** `POST /api/v1/meters/{id}/readings` is a few hundred bytes and
survives a weak signal. It returns the reading's id.

**2. The photo follows as multipart**, to a new `POST /api/v1/meters/readings/{id}/photo` — raw
bytes, no base64 tax, streamed from disk rather than held as a `String`. If it fails, the *photo*
retries; the reading is already safe. This ordering is deliberate: photo-first would orphan assets
whenever somebody abandons the sheet.

**3. Storage already exists and should not be reinvented.** `AssetService.storePhoto()` does the
whole job — a 4MB ceiling with a sentence explaining it, magic-byte checking against the declared
type, SHA-256 content addressing and deduplication. A `METER_READING` kind and a nullable `asset_id`
on `meter_readings` is the entire schema change.

**4. The list says whether there is one; it does not carry it.** Add `hasPhoto` to `ReadingRow`.
Legacy got this right with `imageStatus` — the eye icon appears only when there is something to look
at, and nothing is fetched until somebody asks. A history of twenty readings must not drag twenty
photographs with it.

**5. Viewing streams bytes from a scoped endpoint**, not base64 from a JSON one:
`GET /api/v1/meters/readings/{id}/photo`. That gives HTTP caching for free — the asset store already
serves immutable, year-long `Cache-Control` because the key is the content hash — so the web
lightbox and the mobile viewer both re-open instantly. It must be its own endpoint rather than
`/api/v1/assets/{sha256}`: that path is deliberately *not* public, and `ListingImageController`
exists for exactly this reason — "making that path public would publish every asset".

**6. Capture stays legible.** Evidence that cannot be read is not evidence, so the current 1024px /
quality 70 stays. (An earlier draft of this plan suggested shrinking it further; that was written
when the photo was assumed disposable and is wrong now.) What can still go is the base64 step, which
is the expensive part.

### Where it is viewed

| | Entry point | Behaviour |
|---|---|---|
| **Mobile** | The reading row in meter history | Tap to open full-screen, pinch to zoom |
| **Web** (`hodi-f`) | The reading row in meter history | Click to open a lightbox — legacy's eye icon and modal |

### One decided, one to decide

**Tenant access is not currently possible.** The seeded `Tenants` group holds ten authorities —
`ROLE_INVOICE_VIEW`, `ROLE_PAYMENT_VIEW`, `ROLE_MAINT_*`, `ROLE_VISIT_*`, `ROLE_TENANT_SELF` — and
**no meter authority whatever**. A tenant cannot see a reading today, so "evidence for both landlord
and tenant" needs a decision:

- *Grant tenants `ROLE_METRE_VIEW`.* Simple, and wrong — it opens the estate's entire meter list.
- *Add a self-scoped path* gated on `ROLE_TENANT_SELF`, reaching only meters on the unit they occupy.
  More work, consistent with how the platform already scopes tenants, and the safe answer.
  **This is the decided approach** — see §5, which gives it its entry point: My houses, the
  occupation, then Meters.

**EXIF.** `AssetService` sanitises SVG but does not strip photo metadata, so a meter photo carries
whatever the camera wrote — including GPS. The capture time is arguably useful evidence, but the
server already stamps `readOn`, and the coordinates of somebody's home recorded against their name
are personal data nobody asked to collect. Recommend stripping GPS at minimum, on upload, server-side
where it cannot be skipped by an old client.

## 5. My houses, and what is under it (requirement 6)

Today "My houses" is a list and a dead end: a tenant sees the unit they occupy and can go no further.
The drill-down turns it into the place they actually manage their tenancy from — tap the occupation,
and find **Invoices · Payments · Meters** for it.

This is mostly wiring, because the backend was built for it.

| Tab | Endpoint | Authority the tenant already holds |
|---|---|---|
| The list itself | `GET /api/v1/occupations` | `ROLE_TENANT_SELF` — already accepted |
| Invoices | `GET /api/v1/invoices?occupationId={hash}` | `ROLE_INVOICE_VIEW` |
| Payments | `GET /api/v1/payments?occupationId={hash}` | `ROLE_PAYMENT_VIEW` |
| Meters | **needs a new path** — see below | none |

**A tenant cannot see anybody else's rows through these**, and not because the client is careful. The
tenancy scope in the search engine answers a tenant with their own rows whatever the query string
says; `occupationId` narrows within that, it does not widen it. The separate `mine` flag exists for a
different reason worth knowing — one person is often both a landlord and a tenant, and a superadmin
is answered with everything — so "mine" is read from the session and never from a parameter.

**Put the balance at the top.** `GET /api/v1/payments/balance/{occupationId}` returns a tenancy
balance, and *what do I owe* is the question somebody opens this screen to answer. Answering it above
the tabs saves them reading an invoice list to work it out.

### This settles the tenant-access question in §4

§4 asked how a tenant reaches a meter photograph and suggested the utility line on their invoice.
This is the better entry point, and it is the one to build: **My houses → the occupation → Meters →
a reading → the photograph.** It reads the way somebody would look for it, and it puts the
self-scoping in one place instead of hanging it off a line item.

The meters tab is the only one needing backend work, and it is the same work §4 already describes.
`GET /api/v1/occupations/{id}/meters` gated on `ROLE_TENANT_SELF` is the shape to prefer over
granting tenants `ROLE_METRE_VIEW` — the authority opens an estate's entire meter list, the path
opens one tenancy's. Readings and the photograph hang off it exactly as they do for staff.

### Why this is worth doing beyond the drill-down

It changes what the app is for. Everything else in it is staff-shaped — properties, tenants, meters,
receipting — and a tenant signing in currently finds a list of one. With this, To Let and Stays
(§6), the app has a tenant's half: what I occupy, what I owe, what I paid, what my meters read, and
what else is available to rent. That is the answer to §8's "who is the app for" question, and it
argues for one app with role-driven navigation rather than two.

## 6. To Let, Stays and maps (requirement 4)

**The backend is ready.** `/api/v1/vacant-units/**`, `/api/v1/stays/**` and `/api/v1/map-config` are
all in `SecurityConfig.PUBLIC_PATHS`, so a tenant — or somebody with no account at all — can browse
without a session. No backend work is needed for the browsing itself.

`hodi-f` has `ToLetPage.vue`, `ListingPage.vue` and `StaysPage.vue` already built against these
endpoints; they are the reference for what each screen shows and which query parameters exist.

The app has a `vacant_houses` feature already, written against the legacy endpoint. It is the
starting point for To Let rather than something to keep.

### Maps: one constraint worth knowing before choosing

The web app fetches its Maps key at runtime from `/api/v1/map-config`, and the natural assumption is
that the app can do the same. **It cannot, on Android.** `google_maps_flutter` reads the key from
`com.google.android.geo.API_KEY` in `AndroidManifest.xml`, which is fixed at build time. iOS is more
forgiving — `GMSServices.provideAPIKey()` is a runtime call — but a design that works on one
platform only is not a design.

Three honest options:

| Option | Cost |
|---|---|
| **Bake the key at build time** via `--dart-define` and a Gradle `manifestPlaceholder`. `scripts/build.sh` already injects `API_BASE_URL` this way, so this is a few lines. | Rotating the key means a release. |
| **Static map images** from the Maps Static API, using the runtime key. | No pan or zoom; fine for "where is this listing". |
| **`flutter_map` with OpenStreetMap tiles.** No key at all. | Not Google; different look from the web app. |

My recommendation is baking the key. Rotating a browser key already means a redeploy of the web app;
requiring a release for the mobile one is the same trade, and it keeps one map experience across
both. Note the restriction type differs: an Android key is restricted by package name and SHA-1
fingerprint, not by HTTP referrer, so **this needs its own key** — the web key will not work.

---

## 7. Profile: biometrics and a PIN (requirement 7)

A profile screen where somebody turns on biometric unlock and sets a PIN, with the PIN held by the
server. `../../axis` has built this already — `axis-m/lib/features/profile/set_pin_screen.dart`,
`axis-m/lib/core/auth/biometrics.dart`, `axis-m/lib/core/device/device_id.dart` and the PIN half of
`axis-b/.../auth/AuthController.java` — and it is worth copying closely, because it gets several
things right that are easy to get wrong.

### The two switches are not the same kind of thing

**A PIN is a credential.** The server must hold it, as a BCrypt hash through the same encoder as the
password, with the timestamps beside it. Axis's shape ports directly: `pin_hash`, `pin_set_at`,
`pin_changed_at` on the user row.

**A fingerprint is not.** Axis states it plainly and it is the clearest sentence on the subject I
have read anywhere: *"a fingerprint produces no credential and the server has never heard of it."*
What the biometric prompt proves is that the person holding the phone is the person the phone belongs
to. It guards the refresh token already sitting in the keystore — with it on, resuming the session
costs a fingerprint. That is what every app calling this "biometric login" actually does.

So **the biometric switch cannot be persisted to the backend as a credential**, because there is
nothing to persist. It is a per-device setting and belongs in the keystore beside the token it
guards. Two honest options if the *preference* should still follow the person:

- **Leave it local.** It is per-device by nature — a phone with no sensor cannot honour it, so the
  answer is about this handset, not about this person.
- **Persist it as a preference**, which is nearly free: `users` already carries `show_field_hints`
  and `show_tile_charts`, and `PUT /api/v1/auth/me/preferences` already takes a partial body. One
  more nullable boolean and a new phone remembers the person likes biometric unlock. It still has to
  be re-proved on each device.

Recommend the second, with the first as the fallback — it costs a column and answers the request as
asked, provided it is understood as a preference and not as a credential.

### The PIN pulls in device pairing, and this is the part to decide before building

Four digits is ten thousand combinations. Against an endpoint open to the internet, that is minutes
of work for somebody with a script. It is a sensible credential **only** when something else has
already proved the handset — which is exactly how axis does it: `MobileDeviceFilter` authenticates
the device before the PIN is looked at, and `AuthController` notes that PIN login is refused from
anything but a paired handset.

**`hodi-b` has none of this.** There is no device table, no pairing, no device secret. The one thing
that exists is the `X-Client: mobile` header, and `AuthController` is explicit that it is not a
security control: *"A header is whatever the caller types."*

So requirement 7 is not a screen — it is an auth subsystem:

| Piece | Where | Notes |
|---|---|---|
| Stable device id | `hodi-m` | Axis's `device_id.dart` ports as-is: Android `ANDROID_ID` hashed, iOS random in the Keychain. A **name, not a password** — the pairing secret is what authenticates |
| Pairing code + pair | `hodi-b` | Bound to the caller, so it can pair a device to them and nobody else |
| Device filter | `hodi-b` | Proves the handset before PIN login is considered |
| `pin_hash` + timestamps | `hodi-b` | BCrypt, same encoder as the password |
| Set / change / remove PIN | both | |
| PIN login | both | Refused from an unpaired device |
| Attempt lockout on the PIN | `hodi-b` | Its own counter. `users.locked_until` and `user_login_attempts` already exist and should be reused rather than duplicated |

### The flow, which axis also gets right

Three steps, and each earns its place: **prove → choose → confirm.**

- **Setting** a PIN asks for the **password**. A session left open on an unlocked phone must not be
  able to mint a shorter way in.
- **Changing** one asks for the **current PIN**.
- **Confirming** matters most: a PIN mistyped once is a PIN somebody cannot sign in with and has no
  way to discover until they are locked out.

And a detail worth keeping: axis has **no endpoint whose job is to answer "is this PIN right"**. The
current PIN is checked by attempting the change. An endpoint that validates a PIN in isolation is a
brute-force oracle, and not building it is the whole defence.

### Honest sizing

This is the largest single item in this document. Everything else is migration — moving working
behaviour onto new endpoints. This is new subsystem work in `hodi-b` with a security boundary in it,
and it should be scoped, built and reviewed on its own rather than folded into a phase with six
screens in it.

## 8. Matching the new HODI (requirement 1)

`hodi-f` resolves branding at runtime from `/api/v1/branding` — colours, logo, app name, favicon —
resolved server-side through ESTATE → BANK → GLOBAL. The app should do the same rather than hardcode
a palette, or an estate with its own colours will look like HODI on a phone and like itself in a
browser.

Two things to carry across deliberately:

- **Light is the default**, not the OS setting. `hodi-f`'s theme store has the reasoning: this is a
  daytime tool used beside paper, and dark is the option rather than the baseline.
- **The design tokens** in `hodi-f/src/styles/theme.css` are the source of truth for spacing, radius
  and semantic colour. Port the values; do not re-invent them by eye.

---

## 9. Decisions needed before Phase 1

1. ~~Is the meter photo evidence or OCR input?~~ **Answered: evidence.** It is uploaded, stored and
   viewable from meter history on both web and mobile. Two sub-decisions remain in §4 — how a tenant
   reaches it, and whether EXIF is stripped.
2. **Which maps approach?** (§6) — baked key, static images, or OSM.
3. **Is PIN login worth device pairing?** (§7) — a PIN without a paired device is a four-digit
   password on the open internet, so the honest choices are *build the pairing subsystem* or *ship
   biometric unlock only, which needs no backend at all*. Biometric-only is a fraction of the work
   and covers most of what people mean by "don't make me type my password".
4. **Biometric preference: local, or persisted?** (§7) — persisting costs one nullable column on the
   existing preferences endpoint, but it remains a preference, never a credential.
5. ~~Who is the app for now?~~ **Largely answered by §5.** The drill-down plus To Let and Stays give
   the app a tenant's half, which argues for one app with role-driven navigation. Confirm that is the
   intent before Phase 2 shapes the navigation around it.
6. **Rename the GitHub repository** to `hodi-m`, or leave it as `hodi-mobile`?
7. **Flutter 3.41 is seven months old** and 113 packages have newer versions held back by
   constraints. Upgrade first, or migrate first and upgrade after? Migrating onto a moving
   toolchain makes every failure ambiguous; I would upgrade first, on its own commit.

---

## 10. What this plan does not cover

Push notifications, offline capture and sync for meter readings taken where there is no signal, and
the Play Store/App Store release path. Each is real work and none of it is in the five requirements.
