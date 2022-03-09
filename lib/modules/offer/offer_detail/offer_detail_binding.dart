import 'package:get/get.dart';

import '../offer.dart';

class OfferDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OfferDetailController>(
      () => OfferDetailController(),
    );

    Get.lazyPut<OfferFeedController>(
      () => OfferFeedController(),
    );
  }
}
