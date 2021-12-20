import 'package:get/get.dart';
import '../../../data/data.dart';

import 'sign_in.dart';

class SignInBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(
      () => SignInController(),
    );

    Get.lazyPut<AuthProvider>(
      () => AuthProvider(),
    );
  }
}
