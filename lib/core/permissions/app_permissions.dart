/// The authorities the server grants, as the app names them.
///
/// ## These are strings the backend owns, and they changed
///
/// Every one of these but [dashboardView] was renamed when HODI was rebuilt: the module went from
/// plural to singular, so `ROLE_PROPERTIES_VIEW` became `ROLE_PROPERTY_VIEW`. Nothing about that
/// rename is visible at runtime — a [PermissionGate] testing an authority nobody holds simply hides
/// its child, so the app does not break, it quietly has no features.
///
/// That is why `test/core/permissions/app_permissions_test.dart` exists: it asserts every constant
/// here is spelt the way the backend spells it. The next rename should fail a test rather than
/// puzzle a caretaker.
///
/// ## Two that are not a simple rename
///
/// - **Tenant access was renamed, not collapsed.** Legacy had `ROLE_TENANT_ACCESS_{VIEW,NEW,DELETE}`
///   and the rebuild replaced all three with [tenantSelf] — `ROLE_TENANT_ACCESS` itself is gone from
///   the catalogue, so naming it here would gate on something nobody can hold. The first run of the
///   test below caught exactly that.
/// - **A tenant cannot be deleted.** There is no `ROLE_TENANT_DELETE`, so the constant is gone
///   rather than pointed at something close. A tenancy ends by vacating, which is [vacateView]'s
///   business and leaves the person on the books.
abstract class AppPermissions {
  // ── Dashboard ─────────────────────────────────────────────────────────────
  static const dashboardView = 'ROLE_DASHBOARD_VIEW';

  // ── Properties ────────────────────────────────────────────────────────────
  static const propertyView = 'ROLE_PROPERTY_VIEW';
  static const propertyNew = 'ROLE_PROPERTY_NEW';
  static const propertyEdit = 'ROLE_PROPERTY_EDIT';
  static const propertyDelete = 'ROLE_PROPERTY_DELETE';

  // ── Houses (units) ────────────────────────────────────────────────────────
  //
  // The path is /api/v1/units; the authority stayed ROLE_HOUSE_*. The backend renamed the noun in
  // one place and not the other, which is a trap worth writing down once rather than tripping over
  // three times.
  static const houseView = 'ROLE_HOUSE_VIEW';
  static const houseNew = 'ROLE_HOUSE_NEW';
  static const houseEdit = 'ROLE_HOUSE_EDIT';
  static const houseDelete = 'ROLE_HOUSE_DELETE';

  // ── Tenants ───────────────────────────────────────────────────────────────
  static const tenantView = 'ROLE_TENANT_VIEW';
  static const tenantNew = 'ROLE_TENANT_NEW';
  static const tenantEdit = 'ROLE_TENANT_EDIT';

  /// What a tenant holds over their own tenancy — their unit, and what hangs off it.
  ///
  /// Not a staff authority. It is what lets somebody list their own occupations, and it is the gate
  /// the meters drill-down under "My houses" will be built behind.
  static const tenantSelf = 'ROLE_TENANT_SELF';

  // ── Invoices ──────────────────────────────────────────────────────────────
  static const invoiceView = 'ROLE_INVOICE_VIEW';

  /// Raising one. Legacy gated this on `ROLE_HOUSES_NEW` — the authority for creating a *unit* —
  /// which was a stand-in for a permission that did not exist yet. It exists now.
  static const invoiceNew = 'ROLE_INVOICE_NEW';

  // ── Payments ──────────────────────────────────────────────────────────────
  static const paymentView = 'ROLE_PAYMENT_VIEW';
  static const paymentNew = 'ROLE_PAYMENT_NEW';

  // ── Metres ────────────────────────────────────────────────────────────────
  //
  // Spelt METRE here and `meters` in the path, for the same reason as houses above.
  static const metreView = 'ROLE_METRE_VIEW';
  static const metreNew = 'ROLE_METRE_NEW';
  static const metreEdit = 'ROLE_METRE_EDIT';

