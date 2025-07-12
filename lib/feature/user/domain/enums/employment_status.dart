// EmploymentStatus:
// case STUDENT = 1;
// case EMPLOYEE = 2;
// case UNEMPLOYED = 3;

enum EmploymentStatus {
  student(id: 1, value: 'STUDENT'),
  employed(id: 2, value: 'EMPLOYEE'),
  unemployed(id: 3, value: 'UNEMPLOYED');

  const EmploymentStatus({
    required this.id,
    required this.value,
  });

  /// Id of the banner type in the database.
  final int id;

  /// The text value that stored in db.
  final String value;

  static EmploymentStatus? fromId(int id) {
    return values.where((element) => element.id == id).firstOrNull;
  }

  static EmploymentStatus fromValue(String value) {
    return values.firstWhere((element) => element.value == value);
  }
}
