import 'package:get/get.dart';

import '../../data/data.dart';
import '../modules.dart';

class AvailabilityBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentProvider>(() => StudentProvider());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<AvailabilityController>(() => AvailabilityController());
    Get.lazyPut<FakeStudentProvider>(
      () => FakeStudentProvider(),
    ); // TODO: Change to UserInfoProvider() when backend is ready
  }
}
