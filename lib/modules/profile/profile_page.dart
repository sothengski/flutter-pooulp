import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import '../../data/data.dart';
import '../../routes/routes.dart';
import 'profile.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: ColorsManager.grey100,
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: CustomAppBar(
          // title: 'Profile Page',
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          actions: [
            if (controller.homeController.userToken!.accountType == 'student')
              Container()
            else if (controller.enterpriseSwitching.value == true)
              IconButton(
                icon: const Icon(Icons.person),
                color: ColorsManager.grey300,
                tooltip: 'User Profile',
                onPressed: () => controller.enterpriseSwitching.value =
                    controller.updateSwitchingToggle(
                  switchingNewValue: controller.enterpriseSwitching.value,
                ),
              )
            else
              IconButton(
                icon: const Icon(Icons.location_city),
                color: ColorsManager.grey300,
                tooltip: 'Enterprise Profile',
                onPressed: () => controller.enterpriseSwitching.value =
                    controller.updateSwitchingToggle(
                  switchingNewValue: controller.enterpriseSwitching.value,
                ),
              ),
            IconButton(
              icon: const Icon(Icons.settings),
              color: ColorsManager.grey300,
              tooltip: 'Settings',
              onPressed: () => {Get.toNamed(Routes.settingsRoute)},
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () => controller.onRefresh(),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.only(bottom: AppSize.s32),
            child: Container(
              child: controller.enterpriseSwitching.value == true
                  ? EnterpriseProfileComponent(controller: controller)
                  : controller.isProcessingUserInfoRepsonse.value == true
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ///===== Profile Header Component =====//
                            ProfileHeader(
                              userName: controller
                                  .userInfoRepsonse.value.profile!.fullName,
                              // userRole: controller.userInfoRepsonse.value.profile!.accountType,
                            ),
                            //===== Profile Header Component =====//

                            ///===== Personal Information Component =====//
                            ContactInformationComponent(
                              headerTitle: 'Personal Information',
                              email: controller.userInfoRepsonse.value.email,
                              phone: controller.userInfoRepsonse.value.profile!
                                  .fullPhone1Format,
                              videoPreentationLink: controller
                                  .userInfoRepsonse.value.profile!.description,
                            ),
                            //===== Personal Information Component =====//

                            if (controller
                                    .isProcessingStudentInfoRepsonse.value ==
                                true)
                              Wrap(
                                children: [
                                  ///===== Education Component =====//
                                  CustomContainerWidget(
                                    leftMargin: AppSize.s12,
                                    rightMargin: AppSize.s12,
                                    // topMargin: AppSize.s12,
                                    bottomMargin: AppSize.s12,
                                    leftTitle: 'Education'.toUpperCase(),
                                    titleFontSize: AppSize.s16,
                                    // isRightWidget: true,
                                    rightWidget: const Icon(
                                      Icons.add,
                                      color: ColorsManager.grey800,
                                      size: AppSize.s24,
                                    ),
                                    child: Column(
                                      children: controller
                                          .studentInfoRepsonse.value.educations!
                                          .map(
                                            (e) => CustomListTileWidget(
                                              text1: e.school!.name,
                                              text1Color: ColorsManager.grey850,
                                              text1FontWeight:
                                                  FontWeightManager.medium,
                                              text1FontSize: AppSize.s16,
                                              text2: e.degree,
                                              text2Color: ColorsManager.grey800,
                                              text3:
                                                  '${e.attendedFromTo} at ${e.schoolCityAndCountry}',
                                              // bottomPadding: 8.0,
                                              leftWidget:
                                                  const CustomBoxWidget(),
                                              // leftWidget: const CustomBoxWidget(
                                              //   insideObj: Icon(
                                              //     Icons.school,
                                              //     color:
                                              //         ColorsManager.primary75,
                                              //     size: AppSize.s20,
                                              //   ),
                                              // ),
                                              rightWidget: const Icon(
                                                Icons.edit,
                                                color: ColorsManager.grey800,
                                                size: AppSize.s20,
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                  //===== Education Component =====//

                                  ///===== Professional Component =====//
                                  CustomContainerWidget(
                                    leftMargin: AppSize.s12,
                                    rightMargin: AppSize.s12,
                                    // topMargin: AppSize.s12,
                                    bottomMargin: AppSize.s12,
                                    leftTitle: 'Professional Experiences'
                                        .toUpperCase(),
                                    titleFontSize: AppSize.s16,
                                    // isRightWidget: true,
                                    rightWidget: const Icon(
                                      Icons.add,
                                      color: ColorsManager.grey800,
                                      size: AppSize.s24,
                                    ),
                                    child: Column(
                                      children: controller.studentInfoRepsonse
                                          .value.experiences!
                                          .map(
                                            (e) => e.type == 'professional'
                                                ? CustomListTileWidget(
                                                    text1: e.name,
                                                    text1Color:
                                                        ColorsManager.grey850,
                                                    text1FontWeight:
                                                        FontWeightManager
                                                            .medium,
                                                    text1FontSize: AppSize.s16,
                                                    text2: e.company,
                                                    text2Color:
                                                        ColorsManager.grey800,
                                                    text3:
                                                        '${e.attendedFromTo} at ${e.companyCityAndCountry}',
                                                    // bottomPadding: 8.0,
                                                    leftWidget:
                                                        const CustomBoxWidget(
                                                      insideObj: Icon(
                                                        Icons.work,
                                                        color: ColorsManager
                                                            .primary75,
                                                        size: AppSize.s20,
                                                      ),
                                                    ),
                                                    rightWidget: const Icon(
                                                      Icons.edit,
                                                      color:
                                                          ColorsManager.grey800,
                                                      size: AppSize.s20,
                                                    ),
                                                  )
                                                : Container(),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                  //===== Professional Component =====//

                                  ///===== Personal Component =====//
                                  CustomContainerWidget(
                                    leftMargin: AppSize.s12,
                                    rightMargin: AppSize.s12,
                                    // topMargin: AppSize.s12,
                                    bottomMargin: AppSize.s12,
                                    leftTitle: 'Professional Experiences'
                                        .toUpperCase(),
                                    titleFontSize: AppSize.s16,
                                    // isRightWidget: true,
                                    rightWidget: const Icon(
                                      Icons.add,
                                      color: ColorsManager.grey800,
                                      size: AppSize.s24,
                                    ),
                                    child: Column(
                                      children: controller.studentInfoRepsonse
                                          .value.experiences!
                                          .map(
                                            (e) => e.type == 'personal'
                                                ? CustomListTileWidget(
                                                    text1: e.name,
                                                    text1Color:
                                                        ColorsManager.grey850,
                                                    text1FontWeight:
                                                        FontWeightManager
                                                            .medium,
                                                    text1FontSize: AppSize.s16,
                                                    text2: e.company,
                                                    text2Color:
                                                        ColorsManager.grey800,
                                                    text3:
                                                        '${e.attendedFromTo} at ${e.companyCityAndCountry}',
                                                    // bottomPadding: 8.0,
                                                    leftWidget:
                                                        const CustomBoxWidget(
                                                      insideObj: Icon(
                                                        Icons.work,
                                                        color: ColorsManager
                                                            .primary75,
                                                        size: AppSize.s20,
                                                      ),
                                                    ),
                                                    rightWidget: const Icon(
                                                      Icons.edit,
                                                      color:
                                                          ColorsManager.grey800,
                                                      size: AppSize.s20,
                                                    ),
                                                  )
                                                : Container(),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                  //===== Personal Component =====//

                                  ///===== Skills Component =====//
                                  CustomContainerWidget(
                                    leftMargin: AppSize.s12,
                                    rightMargin: AppSize.s12,
                                    // topMargin: AppSize.s12,
                                    bottomMargin: AppSize.s12,
                                    leftTitle: 'Skills'.toUpperCase(),
                                    titleFontSize: AppSize.s16,
                                    // isRightWidget: true,
                                    rightWidget: const Icon(
                                      Icons.edit,
                                      color: ColorsManager.grey800,
                                      size: AppSize.s24,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // CustomList(
                                        //   title: 'Soft Skill',
                                        //   subtitleList:
                                        //       controller.mockSkillList,
                                        // ),
                                        Container(
                                          padding: const EdgeInsets.fromLTRB(
                                            24.0,
                                            0.0,
                                            8.0,
                                            8.0,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const CustomTextWidget(
                                                text: 'Soft Skill',
                                                marginBottom: 5.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: controller
                                                    .studentInfoRepsonse
                                                    .value
                                                    .skills!
                                                    .map(
                                                      (e) => e.type ==
                                                              Type.softSkill
                                                          ? CustomTextWidget(
                                                              text:
                                                                  '• ${e.label}',
                                                              marginBottom: 5.0,
                                                            )
                                                          : Container(),
                                                    )
                                                    .toList(),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.fromLTRB(
                                            24.0,
                                            0.0,
                                            8.0,
                                            8.0,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const CustomTextWidget(
                                                text: 'Hard Skill',
                                                marginBottom: 5.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: controller
                                                    .studentInfoRepsonse
                                                    .value
                                                    .skills!
                                                    .map(
                                                      (e) => e.type ==
                                                              Type.hardSkill
                                                          ? CustomTextWidget(
                                                              text:
                                                                  '• ${e.label} - ${e.category}',
                                                              marginBottom: 5.0,
                                                            )
                                                          : Container(),
                                                    )
                                                    .toList(),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  //===== Skills Component =====//

                                  ///===== Languages Component =====//
                                  CustomContainerWidget(
                                    leftMargin: AppSize.s12,
                                    rightMargin: AppSize.s12,
                                    // topMargin: AppSize.s12,
                                    bottomMargin: AppSize.s12,
                                    leftTitle: 'Languages'.toUpperCase(),
                                    titleFontSize: AppSize.s16,
                                    // isRightWidget: true,
                                    rightWidget: const Icon(
                                      Icons.edit,
                                      color: ColorsManager.grey800,
                                      size: AppSize.s24,
                                    ),
                                    // child: CustomList(
                                    //   subtitleList: controller.languageList,
                                    // ),
                                    child: Container(
                                      padding: const EdgeInsets.fromLTRB(
                                        24.0,
                                        0.0,
                                        8.0,
                                        8.0,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: controller.studentInfoRepsonse
                                            .value.spokenLanguages!
                                            .map(
                                              (e) => CustomTextWidget(
                                                text:
                                                    '• ${e.label} - Level ${e.level}',
                                                marginBottom: 5.0,
                                              ),
                                            )
                                            .toList(),
                                      ),
                                    ),
                                  ),
                                  //===== Languages Component =====//

                                  ///===== Achievement Component =====//
                                  CustomContainerWidget(
                                    leftMargin: AppSize.s12,
                                    rightMargin: AppSize.s12,
                                    // topMargin: AppSize.s12,
                                    bottomMargin: AppSize.s12,
                                    leftTitle: 'Achievement'.toUpperCase(),
                                    titleFontSize: AppSize.s16,
                                    // isRightWidget: true,
                                    rightWidget: const Icon(
                                      Icons.add,
                                      color: ColorsManager.grey800,
                                      size: AppSize.s24,
                                    ),
                                    child: Column(
                                      children: controller.studentInfoRepsonse
                                          .value.achievements!
                                          .map(
                                            (e) => CustomListTileWidget(
                                              text1: e.name,
                                              text1Color: ColorsManager.grey850,
                                              text1FontWeight:
                                                  FontWeightManager.medium,
                                              text1FontSize: AppSize.s16,
                                              text2:
                                                  'Issued: ${e.dateCompletionFormat}',
                                              text2Color: ColorsManager.grey800,
                                              text3: e.description,
                                              // bottomPadding: 8.0,
                                              leftWidget: const CustomBoxWidget(
                                                insideObj: Icon(
                                                  Icons.card_membership,
                                                  color:
                                                      ColorsManager.primary75,
                                                  size: AppSize.s20,
                                                ),
                                              ),
                                              rightWidget: const Icon(
                                                Icons.edit,
                                                color: ColorsManager.grey800,
                                                size: AppSize.s20,
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                  //===== Achievement Component =====//

                                  ///===== Certificates Component =====//
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: AppSize.s12,
                                      right: AppSize.s12,
                                      // top: AppSize.s4,
                                      bottom: AppSize.s12,
                                    ),
                                    child: CustomContainerWidget(
                                      leftTitle: 'Certificates'.toUpperCase(),
                                      titleFontSize: AppSize.s16,
                                      // isRightWidget: true,
                                      rightWidget: const Icon(
                                        Icons.add,
                                        color: ColorsManager.grey800,
                                        size: AppSize.s24,
                                      ),
                                      child: Column(
                                        children: controller.studentInfoRepsonse
                                            .value.certificates!
                                            .map(
                                              (e) => CustomListTileWidget(
                                                text1: e.title,
                                                text1Color:
                                                    ColorsManager.grey850,
                                                text1FontWeight:
                                                    FontWeightManager.medium,
                                                text1FontSize: AppSize.s16,
                                                text2:
                                                    'Issued: ${e.receivedDateFormat}',
                                                text2Color:
                                                    ColorsManager.grey800,
                                                text3: e.expirationDate != null
                                                    ? 'Expired: ${e.expirationDateFormat}'
                                                    : 'No Expiration Date',
                                                text3FontSize: AppSize.s14,
                                                text4: e.description,
                                                // bottomPadding: 8.0,
                                                leftWidget:
                                                    const CustomBoxWidget(
                                                  insideObj: Icon(
                                                    Icons.emoji_events,
                                                    color:
                                                        ColorsManager.primary75,
                                                    size: AppSize.s20,
                                                  ),
                                                ),
                                                rightWidget: const Icon(
                                                  Icons.edit,
                                                  color: ColorsManager.grey800,
                                                  size: AppSize.s20,
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      ),
                                    ),
                                  )
                                  //===== Certificates Component =====//
                                ],
                              )
                            else
                              const Center(child: Text('Loading...')),
                          ],
                        )
                      : const Center(child: Text('Loading...')),
            ),
          ),
        ),
      ),
    );
  }
}
