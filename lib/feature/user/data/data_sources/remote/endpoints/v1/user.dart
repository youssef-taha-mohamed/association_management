import '../../../../../domain/entities/parameters/read.dart';
import '../../../../../domain/entities/parameters/toggle_notification.dart';
import '../../../../../domain/entities/profile_modification_data.dart';
import '../base/user.dart';

final class UserEndpointsV1 implements UserEndpoints {
  const UserEndpointsV1();

  @override
  Uri get addFcmToken {
    return Uri.parse('api/v1/add_push_message_token');
  }

  @override
  Uri get delete {
    return Uri.parse('api/v1/user/profile/delete');
  }

  @override
  Uri read({required ReadUserParameters parameters}) {
    return Uri.parse('api/v1/users/${parameters.userId}');
  }

  @override
  Uri get sendOtpToVerifyUserAccount {
    return Uri.parse('api/v1/check-phone-verification');
  }

  @override
  Uri toggleNotification({required ToggleNotificationParameters parameters}) {
    return Uri.parse('api/v1/users/${parameters.userId}/toggle-notifications');
  }

  @override
  Uri update({required ProfileModificationData data}) {
    return Uri.parse('api/v1/user/profile/${data.userId}');
  }

  @override
  Uri get userByToken {
    return Uri.parse('api/v1/users/by-token');
  }

  @override
  Uri get userToggleOnline {
    return Uri.parse('api/v1/users/toggle-online');
  }

  @override
  Uri get verifyAccount {
    return Uri.parse('api/v1/verify-phone');
  }

  @override
  Uri  userToggleBusy(int id) {
    
    return Uri.parse('api/v1/users/${id}/toggle-busy');
  }

  @override
  Uri userToggleFast(int id) {
    
    return Uri.parse('api/v1/users/$id/toggle-allow-fast-dreams');
  }
}
