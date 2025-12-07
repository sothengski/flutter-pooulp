import 'package:get/get.dart';

import '../../data/data.dart';
import '../offer/offer_controller.dart';
import 'feed.dart';

class FeedBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FeedController>(() => FeedController());

    Get.lazyPut<OfferController>(() => OfferController());

    Get.lazyPut<OfferProvider>(() => OfferProvider());
    // TODO: Change to OfferProvider() when backend is ready
    Get.lazyPut<FakeOfferProvider>(() => FakeOfferProvider());
  }
}
