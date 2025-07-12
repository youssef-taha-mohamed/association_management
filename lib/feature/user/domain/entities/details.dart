import 'package:equatable/equatable.dart';
import '../../../../shared/enum/gender.dart';
import '../../../../shared/enum/user_role.dart';
import '../enums/commission_type.dart';
import '../enums/employment_status.dart';
import '../enums/marital_status.dart';

base class UserDetails extends Equatable {
  const UserDetails({
    required this.chatId,
    required this.commissionType,
    required this.commissionValue,
    required this.createdAt,
    required this.email,
    required this.username,
    required this.emailVerified,
    required this.gender,
    required this.id,
    required this.isBusy,
    required this.isOnline,
    required this.isFast,
    required this.notificationEnabled,
    this.phone,
    this.fullPhone,
    required this.phoneVerified,
    required this.role,
    required this.updatedAt,
    required this.wallet,
    this.loginMethodId,
    this.countryId,
    //this.country,
    this.bio,
    this.birthday,
    this.deletedAt,
    this.employmentStatus,
    this.firstName,
    this.fullName,
    this.image,
    this.imageId,
    this.lastName,
    this.maritalStatus,
    this.age,
  });

  final int id;
  final String? firstName;
  final String? lastName;
  final String? fullName;
  final String? phone;
  final String? fullPhone;
  final String? image;
  final int? imageId;
  final String? email;
  final String? username;
  final String? bio;
  final DateTime? birthday;
  final Gender? gender;
  final bool phoneVerified;
  final bool emailVerified;
  final int chatId;
  final UserRole? role;
  final int? countryId;
 // final Country? country;
  final CommissionType? commissionType;
  final num? commissionValue;
  final DateTime createdAt;
  final DateTime? deletedAt;
  final EmploymentStatus? employmentStatus;
  final MaritalStatus? maritalStatus;
  final bool isBusy;
  final bool isOnline;
  final bool isFast;
  final bool notificationEnabled;
  final DateTime updatedAt;
  final num wallet;
  final int? loginMethodId;
  final int? age;

  @override
  List<Object?> get props {
    return <Object?>[
      id,
      firstName,
      lastName,
      fullName,
      phone,
      fullPhone,
      image,
      imageId,
      email,
      bio,
      birthday,
      gender,
      phoneVerified,
      emailVerified,
      chatId,
      role,
      countryId,
      //country,
      commissionType,
      commissionValue,
      createdAt,
      deletedAt,
      employmentStatus,
      isBusy,
      isOnline,
      isFast,
      maritalStatus,
      notificationEnabled,
      updatedAt,
      wallet,
      loginMethodId,
      age,
      username,
    ];
  }
}
