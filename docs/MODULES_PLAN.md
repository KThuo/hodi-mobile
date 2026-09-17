# Five modules, and the order to build them in

Agreed scope: **notifications, maintenance, visitors, expenses, reports.** The tenant Meters tab
stays out — it is the one item on the pending list with no endpoint to reuse, and adding one is not
this piece of work.

Every endpoint named below already exists and is already serving `hodi-f`. Nothing here needs a
change to `hodi-b`; where a shape looks like it is missing something, the first move is to find
which endpoint the browser is calling, because that is how the invoice payments turned out to be a
wrong call rather than a gap in the platform.

---

## Why these five, and why in this order

The ordering is not by size. It is by who is blocked.

`DevAccessSeeder` grants a **tenant** these authorities:

```
ROLE_INVOICE_{VIEW,NEW}   ROLE_PAYMENT_{VIEW,NEW}
ROLE_MAINT_{VIEW,NEW}     ROLE_VISIT_{VIEW,DECIDE}
ROLE_AUDIT_VIEW           ROLE_TENANT_SELF
```

and a **caretaker** `ROLE_MAINT_{NEW,RESOLVE}`.

So maintenance and visitors are rights that both audiences already hold and that the app offers no
way to exercise. They are also the two most phone-shaped things in the platform: a caretaker
reporting a repair is standing in front of it, and a tenant approving a visitor is being rung from
the gate. Everything else on this list is a landlord reading figures, which a browser does well.

| | Audience | Blocked today |
|---|---|---|
| 1. Notifications | everyone | Yes — no way to see anything the platform sends |
| 2. Maintenance | tenant, caretaker | Yes — authority held, no screen |
| 3. Visitors | tenant, gate | Yes — authority held, no screen |
| 4. Expenses | staff | No — browser does this |
| 5. Reports | staff | No — browser does this |

---

## 1. Notifications — `/api/v1/notifications`

The smallest and the most cross-cutting, so it goes first and sets the pattern.

```
GET  /notifications?unreadOnly=          InboxRow page
GET  /notifications/unread-count         {count}
POST /notifications/{id}/read            InboxRow
POST /notifications/read-all             {marked}
```

**No `@PreAuthorize` on any of them** — the controller gates on being signed in and scopes to
`CurrentUser` inside `InboxService`. Nothing to add to `AppPermissions`.

`InboxRow` is `{id, template, title, body, route, actionLabel, read, readOn, createdOn}`.

The interesting field is **`route`**. It is a path the *web* router understands, and following it
blindly on a handset would navigate to something that does not exist there. So the app maps the
ones it can serve and shows the rest as text — a notification that cannot be opened is still worth
reading, and a dead tap is worse than no tap.

Where it lives: a bell in the More menu carrying the unread count, and a list screen. Not a sixth
bottom tab.

## 2. Maintenance — `/api/v1/maintenance`

```
GET  /requests                    RequestRow page      ROLE_MAINT_VIEW
GET  /requests/{id}               RequestDetail        ROLE_MAINT_VIEW
POST /requests                    raise one            ROLE_MAINT_NEW
POST /requests/{id}/comments      add an update        ROLE_MAINT_NEW
POST /requests/{id}/status        move it              ROLE_MAINT_EDIT or _NEW
POST /requests/{id}/resolve       done                 ROLE_MAINT_RESOLVE
POST /requests/{id}/close         closed               ROLE_MAINT_RESOLVE
POST /requests/{id}/rate          tenant's rating      ROLE_MAINT_NEW
GET  /workload                    WorkloadSummary      ROLE_MAINT_VIEW
```

`RequestRow` is large — fifty fields — and most of it is the office's: SLA timers, cost splits,
assignee contacts, the expense it became. **The app shows the part its two audiences act on** and
leaves the rest to the browser. Putting all fifty on a phone would be a worse version of a screen
that already exists.

- **A tenant** raises a request, watches its status, comments, and rates it once resolved.
- **A caretaker** sees what is assigned, comments, and resolves.

Both are served by the same list and detail, filtered by what the authorities allow. `assign` and
`cost` are not built: they need `ROLE_MAINT_ASSIGN` and `ROLE_MAINT_EDIT`, which neither audience
holds, and a button nobody can press is a button that fails.

## 3. Visitors — `/api/v1/visits`

```
GET  /visits                      VisitRow page        ROLE_VISIT_VIEW
GET  /visits/{id}                 one                  ROLE_VISIT_VIEW
GET  /visits/on-site              OnSiteSummary        ROLE_VISIT_VIEW
POST /visits/{id}/decision        approve or refuse    ROLE_VISIT_DECIDE
POST /visits                      check in             ROLE_VISIT_NEW
POST /visits/{id}/checkout        check out            ROLE_VISIT_NEW
```

A tenant holds `VIEW` and `DECIDE` and nothing else, which is exactly the shape of the screen:
**somebody is at the gate, and the answer is yes or no.** That decision is the whole feature, and
it is the single most time-critical thing in this app — a list that takes three taps to reach has
failed at it.

`ROLE_VISIT_REVEAL` guards the visitor's id number behind its own authority, and the app does not
ask for it. Neither audience here holds it, and an id document number is not something to fetch
speculatively onto a handset.

Check-in and check-out are gated on `ROLE_VISIT_NEW`, which is the gate's own authority rather than
a tenant's — built, but only rendered for somebody holding it.

## 4. Expenses — `/api/v1/expenses`

```
GET    /expenses                  ExpenseRow page      ROLE_EXPENSE_VIEW
POST   /expenses                  record one           ROLE_EXPENSE_NEW
PUT    /expenses/{id}             correct one          ROLE_EXPENSE_EDIT
DELETE /expenses/{id}             remove one           ROLE_EXPENSE_DELETE
GET    /expenses/recurring        ExpenditureRow page  ROLE_EXPENSE_VIEW
```

List and record. **Recurring expenses are read-only here**: setting up a standing charge is a
configuration decision made once, at a desk, and the form for it belongs where the rest of a
property's settings are.

`AppPermissions` currently names only `expenseView`. `NEW`, `EDIT` and `DELETE` have to be added
and the catalogue test will hold them to the backend's spelling.

## 5. Reports — `/api/v1/reports/*`

```
GET /reports/property-reports     PropertyReportPage   ROLE_REPORT_VIEW
GET /reports/tenant-reports       TenantReportPage     ROLE_REPORT_VIEW
```

Property reports are **already modelled** — `PropertyReportPageModel` and
`PropertyReportTotalsModel` were built for the rent-collection card, and its
`totals`-not-`content[0]` lesson applies unchanged. This is a screen over models that exist, plus
tenant reports beside it.

Export is not built. `ExportService` returns a spreadsheet, and a phone is not where somebody
builds one.

---

## What is deliberately not in this

- **Assigning and costing a maintenance request** — authorities neither audience holds.
- **Revealing a visitor's id number** — its own authority, and not something to pull onto a phone.
- **Creating recurring expenses** — a desk decision.
- **Report export** — a spreadsheet is not a phone deliverable.
- **The tenant Meters tab** — no endpoint, and adding one is out of scope.

Each is a deliberate omission rather than an oversight, so the next person reading this does not
implement one thinking it was forgotten.
