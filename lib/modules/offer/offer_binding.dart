import 'package:get/get.dart';

import 'offer.dart';

class OfferBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OfferController>(
      () => OfferController(),
    );
  }
}
