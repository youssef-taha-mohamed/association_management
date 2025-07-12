import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:management/l10n/arb/app_localizations.dart';
import 'package:requests_inspector/requests_inspector.dart';
import '../core/network/client/dio/client.dart';
import '../core/routes/app_router.dart';
import '../core/style/theme.dart';
import '../core/utils/navigation_service.dart';
import '../core/utils/size_utils.dart';
import '../l10n/l10n.dart';
import '../shared/cubits/language/language_cubit.dart';
import '../shared/cubits/theme/theme_cubit.dart';
import '../shared/screens/splash_view.dart';

class ManagementApp extends StatelessWidget {
  factory ManagementApp() => _singleton;

  const ManagementApp._();

  static const _singleton = ManagementApp._();

  @override
  Widget build(BuildContext context) {
    return RequestsInspector(
      navigatorKey: NavigationService.navigatorKey,
      enabled: inspectorEnabled,
      showInspectorOn: ShowInspectorOn.LongPress,
      hideInspectorBanner: true,
      child: Sizer(
        builder:
            (context, orientation, deviceType) => ScreenUtilInit(
              useInheritedMediaQuery: true,
              designSize: const Size(375, 790),
              child: BlocBuilder<ThemeCubit, ThemeState>(
                builder:
                    (context, state) => MaterialApp(
                      debugShowCheckedModeBanner: false,
                      navigatorObservers: [AppNavObserver()],
                      debugShowMaterialGrid: false,
                      navigatorKey: NavigationService.navigatorKey,
                      localizationsDelegates:
                          AppLocalizations.localizationsDelegates,
                      supportedLocales: AppLocalizations.supportedLocales,
                      locale: Locale(
                        context.watch<LanguageCubit>().state.languageCode,
                      ),
                      onGenerateRoute: AppRouter.generateRoute,
                      theme: getApplicationTheme(
                        isLight: true,
                        lang: context.watch<LanguageCubit>().state.languageCode,
                      ),
                      darkTheme: getApplicationTheme(
                        isLight: false,
                        lang: context.watch<LanguageCubit>().state.languageCode,
                      ),
                      themeMode: ThemeCubit.themeMode,
                      home: SplashScreen(),
                      builder: (context, child) {
                        // NavigatorHelper.of(context);
                        return Builder(
                          builder: (context) {
                            return Directionality(
                              textDirection:
                                  context.l10n.localeName == 'ar'
                                      ? TextDirection.rtl
                                      : TextDirection.ltr,
                              child: child!,
                            );
                          },
                        );
                      },
                    ),
              ),
            ),
      ),
    );
  }
}

class AppNavObserver extends NavigatorObserver {
  static final navStack = <RouteStackItem>[];

  @override
  void didPop(Route route, Route? previousRoute) {
    if (previousRoute != null) {
      navStack.removeLast();
    }
    super.didPop(route, previousRoute);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    log('didPush: ${route.settings.name}');
    navStack.add(RouteStackItem.fromRoute(route));
    super.didPush(route, previousRoute);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    if (previousRoute != null) {
      navStack.removeLast();
    }
    super.didRemove(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    if (oldRoute != null) {
      navStack.removeLast();
    }
    if (newRoute != null) {
      navStack.add(RouteStackItem.fromRoute(newRoute));
    }
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  @override
  void didStartUserGesture(Route route, Route? previousRoute) {
    // TODO: implement didStartUserGesture
    super.didStartUserGesture(route, previousRoute);
  }

  @override
  void didStopUserGesture() {
    // TODO: impl
    super.didStopUserGesture();
  }
}

class RouteStackItem {
  final String? name;
  final Object? args;

  const RouteStackItem({required this.name, required this.args});

  factory RouteStackItem.fromRoute(Route route) =>
      RouteStackItem(name: route.settings.name, args: route.settings.arguments);
}
