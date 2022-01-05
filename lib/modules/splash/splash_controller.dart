import 'package:get/get.dart';

import '../../core/core.dart';
import '../../data/data.dart';
import '../../routes/routes.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    checkAuth();
  }

  Future<void> checkAuth() async {
    final bool isHomeNavigate = AuthServices().isUserLoggedIn();

    await Future.delayed(
      DurationConstant.d2000ms,
      () async => {
        if (isHomeNavigate == true)
          {
            Get.offNamed(Routes.homeRoute),
          }
        else
          {
            Get.offNamed(Routes.signInRoute),
          }
      },
    );
  }
}
