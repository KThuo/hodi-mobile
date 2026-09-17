import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

/// One thing the platform has told this person — the server's `InboxRow`.
///
/// Scoped to the caller inside `InboxService`, which is why the endpoints carry no `@PreAuthorize`:
/// being signed in is the whole of the permission, and there is nothing to add to `AppPermissions`.
@freezed
abstract class NotificationModel with _$NotificationModel {
  const NotificationModel._();

  const factory NotificationModel({
    required String id,

    /// Which notification this is — `INVOICE_RAISED`, `VISIT_REQUESTED` and so on. Carried for the
    /// icon, and so a template the app has never heard of still renders as a plain message rather
    /// than as nothing.
    String? template,
    String? title,
    required String body,

    /// Where it points, **as a path the web router understands**.
    ///
    /// Not a mobile route. Following it blindly would navigate a handset to something that does
    /// not exist on it, so it is translated where there is an equivalent screen and ignored where
    /// there is not — a notification that cannot be opened is still worth reading, and a tap that
    /// goes nowhere is worse than one that was never offered. See [mobileRoute].
    String? route,
    String? actionLabel,
    @Default(false) bool read,
    String? readOn,
    String? createdOn,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  /// What to show as the heading. The server's title where there is one, the template turned back
  /// into words where there is not — never an empty line above a body.
  String get heading {
    final t = title;
    if (t != null && t.trim().isNotEmpty) return t;
    final code = template;
    if (code == null || code.isEmpty) return 'Notification';
    return code
        .toLowerCase()
        .replaceAll('_', ' ')
        .replaceFirstMapped(RegExp('^.'), (m) => m[0]!.toUpperCase());
  }

  /// The app's own path for [route], or null where this app has no such screen.
  ///
  /// Deliberately a small, explicit table rather than a rewrite rule. The web has pages for
  /// modules the app does not carry, and guessing at a translation produces a tap that lands on a
  /// "not found" — which reads as the notification being broken rather than the app being smaller.
  String? get mobileRoute {
    final r = route;
    if (r == null || r.isEmpty) return null;

    // /billing/invoices/HPABACMLPVNH  →  /invoices/HPABACMLPVNH
    final invoice = RegExp(r'^/billing/invoices/([^/?]+)').firstMatch(r);
    if (invoice != null) return '/invoices/${invoice.group(1)}';

    final payment = RegExp(r'^/payments/receipts?/([^/?]+)').firstMatch(r);
    if (payment != null) return '/payments/${payment.group(1)}';

    if (r.startsWith('/maintenance')) return '/more/maintenance';
    if (r.startsWith('/visitors') || r.startsWith('/visits')) return '/more/visitors';
    if (r.startsWith('/occupancy') || r.startsWith('/my-houses')) return '/my-houses';

    return null;
  }

  bool get canOpen => mobileRoute != null;
}
