import 'package:equatable/equatable.dart';
import '../../../../shared/enum/gender.dart';
// import '../../../country/domain/entities/country.dart';
import '../enums/employment_status.dart';
import '../enums/marital_status.dart';

base class ProfileModificationData extends Equatable {
  const ProfileModificationData({
    required this.userId,
    this.countryId,
    this.birthday,
    this.email,
    this.userName,
    this.employmentStatus,
    this.firstName,
    this.gender,
    this.image,
    this.isMailVerified,
    this.isPhoneVerified,
    this.lang,
    this.lastName,
    this.maritalStatus,
    this.phone,
    this.roleId,
    this.oldPassword,
    this.password,
    this.confirmPassword,
    //this.country,
  });

  final int userId;
  final int? countryId;
  final DateTime? birthday;
  final String? email;
  final String? userName;
  final EmploymentStatus? employmentStatus;
  final MaritalStatus? maritalStatus;
  final Gender? gender;
  final String? image;
  final bool? isMailVerified;
  final bool? isPhoneVerified;
  final String? lang;
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? oldPassword;
  final String? password;
  final String? confirmPassword;
  final int? roleId;
  //final Country? country;

  @override
  List<Object?> get props {
    return <Object?>[
      userId,
      birthday,
      countryId,
      email,
      employmentStatus,
      firstName,
      gender,
      image,
      isMailVerified,
      isPhoneVerified,
      lang,
      lastName,
      maritalStatus,
      phone,
      roleId,
      oldPassword,
      password,
      confirmPassword,
      //country,
      userName,
    ];
  }
}
