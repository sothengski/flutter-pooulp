import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import '../../core/core.dart';
import '../../data/data.dart';
import '../../routes/routes.dart';

class SplashController extends GetxController {
  final appBasicProvider = Get.find<AppBasicProvider>();

  @override
  Future<void> onInit() async {
    super.onInit();
    await checkAppBasicTime();
    // await getAppBasicStatusProvider();
  }

  @override
  void onReady() {
    super.onReady();
    checkAuth();
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
                await getAllTranslationLangsProvider(lang: 'fr')
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
}
