import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'home.dart';
import 'inheritedNotifier/language_change_notifier.dart';
import 'inheritedNotifier/language_inherited_notifier.dart';
// import 'localization/json_localization.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final changeNotifier = LanguageChangeNotifier();

  @override
  Widget build(BuildContext context) {
    return LanguageInheritedNotifier(
      notifier: changeNotifier,
      changeLanguage: changeNotifier.setLocale,
      child: Builder(
        builder: (context) {
          // final notifierWidget = LanguageInheritedNotifier.of(context);

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Internationalization and Localization',
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            localeResolutionCallback: (locale, supportedLocales) {
              for (final supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale?.languageCode &&
                    supportedLocale.countryCode == locale?.countryCode) {
                  return locale;
                }
              }

              return supportedLocales.first;
            },
            // localizationsDelegates: JsonLocalizations.localizationsDelegates,
            // supportedLocales: JsonLocalizations.supportedLocales,
            // localeResolutionCallback: JsonLocalizations.localeResolutionCallback,
            // locale: notifierWidget.notifier?.locale,
            home: const Home(isJsonLocalization: false),
          );
        },
      ),
    );
  }
}