  // ── Expenses ──────────────────────────────────────────────────────────────
  //
  // Legacy carried both ROLE_EXPENDITURES_VIEW and ROLE_EXPENSES_VIEW for one idea. One now.
  static const expenseView = 'ROLE_EXPENSE_VIEW';
  static const expenseNew = 'ROLE_EXPENSE_NEW';
  static const expenseEdit = 'ROLE_EXPENSE_EDIT';
  static const expenseDelete = 'ROLE_EXPENSE_DELETE';

  // ── Maintenance ───────────────────────────────────────────────────────────
  //
  // The reason this module is in the app: a tenant holds VIEW and NEW, a caretaker holds NEW and
  // RESOLVE, and neither had a screen to use them on.
  //
  // ASSIGN and EDIT are named here for completeness and gate nothing the app renders — giving a
  // job to somebody, and setting what it cost, are decisions made where the rota and the budget
  // are. A button neither audience can press is a button that fails.
  static const maintView = 'ROLE_MAINT_VIEW';
  static const maintNew = 'ROLE_MAINT_NEW';
  static const maintEdit = 'ROLE_MAINT_EDIT';
  static const maintAssign = 'ROLE_MAINT_ASSIGN';
  static const maintResolve = 'ROLE_MAINT_RESOLVE';

  // ── Visitors ──────────────────────────────────────────────────────────────
  //
  // A tenant holds VIEW and DECIDE: somebody is at the gate and the answer is yes or no. NEW is
  // the gate's own — checking a visitor in and out.
  //
  // REVEAL is deliberately absent rather than named: it uncovers a visitor's identity document
  // number, neither audience holds it, and an id number is not something to pull onto a handset
  // speculatively. OVERRIDE and BLOCK are the office's.
  static const visitView = 'ROLE_VISIT_VIEW';
  static const visitNew = 'ROLE_VISIT_NEW';
  static const visitDecide = 'ROLE_VISIT_DECIDE';

  // ── Estates ───────────────────────────────────────────────────────────────
  static const estateView = 'ROLE_ESTATE_VIEW';

  // ── Reports ───────────────────────────────────────────────────────────────
  static const reportView = 'ROLE_REPORT_VIEW';

  // ── Leases ────────────────────────────────────────────────────────────────
  //
  // No tenant authority here, and there does not need to be: the `/mine` paths carry none and the
  // server scopes them to the caller, honouring the property's own `tenantCanViewLease` setting.
  // So holding [leaseView] is what marks somebody as reading these as staff.
  //
  // DOCUMENT_EDIT is named and gates nothing the app renders. Attaching a signed scan is the
  // office's job and not a thing to do from a phone between other jobs.
  static const leaseView = 'ROLE_LEASE_VIEW';
  static const leaseDocumentView = 'ROLE_LEASE_DOCUMENT_VIEW';
  static const leaseDocumentEdit = 'ROLE_LEASE_DOCUMENT_EDIT';

  // ── Penalties ─────────────────────────────────────────────────────────────
  //
  // A late-payment charge somebody has to decide about: apply it, waive it, or reverse one
  // applied in error. WAIVE covers reversing too, which is the server's grouping.
  static const penaltyView = 'ROLE_PENALTY_VIEW';
  static const penaltyApply = 'ROLE_PENALTY_APPLY';
  static const penaltyWaive = 'ROLE_PENALTY_WAIVE';
  static const penaltyEdit = 'ROLE_PENALTY_EDIT';

  // ── Vacate notices ────────────────────────────────────────────────────────
  static const vacateView = 'ROLE_VACATE_VIEW';

  /// Every authority this app names, for the test that checks them against the backend.
  static const all = <String>[
    dashboardView,
    propertyView, propertyNew, propertyEdit, propertyDelete,
    houseView, houseNew, houseEdit, houseDelete,
    tenantView, tenantNew, tenantEdit, tenantSelf,
    invoiceView, invoiceNew,
    paymentView, paymentNew,
    metreView, metreNew, metreEdit,
    expenseView, expenseNew, expenseEdit, expenseDelete,
    maintView, maintNew, maintEdit, maintAssign, maintResolve,
    visitView, visitNew, visitDecide,
    leaseView, leaseDocumentView, leaseDocumentEdit,
    penaltyView, penaltyApply, penaltyWaive, penaltyEdit,
    estateView,
    reportView,
    vacateView,
  ];
}
