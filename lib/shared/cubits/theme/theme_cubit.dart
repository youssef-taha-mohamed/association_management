import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/db/kv_db/hive.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> with WidgetsBindingObserver {
  ThemeCubit() : super(ThemeInitialState()) {
    WidgetsBinding.instance.addObserver(this);
  }

  static ThemeCubit get(context) => BlocProvider.of<ThemeCubit>(context);

  static ThemeMode themeMode = ThemeMode.light;
  static bool isDark = false;

  @override
  void didChangePlatformBrightness() {
    final Brightness brightness =
        PlatformDispatcher.instance.platformBrightness;

    isDark = brightness == Brightness.dark;
    themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    HiveDatabase.setTheme(isDark);

    emit(ToggleThemeState(
      isDark: isDark,
    ));
  }

  Future<void> getSystemTheme() async {
    bool? data = HiveDatabase.getTheme();
    if (data != null) {
      isDark = data;
      themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
      emit(ToggleThemeState(
        isDark: isDark,
      ));
      return;
    }
    final Brightness brightness = PlatformDispatcher.instance.platformBrightness;
    isDark = brightness == Brightness.dark;
    themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    await HiveDatabase.setTheme(isDark);
    emit(ToggleThemeState(
      isDark: isDark,
    ));
  }

  void toggleTheme() {
    isDark = !isDark;
    themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    HiveDatabase.setTheme(isDark);
    emit(ToggleThemeState(
      isDark: isDark,
    ));
  }

  void setTheme(ThemeMode theme) {
    isDark = theme == ThemeMode.dark;
    themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    HiveDatabase.setTheme(isDark);
    emit(ToggleThemeState(
      isDark: isDark,
    ));
  }

  void refreshTheme() {
    emit(ToggleThemeState(
      isDark: isDark,
    ));
  }
}