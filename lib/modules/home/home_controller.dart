import 'package:get/get.dart';

import '../../data/data.dart';
import '../../routes/routes.dart';

class HomeController extends GetxController {
  final authProvider = Get.find<AuthProvider>();

  late LoginModel? userToken;

  // int currentIndex = 0;
  RxInt currentIndex = 2.obs;

  @override
  void onInit() {
    getToken();
    super.onInit();
  }

  void signOut() {
    AuthServices().removeToken();
    authProvider.logOutAPI();
    Get.offAllNamed(Routes.signInRoute);
  }

  void getToken() {
    userToken = AuthServices().getToken();
  }

  void pageNavigate({int? index = 0}) {
    currentIndex.value = index!;
  }
}
