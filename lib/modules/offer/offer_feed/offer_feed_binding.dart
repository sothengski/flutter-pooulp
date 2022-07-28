import 'package:get/get.dart';

import '../../../data/data.dart';
import '../../home/home.dart';
import '../offer_controller.dart';
import 'offer_feed_controller.dart';

class OfferFeedBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OfferFeedController>(
      () => OfferFeedController(),
    );

    Get.lazyPut<OfferController>(
      () => OfferController(),
    );

    Get.lazyPut<HomeController>(
      () => HomeController(),
    );

    Get.lazyPut<OfferProvider>(
      () => OfferProvider(),
    );
    Get.lazyPut<TagProvider>(
      () => TagProvider(),
    );
  }
}
