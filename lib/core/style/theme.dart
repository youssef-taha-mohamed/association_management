import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:management/core/extension/extension_helper.dart';
import '../utils/navigation_service.dart';
import 'app_colors.dart';

String globalLangCode = 'ar';

String fontFamilyAr = 'Cairo';
String fontFamilyEn = 'Noto_Serif';
final font = NavigationService.navigatorKey.currentContext?.isArabic == true
    ? fontFamilyEn
    : fontFamilyAr;
BoxDecoration kCustomBoxDecoration = BoxDecoration(
  color: AppColors.itemBG,
  borderRadius: BorderRadius.circular(15),
);

ThemeData getApplicationTheme({required bool isLight, String lang = "ar"}) {
  // globalLangCode = lang;

  if (isLight) {
    return _getApplicationThemeLight();
  } else {
    return _getApplicationThemeDark();
  }
}

ThemeData _getApplicationThemeLight() {
  return ThemeData(
    primaryColor: AppColors.primaryColor,
    useMaterial3: true,
    fontFamily: font,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: AppColors.defaultColor,
      brightness: Brightness.light,
    ),
    // Main Colors
    primarySwatch: AppColors.defaultColor,
    scaffoldBackgroundColor: AppColors.background,

    // Font Family
    //fontFamily: globalLangCode == 'en' ? fontFamilyEn : fontFamilyAr,

    canvasColor: AppColors.lightThemeBg,

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,
      hintStyle: TextStyle(
        fontFamily: font,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      labelStyle: TextStyle(
        fontFamily: font,
        color: AppColors.grey4,
        fontSize: 16,
      ),
      errorStyle: TextStyle(
        fontFamily: font,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 20,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: AppColors.grey,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: AppColors.primaryColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: AppColors.primaryColor,
          width: 2,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: AppColors.grey300,
          width: 1.5,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: AppColors.red,
          width: 1.5
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: AppColors.red,
          width: 2,
        ),
      ),
    ),
    // AppBar Theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: AppColors.background,
      scrolledUnderElevation: 0,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppColors.black,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontFamily: font,
      ),
      iconTheme: const IconThemeData(color: AppColors.black),
    ),

    // Time Picker Theme
    timePickerTheme: TimePickerThemeData(
      backgroundColor: AppColors.white,
      hourMinuteColor: WidgetStateColor.resolveWith((states) =>
          states.contains(WidgetState.selected)
              ? AppColors.primaryColor
              : AppColors.grey200),
      dayPeriodColor: WidgetStateColor.resolveWith((states) =>
          states.contains(WidgetState.selected)
              ? AppColors.primaryColor
              : AppColors.grey200),
      dayPeriodTextColor: WidgetStateColor.resolveWith((states) =>
          states.contains(WidgetState.selected)
              ? Colors.white
              : Colors.black87),
      hourMinuteTextColor: WidgetStateColor.resolveWith((states) =>
          states.contains(WidgetState.selected)
              ? Colors.white
              : Colors.black87),
      dialHandColor: AppColors.primaryColor,
      dialBackgroundColor: AppColors.grey200,
      hourMinuteTextStyle:
          const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      dayPeriodTextStyle:
          const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      entryModeIconColor: Colors.black87,
    ),

