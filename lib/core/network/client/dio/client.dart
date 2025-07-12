import 'dart:developer';
import 'dart:io';
import 'package:management/l10n/arb/app_localizations.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:requests_inspector/requests_inspector.dart';
import '../../../../feature/auth/presentation/view/login.dart';
import '../../../../l10n/l10n.dart';
import '../../../authentication/provider.dart';
import '../../../utils/navigation_service.dart';

final inspectorEnabled = true;

final class DioClient {
  late final Dio _dio;

  static final _singleton = DioClient._internal();

  factory DioClient() {
    return _singleton;
  }

  DioClient._internal() {
    final options = BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      connectTimeout: Duration(milliseconds: 100000),
      receiveTimeout: Duration(milliseconds: 100000),
      sendTimeout: Duration(milliseconds: 100000),
      validateStatus: (status) {
        return true;
      },
      receiveDataWhenStatusError: true,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    _dio = Dio(options);

    if (inspectorEnabled) {
      _dio.interceptors.add(RequestsInspectorInterceptor());
    }
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final packageInfo = await PackageInfo.fromPlatform();
          options.headers.addAll({
            "Content-Type": "application/json",
            "Accept": "application/json",
            //"X-Socket-Id":
            // await PusherChannelsFlutter.getInstance().getSocketId(),
            if (Platform.isIOS && kDebugMode == false)
              'ios_version': packageInfo.version,
          });
          final tkn = AuthenticationProvider.instance.currentUser?.accessToken;
          if (tkn != null) {
            options.headers['Authorization'] = 'Bearer $tkn';
          }

          final context = NavigationService.navigatorKey.currentContext;
          if (context != null) {
            final currentLocaleName = AppLocalizations.of(context).localeName;
            options.headers['Accept-Language'] = currentLocaleName;
          }
          return handler.next(options);
        },
        onResponse: (response, handler) async {
          try {
            // التحقق من حالة الخطأ 401 للتعامل مع انتهاء صلاحية التوكن
            if (response.statusCode == 401) {
              log(
                '401 Unauthorized - Logging out user and redirecting to login',
              );
              // تسجيل الخروج محلياً
              await AuthenticationProvider.instance.logoutLocally();

              // التوجيه إلى صفحة تسجيل الدخول
              NavigationService.navigatorKey.currentState?.pushNamedAndRemoveUntil(
                LoginView
                    .routeName, // استبدل هذا بمسار صفحة تسجيل الدخول الخاصة بك
                (route) => false,
              );
            }
            final json = Map<String, dynamic>.from(response.data as Map);
            if (response.statusCode == 500) {
              if (json['error']['error_message'] == 'Unauthorized') {
                await AuthenticationProvider.instance.logoutLocally();

                // final client = const HttpNetworkClient();
                //  await NavigationService.navigatorKey.currentState!
                //       .pushNamedAndRemoveUntil(
                //     WelcomeView.routeName,
                //     (route) => false,
                //   );
              }
            }
          } catch (_) {}
          return handler.next(response);
        },
      ),
    );
    _dio.interceptors.add(
      PrettyDioLogger(
        responseBody: false,
        requestHeader: true,
        logPrint: (object) => log('$object'),
      ),
    );
  }

  Dio get instance => _dio;
}
