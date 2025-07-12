import 'dart:convert';
import 'package:intl/intl.dart';
import '../../../../shared/enum/gender.dart';
import '../../../../shared/enum/user_role.dart';
import '../../domain/entities/details.dart';
import '../../domain/enums/commission_type.dart';
import '../../domain/enums/employment_status.dart';
import '../../domain/enums/field.dart';
import '../../domain/enums/marital_status.dart';

final class UserDetailsDTO extends UserDetails {
  const UserDetailsDTO({
    required super.chatId,
    required super.commissionType,
    required super.commissionValue,
    required super.createdAt,
    required super.email,
    required super.username,
    required super.emailVerified,
    required super.gender,
    required super.id,
    required super.isBusy,
    required super.isFast,
    required super.isOnline,
    required super.notificationEnabled,
    super.phone,
    super.fullPhone,
    required super.phoneVerified,
    required super.role,
    required super.updatedAt,
    required super.wallet,
    required super.countryId,
    //required super.country,
    super.loginMethodId,
    super.bio,
    super.birthday,
    super.deletedAt,
    super.employmentStatus,
    super.firstName,
    super.fullName,
    super.image,
    super.imageId,
    super.lastName,
    super.maritalStatus,
    super.age,
  });

  UserDetails copyWith({
    String? bio,
    DateTime? birthday,
    int? chatId,
    CommissionType? commissionType,
    num? commissionValue,
    DateTime? createdAt,
    DateTime? deletedAt,
    String? email,
    String? username,
    bool? emailVerified,
    EmploymentStatus? employmentStatus,
    String? firstName,
    String? fullName,
    Gender? gender,
    int? id,
    String? image,
    int? imageId,
    bool? isBusy,
    bool? isOnline,
    bool? isFast,
    String? lastName,
    MaritalStatus? maritalStatus,
    bool? notificationEnabled,
    String? phone,
    bool? phoneVerified,
    UserRole? role,
    DateTime? updatedAt,
    num? wallet,
    int? countryId,
    // Country? country,
    int? loginMethodId,
    int? age,
  }) {
    return UserDetails(
      bio: bio ?? this.bio,
      birthday: birthday ?? this.birthday,
      chatId: chatId ?? this.chatId,
      commissionType: commissionType ?? this.commissionType,
      commissionValue: commissionValue ?? this.commissionValue,
      createdAt: createdAt ?? this.createdAt,
      deletedAt: deletedAt ?? this.deletedAt,
      email: email ?? this.email,
      username: email ?? this.username,
      emailVerified: emailVerified ?? this.emailVerified,
      employmentStatus: employmentStatus ?? this.employmentStatus,
      firstName: firstName ?? this.firstName,
      fullName: fullName ?? this.fullName,
      gender: gender ?? this.gender,
      id: id ?? this.id,
      image: image ?? this.image,
      imageId: imageId ?? this.imageId,
      isBusy: isBusy ?? this.isBusy,
      isFast: isFast ?? this.isFast,
      isOnline: isOnline ?? this.isOnline,
      lastName: lastName ?? this.lastName,
      maritalStatus: maritalStatus ?? this.maritalStatus,
      notificationEnabled: notificationEnabled ?? this.notificationEnabled,
      phone: phone ?? this.phone,
      phoneVerified: phoneVerified ?? this.phoneVerified,
      role: role ?? this.role,
      updatedAt: updatedAt ?? this.updatedAt,
      wallet: wallet ?? this.wallet,
      countryId: countryId ?? this.countryId,
      //country: country ?? this.country,
      loginMethodId: loginMethodId ?? this.loginMethodId,
      age: age ?? this.age,
    );
  }

  factory UserDetailsDTO.fromJson(String str) {
    return UserDetailsDTO.fromMap(
      Map<String, dynamic>.from(json.decode(str) as Map),
    );
  }

  String toJson({
    String dateFormat = 'yyyy-MM-dd',
  }) {
    return json.encode(toMap(dateFormat: dateFormat));
  }

