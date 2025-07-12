import 'dart:async';
import 'dart:developer';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/management_app.dart';
import 'core/di/dependency_injector.dart';
import 'firebase_options.dart';
import 'shared/cubits/language/language_cubit.dart';
import 'shared/cubits/theme/theme_cubit.dart';
import 'core/db/kv_db/hive.dart';
import 'core/authentication/provider.dart';

// تحسين مراقب Bloc للتعامل مع الأخطاء بشكل أفضل
class KonozBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    // log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log('onEvent(${bloc.runtimeType}, $event)');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    log('onTransition(${bloc.runtimeType}, $transition)');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    // تسجيل الأخطاء في Firebase Crashlytics
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log('onCreate(${bloc.runtimeType})');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log('onClose(${bloc.runtimeType})');
  }
}

Future<void> main() async {
  // تهيئة كل شيء داخل منطقة واحدة (zone) باستخدام runZonedGuarded
  runZonedGuarded(() async {
    // تهيئة Flutter bindings أولاً
    WidgetsFlutterBinding.ensureInitialized();

    // إعداد مراقب الأخطاء في Flutter
    FlutterError.onError = (FlutterErrorDetails details) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(details);
    };

    // Initialize Firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // تهيئة Crashlytics للتعامل مع الأخطاء
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

    // Initialize Hive before creating any cubits
    await HiveDatabase.init();

    // إعداد حقن التبعيات
    DependencyInjector.setup();

    AuthenticationProvider.injectDelegate(
      delegate: DependencyInjector.authenticationDelegateWithRxdart,
    );

    // تعيين مراقب Bloc المحسن
    Bloc.observer = KonozBlocObserver();

    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ThemeCubit(),
          ),
          BlocProvider(
            create: (context) => LanguageCubit(),
          ),
        ],
        child: DevicePreview(
          enabled: false,
          builder: (context) => ManagementApp(),
        ),
      ),
    );
  }, (error, stack) {
    // تسجيل الأخطاء غير المعالجة في Firebase Crashlytics
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    log('Fatal error occurred: $error');
    log(stack.toString());
  });
}