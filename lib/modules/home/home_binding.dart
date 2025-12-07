import 'package:get/get.dart';

import '../../data/data.dart';
import '../modules.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());

    Get.lazyPut<AuthProvider>(() => AuthProvider());

    Get.lazyPut<UserInfoProvider>(() => UserInfoProvider());

    // Get.lazyPut<FeedProvider>(
    //   () => FeedProvider(),
    // );

    Get.lazyPut<OfferProvider>(() => OfferProvider());

    Get.lazyPut<TagProvider>(() => TagProvider());

    Get.lazyPut<OfferFeedController>(() => OfferFeedController());

    // Get.lazyPut<FeedController>(
    //   () => FeedController(),
    // );

    Get.lazyPut<OfferController>(() => OfferController());

    Get.lazyPut<ProfileController>(() => ProfileController());

    Get.lazyPut<MessagingProvider>(() => MessagingProvider());

    Get.lazyPut<MessagingController>(() => MessagingController());

    Get.lazyPut<FakeAuthProvider>(
      () => FakeAuthProvider(),
    ); // TODO: Change to AuthProvider() when backend is ready
    Get.lazyPut<FakeUserInfoProvider>(
      () => FakeUserInfoProvider(),
    ); // TODO: Change to UserInfoProvider() when backend is ready
    Get.lazyPut<FakeOfferProvider>(
      () => FakeOfferProvider(),
    ); // TODO: Change to OfferProvider() when backend is ready
    Get.lazyPut<FakeTagProvider>(
      () => FakeTagProvider(),
    ); // TODO: Change to TagProvider() when backend is ready
    Get.lazyPut<FakeMessagingProvider>(
      () => FakeMessagingProvider(),
    ); // TODO: Change to MessagingProvider() when backend is ready
  }
}
