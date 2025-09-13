class CaseModel {
  final int? id;
  final String name;
  final int age;
  final String phone;
  final String address;
  final String governorate;
  final String area;
  final String category;
  final int criteriaCount;
  final double donationValue;
  final bool hasProject;
  final String status;
  final bool isActive;

  CaseModel({
    this.id,
    required this.name,
    required this.age,
    required this.phone,
    required this.address,
    required this.governorate,
    required this.area,
    required this.category,
    required this.criteriaCount,
    required this.donationValue,
    required this.hasProject,
    required this.status,
    required this.isActive,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'phone': phone,
      'address': address,
      'governorate': governorate,
      'area': area,
      'category': category,
      'criteriaCount': criteriaCount,
      'donationValue': donationValue,
      'hasProject': hasProject ? 1 : 0,
      'status': status,
      'isActive': isActive ? 1 : 0,
    };
  }

  factory CaseModel.fromMap(Map<String, dynamic> map) {
    return CaseModel(
      id: map['id'],
      name: map['name'],
      age: map['age'],
      phone: map['phone'],
      address: map['address'],
      governorate: map['governorate'],
      area: map['area'],
      category: map['category'],
      criteriaCount: map['criteriaCount'],
      donationValue: map['donationValue'],
      hasProject: map['hasProject'] == 1,
      status: map['status'],
      isActive: map['isActive'] == 1,
    );
  }
}
