# What was still pending on hodi-m, and what is left

`MOBILE_UPGRADE_PLAN.md` set out the move onto `hodi-b`. Most of it had landed — the contract
layer, branding, invoices, payments, metres with its photograph, the PIN and biometric unlock, To
Let and Stays. This document was written as an audit of the remainder, and now records what was
done against it.

Everything below was checked against the running source of both repositories. `flutter analyze`
was clean before any of it, which is why these survived: none of them was a compile error.

**Done in this pass:** §1 Houses and Properties · §2 My houses · §4 maps · §5 change password.
**Still open:** §3 in-app PDF viewing · §5 privacy policy and terms · the Meters tab of §2, which
waits on `hodi-b`.

---

## 1. Houses and Properties were still legacy — done

Both sat in the bottom bar, and neither could load.

### What the server sends

`UnitSummary.id` and `PropertySummary.id` are `@HashId Long`, and `HashIdSerializer` calls
`gen.writeString(...)`. The wire carries `"id": "qNvA7x"`. The detail endpoints agree —
`UnitController.byId(@PathVariable String idHash)`, then `HashIds.require(idHash)`.

### What the app expected

`house_model.dart` and `property_model.dart` both declared `required int id`, and `app_router.dart`
parsed the path parameter with `int.tryParse(...) ?? 0`. A string id against `required int id`
throws inside generated `fromJson`, so the list did not render a wrong row — it failed to parse the
page. The router's `?? 0` turned every real hash into `/units/0`, which is a 404 with a polite
message.

### It was not only the id

The field names had drifted, so fixing the id alone would have produced a list of empty rows:

| The model said | `UnitSummary` sends |
|---|---|
| `houseName` | — (the readable name is `label`) |
| `property` · `estate` · `category` · `houseType` | `propertyName` · `estateName` · `categoryName` · `usageClassName` |
| `features` (a count) | — |
| — | `floorLabel`, `label`, `tenure`, `beds`, `baths`, `ensuite`, `dsq`, `parking`, `mezzanine` |

`PropertyModel` was the same: `occupied` is `occupiedUnits`, `categories` and `features` did not
exist, and `contactName`, `phone`, `bankName`, `invoiceGenerationDay` and `vacantUnits` were sent
and dropped.

### Where the money went

`PropertyDetailModel` expected `totalCollection`, `totalInvoiced`, `totalArrears` and a `period`
query parameter. `PropertyDetail` has none of those fields and `PropertyController` takes no such
parameter — **a property's month is a report now**, projected over invoices, payments and expenses
rather than stored, which is why it reconciles with them by construction.

The Rent Collection card was rebuilt on `GET /reports/property-reports?propertyId=&year=&month=`.
Two consequences worth knowing:

- **It is behind `ROLE_REPORT_VIEW`**, which is narrower than the property page. The card is not
  rendered at all without it — a caretaker can be trusted with the block without being trusted with
  what it collects.
- **The period selector lost "Next".** Legacy offered one because its figures came off the property
  row and a future month read as zeroes. A report cannot report a month that has not happened, so
  the chips are three real months ending with the one just gone.

The card now shows the components rather than the totals alone, in an order that adds up:
`charged + brought forward + credits and adjustments = invoiced`. The old screen put "Invoice
Amount" and "Total Collected" side by side with the carried arrears invisible between them, which
is how a property that settled everything raised could read as collecting well under 100%.

### The tenancy left the unit

`HouseDetailModel` carried a nested `tenant` with `rentOwed` and `refundableAmount`. `UnitDetail`
carries none of that: who occupies a unit is `GET /occupations/house/{houseId}`. The detail screen
composes the two reads, and the tenant card waits on its own request rather than holding the page.

`getHouseFeatures` also went. It asked `GET /catalogue/features/{houseId}` — the feature
*catalogue*, which takes no unit id. A unit's own features arrive inside `UnitDetail.features`.

### The tenant was offered a locked door

`more_screen.dart` showed **Houses** to anybody holding `houseView` **or** `tenantSelf`, and
`app_shell.dart` did the same for the tab. Both sent everybody to `/houses` → `GET /api/v1/units`,
which is `@PreAuthorize("hasAuthority('ROLE_HOUSE_VIEW')")`. A tenant saw the row, tapped it, and
was refused.

They are two endpoints, so they are now two entries. Staff get **Houses**; somebody holding only
`tenantSelf` gets **My Houses** at `/my-houses`. Somebody who is both a landlord and a tenant holds
both authorities, gets the staff list in the tab, and reaches their own tenancies from More.

---

## 2. My houses had no drill-down — done, three tabs of four

A tenant's list was a dead end. Each row now opens the tenancy.

| Piece | Endpoint | State |
|---|---|---|
| The list | `GET /api/v1/occupations` | done — accepts `ROLE_TENANT_SELF` |
| Balance at the top | `GET /api/v1/payments/balance/{occupationId}` | done |
| Invoices tab | `GET /api/v1/invoices?occupationId=` | done |
| Payments tab | `GET /api/v1/payments?occupationId=` | done |
| Meters tab | `GET /api/v1/occupations/{id}/meters` | **still needs `hodi-b`** |

`OccupancyController` has `GET`, `/house/{houseId}`, `/house/{houseId}/history`, `POST` and
`PUT /{id}/terms`. There is no meters path, and `MeterController` is gated on `ROLE_METRE_VIEW`
throughout — except the photograph, which already accepts `ROLE_TENANT_SELF`. So the last tab is
the backend work §4 of the plan already describes, and nothing here anticipates it.

