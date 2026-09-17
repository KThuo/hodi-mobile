/// Where the app talks, and what it calls things.
///
/// ## The prefix moved, and so did most of the nouns
///
/// Legacy served `/api`; the rebuilt backend serves `/api/v1` and renamed much of what hangs off it
/// — `houses` became `units`, `real-estates` became `estates`, `my-houses` became `occupations`.
/// Repointing the prefix alone would have produced forty 404s.
///
/// Two renames are only half-done on the backend and are worth knowing about, because they look like
/// typos here and are not:
///
/// - the path is `/meters`, the authority is `ROLE_METRE_*`
/// - the path is `/units`, the authority is `ROLE_HOUSE_*`
///
/// ## Ids in these paths are hashes
///
/// Anywhere a comment says `append /{id}`, that id is a [HashIds]-encoded string, salted per user.
/// It is never an integer and must be passed through exactly as the server sent it.
abstract class ApiConstants {
  static const String _env = String.fromEnvironment('ENV', defaultValue: 'test');
  // Prefer the URL injected by scripts/build.sh; fall back to the ENV-derived
  // default so `flutter run`/`flutter test` without defines still works.
  //
  // The test host is `newhodi`, not `hodi-test`. Both answer, which is what made this
  // expensive: `hodi-test` is the legacy deployment, so a build aimed at it authenticates,
  // then fails on the first call this app makes — a server error rather than a wrong address.
  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: _env == 'prod'
        ? 'https://hodi.qnex.io'
        : 'https://newhodi.qnex.io',
  );
  static const String apiPrefix = '/api/v1';

  // Timeouts
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);

  /// Says the app is asking, so an account deleted from the app is refused here and still admitted
  /// from a browser — deleting the app is not leaving the tenancy. Not a security control: the
  /// server treats it as a hint and nothing more.
  static const String clientHeader = 'X-Client';
  static const String clientMobile = 'mobile';

  // Status codes (from ResponseModel)
  static const String statusSuccess = '00';
  static const String statusError = '01';
  static const String statusOverdueEstate = '002';
  static const String statusTokenExpired = '003';
  /// A password change is required before anything else will answer.
  static const String statusMustChangePassword = '004';

  // ── Auth ──────────────────────────────────────────────────────────────────
  static const String login = '$apiPrefix/auth/login';

  /*
   * The PIN a handset signs in with.
   *
   * `loginWithPin` is public like `login` — it is how a session begins. The other three need one:
   * setting a PIN costs the account password, and rotating it costs the current PIN. There is
   * deliberately no endpoint that only checks a PIN, because that is a brute-force oracle with a
   * friendly name.
   */
  static const String loginWithPin = '$apiPrefix/auth/login/pin';
  static const String pin = '$apiPrefix/auth/pin';
  static const String changePin = '$apiPrefix/auth/pin/change';
  static const String removePin = '$apiPrefix/auth/pin/remove';
  static const String pinnedHandsets = '$apiPrefix/auth/pin/handsets';

  /// What this handset calls itself. Names the PIN row; never a credential on its own.
  static const String deviceHeader = 'X-Device-Id';
  static const String refreshToken = '$apiPrefix/auth/refresh';
  static const String logout = '$apiPrefix/auth/logout';
  static const String me = '$apiPrefix/auth/me';
  static const String preferences = '$apiPrefix/auth/me/preferences';
  static const String changePassword = '$apiPrefix/auth/change-password';

  /// The rules a new password must satisfy, so the screen can state them rather than guess.
  /// A client that invents its own rules disagrees with the server the first time either changes.
  static const String passwordPolicy = '$apiPrefix/auth/password-policy';
  static const String deleteAccount = '$apiPrefix/auth/delete-account';
  static const String forgotPassword = '$apiPrefix/auth/forgot-password';

  /// The deployment's colours, name and logo. Public: the login screen has to be in the right
  /// colours before anybody has signed in.
  static const String brandingPublic = '$apiPrefix/branding/public';

  // ── Dashboard ─────────────────────────────────────────────────────────────
  //
  // Legacy had one endpoint and a `table-data` companion. The rebuild splits it by the question
  // being asked, because "overall", "this month" and "what is coming up" have different periods and
  // were being averaged together.
  static const String dashboardOverall = '$apiPrefix/dashboard/overall';
  static const String dashboardMonthly = '$apiPrefix/dashboard/monthly';
  static const String dashboardCalendar = '$apiPrefix/dashboard/calendar';

  // ── Estates ───────────────────────────────────────────────────────────────
  static const String estates = '$apiPrefix/estates';

  // ── Properties ────────────────────────────────────────────────────────────
  static const String properties = '$apiPrefix/properties';

  // ── Units (legacy called them houses) ─────────────────────────────────────
  static const String units = '$apiPrefix/units'; // append /{id}
  static const String unitByCode = '$apiPrefix/units/by-code'; // append /{houseCode}

  /// The feature catalogue. Legacy asked `houses/house-features/{id}` for a unit's features; in the
  /// rebuild features belong to the **property** (`PUT /properties/{id}/features`) and the list of
  /// what a feature can be is catalogue-wide. Phase 2 decides which of the two a unit screen wants.
  static const String catalogueFeatures = '$apiPrefix/catalogue/features';

  /// The caller's own tenancies — legacy's `my-houses`.
  ///
  /// One endpoint for both audiences: staff listing an estate's occupations and a tenant listing
  /// their own. `ROLE_TENANT_SELF` is accepted, and the tenancy scope answers a tenant with their
  /// own rows whatever the query string says.
  static const String occupations = '$apiPrefix/occupations';

  // ── Tenants ───────────────────────────────────────────────────────────────
  static const String tenants = '$apiPrefix/tenants';

  // ── Invoices ──────────────────────────────────────────────────────────────
  static const String invoices = '$apiPrefix/invoices';
  static const String invoiceDetail = '$apiPrefix/invoices/detail'; // append /{rrn}
  static const String invoiceByReference = '$apiPrefix/invoices/reference'; // append /{rrn}
  static const String currentPeriod = '$apiPrefix/invoices/current-period';
  static const String generateInvoice = '$apiPrefix/invoices/generate';

  // ── Payments ──────────────────────────────────────────────────────────────
  static const String payments = '$apiPrefix/payments';
  static const String paymentReceipt = '$apiPrefix/payments/receipt'; // append /{rrn}
  static const String paymentMethods = '$apiPrefix/payments/methods';
  static const String paymentBalance = '$apiPrefix/payments/balance'; // append /{occupationId}
  static const String paymentTypes = '$apiPrefix/payment-types';

  // ── Metres ────────────────────────────────────────────────────────────────
  //
  // `meters` in the path, METRE in the authority. The backend renamed one and not the other.
  static const String meters = '$apiPrefix/meters'; // append /{id}
  static const String metersOfHouse = '$apiPrefix/meters/of-house';

  /// A meter's readings: `GET` for the history, `POST` to take one.
  /// Append `/{meterId}/readings`.
  static String meterReadings(String meterId) => '$meters/$meterId/readings';

  // ── Vacate notices ────────────────────────────────────────────────────────
  static const String vacateNotices = '$apiPrefix/vacate-notices';

  // ── Public: to let, and stays ─────────────────────────────────────────────
  //
  // No session needed for any of these — they are in the backend's public allowlist, because
  // somebody looking for somewhere to live does not have an account yet.
  static const String vacantUnits = '$apiPrefix/vacant-units';
  static const String stays = '$apiPrefix/stays';
  static const String mapConfig = '$apiPrefix/map-config';

  // ── Maintenance ───────────────────────────────────────────────────────────
  //
  // ROLE_MAINT_{VIEW,NEW} is held by tenants and caretakers alike, which is why this module is in
  // the app at all: both audiences hold the rights and had no screen to use them on.
  static const String maintenance = '$apiPrefix/maintenance';

  // ── Visits ────────────────────────────────────────────────────────────────
  static const String visits = '$apiPrefix/visits';

  // ── Expenses ──────────────────────────────────────────────────────────────
  static const String expenses = '$apiPrefix/expenses';

  // ── Notifications ─────────────────────────────────────────────────────────
  //
  // No authority on any of these. The controller gates on being signed in and the service scopes
  // every query to the caller, so there is nothing in AppPermissions to gate the screen on either.
  static const String notifications = '$apiPrefix/notifications';

  // ── Reports ───────────────────────────────────────────────────────────────
  static const String reports = '$apiPrefix/reports';

  /// One property's month: what was invoiced, what arrived, what is still owed.
  ///
  /// The property detail endpoint used to carry these figures and no longer does — nothing is
  /// stored, and the row is projected over invoices, payments and expenses each time it is asked
  /// for. Behind `ROLE_REPORT_VIEW`, which is narrower than the property page itself.
  static const String propertyReports = '$reports/property-reports';

  /// Where every tenancy stands: what was invoiced, what came in, what is owed.
  static const String tenantReports = '$reports/tenant-reports';
}
