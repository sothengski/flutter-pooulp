import 'package:get/get.dart';

import '../../core/core.dart';
import '../../data/data.dart';
import '../modules.dart';

class SettingController extends GetxController {
  final homeController = Get.put(HomeController());
  final profileController = Get.put(ProfileController());
  final userInfoProvider = Get.find<UserInfoProvider>();

  RxBool telecommutingRxBool = false.obs;
  RxBool shiftingRxBool = false.obs;

  RxBool drivingLicenseRxBool = false.obs;
  RxBool hasAutoMobileRxBool = false.obs;
  RxBool emailNotificationRxBool = false.obs;
  RxInt radiusRxInt = 0.obs;
  RxString languageRxString = 'en'.obs;

  RxBool isUpdating = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    telecommutingRxBool.value =
        profileController.studentInfoRepsonse.value.telecommuting!;
    drivingLicenseRxBool.value =
        profileController.studentInfoRepsonse.value.drivingLicense!;
    shiftingRxBool.value =
        profileController.studentInfoRepsonse.value.shifting!;
    hasAutoMobileRxBool.value =
        profileController.studentInfoRepsonse.value.hasAutomobile!;
    radiusRxInt.value = profileController.studentInfoRepsonse.value.radius!;
    languageRxString.value =
        profileController.userProfileInfo.value.uiLanguage!;
    emailNotificationRxBool.value =
        profileController.userProfileInfo.value.emailNotification!;
  }

  bool? updatingBoolValue({bool? newValue}) {
    isUpdating.value = true;
    return newValue;
  }

  void dataSummitionAndValidation() {
    final StudentProfileModel studentProfileInfoToBeUpdate =
        StudentProfileModel(
      drivingLicense: drivingLicenseRxBool.value,
      shifting: shiftingRxBool.value,
      radius: radiusRxInt.value,
      telecommuting: telecommutingRxBool.value,
      hasAutomobile: hasAutoMobileRxBool.value,
      facebookLink: profileController.studentInfoRepsonse.value.facebookLink,
      linkedinLink: profileController.studentInfoRepsonse.value.linkedinLink,
      whatsappLink: profileController.studentInfoRepsonse.value.whatsappLink,
      youtubeLink: profileController.studentInfoRepsonse.value.youtubeLink,
      gender: profileController.studentInfoRepsonse.value.gender,
    );

    final ProfileModel profileInfoToBeUpdate = ProfileModel(
      firstName: profileController.userInfoRepsonse.value.profile!.firstName,
      lastName: profileController.userInfoRepsonse.value.profile!.lastName,
      birthDate: profileController.userInfoRepsonse.value.profile!.birthDate,
      phone1CountryCode:
          profileController.userInfoRepsonse.value.profile!.phone1CountryCode,
      phone1: profileController.userInfoRepsonse.value.profile!.phone1,
      description:
          profileController.userInfoRepsonse.value.profile!.description,
      addressStreet:
          profileController.userInfoRepsonse.value.profile!.addressStreet,
      addressCountry:
          profileController.userInfoRepsonse.value.profile!.addressCountry,
      addressCity:
          profileController.userInfoRepsonse.value.profile!.addressCity,
      addressZip: profileController.userInfoRepsonse.value.profile!.addressZip,
      addressLatitude:
          profileController.userInfoRepsonse.value.profile!.addressLatitude,
      addressLongitude:
          profileController.userInfoRepsonse.value.profile!.addressLongitude,
      uiLanguage: languageRxString.value,
      emailNotification: emailNotificationRxBool.value,
    );
    makeRequestToUserProfileAPI(
      userProfileData: profileInfoToBeUpdate,
      studentProfileData: studentProfileInfoToBeUpdate,
    );
  }

  void makeRequestToUserProfileAPI({
    ProfileModel? userProfileData,
    StudentProfileModel? studentProfileData,
  }) {
    userInfoProvider
        .putUpdateStudentProfileInfo(
      data: studentProfileData,
    )
        .then((StudentProfileModel value) {
      profileController.studentInfoRepsonse.value = value;
    });

    userInfoProvider
        .putUpdateUserProfileInfo(
      data: userProfileData,
    )
        .then((ProfileModel value) {
      profileController.userProfileInfo.value = value;
      customSnackbar(
        msgTitle: 'Success',
        msgContent: 'Profile Information Updated',
        bgColor: ColorsManager.green,
      );
    });
  }
}
