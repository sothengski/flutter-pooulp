import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../core/core.dart';
import '../data.dart';

class AuthServices extends GetxService {
  final GetStorage boxStorage = GetStorage(LocalStorage.credentialName);
  dynamic auth;

  String? getStringToken() {
    return boxStorage.read(LocalStorage.authTokenData);
  }

  LoginModel? getToken() {
    auth = boxStorage.read(LocalStorage.authTokenData);
    auth = json.decode(auth.toString());
    return LoginModel.fromJson(auth as Map<String, dynamic>);
  }

  Future<void> removeToken() async {
    await boxStorage.remove(LocalStorage.isLogged);
    await boxStorage.remove(LocalStorage.authTokenData);
    // await boxStorage.erase();
  }

  Future<bool> saveUserToken({
    LoginModel? bodyData,
    String? urlKey = LocalStorage.authTokenData,
    Duration duration = const Duration(days: 1000),
  }) async {
    final String jsonData = jsonEncode(bodyData!.toJson());
    if (jsonData.isNotEmpty) {
      await boxStorage.write(urlKey.toString(), jsonData);
      await boxStorage.write(LocalStorage.isLogged, true);
      return true;
    }
    return false;
  }

  ///==================== Verify User Logged In ====================
  bool isUserLoggedIn() {
    boxStorage.writeIfNull(LocalStorage.isLogged, false);
    final bool isLoggedIn = boxStorage.read(LocalStorage.isLogged) as bool;
    auth = boxStorage.read(LocalStorage.authTokenData);

    if (isLoggedIn == true && auth != null) {
      return true;
    } else {
      return false;
    }
  }
}
