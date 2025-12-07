import 'package:get/get.dart';

import '../../data/data.dart';
import '../modules.dart';

class SkillBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentProvider>(() => StudentProvider());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<SkillController>(() => SkillController());
    Get.lazyPut<FakeStudentProvider>(
      () => FakeStudentProvider(),
    ); // TODO: Change to StudentProvider() when backend is ready
  }
}
