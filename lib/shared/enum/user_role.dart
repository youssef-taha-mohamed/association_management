enum UserRole {
  admin(id: 1, name: 'admin'),
  teacher(id: 2, name: 'teacher'),
  student(id: 3, name: 'student'),
  partner(id: 4, name: 'partner');

  const UserRole({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  static UserRole? fromId(int id) {
    return values.where((element) => element.id == id).firstOrNull;
  }

  static UserRole fromName(String value) {
    return values.firstWhere((element) {
      return element.name.toLowerCase() == value.toLowerCase();
    });
  }
}
