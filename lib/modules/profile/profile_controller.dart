import 'package:get/get.dart';

import '../../data/data.dart';
import '../home/home.dart';

class ProfileController extends GetxController {
  final homeController = Get.put(HomeController());
  final userInfoProvider = Get.find<UserInfoProvider>();

  RxBool enterpriseSwitching = false.obs;

  Rx<UserModel> userInfoRepsonse = UserModel().obs;
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
    getUserInfoResponseProvider()
        .then((value) => isProcessingUserInfoRepsonse.value = true);
    await getStudentInfoResponseProvider()
        .then((value) => isProcessingStudentInfoRepsonse.value = true);
    super.onInit();
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
    // debugPrint('userInfoRepsonse: $userInfoRepsonse');
    return userInfoRepsonse;
  }

  Future<Rx<StudentProfileModel>> getStudentInfoResponseProvider({
    bool? refresh = false,
  }) async {
    studentInfoRepsonse.value = await userInfoProvider.getStudentProfileInfo();
    // debugPrint('studentInfoRepsonse: $studentInfoRepsonse');
    // skillList.addAll(studentInfoRepsonse.value.skills!.toList());
    // // debugPrint('skillList: $skillList');
    // languageList.addAll(studentInfoRepsonse.value.spokenLanguages!.toList());
    // debugPrint('languageList: $languageList');
    return studentInfoRepsonse;
  }

  bool updateSwitchingToggle({bool? switchingNewValue}) {
    return !switchingNewValue!;
  }
}
