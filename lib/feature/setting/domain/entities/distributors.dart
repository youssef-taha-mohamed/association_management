// file: models/distributor_model.dart

class Distributor {
  final String id;
  String name;
  String email;
  String phone;
  String region;
  String status;
  String experience;
  final double rating;
  final int totalDistributions;
  final DateTime lastDistribution;
  final DateTime joinDate;
  List<String> specialization;
  String address;
  String vehicleType;
  List<String> languages;
  String emergencyContact;
  final String avatar;
  String availabilityStatus;
  DateTime? nextScheduledDistribution;

  Distributor({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.region,
    required this.status,
    required this.experience,
    required this.rating,
    required this.totalDistributions,
    required this.lastDistribution,
    required this.joinDate,
    required this.specialization,
    required this.address,
    required this.vehicleType,
    required this.languages,
    required this.emergencyContact,
    required this.avatar,
    required this.availabilityStatus,
    this.nextScheduledDistribution,
  });
}