// Date Picker Theme
    datePickerTheme: DatePickerThemeData(
      backgroundColor: AppColors.white,
      headerBackgroundColor: AppColors.primaryColor,
      headerForegroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      dayForegroundColor: WidgetStateColor.resolveWith((states) =>
          states.contains(WidgetState.selected)
              ? Colors.white
              : AppColors.black),
      dayBackgroundColor: WidgetStateColor.resolveWith((states) =>
          states.contains(WidgetState.selected)
              ? AppColors.primaryColor
              : Colors.transparent),
      todayForegroundColor: WidgetStateColor.resolveWith((states) =>
          states.contains(WidgetState.selected)
              ? Colors.white
              : AppColors.primaryColor),
      todayBackgroundColor: WidgetStateColor.resolveWith((states) =>
          states.contains(WidgetState.selected)
              ? AppColors.primaryColor
              : AppColors.primaryColor.withOpacity(0.1)),
      yearForegroundColor: WidgetStateColor.resolveWith((states) =>
          states.contains(WidgetState.selected)
              ? Colors.white
              : AppColors.black),
      yearBackgroundColor: WidgetStateColor.resolveWith((states) =>
          states.contains(WidgetState.selected)
              ? AppColors.primaryColor
              : Colors.transparent),
    ),
    //container theme
    cardTheme: CardTheme(
      color: AppColors.itemBG,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7),
      ),
    ),
    // Radio Theme
    radioTheme: RadioThemeData(
      fillColor:
          WidgetStateColor.resolveWith((states) => AppColors.defaultColor),
    ),

    // navigationBarTheme: const NavigationBarThemeData(
    //   backgroundColor:
    //       AppColors.lightThemeBg, // modified navigation bar's background color
    // ),
    expansionTileTheme: const ExpansionTileThemeData(
      backgroundColor: AppColors.lightThemeBg,
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1, color: AppColors.lightThemeBg),
      ),
      collapsedBackgroundColor: AppColors.lightThemeBg,
      clipBehavior: Clip.antiAlias,
      iconColor: AppColors.colorTheme,
      textColor: AppColors.black,
    ),
    // listTileTheme: const ListTileThemeData(
    //   selectedColor: AppColors.primarySecondColor,
    //   tileColor: AppColors.itemBG,
    //   selectedTileColor: AppColors.lightThemeBg,
    // ),

    // Checkbox Theme
    checkboxTheme: CheckboxThemeData(
      fillColor:
          WidgetStateColor.resolveWith((states) => AppColors.defaultColor),
    ),
    // Text Theme
    textTheme: TextTheme(
      titleSmall: TextStyle(
        color: AppColors.primaryColor,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: font,
      ),
      titleMedium: TextStyle(
        color: AppColors.primaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: font,
      ),
      titleLarge: TextStyle(
        color: AppColors.primaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: font,
      ),
      bodySmall: TextStyle(
        color: AppColors.black,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: font,
      ),
      bodyMedium: TextStyle(
        color: AppColors.black,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: font,
      ),
      bodyLarge: TextStyle(
        color: AppColors.black,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: font,
      ),
      displaySmall: TextStyle(
        color: AppColors.grey,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: font,
      ),
      displayMedium: TextStyle(
        color: AppColors.grey,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: font,
      ),
      displayLarge: TextStyle(
        color: AppColors.grey,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: font,
      ),
      headlineLarge: TextStyle(
        color: AppColors.black,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        fontFamily: font,
      ),
      headlineMedium: TextStyle(
        color: AppColors.black,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontFamily: font,
      ),
      headlineSmall: TextStyle(
        color: AppColors.black,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        fontFamily: font,
      ),
      labelLarge: TextStyle(
        color: AppColors.black,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontFamily: font,
      ),
      labelMedium: TextStyle(
        color: AppColors.black,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        fontFamily: font,
      ),
      labelSmall: TextStyle(
        color: AppColors.black,
        fontSize: 12,
        fontWeight: FontWeight.w600,
        fontFamily: font,
      ),
    ),
  );
}

ThemeData _getApplicationThemeDark() {
  return ThemeData(
    primaryColor: AppColors.primaryColor,
    useMaterial3: true,
    fontFamily: font,
    // Main Colors
    primarySwatch: AppColors.primaryColor,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkItemBG2,
      hintStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        fontFamily: font,
      ),
      labelStyle: TextStyle(
        fontFamily: font,
        fontSize: 12,
      ),
      errorStyle: TextStyle(
        fontFamily: font,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
      isDense: true,
      contentPadding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.grey),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.grey),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.red),
      ),
    ),
    canvasColor: AppColors.darkThemeBg,
    colorScheme: ColorScheme.fromSwatch(
      //TODO
      //primarySwatch: AppColors.secondColor,
      brightness: Brightness.dark,
    ),
    cardTheme: CardTheme(
      color: AppColors.darkItemBG,
      elevation: 0,
      shadowColor: AppColors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7),
      ),
    ),

    scaffoldBackgroundColor: AppColors.darkItemBG3,
    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: AppColors.darkItemBG3,
      // modified navigation bar's background color
    ),
    // Font Family
    //fontFamily: globalLangCode == 'en' ? fontFamilyEn : fontFamilyAr,

    // AppBar Theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColors.darkItemBG3,
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: AppColors.darkItemBG3,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontFamily: font,
        //fontFamily: globalLangCode == 'en' ? fontFamilyEn : fontFamilyAr,
      ),
      iconTheme: const IconThemeData(color: AppColors.white),
    ),

    // Time Picker Theme
    timePickerTheme: TimePickerThemeData(
      backgroundColor: AppColors.darkItemBG3,
      hourMinuteColor: WidgetStateColor.resolveWith((states) =>
          states.contains(WidgetState.selected)
              ? AppColors.primaryColor
              : AppColors.darkItemBG2),
      dayPeriodColor: WidgetStateColor.resolveWith((states) =>
          states.contains(WidgetState.selected)
              ? AppColors.primaryColor
              : AppColors.darkItemBG2),
      dayPeriodTextColor: WidgetStateColor.resolveWith((states) =>
          states.contains(WidgetState.selected)
              ? Colors.white
              : Colors.white70),
      hourMinuteTextColor: WidgetStateColor.resolveWith((states) =>
          states.contains(WidgetState.selected)
              ? Colors.white
              : Colors.white70),
      dialHandColor: AppColors.primaryColor,
      dialBackgroundColor: AppColors.darkItemBG,
      hourMinuteTextStyle:
          const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      dayPeriodTextStyle:
          const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      entryModeIconColor: Colors.white70,
    ),

