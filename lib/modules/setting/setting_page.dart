import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import '../../data/data.dart';
import '../../routes/routes.dart';
import 'setting.dart';

class SettingPage extends GetView<SettingController> {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WillPopScope(
        ///===== Top of Will Pop Scope Component =====//
        onWillPop: controller.isUpdating.value == false
            ? () async {
                return Future.value(true);
              }
            : () async {
                Get.dialog(
                  const LoadingWidget(),
                );
                await Future.delayed(DurationConstant.d750, () {
                  controller.dataSummitionAndValidation();
                });
                Get.back();
                return Future.value(true);
              },
        //===== Bottom of Will Pop Scope Component =====//
        child: Scaffold(
          appBar: CustomAppBar(
            title: 'preferences'.tr,
          ),

          ///===== Top of body Component =====//
          body: SingleChildScrollView(
            // physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.only(bottom: AppSize.s32),
            child: Column(
              children: [
                ///===== Top of More Information Component =====//
                CustomContainerWidget(
                  leftMargin: AppSize.s12,
                  rightMargin: AppSize.s12,
                  topMargin: AppSize.s12,
                  bottomMargin: AppSize.s12,
                  // leftTitle: 'settings.moreInformation'.tr,
                  // titleFontSize: AppSize.s16,
                  // titleFontWeight: FontWeight.bold,
                  // titleTopPadding: AppSize.s12,
                  // titleBottomPadding: AppSize.s4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///===== Top of Telecommuting Component =====//
                      RowContentInputWidget(
                        centerWidget: CustomTextWidget(
                          marginLeft: AppSize.s12,
                          textAlign: TextAlign.center,
                          text: 'telecommuting'.tr,
                          fontSize: AppSize.s16,
                        ),
                        suffixWidgetFlex: 20,
                        suffixWidget: Switch(
                          value: controller.telecommutingRxBool.value,
                          onChanged: (value) {
                            controller.telecommutingRxBool.value =
                                controller.updatingBoolValue(newValue: value)!;
                          },
                          activeTrackColor: ColorsManager.primary25,
                          activeColor: ColorsManager.primary,
                        ),
                      ),
                      //===== Bottom of Telecommuting Component =====//
                      const Divider(
                        height: 10,
                        thickness: 1,
                      ),

                      ///===== Top of ShiftingComponent =====//
                      // RowContentInputWidget(
                      //   centerWidget: CustomTextWidget(
                      //     marginLeft: AppSize.s12,
                      //     textAlign: TextAlign.center,
                      //     text: 'settings.shifting'.tr,
                      //     fontSize: AppSize.s16,
                      //   ),
                      //   suffixWidgetFlex: 20,
                      //   suffixWidget: Switch(
                      //     value: controller.shiftingRxBool.value,
                      //     onChanged: (value) {
                      //       controller.shiftingRxBool.value =
                      //           controller.updatingBoolValue(newValue: value)!;
                      //     },
                      //     activeTrackColor: ColorsManager.primary25,
                      //     activeColor: ColorsManager.primary,
                      //   ),
                      // ),
                      // //===== Bottom of ShiftingComponent =====//
                      // const Divider(
                      //   height: 10,
                      //   thickness: 1,
                      // ),

                      ///===== Top of Driving License Component =====//
                      RowContentInputWidget(
                        centerWidget: CustomTextWidget(
                          marginLeft: AppSize.s12,
                          textAlign: TextAlign.center,
                          text: 'haveDrivingLicense'.tr,
                          fontSize: AppSize.s16,
                        ),
                        suffixWidgetFlex: 20,
                        suffixWidget: Switch(
                          value: controller.drivingLicenseRxBool.value,
                          onChanged: (value) {
                            controller.drivingLicenseRxBool.value =
                                controller.updatingBoolValue(newValue: value)!;
                          },
                          activeTrackColor: ColorsManager.primary25,
                          activeColor: ColorsManager.primary,
                        ),
                      ),
                      //===== Bottom of Driving License Component =====//
                      const Divider(
                        height: 10,
                        thickness: 1,
                      ),

                      ///===== Top of Has AutomobileComponent =====//
                      RowContentInputWidget(
                        centerWidget: CustomTextWidget(
                          marginLeft: AppSize.s12,
                          textAlign: TextAlign.center,
                          text: 'motorized'.tr,
                          fontSize: AppSize.s16,
                        ),
                        suffixWidgetFlex: 20,
                        suffixWidget: Switch(
                          value: controller.hasAutoMobileRxBool.value,
                          onChanged: (value) {
                            controller.hasAutoMobileRxBool.value =
                                controller.updatingBoolValue(newValue: value)!;
                          },
                          activeTrackColor: ColorsManager.primary25,
                          activeColor: ColorsManager.primary,
                        ),
                      ),
                      //===== Bottom of Has AutomobileComponent =====//
                      // const Divider(
                      //   height: 10,
                      //   thickness: 1,
                      // ),

                      ///===== Top of Radius Component =====//
                      // RowContentInputWidget(
                      //   centerWidgetFlex: 50,
                      //   centerWidget: CustomTextWidget(
                      //     marginLeft: AppSize.s12,
                      //     textAlign: TextAlign.center,
                      //     text:
                      //         '${'settings.radius'.tr}(Km): ${controller.radiusRxInt.value}',
                      //     fontSize: AppSize.s16,
                      //   ),
                      //   suffixWidgetFlex: 50,
                      //   suffixWidget: Slider(
                      //     value: controller.radiusRxInt.value.toDouble(),
                      //     min: 5.0,
                      //     max: 100.0,
                      //     divisions: 100,
                      //     activeColor: ColorsManager.primary,
                      //     inactiveColor: ColorsManager.grey300,
                      //     thumbColor: ColorsManager.primary,
                      //     label: '${controller.radiusRxInt.value}',
                      //     onChanged: (double newValue) {
                      //       controller.isUpdating.value = true;
                      //       controller.radiusRxInt.value = newValue.toInt();
                      //     },
                      //   ),
                      // ),
                      //===== Bottom of Radius Component =====//
                    ],
                  ),
                ),
                //===== Bottom of More Information Component =====//

                ///===== Top of Settings Component =====//
                CustomContainerWidget(
                  leftMargin: AppSize.s12,
                  rightMargin: AppSize.s12,
                  // topMargin: AppSize.s12,
                  bottomMargin: AppSize.s12,
                  leftTitle: 'settings'.tr,
                  titleFontSize: AppSize.s16,
                  titleFontWeight: FontWeight.bold,
                  titleTopPadding: AppSize.s12,
                  titleBottomPadding: AppSize.s4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///===== Top of Change Language Component =====//
                      InkWell(
                        onTap: () => Get.dialog(
                          MaterialDialogWidget(
                            title: 'selectALanguage'.tr,
                            titleHorizontalMargin: AppSize.s12,
                            contentWidget: Center(
                              child: ListView.separated(
                                shrinkWrap: true,
                                itemCount: controller
                                    .languageController.languageOptions.length,
                                separatorBuilder: (context, index) {
                                  return const Divider(
                                    color: ColorsManager.grey600,
                                  );
                                },
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () => {
                                      controller.changeLanguage(
                                        languageKey: controller
                                            .languageController
                                            .languageOptions[index]
                                            .key,
                                      ),
                                      Get.back(),
                                    },
                                    child: RowContentInputWidget(
                                      centerWidget: CustomTextWidget(
                                        // marginTop: AppSize.s4,
                                        // marginBottom: AppSize.s4,
                                        text: controller.languageController
                                            .languageOptions[index].value,
                                        fontWeight: FontWeightManager.medium,
                                        fontSize: AppSize.s16,
                                      ),
                                      prefixWidgetFlex: 25,
                                      prefixWidget: Padding(
                                        padding: const EdgeInsets.only(
                                          right: AppSize.s8,
                                        ),
                                        child: CircleFlag(
                                          controller.languageController
                                              .languageOptions[index].flagPath!,
                                          padding: AppSize.s16,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsets.symmetric(vertical: AppSize.s12),
                          child: RowContentInputWidget(
                            centerWidgetFlex: 50,
                            centerWidget: CustomTextWidget(
                              marginLeft: AppSize.s12,
                              textAlign: TextAlign.center,
                              text: 'language'.tr,
                              fontSize: AppSize.s16,
                            ),
                            suffixWidgetFlex: 50,
                            suffixWidget: Padding(
                              padding:
                                  const EdgeInsets.only(right: AppSize.s12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CustomTextWidget(
                                    textAlign: TextAlign.center,
                                    text: controller
                                        .languageController.languageOptions
                                        .firstWhere(
                                          (e) =>
                                              e.key ==
                                              controller.languageRxString.value,
                                        )
                                        .value,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: AppSize.s4,
                                    ),
                                    child: Icon(
                                      Icons.keyboard_arrow_right_outlined,
                                      color: ColorsManager.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      //===== Bottom of Change Language Component =====//
                      const Divider(
                        height: 10,
                        thickness: 1,
                      ),

                      ///===== Top of Verify Email Component =====//
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(vertical: AppSize.s12),
                        child: RowContentInputWidget(
                          centerWidgetFlex: 30,
                          centerWidget: CustomTextWidget(
                            marginLeft: AppSize.s12,
                            textAlign: TextAlign.center,
                            text: 'email'.tr,
                            fontSize: AppSize.s16,
                          ),
                          suffixWidgetFlex: 70,
                          suffixWidget: Padding(
                            padding: const EdgeInsets.only(right: AppSize.s12),
                            child: controller.profileController.userInfoRepsonse
                                        .value.emailConfirmedAt !=
                                    null
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      CustomTextWidget(
                                        textAlign: TextAlign.center,
                                        text: 'verified'
                                            .tr, //Check your email and confirm
                                        color: ColorsManager.green,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: AppSize.s8,
                                        ),
                                        child: Icon(
                                          Icons.check_circle,
                                          color: ColorsManager.green,
                                          size: AppSize.s18,
                                        ),
                                      ),
                                    ],
                                  )
                                : InkWell(
                                    onTap: () => {
                                      controller
                                          .makeRequestToAuthVerifyEmailAPI(
                                        email: controller.profileController
                                            .userInfoRepsonse.value.email,
                                      ),
                                    },
                                    child: Obx(
                                      () => controller
                                                  .isVerifyEmailSent.value ==
                                              true
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                CustomTextWidget(
                                                  textAlign: TextAlign.center,
                                                  text: 'emailSent'.tr,
                                                  color: ColorsManager.grey,
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: AppSize.s4,
                                                  ),
                                                  child: Icon(
                                                    Icons.check_circle,
                                                    color: ColorsManager.grey,
                                                    size: AppSize.s18,
                                                  ),
                                                ),
                                              ],
                                            )
                                          : Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                CustomTextWidget(
                                                  textAlign: TextAlign.center,
                                                  text: 'verify'.tr,
                                                  color: ColorsManager.blue,
                                                  textDecoration:
                                                      TextDecoration.underline,
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: AppSize.s4,
                                                  ),
                                                  child: Icon(
                                                    Icons
                                                        .keyboard_arrow_right_outlined,
                                                    color: ColorsManager.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      //===== Bottom of Verify Email Component =====//
                      const Divider(
                        height: 10,
                        thickness: 1,
                      ),

                      ///===== Top of Email Notification Component =====//
                      InkWell(
                        onTap: () {
                          controller.emailNotificationRxBool.value =
                              controller.updatingBoolValue(
                            newValue: !controller.emailNotificationRxBool.value,
                          )!;
                        },
                        child: RowContentInputWidget(
                          centerWidget: CustomTextWidget(
                            marginLeft: AppSize.s12,
                            textAlign: TextAlign.center,
                            text: 'emailNotifications'.tr,
                            fontSize: AppSize.s16,
                          ),
                          suffixWidgetFlex: 20,
                          suffixWidget: Switch(
                            value: controller.emailNotificationRxBool.value,
                            onChanged: (value) {
                              controller.emailNotificationRxBool.value =
                                  controller.updatingBoolValue(
                                newValue: value,
                              )!;
                            },
                            activeTrackColor: ColorsManager.primary25,
                            activeColor: ColorsManager.primary,
                          ),
                        ),
                      ),
                      //===== Bottom of Email Notification Component =====//
                      const Divider(
                        height: 10,
                        thickness: 1,
                      ),

                      ///===== Top of Change Password Component =====//
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.changePasswordRoute);
                        },
                        child: Padding(
                          padding:
                              const EdgeInsets.symmetric(vertical: AppSize.s12),
                          child: RowContentInputWidget(
                            centerWidget: CustomTextWidget(
                              marginLeft: AppSize.s12,
                              textAlign: TextAlign.center,
                              text: 'changePassword'.tr,
                              fontSize: AppSize.s16,
                            ),
                            suffixWidget: const Padding(
                              padding: EdgeInsets.only(right: AppSize.s12),
                              child: Icon(
                                Icons.keyboard_arrow_right_outlined,
                                color: ColorsManager.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                      //===== Bottom of Change Password Component =====//
                      const Divider(
                        height: 10,
                        thickness: 1,
                      ),

                      ///===== Top of Delete Account Component =====//
                      InkWell(
                        onTap: () => Get.dialog(
                          ConfirmationDialogWidget(
                            dialogBody:
                                "${'delectAccountWarming'.tr}\n\n${'deleteAccountConfirmMsg'.tr}",
                            onPressed: () async => {
                              Get.dialog(
                                const LoadingWidget(),
                              ),
                              await Future.delayed(DurationConstant.d750, () {
                                controller.makeRequestToAuthDeleteAccountAPI();
                              }),
                              await AuthServices().removeToken().then(
                                    (value) =>
                                        Get.offAllNamed(Routes.splashRoute),
                                  ),
                              // Get.back(),
                            },
                          ),
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsets.symmetric(vertical: AppSize.s12),
                          child: RowContentInputWidget(
                            centerWidget: CustomTextWidget(
                              marginLeft: AppSize.s12,
                              textAlign: TextAlign.center,
                              text: 'deleteAccount'.tr,
                              color: ColorsManager.red,
                              fontSize: AppSize.s16,
                            ),
                            suffixWidget: const Padding(
                              padding: EdgeInsets.only(right: AppSize.s12),
                              child: Icon(
                                Icons.keyboard_arrow_right_outlined,
                                color: ColorsManager.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                      //===== Bottom of Delete Account Component =====//
                      const SizedBox(
                        height: AppSize.s8,
                      ),
                    ],
                  ),
                ),
                //===== Bottom of Settings Component =====//

                ///===== Top of App Version Component =====//
                CustomTextWidget(
                  textAlign: TextAlign.center,
                  text: "${'appVersion'.tr}: $textAppVersion",
                ),
                //===== Bottom of App Version Component =====//
              ],
            ),
          ),
          //===== Bottom of body Component =====//

          ///===== Top of bottomNavigationBar Component =====//
          bottomNavigationBar: CustomMaterialButton(
            leftPadding: AppSize.s12,
            rightPadding: AppSize.s12,
            bottomPadding: AppSize.s20,
            text: 'logout'.tr,
            fontSize: 20.0,
            buttonWidth: getWidth,
            onPressed: () {
              unFocusKeyBoard(context);
              Get.dialog(
                ConfirmationDialogWidget(
                  dialogBody: 'logOutConfirmMsg'.tr,
                  onPressed: () => {
                    controller.homeController.signOut(),
                  },
                ),
              );
            },
          ),
          //===== Bottom of bottomNavigationBar Component =====//
        ),
      ),
    );
  }
}
