import 'package:get/get.dart';

import '../../data/data.dart';
import '../modules.dart';

class ProfileController extends GetxController {
  final homeController = Get.put(HomeController());
  final languageController = Get.put(LanguageController());

  final userInfoProvider = Get.find<UserInfoProvider>();

  RxBool enterpriseSwitching = false.obs;

  Rx<UserModel> userInfoRepsonse = UserModel().obs;
  Rx<ProfileModel> userProfileInfo = const ProfileModel().obs;

  Rx<StudentProfileModel> studentInfoRepsonse = StudentProfileModel().obs;

  RxBool isProcessingUserInfoRepsonse = false.obs;
  RxBool isProcessingStudentInfoRepsonse = false.obs;

  final List<String> mockSkillList = [
    "Persuasion",
    "Responsability",
    "Confidence",
  ];

  // final List<SkillModel> skillList = [];

  final List<String> mockLanguageList = [
    "English - Level 2",
    "French - Level 3",
    "German - Level 4",
  ];

  // final List<FieldModel> languageList = [];

  @override
  Future<void> onInit() async {
    super.onInit();
    getUserInfoResponseProvider()
        .then((value) => isProcessingUserInfoRepsonse.value = true);
    await getStudentInfoResponseProvider()
        .then((value) => isProcessingStudentInfoRepsonse.value = true);
  }

  Future<void> onRefresh() async {
    // monitor network fetch
    await getUserInfoResponseProvider(refresh: true);
    await getStudentInfoResponseProvider(refresh: true);

    await Future.delayed(const Duration(milliseconds: 750));
    // if failed,use refreshFailed()
  }

  Future<Rx<UserModel>> getUserInfoResponseProvider({
    bool? refresh = false,
  }) async {
    userInfoRepsonse.value = await userInfoProvider.getUserInfo();
    userProfileInfo.value = userInfoRepsonse.value.profile!;
    // debugPrint('userInfoRepsonse: $userInfoRepsonse');
    changeLanguageBasedOnProfileLanguage(
      languageKey: userProfileInfo.value.uiLanguage,
    );
    return userInfoRepsonse;
  }

  Future<Rx<StudentProfileModel>> getStudentInfoResponseProvider({
    bool? refresh = false,
  }) async {
    if (homeController.userToken!.accountType == 'student') {
      studentInfoRepsonse.value =
          await userInfoProvider.getStudentProfileInfo();
      return studentInfoRepsonse;
    }
    return studentInfoRepsonse;
  }

  bool updateSwitchingToggle({bool? switchingNewValue}) {
    return !switchingNewValue!;
  }

  void changeLanguageBasedOnProfileLanguage({required String? languageKey}) {
    if (languageController.currentLanguage != languageKey) {
      languageController.updateLanguage(
        languageKey,
      );
    }
  }
}
