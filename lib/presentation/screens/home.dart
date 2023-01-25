import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/constant.dart';
import '../cubits/language/language_cubit.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedLanguage = "en";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.flutterInternationalization),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: sWidth(context) * .04,
          vertical: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CalendarDatePicker(
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
              onDateChanged: (value) {},
            ),
            Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.languageSelection,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            RadioListTile(
              value: "en",
              groupValue: selectedLanguage,
              onChanged: (language) {
                if (language == null) return;
                setState(() {
                  selectedLanguage = language;
                });
                BlocProvider.of<LanguageCubit>(context)
                    .changeLanguage(locale: Locale(language));
              },
              title: Text(AppLocalizations.of(context)!.english),
            ),
            RadioListTile(
              value: "ne",
              groupValue: selectedLanguage,
              onChanged: (language) {
                if (language == null) return;
                setState(() {
                  selectedLanguage = language;
                });
                BlocProvider.of<LanguageCubit>(context)
                    .changeLanguage(locale: Locale(language));
              },
              title: Text(AppLocalizations.of(context)!.nepali),
            ),
            RadioListTile(
              value: "es",
              groupValue: selectedLanguage,
              onChanged: (language) {
                if (language == null) return;
                setState(() {
                  selectedLanguage = language;
                });
                BlocProvider.of<LanguageCubit>(context)
                    .changeLanguage(locale: Locale(language));
              },
              title: Text(AppLocalizations.of(context)!.spanish),
            ),
            RadioListTile(
              value: "hi",
              groupValue: selectedLanguage,
              onChanged: (language) {
                if (language == null) return;
                setState(() {
                  selectedLanguage = language;
                });
                BlocProvider.of<LanguageCubit>(context)
                    .changeLanguage(locale: Locale(language));
              },
              title: Text(AppLocalizations.of(context)!.hindi),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, "/product"),
              child: Text(AppLocalizations.of(context)!.productPage),
            ),
          ],
        ),
      ),
    );
  }
}
