import 'package:flutter/material.dart';

import 'extensions/context_extension.dart';
import 'inheritedNotifier/language_change_notifier.dart';
import 'inheritedNotifier/language_inherited_notifier.dart';

class Home extends StatefulWidget {
  final bool isJsonLocalization;
  const Home({super.key, required this.isJsonLocalization});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final changeNotifier = LanguageChangeNotifier();

  @override
  Widget build(BuildContext context) {
    final notifierWidget = LanguageInheritedNotifier.of(context);
    String title = widget.isJsonLocalization
        ? context.jsonLocalizations.translate("flutterInternationalization")
        : context.appLocalizations.flutterInternationalization;
    String languageSelection = widget.isJsonLocalization
        ? context.jsonLocalizations.translate("languageSelection")
        : context.appLocalizations.languageSelection;

    String english = widget.isJsonLocalization
        ? context.jsonLocalizations.translate("english")
        : context.appLocalizations.english;
    String nepali = widget.isJsonLocalization
        ? context.jsonLocalizations.translate("nepali")
        : context.appLocalizations.nepali;
    String spanish = widget.isJsonLocalization
        ? context.jsonLocalizations.translate("spanish")
        : context.appLocalizations.spanish;
    String hindi = widget.isJsonLocalization
        ? context.jsonLocalizations.translate("hindi")
        : context.appLocalizations.hindi;

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CalendarDatePicker(
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
              onDateChanged: (value) {},
            ),
            Text(
              languageSelection,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            RadioListTile(
              value: "en",
              groupValue: notifierWidget.notifier?.locale.languageCode,
              onChanged: (language) {
                if (language == null) return;

                notifierWidget.changeLanguage(Locale(language));
              },
              title: Text(english),
            ),
            RadioListTile(
              value: "ne",
              groupValue: notifierWidget.notifier?.locale.languageCode,
              onChanged: (language) {
                if (language == null) return;

                notifierWidget.changeLanguage(Locale(language));
              },
              title: Text(nepali),
            ),
            RadioListTile(
              value: "es",
              groupValue: notifierWidget.notifier?.locale.languageCode,
              onChanged: (language) {
                if (language == null) return;

                notifierWidget.changeLanguage(Locale(language));
              },
              title: Text(spanish),
            ),
            RadioListTile(
              value: "hi",
              groupValue: notifierWidget.notifier?.locale.languageCode,
              onChanged: (language) {
                if (language == null) return;

                notifierWidget.changeLanguage(Locale(language));
              },
              title: Text(hindi),
            ),
          ],
        ),
      ),
    );
  }
}
