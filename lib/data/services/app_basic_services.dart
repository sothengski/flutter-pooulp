import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../core/core.dart';

class AuthServices extends GetxService {
  final GetStorage boxStorage = GetStorage(LocalStorage.credentialName);

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
