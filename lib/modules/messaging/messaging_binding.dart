import 'package:get/get.dart';

import '../../data/data.dart';
import '../modules.dart';

class MessagingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MessagingController>(() => MessagingController());

    Get.lazyPut<MessagingProvider>(() => MessagingProvider());

    Get.lazyPut<FakeMessagingProvider>(
      () => FakeMessagingProvider(),
    ); // TODO: Change to MessagingProvider() when backend is ready
  }
}
