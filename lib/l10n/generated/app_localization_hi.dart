import 'app_localization.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationHi extends AppLocalization {
  AppLocalizationHi([String locale = 'hi']) : super(locale);

  @override
  String get flutterInternationalization => 'स्पंदन अंतर्राष्ट्रीयकरण';

  @override
  String get languageSelection => 'Select the language';

  @override
  String get english => 'अंग्रेजी';

  @override
  String get nepali => 'नेपाली';

  @override
  String get spanish => 'स्पैनिश';

  @override
  String get hindi => 'हिन्दी';
}
