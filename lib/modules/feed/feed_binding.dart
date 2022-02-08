import 'package:get/get.dart';

import '../../data/data.dart';
import 'feed.dart';

class FeedBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FeedController>(
      () => FeedController(),
    );

    Get.lazyPut<FeedProvider>(
      () => FeedProvider(),
    );
  }
}
