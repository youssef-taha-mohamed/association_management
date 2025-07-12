import '../../../../../domain/entities/parameters/read.dart';
import '../../../../../domain/entities/parameters/toggle_notification.dart';
import '../../../../../domain/entities/profile_modification_data.dart';

abstract interface class UserEndpoints {
  const UserEndpoints();

  Uri get addFcmToken;

  Uri get delete;

  Uri read({required ReadUserParameters parameters});

  Uri get sendOtpToVerifyUserAccount;

  Uri toggleNotification({
    required ToggleNotificationParameters parameters,
  });

  Uri update({required ProfileModificationData data});

  Uri get userByToken;

  Uri get userToggleOnline;

  Uri get verifyAccount;

  Uri userToggleFast(int id);

  Uri  userToggleBusy(int id);
}
