import '../entities/details.dart';
import '../entities/parameters/add_fcm_token.dart';
import '../entities/parameters/read.dart';
import '../entities/parameters/toggle_notification.dart';
import '../entities/parameters/user_by_token.dart';
import '../entities/parameters/verify_account.dart';
import '../entities/profile_modification_data.dart';
import '../entities/user.dart';

abstract interface class UserBaseRepository {
  const UserBaseRepository();

  Future<void> addFcmToken({required AddFcmTokenParameters parameters});

  Future<void> delete();

  Future<UserDetails> read({required ReadUserParameters parameters});

  Future<void> sendOtpToVerifyUserAccount();

  Future<bool> toggleNotification({
    required ToggleNotificationParameters parameters,
  });

  Future<UserDetails> update({required ProfileModificationData data});

  Future<User> userByToken({required UserByTokenParameters parameters});

  Future<User> verifyAccount({required VerifyAccountParameters parameters});
}
