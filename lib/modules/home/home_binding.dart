import 'package:get/get.dart';

import '../../data/data.dart';
import '../modules.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );

    Get.lazyPut<AuthProvider>(
      () => AuthProvider(),
    );

    Get.lazyPut<UserInfoProvider>(
      () => UserInfoProvider(),
    );

    // Get.lazyPut<FeedProvider>(
    //   () => FeedProvider(),
    // );

    Get.lazyPut<OfferProvider>(
      () => OfferProvider(),
    );

    Get.lazyPut<TagProvider>(
      () => TagProvider(),
    );

    Get.lazyPut<OfferFeedController>(
      () => OfferFeedController(),
    );

    // Get.lazyPut<FeedController>(
    //   () => FeedController(),
    // );

    Get.lazyPut<OfferController>(
      () => OfferController(),
    );

    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
