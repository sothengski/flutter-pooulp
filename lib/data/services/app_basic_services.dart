import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';

import '../../core/core.dart';

class AppBasicServices extends GetxService {
  final GetStorage boxStorage = GetStorage(LocalStorage.appBasic);

  Future<bool> saveAppBasicTime({
    String? urlKey = LocalStorage.appBasic,
    String? bodyData,
    // Duration duration = const Duration(days: 1000),
  }) async {
    // final String jsonData = jsonEncode(bodyData);
    // if (jsonData.isNotEmpty) {
    await boxStorage.write(urlKey.toString(), bodyData);
    return true;
    // }
    // return false;
  }

  String? getAppBasicTime() {
    final appBasic = boxStorage.read(LocalStorage.appBasic);
    if (appBasic != null) {
      return appBasic.toString();
    } else {
      // return '';
      return defaultDate;
    }
  }

  Future<Map<String, dynamic>> getLangsFromFile({required String? lang}) async {
    final String fileName = "${lang}TranslationWords.json";

    final dir = await getTemporaryDirectory();
    final File file = File("${dir.path}/$fileName");
    Map<String, dynamic> map = {};

    if (file.existsSync()) {
      final jsonData = file.readAsStringSync();
      map = jsonDecode(jsonData) as Map<String, dynamic>;
      if (lang == 'en') {
        enLangFile = map.map((key, value) => MapEntry(key, value.toString()));
      } else {
        frLangFile = map.map((key, value) => MapEntry(key, value.toString()));
      }
    } else {
      final jsonData = await readJsonFromFile(path: 'assets/data/langs.json');

      if (lang == 'en') {
        final jsonBody = (jsonData.data as Map<String, dynamic>)['en'];
        map = jsonBody as Map<String, dynamic>;
        enLangFile = map.map((key, value) => MapEntry(key, value.toString()));
      } else {
        map = (jsonData.data as Map<String, dynamic>)['fr']
            as Map<String, dynamic>;
        frLangFile = map.map((key, value) => MapEntry(key, value.toString()));
      }
    }
    return map;
  }
}
