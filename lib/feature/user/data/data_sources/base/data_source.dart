import 'dart:async';
import '../../../domain/entities/parameters/add_fcm_token.dart';
import '../../../domain/entities/parameters/read.dart';
import '../../../domain/entities/parameters/toggle_notification.dart';
import '../../../domain/entities/parameters/user_by_token.dart';
import '../../../domain/entities/parameters/verify_account.dart';
import '../../../domain/entities/profile_modification_data.dart';

abstract interface class UserDataSource {
  const UserDataSource();
  Future<void> addFcmToken({
    required AddFcmTokenParameters parameters,
  });

  Future<void> deleteAccount();

  Future<Map<String, dynamic>> read({
    required ReadUserParameters parameters,
  });

  Future<void> sendOtpToVerifyUserAccount();

  Future<Map<String, dynamic>> userByToken({
    required UserByTokenParameters parameters,
  });

  Future<Map<String, dynamic>> update({
    required ProfileModificationData data,
  });

  Future<Map<String, dynamic>> verifyAccount({
    required VerifyAccountParameters parameters,
  });

  Future<bool> toggleNotification({
    required ToggleNotificationParameters parameters,
  });
}
