import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../core/core.dart';
import '../../../../routes/routes.dart';
import '../../../modules.dart';

class SignInForm extends GetView<SignInController> {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainerWidget(
      isBoxShadow: false,
      elevation: 0.0,
      childPadding: 20.0,
      titleInSide: false,
      child: Obx(
        () => Form(
          key: controller.signInFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextWidget(
                text: 'auth.logIn'.tr,
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
                color: ColorsManager.primary,
                marginBottom: AppSize.s24,
              ),
              CustomTextInput(
                controller: controller.emailCtrl,
                inputTitle: 'auth.email'.tr,
                hintText: 'auth.emailHint'.tr,
                isFilled: true,
                topPadding: AppSize.s12,
                validator: Validator().emailValidator,
                keyboardType: TextInputType.emailAddress,
              ),
              CustomTextInput(
                controller: controller.passwordCtrl,
                inputTitle: 'auth.password'.tr,
                hintText: 'auth.passwordHint'.tr,
                suffixIcon: IconButton(
                  icon: !controller.showPassword.value
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
                  onPressed: () => controller.showPasswordBoolSwitching(
                    boolValue: controller.showPassword.value,
                  ),
                ),
                obscureText: !controller.showPassword.value,
                isFilled: true,
                topPadding: AppSize.s12,
                validator: Validator().passwordValidatorWithMin6Chars,
                inputFormatterList: [
                  FilteringTextInputFormatter.deny(
                    RegExp(Validator.avoidSpaceRegExpPattern),
                  ),
                ],
                // changeShowPassword: () => controller.showPasswordBoolSwitching(
                //   boolValue: controller.showPassword.value,
                // ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => Get.toNamed(Routes.forgotPasswordRoute),
                  child: CustomTextWidget(
                    text: 'auth.forgotPassword'.tr,
                    color: ColorsManager.primary,
                    textDecoration: TextDecoration.underline,
                    marginTop: AppSize.s16,
                    marginBottom: AppSize.s16,
                  ),
                ),
              ),
              // Obx(
              //   () =>
              Visibility(
                visible: controller.isSubmitBtnProcessing.value,
                child: CustomMaterialButton(
                  childWidget: const LoadingWidget(
                    isTreeBounceLoading: true,
                    color: ColorsManager.white,
                  ),
                  buttonWidth: getWidth,
                  onPressed: () {
                    unFocusKeyBoard(context);
                  },
                ),
              ),
              // ),
              // Obx(
              //   () =>
              Visibility(
                visible: !controller.isSubmitBtnProcessing.value,
                child: CustomMaterialButton(
                  text: 'auth.loginButton'.tr,
                  fontSize: 20.0,
                  buttonWidth: getWidth,
                  onPressed: () {
                    unFocusKeyBoard(context);
                    controller.loginButtonOnClick();
                  },
                ),
              ),
              // ),
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      thickness: 1,
                      color: ColorsManager.grey600,
                    ),
                  ),
                  const SizedBox(width: 10),
                  CustomTextWidget(
                    text: 'auth.or'.tr,
                    fontSize: 20.0,
                    marginTop: AppSize.s16,
                    marginBottom: AppSize.s16,
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Divider(
                      thickness: 1,
                      color: ColorsManager.grey600,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: AppSize.s48,
                  right: AppSize.s48,
                ),
                child: GestureDetector(
                  onTap: () => customSnackbar(
                    msgTitle: 'This Page is under construction!',
                    msgContent: 'This Page is only view.\n Data will not save.',
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: controller.googleSignInMethod,
                        child: const CircleAvatar(
                          radius: 20.0,
                          backgroundColor: ColorsManager.white,
                          child: Image(
                            image: AssetImage(AssetsManager.googleLogo),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: controller.linkedInSignInMethod,
                        child: const CircleAvatar(
                          radius: 20.0,
                          backgroundColor: ColorsManager.white,
                          child: Image(
                            image: AssetImage(AssetsManager.linkedInLogo),
                          ),
                        ),
                      ),
                      // const CircleAvatar(
                      //   radius: 20.0,
                      //   backgroundColor: ColorsManager.white,
                      //   child: Image(
                      //     image: AssetImage(AssetsManager.facebookLogo),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
