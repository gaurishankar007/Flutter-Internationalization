import 'app_localization.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationEn extends AppLocalization {
  AppLocalizationEn([String locale = 'en']) : super(locale);

  @override
  String get flutterInternationalization => 'Flutter Internationalization';

  @override
  String get languageSelection => 'Select the language';

  @override
  String get english => 'Engilsh';

  @override
  String get nepali => 'Nepali';

  @override
  String get spanish => 'Spanish';

  @override
  String get hindi => 'Hindi';
}
