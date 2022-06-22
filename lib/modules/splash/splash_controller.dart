import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import '../../core/core.dart';
import '../../data/data.dart';
import '../../data/services/app_basic_services.dart';
import '../../routes/routes.dart';

class SplashController extends GetxController {
  final appBasicProvider = Get.find<AppBasicProvider>();

  @override
  Future<void> onInit() async {
    super.onInit();
    await getAppBasicStatusProvider();
  }

  @override
  void onReady() {
    super.onReady();
    checkAuth();
  }

  Future<void> checkAuth() async {
    final bool isHomeNavigate = AuthServices().isUserLoggedIn();
    // await getAllTranslationLangsProvider(lang: 'en');
    // await getAllTranslationLangsProvider(lang: 'fr');
    await AppBasicServices().getLangsFromFile(lang: 'en');
    await AppBasicServices().getLangsFromFile(lang: 'fr');
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

  Future<void> getAppBasicStatusProvider() async {
    await appBasicProvider.getAppBasicStatus();
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
