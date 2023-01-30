import 'dart:io';

import 'package:flutter/material.dart';

class LanguageManager {
  LanguageManager._init();
  static LanguageManager? _instance;
  static LanguageManager get instance {
    _instance ??= LanguageManager._init();
    return _instance!;
  }

  final enLocale = const Locale('en', 'US');
  final trLocale = const Locale('tr', 'TR');

  List<Locale> get supportedLocales => [enLocale, trLocale];

  Locale get getDeviceLocale {
    //todo check if country code is important
    //todo check if not using country code might cause any problems
    String deviceLanguageCode = Platform.localeName.split('_')[0];
    // String deviceCountryCode = Platform.localeName.split('_')[1];

    return supportedLocales.firstWhere(
        (supportedLocale) => supportedLocale.languageCode == deviceLanguageCode,
        orElse: () {
      return enLocale;
    });
  }
}
