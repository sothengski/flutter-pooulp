import 'package:flutter/material.dart';
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
        () => AutofillGroup(
          child: Form(
            key: controller.signInFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextWidget(
                  text: 'signInToYourAccount'.tr, //'auth.signInToUrAcc'.tr,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  color: ColorsManager.primary,
                  marginBottom: AppSize.s24,
                ),
                // TextFormField(
                //   autofillHints: const [AutofillHints.email],
                //   decoration: InputDecoration(
                //     labelText: 'email'.tr,
                //     hintText: 'emailHint'.tr,
                //   ),
                // ),
                CustomTextInput(
                  controller: controller.emailCtrl,
                  inputTitle: 'email'.tr, //'auth.email'.tr,
                  hintText: 'emailHint'.tr, //'auth.emailHint'.tr,
                  isFilled: true,
                  topPadding: AppSize.s12,
                  validator: Validator().emailValidator,
                  keyboardType: TextInputType.emailAddress,
                ),
                CustomTextInput(
                  controller: controller.passwordCtrl,
                  inputTitle: 'password'.tr, //'auth.password'.tr,
                  hintText: 'passwordHint'.tr, //'auth.passwordHint'.tr,
                  autofillHintsList: const <String>[
                    AutofillHints.streetAddressLine1
                  ],
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
                    FilterTextInputFormat()
                        .deny(regExpString: Validator.avoidSpaceRegExpPattern),
                    // FilteringTextInputFormatter.deny(
                    //   RegExp(Validator.avoidSpaceRegExpPattern),
                    // ),
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
                      text: 'forgotPassword'.tr, //'auth.forgotPassword'.tr,
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
                    text: 'login'.tr, //'auth.loginButton'.tr,
                    fontSize: 20.0,
                    buttonWidth: getWidth,
                    onPressed: () {
                      unFocusKeyBoard(context);
                      controller.loginButtonOnClick();
                    },
                  ),
                ),
                // ),
                // Row(
                //   children: [
                //     const Expanded(
                //       child: Divider(
                //         thickness: 1,
                //         color: ColorsManager.grey600,
                //       ),
                //     ),
                //     const SizedBox(width: 10),
                //     CustomTextWidget(
                //       text: 'or'.tr, //'auth.or'.tr,
                //       fontSize: 20.0,
                //       marginTop: AppSize.s16,
                //       marginBottom: AppSize.s16,
                //     ),
                //     const SizedBox(width: 10),
                //     const Expanded(
                //       child: Divider(
                //         thickness: 1,
                //         color: ColorsManager.grey600,
                //       ),
                //     ),
                //   ],
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //     left: AppSize.s48,
                //     right: AppSize.s48,
                //   ),
                //   child: GestureDetector(
                //     onTap: () => customSnackbar(
                //       msgTitle: 'This Page is under construction!',
                //       msgContent:
                //           'This Page is only view.\n Data will not save.',
                //     ),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         GestureDetector(
                //           // onTap: controller.googleSignInMethod,
                //           child: const CircleAvatar(
                //             radius: 20.0,
                //             backgroundColor: ColorsManager.white,
                //             child: Image(
                //               image: AssetImage(AssetsManager.googleLogo),
                //             ),
                //           ),
                //         ),
                //         GestureDetector(
                //           // onTap: controller.linkedInSignInMethod,
                //           child: const CircleAvatar(
                //             radius: 20.0,
                //             backgroundColor: ColorsManager.white,
                //             child: Image(
                //               image: AssetImage(AssetsManager.linkedInLogo),
                //             ),
                //           ),
                //         ),
                //         // const CircleAvatar(
                //         //   radius: 20.0,
                //         //   backgroundColor: ColorsManager.white,
                //         //   child: Image(
                //         //     image: AssetImage(AssetsManager.facebookLogo),
                //         //   ),
                //         // ),
                //       ],
                //     ),
                //   ),
                // )
                const SizedBox(
                  height: 12.0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
