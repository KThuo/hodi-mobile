abstract class ApiConstants {
  static const String _env = String.fromEnvironment('ENV', defaultValue: 'test');
  static const String baseUrl = _env == 'prod'
      ? 'https://hodi.qnex.io'
      : 'https://hodi-test.qnex.io';
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
  static const String refreshToken = '$apiPrefix/refresh-token';
  static const String forgotPassword = '$apiPrefix/forgot-password';

  // Dashboard
  static const String dashboard = '$apiPrefix/dashboard';
  static const String dashboardTableData = '$apiPrefix/dashboard/table-data';

  // Estates
  static const String estatesAll = '$apiPrefix/real-estates/all';

  // Properties
  static const String properties = '$apiPrefix/properties';
  static const String propertiesAll = '$apiPrefix/properties/all'; // append /{estateId}

  // Houses
  static const String houses = '$apiPrefix/houses';
  static const String houseDetail = '$apiPrefix/houses'; // append /{id}
  static const String houseFeatures = '$apiPrefix/houses/house-features'; // append /{id}
  static const String myHouses = '$apiPrefix/my-houses';

  // Tenants
  static const String tenants = '$apiPrefix/tenants';

  // Invoices
  static const String invoices = '$apiPrefix/invoices';
  static const String invoiceDetail = '$apiPrefix/invoices/detail'; // append /{rrn}
  static const String invoicePrint = '$apiPrefix/invoices/detail/print'; // append /{rrn}
  static const String generateInvoice = '$apiPrefix/invoices/generate';

  // Payments
  static const String payments = '$apiPrefix/payments';
  static const String estatePayments = '$apiPrefix/estate-payments';
  static const String paymentDetail = '$apiPrefix/payments/detail'; // append /{rrn}
  static const String paymentPrint = '$apiPrefix/payments/detail/print'; // append /{rrn}
  static const String recordPayment = '$apiPrefix/payments/receive-payment';
  static const String receivePayments = '$apiPrefix/payments/receive-payments';
  static const String paymentTypes = '$apiPrefix/estate/payment-types'; // append /property/{self}/{propertyId}

  // Metres
  static const String metres = '$apiPrefix/metres';
  static const String metreHistory = '$apiPrefix/metres/history';
  static const String metreUpdateReading = '$apiPrefix/metres/update-reading';

  // Vacate Notices
  static const String vacateNotices = '$apiPrefix/vacate-notices';

  // Vacant Houses
  static const String vacantHouses = '$apiPrefix/vacant-houses';

  // Profile
  static const String profile = '$apiPrefix/profile/user-details';

  // Reports
  static const String reports = '$apiPrefix/reports';
}
