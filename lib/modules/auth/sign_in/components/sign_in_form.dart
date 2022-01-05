import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../core/core.dart';
import '../../../modules.dart';

class SignInForm extends GetView<SignInController> {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainerWidget(
      child: Padding(
        padding: const EdgeInsets.all(double24),
        child: Obx(
          () => Form(
            key: controller.signInFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomTextWidget(
                  text: 'Login',
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                  color: ColorManager.primary,
                ),
                CustomTextInput(
                  controller: controller.emailCtrl,
                  inputTitle: "Email",
                  hintText: "Enter your email",
                  isFilled: true,
                  topPadding: double12,
                  validator: Validator().emailValidator,
                  keyboardType: TextInputType.emailAddress,
                ),
                CustomTextInput(
                  controller: controller.passwordCtrl,
                  inputTitle: "Password",
                  hintText: "Enter your password",
                  suffixIcon: true,
                  obscureText: !controller.showPassword.value,
                  isFilled: true,
                  topPadding: double12,
                  validator: Validator().passwordValidator,
                  maxLength: 15,
                  inputFormatterList: [
                    FilteringTextInputFormatter.deny(
                      RegExp(Validator.avoidSpaceRegExpPattern),
                    ),
                  ],
                  changeShowPassword: () =>
                      controller.showPasswordBoolSwitching(
                    boolValue: controller.showPassword.value,
                  ),
                ),
                const Align(
                  alignment: Alignment.centerRight,
                  child: CustomTextWidget(
                    text: 'Forget password?',
                    color: ColorManager.primary,
                    textDecoration: TextDecoration.underline,
                    marginTop: double16,
                    marginBottom: double16,
                  ),
                ),
                Obx(
                  () => Visibility(
                    visible: controller.isSubmitBtnProcessing.value,
                    child: const LoadingWidget(),
                  ),
                ),
                Obx(
                  () => Visibility(
                    visible: !controller.isSubmitBtnProcessing.value,
                    child: CustomMaterialButton(
                      text: "Login",
                      fontSize: 20.0,
                      buttonWidth: getWidth,
                      onPressed: () {
                        unFocusKeyBoard(context);
                        controller.loginButtonOnClick();
                      },
                    ),
                  ),
                ),
                Row(
                  children: const [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: ColorManager.grey600,
                      ),
                    ),
                    SizedBox(width: 10),
                    CustomTextWidget(
                      text: 'Or',
                      fontSize: 20.0,
                      marginTop: double16,
                      marginBottom: double16,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: ColorManager.grey600,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: double48,
                    right: double48,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      CircleAvatar(
                        radius: 30.0,
                        backgroundColor: ColorManager.white,
                        child: Image(
                          image: AssetImage(ImageAssets.googleLogo),
                        ),
                      ),
                      CircleAvatar(
                        radius: 30.0,
                        backgroundColor: ColorManager.white,
                        child: Image(
                          image: AssetImage(ImageAssets.linkedInLogo),
                        ),
                      ),
                      CircleAvatar(
                        radius: 30.0,
                        backgroundColor: ColorManager.white,
                        child: Image(
                          image: AssetImage(ImageAssets.facebookLogo),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
