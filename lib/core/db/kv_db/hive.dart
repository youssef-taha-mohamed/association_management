import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

abstract interface class HiveDatabase {
  HiveDatabase();

  static late final Box<bool> _appInfo;
  static late final Box<String> _appSettings;

  // تهيئة قاعدة البيانات
  static Future<void> init() async {
    final appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    _appInfo = await Hive.openBox<bool>('app_info');
    _appSettings = await Hive.openBox<String>('app_settings');
  }

  static Future<void> cacheTheAppIsOpened() async {
    return _appInfo.put('first_time_openedApp', false);
  }

  static bool firstTimeOpenedApp() {
    return _appInfo.get('first_time_openedApp', defaultValue: true) ?? true;
  }

  static Future<void> setLanguageCode(String languageCode) async {
    await _appSettings.put('language_code', languageCode);
  }

  static String? getLanguageCode() {
    return _appSettings.get('language_code');
  }

  static Future<void> setTheme(bool isDark) async {
    await _appSettings.put('theme_is_dark', isDark.toString());
  }

  static bool? getTheme() {
    final themeString = _appSettings.get('theme_is_dark');
    return themeString != null ? themeString == 'true' : null;
  }
}