import 'package:get/get.dart';

import '../../data/data.dart';
import 'home.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );

    Get.lazyPut<AuthProvider>(
      () => AuthProvider(),
    );
  }
}
