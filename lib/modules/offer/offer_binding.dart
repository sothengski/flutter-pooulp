import 'package:get/get.dart';

import '../../data/data.dart';
import 'offer.dart';

class OfferBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OfferController>(() => OfferController());

    Get.lazyPut<OfferProvider>(() => OfferProvider());

    Get.lazyPut<NotificationMessagesProvider>(
      () => NotificationMessagesProvider(),
    );

    Get.lazyPut<FakeOfferProvider>(
      () => FakeOfferProvider(),
    ); // TODO: Change to OfferProvider() when backend is ready
    Get.lazyPut<FakeNotificationMessagesProvider>(
      () => FakeNotificationMessagesProvider(),
    ); // TODO: Change to NotificationMessagesProvider() when backend is ready
  }
}
