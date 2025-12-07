import 'package:get/get.dart';

import '../../data/data.dart';
import '../modules.dart';

class AchievementBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentProvider>(() => StudentProvider());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<AchievementController>(() => AchievementController());
    Get.lazyPut<FakeStudentProvider>(
      () => FakeStudentProvider(),
    ); // TODO: Change to UserInfoProvider() when backend is ready
  }
}
