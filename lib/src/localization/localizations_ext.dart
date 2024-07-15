import 'package:edu/src/localization/flutter_gen/rivojLocalizations.dart';
import 'package:flutter/material.dart';

extension LocalizationsExt on BuildContext {
  RivojLocalization get locale => RivojLocalization.of(this);
}
