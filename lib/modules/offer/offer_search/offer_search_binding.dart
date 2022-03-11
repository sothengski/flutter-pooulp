import 'package:get/get.dart';

import '../../../data/data.dart';
import '../offer.dart';

class OfferSearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OfferSearchController>(
      () => OfferSearchController(),
    );

    Get.lazyPut<OfferProvider>(
      () => OfferProvider(),
    );
  }
}
