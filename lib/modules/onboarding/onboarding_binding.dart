import 'package:get/get.dart';

import '../../data/data.dart';
import '../modules.dart';

class OnboardingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingController>(
      () => OnboardingController(),
    );

    Get.lazyPut<OnboardingProvider>(
      () => OnboardingProvider(),
    );
    Get.lazyPut<TagProvider>(
      () => TagProvider(),
    );
  }
}
