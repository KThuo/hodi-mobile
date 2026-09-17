import 'package:url_launcher/url_launcher.dart';

/// Reaching whoever is letting a place.
///
/// The three the web offers on a listing and a stay — call, email, WhatsApp — and nothing else.
/// There is no self-service booking on this platform: `POST /bnb/bookings` is behind
/// `ROLE_BOOKING_NEW`, an operator authority, and `hodi-f`'s own stay page says the booking "is the
/// next slice" and hands people to WhatsApp meanwhile. So the app does what the browser does
/// rather than inventing a flow the server cannot complete.
abstract class ContactActions {
  /// Digits only. `wa.me` refuses anything else, and numbers arrive spaced, bracketed and
  /// plus-prefixed depending on who typed them in.
  static String? _digits(String? phone) {
    if (phone == null) return null;
    final digits = phone.replaceAll(RegExp(r'[^\d]'), '');
    return digits.isEmpty ? null : digits;
  }

  static Future<bool> call(String? phone) async {
    final digits = _digits(phone);
    if (digits == null) return false;
    return _open(Uri.parse('tel:$phone'));
  }

  static Future<bool> email(String? address, {String? subject, String? body}) async {
    if (address == null || address.isEmpty) return false;
    return _open(Uri(
      scheme: 'mailto',
      path: address,
      query: [
        if (subject != null) 'subject=${Uri.encodeComponent(subject)}',
        if (body != null) 'body=${Uri.encodeComponent(body)}',
      ].join('&'),
    ));
  }

  static Future<bool> whatsApp(String? phone, String message) async {
    final digits = _digits(phone);
    if (digits == null) return false;
    return _open(
      Uri.parse('https://wa.me/$digits?text=${Uri.encodeComponent(message)}'),
    );
  }

  /// `externalApplication`, so a tel: or a wa.me link leaves for the app that owns it rather than
  /// opening a web view of a page that immediately tries to hand off again.
  static Future<bool> _open(Uri uri) async {
    try {
      return await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (_) {
      // A handset with no dialler, no mail client, or no WhatsApp. The caller says so; throwing
      // here would make a missing app look like a fault in the listing.
      return false;
    }
  }
}
