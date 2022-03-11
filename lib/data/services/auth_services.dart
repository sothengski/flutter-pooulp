import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../core/core.dart';
import '../data.dart';

class AuthServices extends GetxService {
  final GetStorage boxStorage = GetStorage(LocalStorage.credentialName);
  dynamic auth;
  LoginModel? loginTokenData;

  String? getStringToken() {
    auth = boxStorage.read(LocalStorage.authTokenData);
    if (auth != null) {
      auth = json.decode(auth.toString());
      loginTokenData = LoginModel.fromJson(auth as Map<String, dynamic>);
      return loginTokenData!.token.toString();
    } else {
      return '';
    }
  }

  LoginModel? getToken() {
    auth = boxStorage.read(LocalStorage.authTokenData);
    auth = json.decode(auth.toString());
    //TODO:: Prevent auth == null
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
    // Duration duration = const Duration(days: 1000),
  }) async {
    // final tokenExpireDate = DateTime.now().add(const Duration(seconds: 7));

    final tokenExpireDate =
        DateTime.now().add(Duration(seconds: bodyData!.expireIn!));
    final LoginModel userData = LoginModel(
      token: bodyData.token,
      tokenType: bodyData.tokenType,
      expireIn: bodyData.expireIn,
      accountType: bodyData.accountType,
      tokenExpirationDate: tokenExpireDate,
    );
    final String jsonData = jsonEncode(userData.toJson());

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

    // final now = DateTime.now();

    if (isLoggedIn == true && auth != null) {
      // auth = json.decode(auth.toString());
      // final LoginModel loginCredential =
      //     LoginModel.fromJson(auth as Map<String, dynamic>);
      // if (loginCredential.tokenExpirationDate!.compareTo(now) >= 0) {
      return true;
      // } else {
      //   customSnackbar(
      //     msgTitle: 'Session Expired',
      //     msgContent: 'Please log In again.',
      //     duration: DurationConstant.d7000,
      //   );
      //   return false;
      // }
    } else {
      return false;
    }
  }
}
