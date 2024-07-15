import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'rivojLocalization_uz.dart';

abstract class RivojLocalization {
  RivojLocalization(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static RivojLocalization of(BuildContext context) {
    return Localizations.of<RivojLocalization>(context, RivojLocalization)!;
  }

  static const LocalizationsDelegate<RivojLocalization> delegate = _RivojLocalizationDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('uz')
  ];

  /// No description provided for @hi.
  ///
  /// In uz, this message translates to:
  /// **'salom'**
  String get hi;

  
}

class _RivojLocalizationDelegate extends LocalizationsDelegate<RivojLocalization> {
  const _RivojLocalizationDelegate();

  @override
  Future<RivojLocalization> load(Locale locale) {
    return SynchronousFuture<RivojLocalization>(lookupCrmLocalization(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['uz'].contains(locale.languageCode);

  @override
  bool shouldReload(_RivojLocalizationDelegate old) => false;
}

RivojLocalization lookupCrmLocalization(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'uz': return RivojLocalizationU();
  }

  throw FlutterError(
    'CrmLocalization.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
