import 'package:flutter/material.dart';

import 'home.dart';
import 'inheritedNotifier/language_change_notifier.dart';
import 'inheritedNotifier/language_inherited_notifier.dart';
import 'l10n/generated/app_localization.dart';
// import 'localization/json_localization.dart';

main() {
  runApp(const InternationalizationExample());
}

class InternationalizationExample extends StatefulWidget {
  const InternationalizationExample({super.key});

  @override
  State<InternationalizationExample> createState() =>
      _InternationalizationExampleState();
}

class _InternationalizationExampleState
    extends State<InternationalizationExample> {
  final changeNotifier = LanguageChangeNotifier();

  @override
  Widget build(BuildContext context) {
    return LanguageInheritedNotifier(
      notifier: changeNotifier,
      changeLanguage: changeNotifier.setLocale,
      child: Builder(
        builder: (context) {
          final notifierWidget = LanguageInheritedNotifier.of(context);

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Internationalization and Localization',
            localizationsDelegates: AppLocalization.localizationsDelegates,
            supportedLocales: AppLocalization.supportedLocales,
            localeResolutionCallback: (locale, supportedLocales) {
              for (final supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale?.languageCode &&
                    supportedLocale.countryCode == locale?.countryCode) {
                  return locale;
                }
              }

              return supportedLocales.first;
            },
            // localizationsDelegates: JsonLocalization.localizationsDelegates,
            // supportedLocales: JsonLocalization.supportedLocales,
            // localeResolutionCallback: JsonLocalization.localeResolutionCallback,
            locale: notifierWidget.notifier?.locale,
            home: const Home(isJsonLocalization: false),
          );
        },
      ),
    );
  }
}
