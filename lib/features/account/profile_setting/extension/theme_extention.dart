import 'package:cineverse/features/account/profile_setting/enum/profile_setting.dart';

extension AppThemeModeExtension on AppThemeMode {
  String get label {
    switch (this) {
      case AppThemeMode.light:
        return 'Light';
      case AppThemeMode.dark:
        return 'Dark';
      case AppThemeMode.system:
      default:
        return 'System';
    }
  }
}
