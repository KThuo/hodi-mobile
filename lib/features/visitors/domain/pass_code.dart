/// What a pass's QR says, and reading it back.
///
/// The QR carries the code and nothing else — no name, no unit — so a photo of it tells nobody
/// anything without a gate account in the same estate. Kept in one place so the screen that draws
/// it and the screen that scans it cannot drift apart.
const passQrPrefix = 'HODIPASS:';

/// The QR text for a pass code, `HODIPASS:7K2M9XQ4TB`. The dash is for people, not scanners.
String passQrData(String passCode) =>
    '$passQrPrefix${passCode.replaceAll(RegExp(r'[^A-Za-z0-9]'), '').toUpperCase()}';

/// The code inside a scanned QR, or null when what was scanned is not a HODI pass — a payment QR,
/// a URL, somebody's Wi-Fi.
String? passCodeFromScan(String? raw) {
  if (raw == null) return null;
  final text = raw.trim();
  if (text.length <= passQrPrefix.length ||
      text.substring(0, passQrPrefix.length).toUpperCase() != passQrPrefix) {
    return null;
  }
  final code = text
      .substring(passQrPrefix.length)
      .replaceAll(RegExp(r'[^A-Za-z0-9]'), '')
      .toUpperCase();
  return code.isEmpty ? null : code;
}
