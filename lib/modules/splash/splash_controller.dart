import 'package:get/get.dart';

import '../../core/core.dart';
import '../../data/data.dart';
import '../../routes/routes.dart';

class SplashController extends GetxController {
  final appBasicProvider = Get.find<AppBasicProvider>();

  @override
  void onReady() {
    super.onReady();
    checkAuth();
    // getAppBasicStatusProvider();
    // getAllTranslationLangsProvider();
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

  Future<void> getAppBasicStatusProvider() async {
    await appBasicProvider.getAppBasicStatus();
  }

  Future<void> getAllTranslationLangsProvider() async {
    await appBasicProvider.getAllTranslationLangs();
  }
}
