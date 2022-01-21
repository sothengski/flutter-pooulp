import 'package:get/get.dart';

import '../../data/data.dart';
import 'profile.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );

    Get.lazyPut<UserInfoProvider>(
      () => UserInfoProvider(),
    );
  }
}
