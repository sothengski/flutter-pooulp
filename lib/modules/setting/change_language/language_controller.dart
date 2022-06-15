import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/data.dart';

class LanguageController extends GetxController {
  static LanguageController get to => Get.find();
  final language = "".obs;
  final storage = Get.find<StorageServices>();

  final String defaultLanguage = 'en';

  final List<MenuOptionsModel> languageOptions = [
    MenuOptionsModel(key: "en", value: "English", flagPath: 'GB'), //English
    MenuOptionsModel(key: "fr", value: "Français", flagPath: 'FR'), //Khmer
    // MenuOptionsModel(key: "nl", value: "Nederlands", flagPath: 'NL'), //Chinese
    // MenuOptionsModel(key: "km", value: "ភាសាខ្មែរ", flagPath: 'KH'), //Khmer
    // MenuOptionsModel(key: "zh", value: "简体中文", flagPath: 'CN'), //Chinese
  ];

  // RxString selected = "English".obs;
  String get currentLanguage => language.value;

  @override
  Future<void> onInit() async {
    super.onInit();
    currentLanguageStore;
    // setInitialLocalLanguage();
  }

  // Gets current language stored
  RxString get currentLanguageStore {
    language.value = storage.readData('language').toString();
    return language;
  }

  static final locales = [
    const Locale('en', 'US'),
    const Locale('nl', 'NL'),
    const Locale('fr', 'FR'),
  ];

  // gets the language locale app is set to
  Locale? get getLocale {
    if (currentLanguageStore.value == '') {
      // language.value = languageOptions as String;
      updateLanguage(defaultLanguage);
    } else if (currentLanguageStore.value != '') {
      //set the stored string country code to the locale
      return currentLanguageStore.value == 'en'
          ? locales[0]
          : currentLanguageStore.value == 'nl'
              ? locales[1]
              : locales[2];
    }
    // gets the default language key for the system.
    return Get.deviceLocale;
  }

// updates the language stored
  Future<void> updateLanguage(String? value) async {
    language.value = value!;
    await storage.writeData('language', value);
    if (getLocale != null) {
      Get.updateLocale(getLocale!);
    }
    update();
  }
}
