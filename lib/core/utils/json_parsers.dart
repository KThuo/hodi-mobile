/// Parses a value that may be a String or num into a double.
/// Handles API responses that return numeric values as strings.
double parseDouble(dynamic value) {
  if (value == null) return 0;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value) ?? 0;
  return 0;
}

/// Parses a value that may be a String or num into an int.
/// Handles API responses that return numeric values as strings.
int? parseIntNullable(dynamic value) {
  if (value == null) return null;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value);
  return null;
}

/// Like [parseDouble], but keeps "the server did not say" distinct from "zero".
///
/// A receipt's balance before and after is the case that needs it: a payment from before those
/// columns existed carries neither, and printing "KES 0.00" there would state a fact nobody has.
double? parseDoubleNullable(dynamic value) {
  if (value == null) return null;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value);
  return null;
}
