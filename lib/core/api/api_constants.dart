abstract class ApiConstants {
  static const String baseUrl = 'https://app.hodi.co.ke';
  static const String apiPrefix = '/api';

  // Timeouts
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);

  // Status codes (from ResponseModel)
  static const String statusSuccess = '00';
  static const String statusError = '01';
  static const String statusOverdueEstate = '002';
  static const String statusTokenExpired = '003';

  // Auth endpoints
  static const String login = '$apiPrefix/login';
  static const String deleteAccount = '$apiPrefix/delete-account';
  static const String forgotPassword = '$apiPrefix/forgot-password';

  // Dashboard
  static const String dashboard = '$apiPrefix/dashboard';

  // Properties
  static const String properties = '$apiPrefix/properties';

  // Houses
  static const String houses = '$apiPrefix/houses';
  static const String myHouses = '$apiPrefix/my-houses';

  // Tenants
  static const String tenants = '$apiPrefix/tenants';

  // Invoices
  static const String invoices = '$apiPrefix/invoices';
  static const String generateInvoice = '$apiPrefix/invoices/generate';

  // Payments
  static const String payments = '$apiPrefix/payments';
  static const String recordPayment = '$apiPrefix/payments/receive-payment';

  // Metres
  static const String metres = '$apiPrefix/metres';

  // Vacate Notices
  static const String vacateNotices = '$apiPrefix/vacate-notices';

  // Vacant Houses
  static const String vacantHouses = '$apiPrefix/vacant-houses';

  // Reports
  static const String reports = '$apiPrefix/reports';
}
