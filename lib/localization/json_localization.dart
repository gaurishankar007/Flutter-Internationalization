import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class JsonLocalizations {
  late final Locale _locale;
  late Map<String, String> _localizedValues;

  JsonLocalizations(this._locale);

  /// Helper method to keep the code in the widgets concise
  /// Localizations are accessed using an InheritedWidget "of" syntax
  static JsonLocalizations? of(BuildContext context) {
    return Localizations.of<JsonLocalizations>(context, JsonLocalizations);
  }

  /// Static member to have a simple access to the delegate from the MaterialApp
  static const LocalizationsDelegate<JsonLocalizations> delegate = _JsonLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('hi'),
    Locale('ne')
  ];

  static LocaleResolutionCallback? get localeResolutionCallback => (locale, supportedLocales) {
        // Check if the current device locale is supported
        for (final supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode &&
              supportedLocale.countryCode == locale?.countryCode) {
            return locale;
          }
        }

        /// If the locale of the device is not supported, use the first one
        /// from the list (English, in this case).
        return supportedLocales.first;
      };

  Future<bool> loadLanguage() async {
    /// Load the language JSON file from the assets folder
    String jsonStringValues = await rootBundle.loadString("${_locale.languageCode}.json");
    Map<String, dynamic> jsonMap = json.decode(jsonStringValues);

    /// Converting `dynamic` value to `String` from Map<String, dynamic>
    /// Because `jsonMap` is of type Map<String, String>
    _localizedValues = jsonMap.map(
      (key, value) => MapEntry(key, value.toString()),
    );

    return true;
  }

  /// This method will be called from every widget which needs a localized text
  String translate(String key) => _localizedValues[key] ?? "key not found";
}

/// LocalizationsDelegate is a factory for a set of localized resources
/// In this case, the localized strings will be gotten in an AppLocalizations object
class _JsonLocalizationsDelegate extends LocalizationsDelegate<JsonLocalizations> {
  /// This delegate instance will never change (it doesn't even have fields!)
  /// It can provide a constant constructor.
  const _JsonLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    /// Include all of your supported language codes here
    return ["en", "es", "hi", "ne"].contains(locale.languageCode);
  }

  @override
  Future<JsonLocalizations> load(Locale locale) async {
    /// AppLocalizations class is where the JSON loading actually runs
    JsonLocalizations appLocalization = JsonLocalizations(locale);
    await appLocalization.loadLanguage();
    return appLocalization;
  }

  @override
  bool shouldReload(_JsonLocalizationsDelegate old) => false;
}
