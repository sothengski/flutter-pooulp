import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../setting.dart';

class ChangePasswordPage extends GetView<ChangePasswordController> {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: 'settings.changePasswordTitle'.tr,
      ),

      ///===== Top of body Component =====//
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Obx(
          () => Form(
            key: controller.passwordFormKey,
            child: Padding(
              padding: const EdgeInsets.all(AppSize.s16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ///===== Top of Current Password Component =====//
                  CustomTextInput(
                    controller: controller.currentPasswordCtrl,
                    inputTitle: 'settings.currentPassword'.tr,
                    hintText: 'settings.currentPasswordHint'.tr,
                    suffixIcon: IconButton(
                      icon: !controller.showCurrentPassword.value
                          ? const Icon(
                              Icons.visibility_outlined,
                              color: ColorsManager.grey400,
                              size: 20.0,
                            )
                          : const Icon(
                              Icons.visibility_off_outlined,
                              color: ColorsManager.grey400,
                              size: 20.0,
                            ),
                      onPressed: () => controller.showCurrentPassword.value =
                          switchingBooleanValue(
                        boolValue: controller.showCurrentPassword.value,
                      ),
                    ),
                    obscureText: !controller.showCurrentPassword.value,
                    isFilled: true,
                    topPadding: AppSize.s12,
                    bottomPadding: AppSize.s16,
                    validator: Validator().passwordValidatorWithMin6Chars,
                    inputFormatterList: [
                      Validator().avoidSpaceInputFormatter(),
                    ],
                    onChanged: (_) =>
                        controller.passwordFormKey.currentState!.validate(),
                  ),
                  //===== Bottom of Current Password Component =====//

                  ///===== Top of New Password Component =====//
                  CustomTextInput(
                    controller: controller.newPasswordCtrl,
                    inputTitle: 'settings.newPassword'.tr,
                    hintText: 'settings.newPasswordHint'.tr,
                    suffixIcon: IconButton(
                      icon: !controller.showNewPassword.value
                          ? const Icon(
                              Icons.visibility_outlined,
                              color: ColorsManager.grey400,
                              size: 20.0,
                            )
                          : const Icon(
                              Icons.visibility_off_outlined,
                              color: ColorsManager.grey400,
                              size: 20.0,
                            ),
                      onPressed: () => controller.showNewPassword.value =
                          switchingBooleanValue(
                        boolValue: controller.showNewPassword.value,
                      ),
                    ),
                    obscureText: !controller.showNewPassword.value,
                    isFilled: true,
                    topPadding: AppSize.s12,
                    bottomPadding: AppSize.s16,
                    validator: Validator().passwordValidatorWithMin6Chars,
                    inputFormatterList: [
                      Validator().avoidSpaceInputFormatter(),
                    ],
                    onChanged: (_) =>
                        controller.passwordFormKey.currentState!.validate(),
                  ),
                  //===== Bottom of New Password Component =====//

                  ///===== Top of New Password Confirmation Component =====//
                  CustomTextInput(
                    controller: controller.newPasswordConfirmationCtrl,
                    inputTitle: 'settings.confirmNewPassword'.tr,
                    hintText: 'settings.confirmNewPasswordHint'.tr,
                    suffixIcon: IconButton(
                      icon: !controller.showNewPasswordConfirmation.value
                          ? const Icon(
                              Icons.visibility_outlined,
                              color: ColorsManager.grey400,
                              size: 20.0,
                            )
                          : const Icon(
                              Icons.visibility_off_outlined,
                              color: ColorsManager.grey400,
                              size: 20.0,
                            ),
                      onPressed: () => controller.showNewPasswordConfirmation
                          .value = switchingBooleanValue(
                        boolValue: controller.showNewPasswordConfirmation.value,
                      ),
                    ),
                    obscureText: !controller.showNewPasswordConfirmation.value,
                    isFilled: true,
                    topPadding: AppSize.s12,
                    bottomPadding: AppSize.s16,
                    validator: (_) => controller.matchingPasswords(),
                    inputFormatterList: [
                      Validator().avoidSpaceInputFormatter(),
                    ],
                    onChanged: (_) =>
                        controller.passwordFormKey.currentState!.validate(),
                  ),
                  //===== Bottom of New Password Confirmation Component =====//
                ],
              ),
            ),
          ),
        ),
      ),
      //===== Bottom of body Component =====//

      ///===== Top of bottomNavigationBar Component =====//
      bottomNavigationBar: Obx(
        () => CustomMaterialButton(
          leftPadding: AppSize.s12,
          rightPadding: AppSize.s12,
          bottomPadding: AppSize.s20,
          text: 'core.saveBtn'.tr,
          childWidget: controller.isSubmitBtnProcessing.value == true
              ? const SizedBox(
                  height: 40,
                  child: LoadingWidget(
                    isTreeBounceLoading: true,
                    color: ColorsManager.white,
                  ),
                )
              : null,
          fontSize: AppSize.s20,
          buttonWidth: getWidth,
          onPressed: () {
            unFocusKeyBoard(context);
            if (!controller.isSubmitBtnProcessing.value == true) {
              controller.summitAndValidateData();
            }
          },
        ),
      ),
      //===== Bottom of bottomNavigationBar Component =====//
    );
  }
}
