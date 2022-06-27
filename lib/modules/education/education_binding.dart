import 'package:get/get.dart';

import '../../data/data.dart';
import '../modules.dart';

class EducationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentProvider>(
      () => StudentProvider(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
    Get.lazyPut<EducationController>(
      () => EducationController(),
    );
  }
}
