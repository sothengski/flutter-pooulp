import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';

import '../../core/core.dart';

class AppBasicServices extends GetxService {
  final GetStorage boxStorage = GetStorage(LocalStorage.appBasic);

  Future<Map<String, dynamic>> getLangsFromFile({required String? lang}) async {
    final String fileName = "${lang}TranslationWords.json";

    final dir = await getTemporaryDirectory();
    final File file = File("${dir.path}/$fileName");
    Map<String, dynamic> map = {};

    if (file.existsSync()) {
      final jsonData = file.readAsStringSync();
      print('map: $jsonData');

      map = jsonDecode(jsonData) as Map<String, dynamic>;
    }
    return map;
  }

  // Future<bool> saveAppStatus({
  //   AppBasicModel? bodyData,
  //   String? urlKey = LocalStorage.authTokenData,
  //   // Duration duration = const Duration(days: 1000),
  // }) async {
  // final tokenExpireDate = DateTime.now().add(const Duration(seconds: 7));

  // final tokenExpireDate =
  //     DateTime.now().add(Duration(seconds: bodyData!.expireIn!));
  // final LoginModel userData = LoginModel(
  //   token: bodyData.token,
  //   tokenType: bodyData.tokenType,
  //   expireIn: bodyData.expireIn,
  //   accountType: bodyData.accountType,
  //   tokenExpirationDate: tokenExpireDate,
  // );
  // final String jsonData = jsonEncode(userData.toJson());

  // if (jsonData.isNotEmpty) {
  //   await boxStorage.write(urlKey.toString(), jsonData);
  //   await boxStorage.write(LocalStorage.isLogged, true);
  //   return true;
  // }
  // return false;
  // }
}
