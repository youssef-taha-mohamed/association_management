class StatementModel {
  int? id;
  String name;
  int age;
  String phone;
  String address;
  String area;
  String category;
  double income;
  double donation;
  bool hasProject;
  String status;
  bool isActive;

  StatementModel({
    this.id,
    required this.name,
    required this.age,
    required this.phone,
    required this.address,
    required this.area,
    required this.category,
    required this.income,
    required this.donation,
    required this.hasProject,
    required this.status,
    required this.isActive,
  });
}
