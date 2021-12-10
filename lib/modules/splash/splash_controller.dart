import 'package:get/get.dart';
import '../../core/core.dart';
import '../../routes/routes.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    checkAuth();
  }

  Future<void> checkAuth() async {
    await Future.delayed(
      duration2s,
      () => {
        // if (AuthServices().isUserLoggedIn() == true)
        //   {
        // Get.offNamed(Routes.homeRoute),
        //   }
        // else
        //   {
        Get.offNamed(Routes.signInRoute),
        //   }
      },
    );
  }
}
