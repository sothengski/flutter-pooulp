import 'package:get/get.dart';

import '../../../data/data.dart';
import '../../modules.dart';

class SignInBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());

    Get.lazyPut<AuthProvider>(() => AuthProvider());
    // TODO: Change to AuthProvider() when backend is ready
    Get.lazyPut<FakeAuthProvider>(() => FakeAuthProvider());

    Get.lazyPut<LanguageController>(() => LanguageController());
  }
}
