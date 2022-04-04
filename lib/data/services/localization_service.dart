import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';

class LocalizationService extends Translations {
  // Default locale
  static Locale? get locale => Get.deviceLocale;

  // static final locale = Locale('en', 'US');
  // fallbackLocale saves the day when the locale gets in trouble
  static const fallbackLocale = Locale('en', 'US');

  // Supported languages
  // Needs to be same order with locales
  // static final langs = [
  //   'English',
  //   'ភាសាខ្មែរ',
  // ];
  static void changeLocale(String langCode) {
    final locale = _getLocaleFromLanguage(langCode: langCode);
    Get.updateLocale(locale!);
  }

  static Locale? _getLocaleFromLanguage({String? langCode}) {
    final lang = langCode ?? Get.deviceLocale;
    for (int i = 0; i < locales.length; i++) {
      if (lang == locales[i]) return locales[i];
    }
    return Get.deviceLocale;
  }

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    const Locale('en', 'US'),
    const Locale('nl', 'NL'),
    const Locale('fr', 'FR'),
  ];

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS, // en_language.dart
        'nl_NL': nlNL, // nl_language.dart
        'fr_FR': frFR, // fr_language.dart
      };
}
