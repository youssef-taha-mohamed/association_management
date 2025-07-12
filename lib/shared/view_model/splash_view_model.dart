import '../../../../core/authentication/cache/disk/hive.dart';
import '../../../../core/authentication/provider.dart';
import '../../../../core/db/kv_db/hive.dart';
//import '../../../../di/dependency_injector.dart';
import '../../../../shared/enum/user_role.dart';
import '../../core/utils/notification/notification.dart';
//import 'notifications_provider.dart';
import 'state.dart';

final class SplashScreenViewModel {
  const SplashScreenViewModel();

  Future<SplashState> init() async {
    await _initAppConfigurations();
    await _initAppDatabases();
    // NotificationsProvider.init(
    //   repository: DependencyInjector.notificationRepository,
    // );
    NotificationUtils.onTokenRefresh().listen((event) {
      AuthenticationProvider.instance.addFcmToken(token: event);
    });
    AuthenticationProvider.instance.authStateChanges().listen((event) async {
      final token = await NotificationUtils.fcmToken();
      if (event != null && token != null) {
        await AuthenticationProvider.instance.addFcmToken(token: token);
      }
    });

    final firstTimeOpenedApp = HiveDatabase.firstTimeOpenedApp();

    if (firstTimeOpenedApp) {
      await HiveDatabase.cacheTheAppIsOpened();
      return SplashState.notOpenedAppBefore;
    } else {
      await AuthenticationProvider.instance.init();
      final user = AuthenticationProvider.instance.currentUser;
      if (user == null) {
        return SplashState.notLoggedIn;
      } else {
        if (user.details.role == UserRole.partner) {
          return SplashState.loggedIn;
        }

        return (user.details.phoneVerified ||
                (user.details.emailVerified ||
                    user.details.loginMethodId != null))
            ? SplashState.loggedIn
            : SplashState.phoneNotVerified;
      }
    }
  }

  Future<void> _initAppConfigurations() async {}

  Future<void> _initAppDatabases() async {
    // HiveDatabase is already initialized in main.dart
    await HiveAuthenticationCache().init();
  }
}
