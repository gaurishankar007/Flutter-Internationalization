import 'package:flutter/material.dart';

import 'language_change_notifier.dart';

class LanguageInheritedNotifier extends InheritedNotifier<LanguageChangeNotifier> {
  final Function(Locale) changeLanguage;

  const LanguageInheritedNotifier({
    super.key,
    required super.notifier,
    required this.changeLanguage,
    required super.child,
  });

  static LanguageInheritedNotifier of(BuildContext context) {
    final notifier = context.dependOnInheritedWidgetOfExactType<LanguageInheritedNotifier>();

    assert(notifier != null, "LanguageInheritedNotifier is not found.");

    return notifier!;
  }
}
