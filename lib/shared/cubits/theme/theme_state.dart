part of 'theme_cubit.dart';
abstract class ThemeState {}

class ThemeInitialState extends ThemeState {}

class ToggleThemeState extends ThemeState {
  final bool isDark;

  ToggleThemeState({required this.isDark});
}
