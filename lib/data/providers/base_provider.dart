import 'package:get/get.dart';
import '../../routes/routes.dart';

import '../data.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    // add your local storage here to load for every request
    final String userToken = AuthServices().getStringToken().toString();

    //1.base_url
    httpClient.baseUrl = API.host;
    //2.
    httpClient.defaultContentType = "application/json";
    httpClient.timeout = const Duration(seconds: 45);

    httpClient.addResponseModifier((request, response) async {
      if (response.statusCode == 401) {
        await AuthServices().removeToken().then(
              (value) => Get.offAllNamed(Routes.splashRoute),
            );
      }
      return response;
    });

    httpClient.addRequestModifier<void>((request) async {
      // request.headers['apikey'] = '12345678';
      request.headers['Authorization'] = 'Bearer $userToken';
      return request;
    });

    //Autenticator will be called 3 times if HttpStatus is
    //HttpStatus.unauthorized
    httpClient.maxAuthRetries = 3;
    super.onInit();
  }
}
