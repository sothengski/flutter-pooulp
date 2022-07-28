import 'package:get/get.dart';

import '../../data/data.dart';
import 'offer.dart';

class OfferBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OfferController>(
      () => OfferController(),
    );

    Get.lazyPut<OfferProvider>(
      () => OfferProvider(),
    );

    Get.lazyPut<NotificationMessagesProvider>(
      () => NotificationMessagesProvider(),
    );
  }
}
