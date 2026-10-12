# Analytics on the phone

The web console's analytics page grew a third pass on 8 October 2026 — a tenant league, rent
realised per property, HODI Stays figures (see `hodi-b/docs/ANALYTICS_PLAN.md`, "Third pass"). The
phone reads none of it. This plan brings across the three pieces somebody acts on away from a desk,
and leaves the rest where a wide screen serves it better.

## Who reads it

Holders of `ROLE_REPORT_VIEW` — estate admins, bank admins and platform admins — the same authority
the web page and its endpoints require. A tenant never sees the section, and nor does a caretaker
unless their group was granted the authority. The dashboard already splits on
`ROLE_DASHBOARD_VIEW`; this adds a second check rather than assuming the first implies it, because
the server checks the second.

## What, and why each one fits a phone

A new **Insights** section on the dashboard, under the monthly summary, with three cards. Each reads
the web page's default window — the last twelve months ending this month — and the dashboard's own
estate and property filter, and says "last 12 months" on the card so nobody reads it as the month in
the summary above it.

| Card | Reads | What it shows | Why on a phone |
| --- | --- | --- | --- |
| **Tenants to chase** | `GET /analytics/tenants/league?sort=rank&desc=true&pageSize=5` | The five lowest-ranked tenancies: name, unit, owed now, typical days late, on-time share. Tapping one opens the tenant. | The list a manager acts on while walking the property. |
| **Rent realised** | `GET /analytics/properties` | Each property's realised share — rent collected against the rent roll — as a bar, best first, five shown and the rest behind "Show all". The scope's own figure at the top. | The one number a landlord or bank officer checks between meetings. |
| **HODI Stays** | `GET /analytics/stays` | Occupancy, ADR, RevPAR and nights sold. Hidden entirely when no Stays unit is in scope. | Owners who mostly run short stays want these three numbers and nothing else. |

"Tenants to chase" takes the bottom of the **ranked** league, exactly the web's *worth a
conversation* card. A tenancy too new to rank is not on it — sorting rank descending puts the
unranked last, and the card skips any that arrive.

## Left on the web, on purpose

The full league with its twelve columns, the realisation waterfall, the property table with every
column, payment timing, churn, categories, maintenance depth, and the CSV downloads. All of them are
tables or charts that need width, and a phone version of each would be a worse copy of the web.

## One backend addition

The tenant screen on the phone opens by the tenant's **user** id (`/more/tenants/:userId/details`).
A league row carries its tenancy id only, so `TenantRanking` gains `tenantUserId` — hashed like every
other id. The web league ignores it today; it is there for the next link anybody wants to make.

## How it is built

- One repository, `AnalyticsRepository`, with three calls, and models with hand-written `fromJson`
  in the style of `DashboardSummary` — three small read-only shapes do not need code generation.
- Three `FutureProvider.autoDispose`s keyed on the filter, so changing the estate refreshes them as
  it refreshes the summary, and pull-to-refresh invalidates them with the rest.
- Each card loads on its own and fails on its own: a slow or refused analytics call shows a quiet
  line in its card, never a failed dashboard.
- Rates come from the server and are shown as sent. Nothing is recomputed on the phone, which is
  what keeps it saying the same thing as the web page.

## Verification

1. `flutter analyze` clean, `flutter test` green, with new tests that parse each response — a
   ranked and an unranked league row, a property with no rent roll (realised is null, not 0%), and a
   Stays view with no units.
2. The test APK builds through `scripts/build.sh test apk`.
3. The backend league still passes `TenantRankingTest` and `AnalyticsQueriesAgreeTest` with the new
   field.
