import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uni_links/uni_links.dart';

import '../../core/core.dart';
import '../../data/data.dart';
import '../../routes/routes.dart';

class SplashController extends GetxController {
  final appBasicProvider = Get.find<AppBasicProvider>();
  // ignore: cancel_subscriptions
  StreamSubscription? sub;

  @override
  Future<void> onInit() async {
    super.onInit();
    await checkAuth();
    await checkAppBasicTime();
    await handleDeepLinks();
    // await getAppBasicStatusProvider();
  }

  Future<void> checkAuth() async {
    final bool isHomeNavigate = AuthServices().isUserLoggedIn();
    await Future.delayed(
      DurationConstant.d2000,
      () async => {
        if (isHomeNavigate == true)
          {
            // Get.offNamed(Routes.onBoardingRoute),
            Get.offNamed(Routes.homeRoute),
          }
        else
          {
            Get.offNamed(Routes.signInRoute),
          }
      },
    );
  }

  Future<void> checkAppBasicTime() async {
    final String? appBasicTimeStamp = AppBasicServices().getAppBasicTime();
    await Future.delayed(
      DurationConstant.d1000,
      () async =>
          {await getAppBasicStatusProvider(lastSyncDate: appBasicTimeStamp)},
    );
  }

  Future<void> getAppBasicStatusProvider({String? lastSyncDate}) async {
    await appBasicProvider.getAppBasicStatus().then(
          (value) async => {
            if (DateOnlyCompare(
                  value.latestTranslationUpdate!,
                ).isSameDateTime(other: DateTime.parse(lastSyncDate!)) ==
                false)
              {
                await AppBasicServices().saveAppBasicTime(
                  bodyData: value.latestTranslationUpdate.toString(),
                ),
                await getAllTranslationLangsProvider(lang: 'en'),
                await getAllTranslationLangsProvider(lang: 'fr'),
                await getAllTranslationLangsProvider(lang: 'nl')
              }
            else
              {}
          },
        );
  }

  Future<void> getAllTranslationLangsProvider({required String? lang}) async {
    final String fileName = "${lang}TranslationWords.json";

    final dir = await getTemporaryDirectory();
    final File file = File("${dir.path}/$fileName");

    final JsonResponse respData =
        await appBasicProvider.getAllTranslationLangs(lang: lang);

    if (respData.success == true) {
      // print('fileName:: $fileName,, resp: $respData.data');
      file.writeAsStringSync(
        jsonEncode(respData.data),
        flush: true, // mode: FileMode.write
      );
    }
  }

  Future<void> handleDeepLinks() async {
    // debugPrint('handleDeepLinks');
    sub = linkStream.listen(
      (String? link) {
        if (link != null) {
          // print('listener is working');
          // print("link :: $link");

          final uri = Uri.parse(link);

          // if (uri.queryParameters['id'] != null) {

          if (uri.path.contains('joboffers')) {
            // print(uri.queryParameters['id'].toString());
            // print("uri.path :: ${uri.path}");
            // print("uri.pathSegments :: ${uri.pathSegments.last}");

            Get.toNamed(
              "${Routes.offerdetailRoute}?id=${uri.pathSegments.last}",
              arguments: [
                // jobOfferItem
                uri.pathSegments.last,
                <Widget>[],
                false,
                // bottomActionWidgetList,
                // isCustomActBtn,
              ],
            );
          }
        }
      },
      onError: (err) {
        // print('err');
      },
    );
  }

  // Future<void> handleDeepLinks() async {
  //   final PendingDynamicLinkData? initialLink =
  //       await FirebaseDynamicLinks.instance.getInitialLink();
  //   if (initialLink != null) {
  //     final Uri deepLink = initialLink.link;
  //     print('Deeplinks uri:${deepLink.path}');
  //     if (deepLink.path == '/ShowApiDataScreen') {
  //       AppRoute.nextPage(
  //         context,
  //         ShowApiDataScreen(
  //           deepLinkPath: '${deepLink.path}:Deep Link',
  //         ),
  //       );
  //     } else if (deepLink.path == '/GoogleMapScreen') {
  //       AppRoute.nextPage(
  //         context,
  //         GoogleMapScreen(
  //           deepLinkPath: '${deepLink.path}:Deep Link',
  //         ),
  //       );
  //     } else if (deepLink.path == '/UserSignUpScreen') {
  //       AppRoute.nextPage(
  //         context,
  //         UserSignUpScreen(
  //           deeplinkPath: '${deepLink.path}:Deep Link',
  //         ),
  //       );
  //     }
  //   }
  // }
}
