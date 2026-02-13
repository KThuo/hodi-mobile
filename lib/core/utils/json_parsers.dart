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
