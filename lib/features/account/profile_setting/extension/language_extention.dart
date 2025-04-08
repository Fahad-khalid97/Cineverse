import 'package:cineverse/features/account/profile_setting/enum/profile_setting.dart';

extension AppLanguageExtension on AppLanguage {
  String get label {
    switch (this) {
      case AppLanguage.en:
        return 'English';
      case AppLanguage.fr:
        return 'French';
      case AppLanguage.es:
        return 'Spanish';
      case AppLanguage.ar:
        return 'Arabic';
    }
  }
}
