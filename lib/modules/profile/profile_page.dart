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
                            //update the Network State
                            // GetBuilder<GetXNetworkManager>(builder: (builder)=>Text((_networkManager.connectionType == 0 )? 'No Internet' : (_networkManager.connectionType == 1) ? 'You are Connected to Wifi' : 'You are Connected to Mobile Internet',style: TextStyle(fontSize: 30),)),

                            ///===== Profile Header Component =====//
                            ProfileHeader(
                              userName:
                                  controller.userProfileInfo.value.fullName,
                              // userRole: controller.userInfoRepsonse.value.profile!.accountType,
                              controller: controller,
                              profileImg:
                                  controller.userProfileInfo.value.pictureUrl,
                            ),
                            //===== Profile Header Component =====//

                            ///===== Profile Completion Component =====//
                            CustomContainerWidget(
                              leftMargin: AppSize.s16,
                              rightMargin: AppSize.s16,
                              topMargin: AppSize.s12,
                              // bottomMargin: AppSize.s12,
                              leftTitle: 'Profile Progress',
                              rightWidget: const CustomTextWidget(
                                text: '0%',
                                fontWeight: FontWeightManager.medium,
                              ),
                              titleFontSize: AppSize.s16,
                              child: Container(),
                            ),

                            ///===== Personal Information Component =====//
                            // ContactInformationComponent(
                            //   headerTitle: 'Personal Information',
                            //   email: controller.userInfoRepsonse.value.email,
                            //   phone: controller.userInfoRepsonse.value.profile!
                            //       .fullPhone1Format,
                            //   videoPreentationLink: controller
                            //       .userInfoRepsonse.value.profile!.description,
                            // ),

                            CustomContainerWidget(
                              leftMargin: AppSize.s16,
                              rightMargin: AppSize.s16,
                              topMargin: AppSize.s12,
                              bottomMargin: AppSize.s12,
                              leftTitle: 'Personal Information'.toUpperCase(),
                              titleFontSize: AppSize.s16,
                              rightWidget: CustomIconButtonWidget(
                                iconData: Icons.edit_outlined,
                                padding: 0.0,
                                isConstraints: true,
                                onClick: () => {
                                  Get.toNamed(Routes.editUserInfoRoute),
                                },
                              ),
                              child: Column(
                                children: [
                                  if (controller.userInfoRepsonse.value.profile!
                                          .description ==
                                      '')
                                    Container()
                                  else
                                    CustomTextWidget(
                                      text:
                                          '${controller.userProfileInfo.value.description}',
                                      maxLine: 3,
                                      marginTop: AppSize.s4,
                                      marginLeft: AppSize.s16,
                                      marginRight: AppSize.s16,
                                      marginBottom: AppSize.s4,
                                    ),
                                  CustomListTileWidget(
                                    text1: 'Email',
                                    text2:
                                        controller.userInfoRepsonse.value.email,
                                    // isLauching: true,
                                    text2Color: ColorsManager.blue,
                                    leftWidget: const CustomBoxWidget(
                                      insideObj: Icon(
                                        Icons.email_outlined,
                                        color: ColorsManager.grey,
                                        size: AppSize.s24,
                                      ),
                                      backgroundColor: ColorsManager.white,
                                    ),
                                  ),
                                  CustomListTileWidget(
                                    text1: 'Phone',
                                    text2: controller
                                        .userProfileInfo.value.fullPhone1Format,
                                    // isLauching: true,
                                    text2Color: ColorsManager.blue,
                                    leftWidget: const CustomBoxWidget(
                                      insideObj: Icon(
                                        Icons.phone_outlined,
                                        color: ColorsManager.grey,
                                        size: AppSize.s24,
                                      ),
                                      backgroundColor: ColorsManager.white,
                                    ),
                                  ),
                                  CustomListTileWidget(
                                    text1: 'Video presentation link',
                                    text2: controller
                                        .studentInfoRepsonse.value.youtubeLink,
                                    // isLauching: true,
                                    text2Color: ColorsManager.blue,
                                    bottomPadding: 8.0,
                                    isDivider: false,
                                    leftWidget: const CustomBoxWidget(
                                      insideObj: Icon(
                                        Icons.video_library_outlined,
                                        color: ColorsManager.grey,
                                        size: AppSize.s24,
                                      ),
                                      backgroundColor: ColorsManager.white,
                                    ),
                                  ),
                                ],
                              ),
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
                                          Obx(
                                            () => CustomContainerWidget(
                                              leftMargin: AppSize.s16,
                                              rightMargin: AppSize.s16,
                                              // topMargin: AppSize.s12,
                                              bottomMargin: AppSize.s12,
                                              leftTitle:
                                                  'Education'.toUpperCase(),
                                              titleFontSize: AppSize.s16,
                                              rightWidget:
                                                  CustomIconButtonWidget(
                                                iconData: Icons.add,
                                                padding: 0.0,
                                                isConstraints: true,
                                                onClick: () => {
                                                  Get.toNamed(
                                                    Routes
                                                        .addOrEditEducationRoute,
                                                    arguments: [
                                                      Keys.addOperation
                                                    ],
                                                  ),
                                                },
                                              ),
                                              child: Column(
                                                children: controller
                                                    .studentInfoRepsonse
                                                    .value
                                                    .educations!
                                                    .map(
                                                      (e) =>
                                                          CustomListTileWidget(
                                                        text1: e.school!.name,
                                                        text1Color:
                                                            ColorsManager
                                                                .grey850,
                                                        text1FontWeight:
                                                            FontWeightManager
                                                                .medium,
                                                        text1FontSize:
                                                            AppSize.s16,
                                                        text2: e.degree,
                                                        text2Color:
                                                            ColorsManager
                                                                .grey800,
                                                        text3:
                                                            '${e.attendedFromTo} at ${e.schoolCityAndCountry}',
                                                        // bottomPadding: 8.0,
                                                        leftWidget:
                                                            const CustomBoxWidget(
                                                          size: 40,
                                                        ),
                                                        // leftWidget:
                                                        //     const CustomBoxWidget(
                                                        //   insideObj: Icon(
                                                        //     Icons.school,
                                                        //     color: ColorsManager
                                                        //         .primary75,
                                                        //     size: AppSize.s20,
                                                        //   ),
                                                        // ),
                                                        rightWidget:
                                                            CustomIconButtonWidget(
                                                          iconData: Icons
                                                              .edit_outlined,
                                                          padding: 0.0,
                                                          iconSize: 20.0,
                                                          isConstraints: true,
                                                          onClick: () => {
                                                            Get.toNamed(
                                                              Routes
                                                                  .addOrEditEducationRoute,
                                                              arguments: [
                                                                Keys.editOperation,
                                                                e
                                                              ],
                                                            ),
                                                          },
                                                        ),
                                                      ),
                                                    )
                                                    .toList(),
                                              ),
                                            ),
                                          ),
                                          //===== Education Component =====//

                                          ///===== Professional Component =====//
                                          CustomContainerWidget(
                                            leftMargin: AppSize.s16,
                                            rightMargin: AppSize.s16,
                                            // topMargin: AppSize.s12,
                                            bottomMargin: AppSize.s12,
                                            leftTitle:
                                                'Professional Experiences'
                                                    .toUpperCase(),
                                            titleFontSize: AppSize.s16,
                                            rightWidget: CustomIconButtonWidget(
                                              iconData: Icons.add,
                                              padding: 0.0,
                                              isConstraints: true,
                                              onClick: () => {
                                                Get.toNamed(
                                                  Routes
                                                      .addOrEditExperienceRoute,
                                                  arguments: [
                                                    Keys.addOperation,
                                                    AppStrings.professionalKey,
                                                  ],
                                                ),
                                              },
                                            ),
                                            child: Column(
                                              children: controller
                                                  .studentInfoRepsonse
                                                  .value
                                                  .experiences!
                                                  .map(
                                                    (e) => e.type ==
                                                            AppStrings
                                                                .professionalKey
                                                        ? CustomListTileWidget(
                                                            text1: e.name,
                                                            text1Color:
                                                                ColorsManager
                                                                    .grey850,
                                                            text1FontWeight:
                                                                FontWeightManager
                                                                    .medium,
                                                            text1FontSize:
                                                                AppSize.s16,
                                                            text2: e.company,
                                                            text2Color:
                                                                ColorsManager
                                                                    .grey800,
                                                            text3:
                                                                '${e.attendedFromTo} at ${e.companyCityAndCountry}',
                                                            // bottomPadding: 8.0,
                                                            leftWidget:
                                                                const CustomBoxWidget(
                                                              size: 40,
                                                              insideObj: Icon(
                                                                Icons.work,
                                                                color: ColorsManager
                                                                    .primary75,
                                                                size:
                                                                    AppSize.s20,
                                                              ),
                                                            ),
                                                            rightWidget:
                                                                CustomIconButtonWidget(
                                                              iconData: Icons
                                                                  .edit_outlined,
                                                              padding: 0.0,
                                                              iconSize: 20.0,
                                                              isConstraints:
                                                                  true,
                                                              onClick: () => {
                                                                Get.toNamed(
                                                                  Routes
                                                                      .addOrEditExperienceRoute,
                                                                  arguments: [
                                                                    Keys.editOperation,
                                                                    AppStrings
                                                                        .professionalKey,
                                                                    e,
                                                                  ],
                                                                ),
                                                              },
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
                                            leftMargin: AppSize.s16,
                                            rightMargin: AppSize.s16,
                                            // topMargin: AppSize.s12,
                                            bottomMargin: AppSize.s12,
                                            leftTitle: 'Personal Experiences'
                                                .toUpperCase(),
                                            titleFontSize: AppSize.s16,
                                            rightWidget: CustomIconButtonWidget(
                                              iconData: Icons.add,
                                              padding: 0.0,
                                              isConstraints: true,
                                              onClick: () => {
                                                Get.toNamed(
                                                  Routes
                                                      .addOrEditExperienceRoute,
                                                  arguments: [
                                                    Keys.addOperation,
                                                    AppStrings.personalKey,
                                                  ],
                                                ),
                                              },
                                            ),
                                            child: Column(
                                              children: controller
                                                  .studentInfoRepsonse
                                                  .value
                                                  .experiences!
                                                  .map(
                                                    (e) => e.type ==
                                                            AppStrings
                                                                .personalKey
                                                        ? CustomListTileWidget(
                                                            text1: e.name,
                                                            text1Color:
                                                                ColorsManager
                                                                    .grey850,
                                                            text1FontWeight:
                                                                FontWeightManager
                                                                    .medium,
                                                            text1FontSize:
                                                                AppSize.s16,
                                                            text2: e.company,
                                                            text2Color:
                                                                ColorsManager
                                                                    .grey800,
                                                            text3:
                                                                '${e.attendedFromTo} at ${e.companyCityAndCountry}',
                                                            // bottomPadding: 8.0,
                                                            leftWidget:
                                                                const CustomBoxWidget(
                                                              size: 40,
                                                              insideObj: Icon(
                                                                Icons.work,
                                                                color: ColorsManager
                                                                    .primary75,
                                                                size:
                                                                    AppSize.s20,
                                                              ),
                                                            ),
                                                            rightWidget:
                                                                CustomIconButtonWidget(
                                                              iconData: Icons
                                                                  .edit_outlined,
                                                              padding: 0.0,
                                                              iconSize: 20.0,
                                                              isConstraints:
                                                                  true,
                                                              onClick: () => {
                                                                Get.toNamed(
                                                                  Routes
                                                                      .addOrEditExperienceRoute,
                                                                  arguments: [
                                                                    Keys.editOperation,
                                                                    AppStrings
                                                                        .personalKey,
                                                                    e,
                                                                  ],
                                                                ),
                                                              },
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
                                            leftMargin: AppSize.s16,
                                            rightMargin: AppSize.s16,
                                            // topMargin: AppSize.s12,
                                            bottomMargin: AppSize.s12,
                                            leftTitle: 'Skills'.toUpperCase(),
                                            titleFontSize: AppSize.s16,
                                            rightWidget: CustomIconButtonWidget(
                                              iconData: Icons.edit_outlined,
                                              padding: 0.0,
                                              isConstraints: true,
                                              onClick: () => {
                                                customSnackbar(
                                                  msgTitle:
                                                      'This Page is under construction!',
                                                  msgContent:
                                                      'This Page is only view.\n Data will not save.',
                                                ),
                                              },
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
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                    24.0,
                                                    0.0,
                                                    8.0,
                                                    8.0,
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const CustomTextWidget(
                                                        text: 'Soft Skills',
                                                        marginBottom: 5.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
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
                                                                      marginBottom:
                                                                          5.0,
                                                                    )
                                                                  : Container(),
                                                            )
                                                            .toList(),
                                                      )
                                                    ],
                                                  ),
                                                ),

                                                Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                    24.0,
                                                    0.0,
                                                    8.0,
                                                    8.0,
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const CustomTextWidget(
                                                        text: 'Hard Skills',
                                                        marginBottom: 5.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: controller
                                                            .studentInfoRepsonse
                                                            .value
                                                            .skills!
                                                            .map(
                                                              (e) => e.type ==
                                                                      Type.hardSkill
                                                                  ? CustomTextWidget(
                                                                      text:
                                                                          '${e.displayLabelAndCategory}',
                                                                      marginBottom:
                                                                          5.0,
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
                                            leftMargin: AppSize.s16,
                                            rightMargin: AppSize.s16,
                                            // topMargin: AppSize.s12,
                                            bottomMargin: AppSize.s12,
                                            leftTitle:
                                                'Languages'.toUpperCase(),
                                            titleFontSize: AppSize.s16,
                                            rightWidget: CustomIconButtonWidget(
                                              iconData: Icons.edit_outlined,
                                              padding: 0.0,
                                              isConstraints: true,
                                              onClick: () => {
                                                customSnackbar(
                                                  msgTitle:
                                                      'This Page is under construction!',
                                                  msgContent:
                                                      'This Page is only view.\n Data will not save.',
                                                ),
                                              },
                                            ),
                                            // child: CustomList(
                                            //   subtitleList: controller.languageList,
                                            // ),
                                            child: controller
                                                        .studentInfoRepsonse
                                                        .value
                                                        .spokenLanguages ==
                                                    []
                                                ? Container()
                                                : Container(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(
                                                      24.0,
                                                      0.0,
                                                      8.0,
                                                      0.0,
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: controller
                                                          .studentInfoRepsonse
                                                          .value
                                                          .spokenLanguages!
                                                          .map(
                                                            (e) =>
                                                                CustomTextWidget(
                                                              text:
                                                                  '${e.displayLabelAndLevel}',
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
                                            leftMargin: AppSize.s16,
                                            rightMargin: AppSize.s16,
                                            // topMargin: AppSize.s12,
                                            bottomMargin: AppSize.s12,
                                            leftTitle:
                                                'Achievement'.toUpperCase(),
                                            titleFontSize: AppSize.s16,
                                            rightWidget: CustomIconButtonWidget(
                                              iconData: Icons.add,
                                              padding: 0.0,
                                              isConstraints: true,
                                              onClick: () => {
                                                Get.toNamed(
                                                  Routes
                                                      .addOrEditAchievementRoute,
                                                  arguments: [
                                                    Keys.addOperation,
                                                  ],
                                                ),
                                              },
                                            ),
                                            child: Column(
                                              children: controller
                                                  .studentInfoRepsonse
                                                  .value
                                                  .achievements!
                                                  .map(
                                                    (e) => CustomListTileWidget(
                                                      text1: e.name,
                                                      text1Color:
                                                          ColorsManager.grey850,
                                                      text1FontWeight:
                                                          FontWeightManager
                                                              .medium,
                                                      text1FontSize:
                                                          AppSize.s16,
                                                      text2:
                                                          'Issued: ${e.dateCompletionFormat}',
                                                      text2Color:
                                                          ColorsManager.grey800,
                                                      text3: e.description,
                                                      // bottomPadding: 8.0,
                                                      leftWidget:
                                                          const CustomBoxWidget(
                                                        size: 40,
                                                        insideObj: Icon(
                                                          Icons.card_membership,
                                                          color: ColorsManager
                                                              .primary75,
                                                          size: AppSize.s20,
                                                        ),
                                                      ),
                                                      rightWidget:
                                                          CustomIconButtonWidget(
                                                        iconData:
                                                            Icons.edit_outlined,
                                                        padding: 0.0,
                                                        iconSize: 20.0,
                                                        isConstraints: true,
                                                        onClick: () => {
                                                          Get.toNamed(
                                                            Routes
                                                                .addOrEditAchievementRoute,
                                                            arguments: [
                                                              Keys.editOperation,
                                                              e
                                                            ],
                                                          ),
                                                        },
                                                      ),
                                                    ),
                                                  )
                                                  .toList(),
                                            ),
                                          ),
                                          //===== Achievement Component =====//

                                          ///===== Certificates Component =====//
                                          CustomContainerWidget(
                                            leftMargin: AppSize.s16,
                                            rightMargin: AppSize.s16,
                                            // topMargin: AppSize.s12,
                                            bottomMargin: AppSize.s12,
                                            leftTitle:
                                                'Certificates'.toUpperCase(),
                                            titleFontSize: AppSize.s16,
                                            rightWidget: CustomIconButtonWidget(
                                              iconData: Icons.add,
                                              padding: 0.0,
                                              isConstraints: true,
                                              onClick: () => {
                                                customSnackbar(
                                                  msgTitle:
                                                      'This Page is under construction!',
                                                  msgContent:
                                                      'This Page is only view.\n Data will not save.',
                                                ),
                                              },
                                            ),
                                            child: Column(
                                              children: controller
                                                  .studentInfoRepsonse
                                                  .value
                                                  .certificates!
                                                  .map(
                                                    (e) => CustomListTileWidget(
                                                      text1: e.title,
                                                      text1Color:
                                                          ColorsManager.grey850,
                                                      text1FontWeight:
                                                          FontWeightManager
                                                              .medium,
                                                      text1FontSize:
                                                          AppSize.s16,
                                                      text2:
                                                          'Issued: ${e.receivedDateFormat}',
                                                      text2Color:
                                                          ColorsManager.grey800,
                                                      text3: e.expirationDate !=
                                                              null
                                                          ? 'Expired: ${e.expirationDateFormat}'
                                                          : 'No Expiration Date',
                                                      text3FontSize:
                                                          AppSize.s14,
                                                      text4: e.description,
                                                      // bottomPadding: 8.0,
                                                      leftWidget:
                                                          const CustomBoxWidget(
                                                        size: 40,
                                                        insideObj: Icon(
                                                          Icons.emoji_events,
                                                          color: ColorsManager
                                                              .primary75,
                                                          size: AppSize.s20,
                                                        ),
                                                      ),
                                                      rightWidget:
                                                          CustomIconButtonWidget(
                                                        iconData:
                                                            Icons.edit_outlined,
                                                        padding: 0.0,
                                                        iconSize: 20.0,
                                                        isConstraints: true,
                                                        onClick: () => {
                                                          customSnackbar(
                                                            msgTitle:
                                                                'This Page is under construction!',
                                                            msgContent:
                                                                'This Page is only view.\n Data will not save.',
                                                          ),
                                                        },
                                                      ),
                                                    ),
                                                  )
                                                  .toList(),
                                            ),
                                          )
                                          //===== Certificates Component =====//
                                        ],
                                      )
                                    : const Center(child: Text('Loading...')),
                              )
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
