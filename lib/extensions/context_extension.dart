import 'package:flutter/material.dart';

import '../l10n/generated/app_localization.dart';
import '../localization/json_localization.dart';

extension ContextExtension on BuildContext {
  AppLocalization get appLocalizations => AppLocalization.of(this);
  JsonLocalization get jsonLocalizations => JsonLocalization.of(this)!;
}
