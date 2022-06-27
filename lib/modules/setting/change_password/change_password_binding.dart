import 'package:get/get.dart';

import '../../modules.dart';

class ChangePasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangePasswordController>(
      () => ChangePasswordController(
          // ChangePasswordRepository(MyApi()),
          ),
    );
  }
}