// Date Picker Theme
    datePickerTheme: DatePickerThemeData(
      backgroundColor: AppColors.darkItemBG3,
      headerBackgroundColor: AppColors.primaryColor,
      headerForegroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      dayForegroundColor: WidgetStateColor.resolveWith((states) =>
          states.contains(WidgetState.selected)
              ? Colors.white
              : AppColors.white),
      dayBackgroundColor: WidgetStateColor.resolveWith((states) =>
          states.contains(WidgetState.selected)
              ? AppColors.primaryColor
              : Colors.transparent),
      todayForegroundColor: WidgetStateColor.resolveWith((states) =>
          states.contains(WidgetState.selected)
              ? Colors.white
              : AppColors.primaryColor),
      todayBackgroundColor: WidgetStateColor.resolveWith((states) =>
          states.contains(WidgetState.selected)
              ? AppColors.primaryColor
              : AppColors.primaryColor.withOpacity(0.3)),
      yearForegroundColor: MaterialStateColor.resolveWith((states) =>
          states.contains(MaterialState.selected)
              ? Colors.white
              : AppColors.white),
      yearBackgroundColor: MaterialStateColor.resolveWith((states) =>
          states.contains(MaterialState.selected)
              ? AppColors.primaryColor
              : Colors.transparent),
    ),

    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
    ),
    // Radio Theme
    radioTheme: RadioThemeData(
      fillColor: WidgetStateColor.resolveWith((states) => AppColors.grey),
    ),
    // Checkbox Theme
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateColor.resolveWith((states) => AppColors.grey),
    ),
    expansionTileTheme: const ExpansionTileThemeData(
      backgroundColor: AppColors.darkThemeBg,
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1, color: AppColors.darkThemeBg),
      ),
      collapsedBackgroundColor: AppColors.darkThemeBg,
      clipBehavior: Clip.antiAlias,
      iconColor: AppColors.white,
      textColor: AppColors.white,
    ),
    listTileTheme: const ListTileThemeData(
      textColor: AppColors.white,
      selectedColor: AppColors.primaryColor,
      tileColor: Colors.transparent,
      selectedTileColor: AppColors.black,
    ),
    // Text Theme
    textTheme: TextTheme(
      titleSmall: TextStyle(
        color: AppColors.primaryColor,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: font,
      ),
      titleMedium: TextStyle(
        color: AppColors.primaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: font,
      ),
      titleLarge: TextStyle(
        color: AppColors.primaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: font,
      ),
      bodySmall: TextStyle(
        color: AppColors.white,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: font,
      ),
      bodyMedium: TextStyle(
        color: AppColors.white,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: font,
      ),
      bodyLarge: TextStyle(
        color: AppColors.white,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: font,
      ),
      displaySmall: TextStyle(
        color: AppColors.grey,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: font,
      ),
      displayMedium: TextStyle(
        color: AppColors.grey,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: font,
      ),
      displayLarge: TextStyle(
        color: AppColors.grey,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: font,
      ),
      headlineLarge: TextStyle(
        color: AppColors.white,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        fontFamily: font,
      ),
      headlineMedium: TextStyle(
        color: AppColors.white,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontFamily: font,
      ),
      headlineSmall: TextStyle(
        color: AppColors.white,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        fontFamily: font,
      ),
      labelLarge: TextStyle(
        color: AppColors.white,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontFamily: font,
      ),
      labelMedium: TextStyle(
        color: AppColors.white,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        fontFamily: font,
      ),
      labelSmall: TextStyle(
        color: AppColors.white,
        fontSize: 12,
        fontWeight: FontWeight.w600,
        fontFamily: font,
      ),
    ),
  );
}
