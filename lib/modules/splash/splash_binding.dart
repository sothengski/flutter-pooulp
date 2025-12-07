import 'package:get/get.dart';

import '../../data/data.dart';
import '../modules.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
    Get.lazyPut<AppBasicProvider>(() => AppBasicProvider());

    Get.lazyPut<FakeAppBasicProvider>(
      () => FakeAppBasicProvider(),
    ); // TODO: Change to AppBasicProvider() when backend is ready
  }
}
