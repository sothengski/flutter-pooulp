import 'package:get/get.dart';

import 'feed.dart';

class FeedBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FeedController>(
      () => FeedController(),
    );
  }
}
