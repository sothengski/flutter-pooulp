import 'package:get/get.dart';

import '../../data/data.dart';
import '../modules.dart';

class CertificateBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentProvider>(() => StudentProvider());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<CertificateController>(() => CertificateController());
    Get.lazyPut<FakeUserInfoProvider>(
      () => FakeUserInfoProvider(),
    ); // TODO: Change to UserInfoProvider() when backend is ready
  }
}
