import 'package:flutter/material.dart';

class LanguageChangeNotifier extends ChangeNotifier {
  Locale locale = const Locale("en");

  void setLocale(Locale newLocal) {
    locale = newLocal;
    notifyListeners();
  }
}
