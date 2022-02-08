import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';
import '../data.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    super.onInit();

    // add your local storage here to load for every request
    final String userToken = AuthServices().getStringToken().toString();

    //1.base_url
    httpClient.baseUrl = API.host;
    //2.
    httpClient.defaultContentType = "application/json";
    httpClient.timeout = const Duration(seconds: 45);

    httpClient.addResponseModifier((request, response) async {
      if ('${request.url}' ==
              '${httpClient.baseUrl}${API.paths[Endpoint.signIn]}' ||
          '${request.url}' ==
              '${httpClient.baseUrl}${API.paths[Endpoint.registerNewUser]}') {
      } else {
        if (response.statusCode == 401) {
          Get.defaultDialog(
            barrierDismissible: false,
            radius: 10.0,
            contentPadding: const EdgeInsets.all(20.0),
            title: 'Session Expired',
            middleText: 'Please log in again.',
            textConfirm: 'OK',
            confirm: OutlinedButton.icon(
              onPressed: () async => {
                await AuthServices().removeToken().then(
                      (value) => Get.offAllNamed(Routes.splashRoute),
                    )
              },
              icon: const Icon(
                Icons.check,
                color: Colors.blue,
              ),
              label: const Text(
                'Okay',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            // cancel: OutlinedButton.icon(
            //   onPressed: () {},
            //   icon: const Icon(
            //     Icons.check,
            //     color: Colors.blue,
            //   ),
            //   label: const Text("cancel"),
            // ),
          );
          // await AuthServices().removeToken().then(
          //       (value) => Get.offAllNamed(Routes.splashRoute),
          //     );
        }
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
  }
}
