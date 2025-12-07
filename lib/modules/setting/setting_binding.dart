import 'package:get/get.dart';

import '../../data/data.dart';
import '../modules.dart';

class SettingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingController>(() => SettingController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<UserInfoProvider>(() => UserInfoProvider());
    Get.lazyPut<FakeUserInfoProvider>(
      () => FakeUserInfoProvider(),
    ); // TODO: Change to UserInfoProvider() when backend is ready
  }
}
