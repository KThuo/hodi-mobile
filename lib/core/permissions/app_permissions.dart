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

  // ── Estates ───────────────────────────────────────────────────────────────
  static const estateView = 'ROLE_ESTATE_VIEW';

  // ── Reports ───────────────────────────────────────────────────────────────
  static const reportView = 'ROLE_REPORT_VIEW';

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
    expenseView,
    estateView,
    reportView,
    vacateView,
  ];
}
