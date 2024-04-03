import 'package:flutter/material.dart';

import 'extensions/context_extension.dart';
import 'inheritedNotifier/language_change_notifier.dart';
import 'inheritedNotifier/language_inherited_notifier.dart';

class Home extends StatefulWidget {
  final bool json;
  const Home({super.key, required this.json});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final changeNotifier = LanguageChangeNotifier();

  @override
  Widget build(BuildContext context) {
    final notifierWidget = LanguageInheritedNotifier.of(context);
    String title = widget.json
        ? context.jsonLocalizations.translate("flutterInternationalization")
        : context.appLocalizations.flutterInternationalization;
    String languageSelection = widget.json
        ? context.jsonLocalizations.translate("languageSelection")
        : context.appLocalizations.languageSelection;

    String english = widget.json
        ? context.jsonLocalizations.translate("english")
        : context.appLocalizations.english;
    String nepali = widget.json
        ? context.jsonLocalizations.translate("nepali")
        : context.appLocalizations.nepali;
    String spanish = widget.json
        ? context.jsonLocalizations.translate("spanish")
        : context.appLocalizations.spanish;
    String hindi =
        widget.json ? context.jsonLocalizations.translate("hindi") : context.appLocalizations.hindi;

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
