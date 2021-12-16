import 'package:get/get.dart';
import '../../../data/data.dart';

import 'sign_up.dart';

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(
      () => SignUpController(),
      fenix: true,
    );
    // Get.put<SignUpController>(SignUpController());

    Get.lazyPut<AuthProvider>(
      () => AuthProvider(),
    );
  }
}
