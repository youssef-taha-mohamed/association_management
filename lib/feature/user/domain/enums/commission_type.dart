enum CommissionType {
  fixed(name: 'Fixed', value: 'fixed'),
  percentage(name: 'Percentage', value: 'percentage');

  const CommissionType({
    required this.name,
    required this.value,
  });

  final String name;
  final String value;

  static CommissionType fromValue(String value) {
    return values.firstWhere((element) => element.value == value);
  }

  static CommissionType? tryParseFromValue(String? value) {
    final temp = values.where((element) => element.value == value).toList();
    return temp.firstOrNull;
  }
}
