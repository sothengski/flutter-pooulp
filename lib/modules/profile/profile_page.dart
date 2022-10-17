import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import '../../routes/routes.dart';
import 'profile.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        // backgroundColor: ColorsManager.grey100,
        extendBodyBehindAppBar: true,
        extendBody: true,
        // appBar: CustomAppBar(
        //   // title: 'Profile Page',
        //   elevation: 0.0,
        //   backgroundColor: Colors.transparent,
        //   actions: [
        //     if (controller.homeController.userToken!.accountType == 'student')
        //       Container()
        //     else if (controller.enterpriseSwitching.value == true)
        //       CustomIconButtonWidget(
        //         iconData: Icons.person,
        //         iconColor: ColorsManager.grey300,
        //         tooltip: 'User Profile',
        //         onClick: () => controller.enterpriseSwitching.value =
        //             controller.updateSwitchingToggle(
        //           switchingNewValue: controller.enterpriseSwitching.value,
        //         ),
        //       )
        //     else
        //       CustomIconButtonWidget(
        //         iconData: Icons.location_city,
        //         iconColor: ColorsManager.grey300,
        //         tooltip: 'Enterprise Profile',
        //         onClick: () => controller.enterpriseSwitching.value =
        //             controller.updateSwitchingToggle(
        //           switchingNewValue: controller.enterpriseSwitching.value,
        //         ),
        //       ),
        //     CustomIconButtonWidget(
        //       iconData: Icons.settings_outlined,
        //       iconColor: ColorsManager.grey300,
        //       tooltip: 'Settings',
        //       onClick: () => {Get.toNamed(Routes.settingsRoute)},
        //     ),
        //   ],
        // ),
        body: RefreshIndicator(
          color: ColorsManager.primary,
          onRefresh: () => controller.onRefresh(),
          child: SingleChildScrollView(
            // physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.only(bottom: AppSize.s32),
            child: Container(
              child: controller.enterpriseSwitching.value == true
                  ? EnterpriseProfileComponent(controller: controller)
                  : controller.isProcessingUserInfoRepsonse.value == true
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ///===== Profile Header Component =====//
                            ProfileHeaderComponent(
                              userName:
                                  controller.userProfileInfo.value.fullName,
                              // userRole: controller.userInfoRepsonse.value.profile!.accountType,
                              controller: controller,
                              profileImg:
                                  controller.userProfileInfo.value.pictureUrl,
                            ),
                            //===== Profile Header Component =====//

                            ///===== Profile Completion Component =====//
                            ProfileCompletionComponent(
                              title: 'profileCompleteness'.tr,
                              completionPercentage: controller
                                  .studentInfoRepsonse
                                  .value
                                  .calculatingProfileCompleteness,
                            ),
                            //===== Profile Completion Component =====//

                            ///===== Personal Information Component =====//
                            PersonalInformationComponent(
                              routeNameForEdit: Routes.editUserInfoRoute,
                              profileModel: controller.userProfileInfo.value,
                              userModel: controller.userInfoRepsonse.value,
                              studentProfileModel:
                                  controller.studentInfoRepsonse.value,
                            ),
                            //===== Personal Information Component =====//

                            if (controller
                                    .homeController.userToken!.accountType !=
                                'student')
                              Container()
                            else
                              Container(
                                child: controller
                                            .isProcessingStudentInfoRepsonse
                                            .value ==
                                        true
                                    ? Wrap(
                                        children: [
                                          ///===== Education Component =====//
                                          ProfileEduComponent(
                                            title: 'educations'.tr,
                                            addOrEditEduRoute:
                                                Routes.addOrEditEducationRoute,
                                            eduList: controller
                                                .studentInfoRepsonse
                                                .value
                                                .educations,
                                          ),
                                          //===== Education Component =====//

                                          ///===== Professional Component =====//
                                          ProfileExpComponent(
                                            title: 'professionalExperiences'.tr,
                                            addOrEditExpRoute:
                                                Routes.addOrEditExperienceRoute,
                                            expTypeKey:
                                                AppStrings.professionalKey,
                                            expList: controller
                                                .studentInfoRepsonse
                                                .value
                                                .experiences,
                                          ),
                                          //===== Professional Component =====//

                                          ///===== Personal Component =====//
                                          ProfileExpComponent(
                                            title: 'personalExperiences'.tr,
                                            addOrEditExpRoute:
                                                Routes.addOrEditExperienceRoute,
                                            expTypeKey: AppStrings.personalKey,
                                            expList: controller
                                                .studentInfoRepsonse
                                                .value
                                                .experiences,
                                          ),
                                          //===== Personal Component =====//

                                          ///===== Skills Component =====//
                                          ProfileSkillComponent(
                                            title: 'skills'.tr,
                                            addOrEditSkillRoute:
                                                Routes.addOrEditSkillRoute,
                                            skillList: controller
                                                .studentInfoRepsonse
                                                .value
                                                .skills,
                                          ),
                                          //===== Skills Component =====//

                                          ///===== Languages Component =====//
                                          ProfileLanguageComponent(
                                            title: 'languages'.tr,
                                            addOrEditLangRoute: Routes
                                                .addOrEditLanguageUsageRoute,
                                            spokenLanguageList: controller
                                                .studentInfoRepsonse
                                                .value
                                                .spokenLanguages,
                                          ),
                                          //===== Languages Component =====//

                                          ///===== Achievement Component =====//
                                          ProfileAchievementComponent(
                                            title: 'achievements'.tr,
                                            addOrEditAchievementRoute: Routes
                                                .addOrEditAchievementRoute,
                                            achievementList: controller
                                                .studentInfoRepsonse
                                                .value
                                                .achievements,
                                          ),
                                          //===== Achievement Component =====//

                                          ///===== Certificates Component =====//
                                          ProfileCertificateComponent(
                                            title:
                                                "${'diplomas'.tr} / ${'certificates'.tr}",
                                            addOrEditCertificateRoute: Routes
                                                .addOrEditCertificateRoute,
                                            certificateList: controller
                                                .studentInfoRepsonse
                                                .value
                                                .certificates,
                                          ),
                                          //===== Certificates Component =====//

                                          ///===== Availabilities Component =====//
                                          ProfileAvailabilityComponent(
                                            title: 'availabilities'.tr,
                                            addOrEditAvailabilityRoute: Routes
                                                .addOrEditAvailabilityRoute,
                                            availabilityList: controller
                                                .studentInfoRepsonse
                                                .value
                                                .periods,
                                          )
                                          //===== Availabilities Component =====//
                                        ],
                                      )
                                    : const Center(
                                        child: LoadingWidget(
                                          isTreeBounceLoading: true,
                                        ),
                                      ),
                              )
                          ],
                        )
                      : const Center(
                          child: LoadingWidget(
                            isTreeBounceLoading: true,
                          ),
                        ),
            ),
          ),
        ),
      ),
    );
  }
}
