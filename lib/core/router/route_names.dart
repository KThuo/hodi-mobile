abstract class RouteNames {
  // Auth
  static const login = 'login';
  static const forgotPassword = 'forgot-password';

  // Public
  static const vacantHouses = 'vacant-houses';
  static const stays = 'stays';
  static const vacantHouseDetail = 'vacant-house-detail';

  // Main
  static const home = 'home';
  static const properties = 'properties';
  static const propertyDetail = 'property-detail';
  static const houses = 'houses';
  static const houseDetail = 'house-detail';

  // A tenant's own tenancies. A different endpoint from [houses], not a filter on it.
  static const myHouses = 'my-houses';
  static const myHouseDetail = 'my-house-detail';
  static const tenants = 'tenants';
  static const tenantDetail = 'tenant-detail';
  static const invoices = 'invoices';
  static const invoiceDetail = 'invoice-detail';
  static const payments = 'payments';
  static const paymentDetail = 'payment-detail';

  // More
  static const more = 'more';
  static const notifications = 'notifications';
  static const maintenance = 'maintenance';
  static const maintenanceDetail = 'maintenance-detail';
  static const metres = 'metres';
  static const metreHistory = 'metre-history';
  static const vacateNotices = 'vacate-notices';
  static const vacateNoticeDetail = 'vacate-notice-detail';
  static const profile = 'profile';
  static const setPin = 'set-pin';
  static const changePassword = 'change-password';
  static const about = 'about';
  static const privacyPolicy = 'privacy-policy';
  static const termsAndConditions = 'terms-and-conditions';
}
