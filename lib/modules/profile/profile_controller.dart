import 'package:get/get.dart';

import '../../data/data.dart';
import '../home/home.dart';

class ProfileController extends GetxController with StateMixin<Rx<UserModel>> {
  final homeController = Get.put(HomeController());
  final userInfoProvider = Get.find<UserInfoProvider>();

  RxBool enterpriseSwitching = false.obs;

  Rx<UserModel> userInfoRepsonse = UserModel().obs;
  RxBool isProcessinguserInfoRepsonse = false.obs;

  final List<String> skillList = [
    "Persuasion",
    "Responsability",
    "Confidence",
  ];

  final List<String> languagesList = [
    "English - Level 2",
    "French - Level 3",
    "German - Level 4",
  ];

  @override
  Future<void> onInit() async {
    getUserInfoResponse()
        .then((value) => isProcessinguserInfoRepsonse.value = true);
    super.onInit();
  }

  Future<void> onRefresh() async {
    // monitor network fetch
    await getUserInfoResponse(refresh: true);
    await Future.delayed(const Duration(milliseconds: 500));
    // if failed,use refreshFailed()
  }

  Future<void> getUserInfoResponse({
    bool? refresh = false,
  }) async {
    change(null, status: RxStatus.loading());
    getUserInfoResponseProvider(refresh: refresh).then(
      (resp) {
        change(resp, status: RxStatus.success());
      },
      onError: (err) {
        change(
          null,
          status: RxStatus.error(err.toString()),
        );
      },
    );
  }

  Future<Rx<UserModel>> getUserInfoResponseProvider({
    bool? refresh = false,
  }) async {
    userInfoRepsonse.value = await userInfoProvider.getUserInfo();
    // debugPrint('userInfoRepsonse: $userInfoRepsonse');
    return userInfoRepsonse;
  }

  bool updateSwitchingToggle({bool? switchingNewValue}) {
    return !switchingNewValue!;
  }
}