Two notes on what was built:

- **There is no `GET /occupations/{id}`.** The row travels with the tap in `extra`, and a cold link
  renders the header from the balance read alone, which carries the unit code and tenant name. The
  terms card is what the list row adds.
- **The tabs page by growing the page size** rather than appending. A tenancy has tens of rows, and
  an appending notifier per tab is three times the code to save a request somebody makes once.

---

## 3. PDF documents: done already, except viewing one in the app

**Corrected after a closer read.** An earlier draft of this document said the phone had never
picked up the server-rendered PDFs. It had. `InvoiceRepository.downloadInvoicePdf` and
`PaymentRepository.downloadReceiptPdf` both call them, and both detail screens have the action.

`PdfDownloader` fetches to a temp file, checks the five-byte `%PDF-` header before handing it on —
a failed request still writes a file, and an error page passed to `OpenFilex` surfaces as "no app
can perform this action" — then opens it with the system viewer.

What is missing is the plan's first row: **viewing the document inside the app**. Today every
document leaves for whatever reader the handset has, and a phone with none shows an empty chooser.
That is one dependency and one screen, and it is the smallest item here.

---

## 4. Listings had coordinates and no map — done, as static images

`VacantHouseDetailModel` and `StayModel` both parse `latitude` and `longitude`, and nothing rendered
them. `ApiConstants.mapConfig` was declared and never called.

**Plan decision #2 was answered: fetch the key from the server, as the web does.** That decides the
rest of the design, because of a constraint worth writing down once:

> The key can be fetched at runtime **only for the Maps Static API**, where it is a URL parameter.
> `google_maps_flutter` reads `com.google.android.geo.API_KEY` out of `AndroidManifest.xml` when the
> map view is created and has no runtime setter, so an interactive Google map on Android needs the
> key baked in at build time. iOS is more forgiving — `GMSServices.provideAPIKey()` is a runtime
> call — but a design that works on one platform only is not a design.

So: `GET /api/v1/map-config` at runtime, and static map images. What is lost is pan and zoom; what a
listing page needs is "where is this", and tapping hands that to the maps app the handset has.

Two details:

- **`provider` decides, not the key.** The server answers `provider: "none"` whenever the key is
  blank, so a deployment without one does not load a map it cannot authenticate. `StaticMapView`
  renders nothing at all in that case — a grey box labelled "map unavailable" reads as a fault on a
  page where nothing is wrong.
- **Stays gets a link, not a map.** Every static image is a billed request, and the stays screen is
  a list: twenty cards would be twenty of them, drawn at thumbnail size beside a photograph already
  doing that work. A vacant unit's page gets a real map because it is one listing, opened
  deliberately.

---

## 5. Four routes declared and wired to nothing

`route_names.dart` named `changePassword`, `about`, `privacyPolicy` and `termsAndConditions`, and
`app_router.dart` had routes for none of them.

### Change password — done

It was a dead end with a live trigger. `ApiConstants.statusMustChangePassword` (`'004'`) was
declared and never read; `UserModel.mustChangePassword` was parsed and never acted on;
`POST /api/v1/auth/change-password` existed and was never called. An account flagged for a change
signed in, had every subsequent call refused with `004`, and saw a generic error with no way
forward. Signing out and in again reproduced it exactly.

Now: the interceptor raises `004`, `AuthNotifier.passwordChangeRequired()` sets a flag on the state,
and the router holds the app on `/change-password` until it clears. Three choices in it worth the
ink:

- **The route is outside the shell.** While the flag is set there is nowhere else to go, and a
  bottom bar offering five tabs that all fail is an invitation to try them.
- **Not a dialogue.** Every call answers `004`, so a dialogue would be dismissed and immediately
  raised again by the next request.
- **The rules come from `GET /auth/password-policy`.** A screen listing rules it invented disagrees
  with the server the first time either changes, and the person retyping is who finds out. Only the
  length is ticked off locally, because it is a number the server sent; the rest are shown as the
  server worded them.

The same screen is reachable from the profile, where there is a way back and cancelling leaves the
password alone.

### About — was already dead

`more_screen.dart` shows a dialogue instead. The constant is unused.

### Privacy policy and terms — still open

A store requirement rather than a feature: Google Play and the App Store both ask for a reachable
policy, and an app that deletes accounts — `ApiConstants.deleteAccount`, which *is* called — is
asked more firmly. Worth doing before a submission and not before.

---

## What is left

1. **An in-app PDF viewer.** Invoices, receipts and lease agreements all download and open in the
   handset's own reader. A phone with none shows an empty chooser.
2. **The tenant Meters tab**, which needs `GET /api/v1/occupations/{id}/meters` in `hodi-b` gated
   on `ROLE_TENANT_SELF`. Checked twice now: the web shows meters only on a **staff** unit page
   behind `ROLE_METRE_VIEW`, so there is genuinely nothing to reuse.
3. **Guest booking for stays.** `POST /bnb/bookings` needs `ROLE_BOOKING_NEW`, an operator
   authority, and `hodi-f`'s stay page says the booking "is the next slice" and hands people to
   WhatsApp meanwhile. The app matches the web: detail, a real quote, and contact.
4. **112 packages held back by constraints.** The SDK is current; the dependency tree is not.

## Done since this document was written

Privacy policy and terms · the Flutter upgrade to 3.47.4 · stay detail with a live quote · contact
actions on both listings and stays · notifications · maintenance · visitors · expenses · tenancy
reports · agreements · penalties. Plus the migration and bug work the commits describe.
