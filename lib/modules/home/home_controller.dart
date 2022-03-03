import 'package:get/get.dart';

import '../../core/core.dart';
import '../../data/data.dart';
import '../../routes/routes.dart';

class HomeController extends GetxController {
  final authProvider = Get.find<AuthProvider>();

  late LoginModel? userToken;

  RxInt currentIndex = 0.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await getToken();
  }

  Future<void> signOut() async {
    await AuthServices().removeToken();
    await authProvider.logOutAPI();
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
    currentIndex.value = index!;
  }
}
