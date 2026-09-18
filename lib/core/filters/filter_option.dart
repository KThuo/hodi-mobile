/// One entry in the estate or property switcher.
///
/// The server's `Option` — `{id, label}`. This read `json['name']`, which that record does not
/// have, so every entry came back with an empty label: a dropdown of blank rows. The id survived,
/// which is why selecting one of the blanks still filtered correctly and made the fault look
/// cosmetic.
class FilterOption {
  final String id;
  final String label;

  const FilterOption({required this.id, required this.label});

  factory FilterOption.fromJson(Map<String, dynamic> json) {
    return FilterOption(
      id: json['id']?.toString() ?? '',
      // `name` is accepted as well: the same shape is served under both spellings elsewhere in
      // the API, and a switcher is not the place to be strict about which one arrived.
      label: (json['label'] ?? json['name'])?.toString() ?? '',
    );
  }

  /// Worth keeping out of the list: an entry with no label is a row somebody cannot choose
  /// between, and one with no id filters nothing.
  bool get usable => id.isNotEmpty && label.isNotEmpty;
}
