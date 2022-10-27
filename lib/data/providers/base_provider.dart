import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import '../../routes/routes.dart';
import '../data.dart';

class BaseProvider extends GetConnect {
  // final authProvider = AuthProvider();
  @override
  Future<void> onInit() async {
    super.onInit();

    // add your local storage here to load for every request
    // final String userToken =
    getUserToken();
    // debugPrint('BaseProvider token: ${getUserToken()}');

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
        if
            //  ('${request.url}' ==
            //         '${httpClient.baseUrl}${API.paths[Endpoint.getPendingOffer]}' &&
            //     response.statusCode != 401)
            ('${request.url}' ==
                    '${httpClient.baseUrl}${API.paths[Endpoint.getPendingOffer]}' &&
                AuthServices().getToken()!.tokenExpirationDate!.compareTo(now) <
                    30) {
          // debugPrint(
          //   "expire: ${AuthServices().getToken()!.tokenExpirationDate!} ${AuthServices().getToken()!.tokenExpirationDate!.compareTo(now) < 30}",
          // );
          Future.delayed(DurationConstant.d4000, () async {
            await AuthProvider().refreshTokenAPI().then((value) async {
              final bool loginStatus = await AuthServices().saveUserToken(
                bodyData: value,
              );
              // debugPrint(
              //   "refreshTokenAPI: ${getUserToken()}",
              // );
              if (loginStatus == true) {
                // customSnackbar(
                //   msgTitle: "RefreshToken",
                //   msgContent: "RefreshToken",
                //   bgColor: ColorsManager.red,
                // );
              } else {
                // debugPrint(
                //   "${request.url}:${response.statusCode}: ${getUserToken()}",
                // );
                customSnackbar(
                  msgTitle: "Can't save RefreshToken",
                  msgContent: "Can't save RefreshToken",
                  bgColor: ColorsManager.red,
                );
                Get.defaultDialog(
                  barrierDismissible: false,
                  radius: 10.0,
                  contentPadding: const EdgeInsets.all(20.0),
                  title: 'Session Expired',
                  middleText: 'Please log in again.',
                  textConfirm: 'OK',
                  confirm: OutlinedButton.icon(
                    onPressed: () async {
                      // debugPrint(
                      //   "Can't save RefreshToken token: ${getUserToken()}",
                      // );
                      await AuthServices().removeToken().then(
                            (value) => Get.offAllNamed(Routes.splashRoute),
                          );
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
              }
            });
          });

          // Get.defaultDialog(
          //   barrierDismissible: false,
          //   radius: 10.0,
          //   contentPadding: const EdgeInsets.all(20.0),
          //   title: 'Session Expired',
          //   middleText: 'Please log in again.',
          //   textConfirm: 'OK',
          //   confirm: OutlinedButton.icon(
          //     onPressed: () async => {
          //       await AuthServices().removeToken().then(
          //             (value) => Get.offAllNamed(Routes.splashRoute),
          //           )
          //     },
          //     icon: const Icon(
          //       Icons.check,
          //       color: Colors.blue,
          //     ),
          //     label: const Text(
          //       'Okay',
          //       style: TextStyle(color: Colors.blue),
          //     ),
          //   ),
          //   // cancel: OutlinedButton.icon(
          //   //   onPressed: () {},
          //   //   icon: const Icon(
          //   //     Icons.check,
          //   //     color: Colors.blue,
          //   //   ),
          //   //   label: const Text("cancel"),
          //   // ),
          // );
          // await AuthServices().removeToken().then(
          //       (value) => Get.offAllNamed(Routes.splashRoute),
          //     );
        } else if (
            // !('${request.url}' ==
            //       '${httpClient.baseUrl}${API.paths[Endpoint.getPendingOffer]}') &&
            response.statusCode == 401) {
          // debugPrint(
          //   "${request.url}:${response.statusCode}: ${getUserToken()}",
          // );
          Get.defaultDialog(
            barrierDismissible: false,
            radius: 10.0,
            contentPadding: const EdgeInsets.all(20.0),
            title: 'Session Expired',
            middleText: 'Please log in again.',
            textConfirm: 'OK',
            confirm: OutlinedButton.icon(
              onPressed: () async {
                // debugPrint(
                //   "Not getPendingOffer RefreshToken token: ${getUserToken()}",
                // );
                await AuthServices().removeToken().then(
                      (value) => Get.offAllNamed(Routes.splashRoute),
                    );
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
          );
        }
      }
      return response;
      // return getServerResponse(response);
    });

    httpClient.addRequestModifier<void>((request) async {
      // request.headers['apikey'] = '12345678';
      request.headers['Authorization'] = 'Bearer ${getUserToken()}';
      return request;
    });

    //Autenticator will be called 3 times if HttpStatus is
    //HttpStatus.unauthorized
    httpClient.maxAuthRetries = 3;
  }

  String getUserToken() {
    return AuthServices().getStringToken().toString();
  }

  Map<String, String> getRequestHeaders({
    bool addHeaderAuthorization = false,
    bool addHeaderContentJson = false,
    String? addHeaderCustomContent,
  }) {
    final reqHeaders = <String, String>{};
    reqHeaders.putIfAbsent('Accept', () => 'application/json');
    reqHeaders.putIfAbsent('Accept-Encoding', () => 'gzip');
    if (addHeaderAuthorization) {
      reqHeaders.putIfAbsent(
        'Authorization',
        () => 'Bearer ${getUserToken()}',
      );
    }
    if (addHeaderContentJson) {
      reqHeaders.putIfAbsent('Content-Type', () => 'application/json');
    } else if (addHeaderCustomContent != null &&
        addHeaderCustomContent.isNotEmpty) {
      reqHeaders.putIfAbsent('Content-Type', () => addHeaderCustomContent);
    }
    return reqHeaders;
  }

  Response getServerResponse(Response response) {
    if (response.statusCode == 200) {
      return response;
    } else if (response.statusCode == 403) {
      throw Exception(
        'Non si dispone delle autorizzazioni necessarie per accedere alla risorsa',
      );
    } else if (response.statusCode == 404) {
      throw Exception('Risorsa non trovata');
    } else if (response.statusCode == 415) {
      throw Exception('Unsupported media type');
    } else {
      throw Exception('Errore nel recupero dei dati');
    }
  }
}
