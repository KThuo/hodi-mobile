class FilterOption {
  final String id;
  final String name;

  const FilterOption({required this.id, required this.name});

  factory FilterOption.fromJson(Map<String, dynamic> json) {
    return FilterOption(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
    );
  }
}