  factory UserDetailsDTO.fromMap(Map<String, dynamic> json) {
    return UserDetailsDTO(
      id: json[UserField.id.value] as int,
      firstName: json[UserField.firstName.value] as String?,
      lastName: json[UserField.lastName.value] as String? ?? '',
      fullName: json[UserField.fullName.value] as String?,
      phone: json[UserField.phone.value],
      fullPhone: json[UserField.fullPhone.value],
      email: json[UserField.email.value] as String,
      username: json[UserField.userName.value] as String?,
      gender: Gender.fromId(json[UserField.gender.value] as int),
      birthday: DateTime.tryParse(
        '${json[UserField.birthday.value]}' as String? ?? '',
      ),
      image: json[UserField.image.value] as String?,
      imageId: json[UserField.imageId.value] as int?,
      bio: json[UserField.bio.value] as String? ?? '',
      chatId: json[UserField.chatId.value] ?? 0,
      commissionType: CommissionType.tryParseFromValue(
        json[UserField.commissionType.value] as String?,
      ),
      commissionValue: json[UserField.commissionValue.value] as num?,
      createdAt: DateTime.parse(json[UserField.createdAt.value] as String),
      deletedAt: DateTime.tryParse(
        json[UserField.deletedAt.value] as String? ?? '',
      ),
      emailVerified: json[UserField.emailVerified.value] as bool,
      employmentStatus: json[UserField.employmentStatus.value] == null
          ? null
          : EmploymentStatus.fromId(
              json[UserField.employmentStatus.value] as int,
            ),
      isBusy: json[UserField.isBusy.value] as bool,
      isFast: json[UserField.isFast.value] as bool,
      isOnline: json[UserField.isOnline.value] as bool,
      maritalStatus: json[UserField.maritalStatus.value] == null
          ? null
          : MaritalStatus.fromId(json[UserField.maritalStatus.value] as int),
      notificationEnabled: json[UserField.notificationEnabled.value] as bool,
      phoneVerified: json[UserField.phoneVerified.value] as bool,
      role: UserRole.fromId(json[UserField.role.value] as int? ?? 0),
      updatedAt: DateTime.parse(json[UserField.updatedAt.value] as String),
      wallet: json[UserField.wallet.value] as num,
      countryId: json[UserField.countryId.value] as int?,
      loginMethodId: json[UserField.loginMethodId.value] as int?,
      age: json[UserField.age.value] as int?,
      // country: json[UserField.country.value] == null
      //     ? null
      //     : CountryDTO.fromMap(
      //         Map<String, dynamic>.from(
      //           json[UserField.country.value] as Map,
      //         ),
      //       ),
    );
  }

  factory UserDetailsDTO.fromEntity(UserDetails entity) {
    return UserDetailsDTO(
      bio: entity.bio,
      birthday: entity.birthday,
      chatId: entity.chatId,
      commissionType: entity.commissionType,
      commissionValue: entity.commissionValue,
      createdAt: entity.createdAt,
      deletedAt: entity.deletedAt,
      email: entity.email,
      username: entity.username,
      emailVerified: entity.emailVerified,
      employmentStatus: entity.employmentStatus,
      firstName: entity.firstName,
      fullName: entity.fullName,
      gender: entity.gender,
      id: entity.id,
      image: entity.image,
      imageId: entity.imageId,
      isBusy: entity.isBusy,
      isOnline: entity.isOnline,
      isFast: entity.isFast,
      lastName: entity.lastName,
      maritalStatus: entity.maritalStatus,
      notificationEnabled: entity.notificationEnabled,
      phone: entity.phone,
      phoneVerified: entity.phoneVerified,
      role: entity.role,
      updatedAt: entity.updatedAt,
      wallet: entity.wallet,
      countryId: entity.countryId,
      //country: entity.country,
      loginMethodId: entity.loginMethodId,
      age: entity.age,
    );
  }

  Map<String, dynamic> toMap({
    String dateFormat = 'yyyy-MM-dd',
  }) {
    return <String, dynamic>{
      UserField.bio.value: bio,
      UserField.birthday.value: birthday == null
          ? null
          : DateFormat(dateFormat).format(
              birthday!,
            ),
      UserField.chatId.value: chatId,
      UserField.commissionType.value: commissionType?.value,
      UserField.commissionValue.value: commissionValue,
      UserField.createdAt.value: DateFormat(dateFormat).format(createdAt),
      UserField.deletedAt.value: deletedAt == null
          ? null
          : DateFormat(dateFormat).format(
              deletedAt!,
            ),
      UserField.email.value: email,
      UserField.userName.value: username,
      UserField.emailVerified.value: emailVerified,
      UserField.employmentStatus.value: employmentStatus?.id,
      UserField.firstName.value: firstName,
      UserField.fullName.value: fullName,
      UserField.gender.value: gender?.id,
      UserField.id.value: id,
      UserField.image.value: image,
      UserField.imageId.value: imageId,
      UserField.isBusy.value: isBusy,
      UserField.isOnline.value: isOnline,
      UserField.lastName.value: lastName,
      UserField.maritalStatus.value: maritalStatus?.id,
      UserField.notificationEnabled.value: notificationEnabled,
      UserField.phone.value: phone,
      UserField.phoneVerified.value: phoneVerified,
      UserField.role.value: role?.id,
      UserField.updatedAt.value: DateFormat(dateFormat).format(updatedAt),
      UserField.wallet.value: wallet,
      UserField.countryId.value: countryId,
      //UserField.country.value: country,
      UserField.loginMethodId.value: loginMethodId,
      UserField.age.value: age,
    };
  }
}
