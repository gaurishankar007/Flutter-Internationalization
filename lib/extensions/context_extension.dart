import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../localization/json_localization.dart';

extension ContextExtension on BuildContext {
  AppLocalizations get appLocalizations => AppLocalizations.of(this)!;
  JsonLocalizations get jsonLocalizations => JsonLocalizations.of(this)!;
}
