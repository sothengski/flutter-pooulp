import 'package:get/get.dart';

import '../../../data/data.dart';
import '../../modules.dart';

class EditUserInformationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditUserInformationController>(
      () => EditUserInformationController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
    Get.lazyPut<UserInfoProvider>(
      () => UserInfoProvider(),
    );
  }
}
