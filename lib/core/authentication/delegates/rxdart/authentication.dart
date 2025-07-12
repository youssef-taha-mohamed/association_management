import 'dart:async';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_badge/flutter_app_badge.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../feature/auth/domain/entities/login_credentials.dart';
import '../../../../feature/auth/domain/entities/logout_params.dart';
import '../../../../feature/auth/domain/entities/register_credentials.dart';
import '../../../../feature/auth/domain/entities/social_media_credentials.dart';
import '../../../../feature/auth/domain/repositories/authentication.dart';
import '../../../../feature/auth/domain/use_cases/login.dart';
import '../../../../feature/auth/domain/use_cases/login_with_social_media.dart';
import '../../../../feature/auth/domain/use_cases/logout.dart';
import '../../../../feature/auth/domain/use_cases/register.dart';
import '../../../../feature/user/domain/entities/parameters/add_fcm_token.dart';
import '../../../../feature/user/domain/entities/parameters/user_by_token.dart';
import '../../../../feature/user/domain/entities/parameters/verify_account.dart';
import '../../../../feature/user/domain/entities/user.dart';
import '../../../../feature/user/domain/repositories/user.dart';
import '../../../../feature/user/domain/use_cases/add_fcm_token.dart';
import '../../../../feature/user/domain/use_cases/fetch_user_by_token.dart';
import '../../../../feature/user/domain/use_cases/verify_account.dart';
import '../../../utils/notification/notification.dart';
import '../../cache/base/auth.dart';
import '../base/authentication.dart';

final class AuthenticationDelegateWithRxdart implements AuthenticationDelegate {
  AuthenticationDelegateWithRxdart({
    required AuthenticationBaseRepository authRepository,
    required UserBaseRepository userRepository,
    required AuthenticationCache cache,
  })  : _cache = cache,
        _authRepository = authRepository,
        _userRepository = userRepository;

  final AuthenticationBaseRepository _authRepository;
  final UserBaseRepository _userRepository;
  final AuthenticationCache _cache;

  final _userChangesStreamController = BehaviorSubject<User?>.seeded(null);
  final _authChangesStreamController = BehaviorSubject<User?>();
  late final StreamSubscription _authStreamSubscription;

  @override
  User? get currentUser {
    return _userChangesStreamController.value;
  }

  @override
  Future<void> init() async {
    _authStreamSubscription = authStateChanges().listen((event) async {
      if (event == null) {
        await _cache.destroyToken();
      } else {
        await _cache.cacheToken(token: event.accessToken);
      }
    });

    await verifyToken();
  }

  @override
  void dispose() {
    _userChangesStreamController.close();
    _authChangesStreamController.close();
    _authStreamSubscription.cancel();
  }

  @override
  Future<User> login({required LoginCredentials credentials}) async {
    final usecase = Login(repository: _authRepository);
    final user = await usecase.call(credentials: credentials);

    _authChangesStreamController.sink.add(user);
    _userChangesStreamController.sink.add(user);

    return user;
  }

  @override
  void sinkUser(User user) {
    _authChangesStreamController.sink.add(user);
    _userChangesStreamController.sink.add(user);
  }

  @override
  Future<User> loginWithSocialMedia({
    required SocialMediaCredentials credentials,
  }) async {
    final usecase = LoginWithSocialMedia(repository: _authRepository);
    final user = await usecase.call(credentials: credentials);

    _authChangesStreamController.sink.add(user);
    _userChangesStreamController.sink.add(user);

    return user;
  }

  @override
  Future<void> logout() async {
    if (currentUser != null) {
      await Logout(repository: _authRepository).call(
        parameters: LogoutParameters(
            fcmToken: await NotificationUtils.fcmToken() ?? ''),
      );
      await FirebaseMessaging.instance.deleteToken();
      await FlutterAppBadge.count(0);
    }

    _authChangesStreamController.sink.add(null);
    _userChangesStreamController.sink.add(null);
    await NotificationUtils.deleteFcmToken();
  }

  @override
  Future<User> register({
    required RegisterCredentials credentials,
  }) async {
    final usecase = Register(repository: _authRepository);
    final user = await usecase.call(credentials: credentials);

    _authChangesStreamController.sink.add(user);
    _userChangesStreamController.sink.add(user);

    return user;
  }

  @override
  Future<User> verifyAccount({
    required VerifyAccountParameters parameters,
  }) async {
    final usecase = VerifyAccount(repository: _userRepository);
    final user = await usecase.call(parameters: parameters);

    _authChangesStreamController.sink.add(user);
    _userChangesStreamController.sink.add(user);

    return user;
  }

  @override
  Future<void> addFcmToken({required String token}) async {
    if (currentUser == null) {
      return;
    }
    final usecase = AddFcmToken(repository: _userRepository);
    await usecase.call(
      parameters: AddFcmTokenParameters(
        token: token,
        platform:
        Platform.isAndroid ? TargetPlatform.android : TargetPlatform.iOS,
      ),
    );
  }

  @override
  Stream<User?> authStateChanges() {
    return _authChangesStreamController.stream;
  }

  @override
  Stream<User?> userChanges() {
    return _userChangesStreamController.stream;
  }

  @override
  Future<void> verifyToken() async {
    try {
      final token = await _cache.cachedToken();
      if (token == null) {
        _authChangesStreamController.sink.add(null);
        _userChangesStreamController.sink.add(null);
        await NotificationUtils.deleteFcmToken();
        return;
      }

      final usecase = FetchUserByToken(repository: _userRepository);
      final user = await usecase.call(
        parameters: UserByTokenParameters(token: token),
      );

      _userChangesStreamController.sink.add(user);
    } catch (_) {
      try {
        await logout();
      } catch (_) {
        _authChangesStreamController.sink.add(null);
        _userChangesStreamController.sink.add(null);
      }
    }
  }

  @override
  Future<void> refreshUser() async {
    final user = await FetchUserByToken(repository: _userRepository).call(
      parameters: UserByTokenParameters(token: currentUser!.accessToken),
    );
    _userChangesStreamController.sink.add(user);
  }

  @override
  Future<void> logoutLocally() async {
    await _cache.destroyToken();
    _authChangesStreamController.sink.add(null);
    _userChangesStreamController.sink.add(null);
    await NotificationUtils.deleteFcmToken();
  }
}
