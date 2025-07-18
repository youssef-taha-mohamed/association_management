import 'package:flutter/material.dart';

class AppColors {
  // اللون الرئيسي الجديد بدرجاته (لون إسلامي هادئ يناسب تعليم القرآن)
  static const MaterialColor defaultColor = MaterialColor(
    _defaultColorPrimaryValue,
    <int, Color>{
      50: Color(0xFFE3F4F4),
      100: Color(0xFFBAE4E4),
      200: Color(0xFF8FD3D2),
      300: Color(0xFF64C1C1),
      400: Color(0xFF45B3B3),
      500: Color(_defaultColorPrimaryValue), // اللون الرئيسي
      600: Color(0xFF278F8F),
      700: Color(0xFF228484),
      800: Color(0xFF1D7A7A),
      900: Color(0xFF136868),
    },
  );
  static const int _defaultColorPrimaryValue = 0xFF2C7A7B;

  static const primaryColor = defaultColor;

  // ألوان إضافية متناسقة
  static const Color secondaryColor = Color(0xFFB4D9C2); // لون فاتح مريح
  static const Color tertiaryColor = Color(0xFF5A9F8E);  // لون مكمل مائل للأزرق الأخضر

  // ألوان جميلة إضافية
  static const Color goldAccent = Color(0xFFE4B95B); // لون ذهبي ناعم
  static const Color darkGreen = Color(0xFF1E4D4D);  // لون داكن يستخدم في الوضع الغامق

  // الوضع الغامق / الفاتح
  static const Color darkThemeBg = Color(0xFF1B1E23);
  static const Color lightThemeBg = Color(0xFFFDFDFD);

  // الخلفية العامة
  static const Color background = Color(0xFFF4F4F5);

  // باقي الألوان القديمة كما هي بدون تغيير
  static const Color colorTheme = Color(0xFFEFB287);
  static const Color colorDark = Color(0xFFEDA674);
  static const Color colorLight = Color(0xFFF2D1B7);

  static const Color textTwo = Color(0xff8E8E8E);
  static const Color customRed = Color(0xffE7484C);
  static const Color black = Color(0xff021424);
  static const Color grey1 = Color(0xFF606060);
  static const Color scaffoldColor = Color(0xFFF4F4F4);
  static const Color dialogColor = Color(0xff2A303E);
  static const Color appYellow = Color(0xffEDA10E);
  static const Color green = Color(0xFF0C9B23);
  static const Color greenOpacity1 = Color(0x1A4CAF50);
  static const Color hintTextColor = Color(0xFF515151);
  static const Color white0 = Color(0xFF6C6C6C);
  static const Color iconBackColor = Color(0xFF001A72);
  static const Color grey19 = Color(0xffD9D9D9);
  static const Color grey10 = Color(0xff626262);
  static const Color grey4 = Color(0xff8D8D8D);
  static const Color blurOpacity = Color(0xffCEE5FB);
  static const Color grey3 = Color(0xffA0A0A0);
  static const Color chatColor = Color(0xffCCCCCC);
  static const Color chatColor2 = Color(0xffE9E9E9);
  static const Color colorCard = Color(0xffDDDDDD);
  static const Color textCard = Color(0xff717171);
  static const Color buttonProfile = Color(0xffA0A0A0);
  static const Color textBottomSheetColor = Color(0xff52616A);
  static const Color buttonBlue = Color.fromRGBO(14, 123, 223, 0.10);
  static const Color red = Colors.red;
  static const Color appRed = Color(0xFFAC3C44);
  static const Color white = Colors.white;
  static const Color whiteOpacity2 = Color(0x33FFFFFF);
  static const Color whiteOpacity5 = Color(0x80FFFFFF);
  static Color red700 = Colors.red.shade700;
  static const Color grey = Colors.grey;
  static const Color itemBHome = Color(0xff4D4D4D);
  static const Color blackOpacity700 = Color(0xB3000000);
  static const Color colorShimmerCard = Color(0xFF112637);
  static const Color baseColorShimmer = Color(0xFF2b556b);
  static const Color iconsColor = Color(0xffABABAB);
  static const Color greyBorder = Color(0xffD3D3D3);
  static const Color textThree = Color(0xff4E4E4E);
  static const Color darkBlue = Color(0xff454F54);
  static const Color appGreen = Color(0xff56EEC5);
  static const Color blue = Colors.blue;
  static const Color itemBG = Color(0xFFE8E7E7);
  static const Color darkItemBG = Color(0xFF2B2B2B);
  static const Color darkItemBG2 = Color(0xFF24292D);
  static const Color darkItemBG3 = Color(0xFF0F1116);
  static const Color darkItemBG4 = Color(0xFF1c1f24);
  static const Color darkGrey = Color(0xff1B1B1B);
  static const Color yellow2 = Color(0xffFDDB7A);
  static const grey50 = Color(0xFFFAFAFA);
  static const grey100 = Color(0xFFF5F5F5);
  static const grey200 = Color(0xFFEEEEEE);
  static const grey300 = Color(0xFFE0E0E0);
  static const grey400 = Color(0xFFBDBDBD);
  static const grey500 = Color(0xFF9E9E9E);
  static const grey600 = Color(0xFF757575);
  static const grey700 = Color(0xFF616161);

  static const color3 = Color(0xff476D8E);
  static const color8 = Color(0xff0b2235);
  static const Color error = Color(0xFFDC3545); // A standard error red color


// new colors
  static const Color islamicGold = Color(0xFFDAAA33);

  // لون أخضر مائل للأزرق بدرجة أفتح قليلا
  static const Color lightTeal = Color(0xFF3DACAC);

  // لون أخضر داكن لإضافة العمق
  static const Color deepGreen = Color(0xFF174D4D);

  // درجات لون الخط المناسبة للتطبيق
  static const Color textDark = Color(0xFF1A3838);
  static const Color textLight = Color(0xFFF9FFFF);

  // لون خلفية بديل للوضع الفاتح
  static const Color lightBackground = Color(0xFFF0F7F7);

  // ألوان مناسبة لعناصر الآيات القرآنية
  static const Color verseBackground = Color(0xFFF8F4E9);
  static const Color verseBorder = Color(0xFFD1C9B0);

  // ألوان تمييز أحكام التجويد
  static const Color tajweedRed = Color(0xFFD13A3A);
  static const Color tajweedBlue = Color(0xFF3A64D1);
  static const Color tajweedGreen = Color(0xFF3AD15A);


}
