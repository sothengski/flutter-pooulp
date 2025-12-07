import 'package:get/get.dart';

import '../../core/core.dart';
import '../../data/data.dart';
import '../../routes/routes.dart';

class HomeController extends GetxController {
  // final authProvider = Get.find<AuthProvider>();
  final authProvider =
      Get.find<
        FakeAuthProvider
      >(); // TODO: Change to AuthProvider() when backend is ready

  late LoginModel? userToken;

  RxInt currentIndex = 0.obs;

  //onClickActionButtonJobOfferFeed() - OfferFeedController
  RxBool isMyOfferBag = false.obs;

  //getConversationStatusResponseProvider() - MessagingController
  RxBool isMessagingBag = false.obs;
  RxString messagingBagLabel = ''.obs;
  // FirebaseDynamicLinkService firebase = FirebaseDynamicLinkService();

  @override
  Future<void> onInit() async {
    super.onInit();
    await getToken();
  }

  @override
  Future<void> onReady() async {
    // await deepLink();
    super.onReady();
  }

  Future<void> deepLink() async {
    await Future.delayed(
      DurationConstant.d2000,
      () => {
        // await firebase.handleDeepLinks()
      },
    );
  }

  Future<void> signOut() async {
    authProvider.logOutAPI(token: userToken!.token);
    await AuthServices().removeToken();
    Get.offAllNamed(Routes.signInRoute);
  }

  Future<void> getToken() async {
    final now = DateTime.now();

    userToken = AuthServices().getToken();
    if (userToken!.tokenExpirationDate!.compareTo(now) <= 0) {
      await signOut();
      customSnackbar(
        msgTitle: 'Session Expired',
        msgContent: 'Please log In again.',
        duration: DurationConstant.d7000,
      );
    }
  }

  void pageNavigate({int? index = 0}) {
    if (index == 1) {
      isMyOfferBag.value = false;
    }
    currentIndex.value = index!;
  }

  // Future<void> handleDeepLinks() async {
  //   debugPrint('handleDeepLinks');
  //   FirebaseDynamicLinks.instance.onLink.listen(
  //     (dynamicLinkData) {
  //       print('deeplink data: ${dynamicLinkData.link.pathSegments.last}');

  //       Get.toNamed(
  //         "${Routes.offerdetailRoute}?id=${dynamicLinkData.link.pathSegments.last}",
  //       );
  //     },
  //   ).onError((error) {
  //     // Handle errors
  //   });
  // }
}
