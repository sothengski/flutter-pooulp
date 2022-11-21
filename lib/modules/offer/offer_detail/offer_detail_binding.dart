import 'package:get/get.dart';

import '../../../data/data.dart';
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

    Get.lazyPut<OfferProvider>(
      () => OfferProvider(),
    );

    // Get.lazyPut<UserInfoProvider>(
    //   () => UserInfoProvider(),
    // );
    // Get.lazyPut<TagProvider>(
    //   () => TagProvider(),
    // );
  }
}
