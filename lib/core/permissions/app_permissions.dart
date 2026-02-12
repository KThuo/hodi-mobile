abstract class AppPermissions {
  // Dashboard
  static const dashboardView = 'ROLE_DASHBOARD_VIEW';
  static const tenantAccessView = 'ROLE_TENANT_ACCESS_VIEW';
  static const tenantAccessNew = 'ROLE_TENANT_ACCESS_NEW';
  static const tenantAccessDelete = 'ROLE_TENANT_ACCESS_DELETE';

  // Properties
  static const propertiesView = 'ROLE_PROPERTIES_VIEW';
  static const propertiesNew = 'ROLE_PROPERTIES_NEW';
  static const propertiesEdit = 'ROLE_PROPERTIES_EDIT';
  static const propertiesDelete = 'ROLE_PROPERTIES_DELETE';

  // Houses
  static const housesView = 'ROLE_HOUSES_VIEW';
  static const housesNew = 'ROLE_HOUSES_NEW';
  static const housesEdit = 'ROLE_HOUSES_EDIT';
  static const housesDelete = 'ROLE_HOUSES_DELETE';

  // Tenants
  static const tenantsView = 'ROLE_TENANTS_VIEW';
  static const tenantsNew = 'ROLE_TENANTS_NEW';
  static const tenantsEdit = 'ROLE_TENANTS_EDIT';
  static const tenantsDelete = 'ROLE_TENANTS_DELETE';

  // Invoices (uses ROLE_HOUSES_NEW for generation on backend)
  static const invoicesGenerate = 'ROLE_HOUSES_NEW';

  // Payments
  static const paymentsView = 'ROLE_PAYMENTS_VIEW';
  static const paymentsNew = 'ROLE_PAYMENTS_NEW';

  // Metres
  static const metresView = 'ROLE_METRES_VIEW';
  static const metresNew = 'ROLE_METRES_NEW';
  static const metresEdit = 'ROLE_METRES_EDIT';

  // Expenditures
  static const expendituresView = 'ROLE_EXPENDITURES_VIEW';
  static const expensesView = 'ROLE_EXPENSES_VIEW';

  // Estates
  static const estatesView = 'ROLE_ESTATES_VIEW';

  // Reports
  static const reportsView = 'ROLE_REPORTS_VIEW';

  // Vacate Notices
  static const vacateNoticesView = 'ROLE_VACATE_NOTICES_VIEW';
}
