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

This turned out not to be a gap to fill. The photo is OCR input rather than evidence, so it stops at
the handset and the absence of a field is correct. See §4.

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

### What it does now

`update_reading_sheet.dart:45` captures at 1024×1024, quality 70, then runs ML Kit OCR and
`base64Encode` **in parallel**, holds the result in a `String`, and posts it inside the JSON body.

The parallelism is a nice touch. Everything around it is expensive:

- **Base64 costs 33% on the wire**, before JSON escaping. A 300KB photo becomes ~400KB of string.
- **Three copies in memory at once** — the `File` bytes, the ML Kit input, and the base64 `String`.
  On a cheap Android handset this is where it will be killed.
- **The upload is welded to the reading.** One request carries both, so a flaky connection loses the
  reading because the photo did not make it, and there is no retry that keeps the number.

### Decided: the photo never leaves the handset

The question was whether the photo is *evidence* — something to be stored and audited later — or
merely *OCR input*. It is OCR input. Recognition runs on-device through ML Kit, the capture is
optional, and a reading the OCR gets wrong is typed over by the person standing at the meter. The
number is the record; the photo is only how the number was obtained, and once it has been read there
is nothing left in it that anybody needs.

The new backend had already reached the same conclusion independently: `ReadingRequest` has no image
field, and no column behind it. Uploading was a legacy habit, not a requirement.

**So requirement 3 is answered by deletion, which is the most efficient version of any feature.**

| | Now | After |
|---|---|---|
| Wire | ~400KB of base64 inside a JSON body | nothing |
| Memory | file bytes + ML Kit input + base64 `String` | file bytes + ML Kit input |
| Requests | reading and photo welded together — a flaky link loses both | reading alone, small and retryable |
| Backend | needs a new field and column | needs nothing |

What to do:

1. **Delete `ImageHelper.toBase64` and `_imageBase64`.** With them goes the third copy of the image
   in memory, which on a cheap Android handset is where this gets killed.
2. **Drop `image` from `updateReading`.** The reading posts on its own to
   `POST /api/v1/meters/{id}/readings`, which is a few hundred bytes and will survive a bad signal
   in a stairwell.
3. **Keep the capture, keep the preview, keep the OCR.** The thumbnail stays on screen while the
   sheet is open so somebody can check the dial against what was recognised. It is discarded with
   the sheet.
4. **Capture leaner, since it is now transient.** ML Kit does not need 1024² at quality 70 to read a
   dial — around 800px on the long edge is legible, recognises faster, and allocates less. Take the
   bytes straight to ML Kit rather than through a temporary `File` where the platform allows it.
5. **Show what was recognised, and that it can be corrected.** The reading field is already
   editable; say so, rather than leaving somebody to guess whether the number is theirs to change.

**If audit evidence is ever wanted**, it is an additive change and nothing here blocks it: multipart
to the content-addressed asset store (`AssetController` already serves `/api/v1/assets/{sha256}`),
an `imageRef` on the reading, uploaded as a second request so the number is never lost with the
photo. It is deliberately not being built now.

---

## 5. To Let, Stays and maps (requirement 4)

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

## 6. Matching the new HODI (requirement 1)

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

## 7. Decisions needed before Phase 1

1. ~~Is the meter photo evidence or OCR input?~~ **Answered: OCR input.** It is not uploaded. See §4.
2. **Which maps approach?** (§5) — baked key, static images, or OSM.
3. **Who is the app for now?** It is currently staff-shaped: properties, tenants, meters, payments.
   Requirement 4 adds tenant browsing. One app with role-driven navigation, or a tenant experience
   that is clearly its own thing?
4. **Rename the GitHub repository** to `hodi-m`, or leave it as `hodi-mobile`?
5. **Flutter 3.41 is seven months old** and 113 packages have newer versions held back by
   constraints. Upgrade first, or migrate first and upgrade after? Migrating onto a moving
   toolchain makes every failure ambiguous; I would upgrade first, on its own commit.

---

## 8. What this plan does not cover

Push notifications, offline capture and sync for meter readings taken where there is no signal, and
the Play Store/App Store release path. Each is real work and none of it is in the five requirements.
