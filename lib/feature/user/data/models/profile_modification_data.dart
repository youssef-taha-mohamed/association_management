import 'dart:convert';
import '../../../../../shared/enum/gender.dart';
// import '../../../country/data/models/country.dart';
import '../../domain/entities/profile_modification_data.dart';
import '../../domain/enums/employment_status.dart';
import '../../domain/enums/field.dart';
import '../../domain/enums/marital_status.dart';

final class ProfileModificationDataDTO extends ProfileModificationData {
  const ProfileModificationDataDTO({
    required super.userId,
    required super.countryId,
    super.birthday,
    super.email,
    super.employmentStatus,
    super.firstName,
    super.gender,
    super.image,
    super.isMailVerified,
    super.isPhoneVerified,
    super.lang,
    super.lastName,
    super.maritalStatus,
    super.phone,
    super.roleId,
    super.oldPassword,
    super.password,
    super.confirmPassword,
   // super.country,
    super.userName,
  });

  factory ProfileModificationDataDTO.fromJson(String json) {
    return ProfileModificationDataDTO.fromMap(
      Map<String, dynamic>.from(jsonDecode(json) as Map),
    );
  }

  factory ProfileModificationDataDTO.fromMap(Map<String, dynamic> map) {
    return ProfileModificationDataDTO(
      userId: map[UserField.id.value] as int,
      firstName: map[UserField.firstName.value] as String,
      lastName: map[UserField.lastName.value] as String,
      phone: map[UserField.phone.value] as String,
      image: map[UserField.image.value] as String,
      email: map[UserField.email.value] as String,
      userName: map[UserField.userName.value] as String,
      birthday: map[UserField.birthday.value] as DateTime,
      gender: Gender.fromId(map[UserField.gender.value]),
      employmentStatus: EmploymentStatus.fromId(map[UserField.gender.value]),
      maritalStatus: MaritalStatus.fromId(map[UserField.gender.value]),
      countryId: map[UserField.countryId.value] as int,
      roleId: map[UserField.role.value] as int,
      isMailVerified: map[UserField.emailVerified.value] as bool,
      isPhoneVerified: map[UserField.phoneVerified.value] as bool,
      oldPassword: map[UserField.password.value] as String?,
      password: map[UserField.password.value] as String?,
      confirmPassword: map[UserField.confirmationPassword.value] as String?,
      // country: map[UserField.country.value] == null
      //     ? null
      //     : CountryDTO.fromMap(
      //         Map<String, dynamic>.from(
      //           map[UserField.country.value] as Map,
      //         ),
      //       ),
    );
  }

  String toJson() {
    return jsonEncode(toMap());
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      UserField.firstName.value: firstName,
      UserField.lastName.value: lastName,
      UserField.phone.value: phone,
      UserField.image.value:
          image != null ? 'data:image/jpeg;base64,$image' : null,
      UserField.email.value: email,
      UserField.userName.value: userName,
      UserField.birthday.value: birthday?.toIso8601String(),
      UserField.gender.value: gender?.id.toString(),
      UserField.employmentStatus.value: employmentStatus?.id.toString(),
      UserField.maritalStatus.value: maritalStatus?.id.toString(),
      UserField.countryId.value: countryId,
      UserField.role.value: roleId,
      UserField.emailVerified.value: isMailVerified,
      UserField.phoneVerified.value: isPhoneVerified,
      UserField.oldPassword.value: oldPassword,
      UserField.password.value: password,
      UserField.confirmationPassword.value: confirmPassword,
      //UserField.country.value: country,
    }..removeWhere(
        (key, value) => value == null || value.toString().isEmpty,
      );
  }

  factory ProfileModificationDataDTO.fromEntity(
    ProfileModificationData entity,
  ) {
    return ProfileModificationDataDTO(
      userId: entity.userId,
      firstName: entity.firstName,
      lastName: entity.lastName,
      phone: entity.phone,
      image: entity.image,
      email: entity.email,
      userName: entity.userName,
      birthday: entity.birthday,
      gender: entity.gender,
      employmentStatus: entity.employmentStatus,
      maritalStatus: entity.maritalStatus,
      lang: entity.lang,
      countryId: entity.countryId,
      roleId: entity.roleId,
      isMailVerified: entity.isMailVerified,
      isPhoneVerified: entity.isPhoneVerified,
      oldPassword: entity.oldPassword,
      password: entity.password,
      confirmPassword: entity.confirmPassword,
      //country: entity.country,
    );
  }
}
