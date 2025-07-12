// MaritalStatus:
// case SINGLE = 1;
// case MARRIED = 2;
// case WIDOW = 3;
// case DIVORCED = 4;

enum MaritalStatus {
  single(id: 1, value: 'SINGLE'),
  widow(id: 2, value: 'MARRIED'),
  married(id: 3, value: 'WIDOW'),
  absolute(id: 4, value: 'DIVORCED');

  const MaritalStatus({
    required this.id,
    required this.value,
  });

  /// Id of the banner type in the database.
  final int id;

  /// The text value that stored in db.
  final String value;

  static MaritalStatus? fromId(int id) {
    return values.where((element) => element.id == id).firstOrNull;
  }

  static MaritalStatus fromValue(String value) {
    return values.firstWhere((element) => element.value == value);
  }
}
