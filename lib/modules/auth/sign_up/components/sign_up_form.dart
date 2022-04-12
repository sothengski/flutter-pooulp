import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../core/core.dart';
import '../../../../data/data.dart';
import '../../../../routes/routes.dart';
import '../../../modules.dart';

class SignUpForm extends GetView<SignUpController> {
  final String? userType;
  final bool? isStudent;
  const SignUpForm({
    this.userType,
    this.isStudent = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primaryBlue,
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            controller.clearData();
            Get.back();
          },
        ),
      ),
      body: GestureDetector(
        onTap: () => unFocusKeyBoard(context),
        child: SizedBox(
          height: getHeight,
          width: getWidth,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const Padding(
                //   padding: EdgeInsets.only(
                //     top: kBottomNavigationBarHeight + 48,
                //     left: AppSize.s72,
                //     right: AppSize.s72,
                //     bottom: AppSize.s24,
                //   ),
                //   child: Image(
                //     image: AssetImage(AssetsManager.appLogoWhite),
                //   ),
                // ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: kBottomNavigationBarHeight + 48,
                    left: AppSize.s72,
                    right: AppSize.s72,
                    bottom: AppSize.s12,
                  ),
                  // child: SvgPicture.asset(
                  //   AssetsManager.appLogoWhiteSvg,
                  //   height: 80,
                  //   matchTextDirection: true,
                  // ),
                  child: Image(
                    // height: 80,
                    image: AssetImage(AssetsManager.appLogoRose),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(AppSize.s16),
                  child: CustomContainerWidget(
                    isBoxShadow: false,
                    elevation: 0.0,
                    childPadding: 20.0,
                    titleInSide: false,
                    child: Obx(
                      () => Form(
                        key: controller.registrationFormKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomTextWidget(
                              text: isStudent == true
                                  ? 'auth.createStudentAccount'.tr
                                  : 'auth.createEnterpriseAccount'.tr,
                              fontSize: 24.0,
                              fontWeight: FontWeight.w700,
                              color: ColorsManager.primary,
                              marginBottom: AppSize.s24,
                            ),
                            CustomTextInput(
                              controller: controller.tokenCtrl,
                              inputTitle: 'auth.token'.tr,
                              hintText: 'auth.tokenHint'.tr,
                              isFilled: true,
                              topPadding: AppSize.s12,
                              validator: Validator().notEmptyValidator,
                            ),
                            CustomTextInput(
                              controller: controller.firstNameCtrl,
                              inputTitle: 'auth.firstName'.tr,
                              hintText: 'auth.firstNameHint'.tr,
                              isFilled: true,
                              topPadding: AppSize.s12,
                              validator: Validator().notEmptyValidator,
                              // onChanged: (value) => null,
                              // onSaved: (value) => controller
                              //     .firstNameCtrl.text = value.toString(),
                            ),
                            CustomTextInput(
                              controller: controller.lastNameCtrl,
                              inputTitle: 'auth.lastName'.tr,
                              hintText: 'auth.lastNameHint'.tr,
                              isFilled: true,
                              topPadding: AppSize.s12,
                              validator: Validator().notEmptyValidator,
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
                            Row(
                              children: [
                                Expanded(
                                  flex: 40,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomTextWidget(
                                        text: 'auth.phoneNumber'.tr,
                                        marginTop: AppSize.s12,
                                        textAlign: TextAlign.left,
                                        // marginBottom: AppSize.s4,
                                      ),
                                      const SizedBox(
                                        height: 3.0,
                                      ),
                                      GestureDetector(
                                        onTap: () => Get.bottomSheet(
                                          Container(
                                            height: getHeight * 0.8,
                                            decoration: const ShapeDecoration(
                                              color: ColorsManager.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                    16,
                                                  ),
                                                  topRight: Radius.circular(
                                                    16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            child: CountryListSelector(
                                              countrylist: countryList,
                                              selectedCountry: controller
                                                  .selectedCountry.value,
                                              onTap: (country) {
                                                controller
                                                    .selectedCountryOnClick(
                                                  country,
                                                );
                                                Get.back();
                                              },
                                            ),
                                          ),
                                        ),
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          padding: EdgeInsets.zero,
                                          child: FormField(
                                            validator: (_) => controller
                                                .isPhoneNumberValidate(),
                                            builder: (
                                              FormFieldState<String> state,
                                            ) {
                                              return InputDecorator(
                                                // alignedDropdown: true,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      const EdgeInsets.fromLTRB(
                                                    12,
                                                    0,
                                                    4,
                                                    0,
                                                  ),
                                                  fillColor:
                                                      ColorsManager.grey100,
                                                  filled: true,
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      AppSize.s8,
                                                    ),
                                                  ),
                                                  errorText: state.hasError
                                                      ? state.errorText
                                                      : null,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      AppSize.s8,
                                                    ),
                                                    borderSide:
                                                        const BorderSide(
                                                      color:
                                                          ColorsManager.grey100,
                                                    ),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      AppSize.s8,
                                                    ),
                                                    borderSide:
                                                        const BorderSide(
                                                      color:
                                                          ColorsManager.red900,
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      AppSize.s8,
                                                    ),
                                                    borderSide:
                                                        const BorderSide(
                                                      color:
                                                          ColorsManager.grey300,
                                                    ),
                                                  ),
                                                ),
                                                child: Obx(
                                                  () => controller
                                                              .selectedCountry
                                                              .value
                                                              .phoneCode ==
                                                          null
                                                      ? RowContentInputWidget(
                                                          centerWidget:
                                                              CustomTextWidget(
                                                            text:
                                                                'auth.countryCode'
                                                                    .tr,
                                                            color: ColorsManager
                                                                .grey400,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 16.0,
                                                          ),
                                                        )
                                                      : RowContentInputWidget(
                                                          prefixWidgetFlex: 25,
                                                          prefixWidget:
                                                              CircleFlag(
                                                            controller
                                                                .selectedCountry
                                                                .value
                                                                .isoCode
                                                                .toString(),
                                                          ),
                                                          prefixWidgetRightPadding:
                                                              AppSize.s12,
                                                          centerWidgetFlex: 75,
                                                          centerWidget:
                                                              CustomTextWidget(
                                                            //marginLeft: 4.0,
                                                            text: controller
                                                                .selectedCountry
                                                                .value
                                                                .phoneCode,
                                                            color: ColorsManager
                                                                .black,
                                                            fontSize: 16.0,
                                                          ),
                                                        ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 60,
                                  child: CustomTextInput(
                                    controller: controller.phoneNumberCtrl,
                                    inputTitle: "",
                                    hintText: 'auth.phoneNumberHint'.tr,
                                    keyboardType: TextInputType.phone,
                                    isFilled: true,
                                    topPadding: AppSize.s12,
                                    leftPadding: AppSize.s4,
                                    validator: (_) =>
                                        controller.isPhoneNumberValidate(
                                      isPhoneNumberField: true,
                                    ),
                                    maxLength: 13,
                                    inputFormatterList: [
                                      FilteringTextInputFormatter.deny(
                                        RegExp(
                                          Validator.avoidSpaceRegExpPattern,
                                        ),
                                      ),
                                      FilteringTextInputFormatter.allow(
                                        RegExp(
                                          Validator.numberRegExpPattern,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
                                onPressed: () =>
                                    controller.showPasswordBoolSwitching(
                                  boolValue: controller.showPassword.value,
                                ),
                              ),
                              obscureText: !controller.showPassword.value,
                              isFilled: true,
                              topPadding: AppSize.s12,
                              bottomPadding:
                                  isStudent == true ? AppSize.s16 : 0.0,
                              validator:
                                  Validator().passwordValidatorWithMin6Chars,
                              inputFormatterList: [
                                FilteringTextInputFormatter.deny(
                                  RegExp(Validator.avoidSpaceRegExpPattern),
                                ),
                              ],
                            ),
                            // CustomTextInput(
                            //   controller: controller.passwordConfirmationCtrl,
                            //   inputTitle: "Password Confirmation",
                            //   hintText: "Enter your password confirmation",
                            //   suffixIcon: true,
                            //   obscureText:
                            // /      !controller.showPasswordConfirmation.value,
                            //   isFilled: true,
                            //   topPadding: AppSize.s12,
                            //   bottomPadding:
                            //       isStudent == true ? AppSize.s32 : 0.0,
                            //   validator: (_) =>
                            //       controller.matchingPasswords(),
                            //   inputFormatterList: [
                            //     FilteringTextInputFormatter.deny(
                            //       RegExp(Validator.avoidSpaceRegExpPattern),
                            //     ),
                            //   ],
                            //   changeShowPassword: () => controller
                            //       .showPasswordConfirmationBoolSwitching(
                            //     boolValue:
                            //         controller.showPasswordConfirmation.value,
                            //   ),
                            // ),
                            if (isStudent == true)
                              Container()
                            else
                              CustomTextInput(
                                controller: controller.enterpriseNameCtrl,
                                inputTitle: 'auth.enterpriseName'.tr,
                                hintText: 'auth.enterpriseNameHint'.tr,
                                isFilled: true,
                                topPadding: AppSize.s12,
                                validator: Validator().notEmptyValidator,
                              ),
                            if (isStudent == true)
                              Container()
                            else
                              CustomTextInput(
                                controller: controller.enterpriseIDCtrl,
                                inputTitle: 'auth.enterpriseID'.tr,
                                hintText: 'auth.enterpriseIDHint'.tr,
                                isFilled: true,
                                topPadding: AppSize.s12,
                                bottomPadding: AppSize.s16,
                                // validator: Validator().password,
                              ),
                            Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomIconButtonWidget(
                                  isConstraints: true,
                                  iconWidget: controller
                                              .isCheckTermCondition.value ==
                                          true
                                      ? const Icon(
                                          Icons.check_box,
                                          color: ColorsManager.primary,
                                        )
                                      : const Icon(
                                          Icons.check_box_outline_blank_sharp,
                                          color: ColorsManager.grey,
                                        ),
                                  onClick: () =>
                                      controller.checkingBoolSwitching(
                                    boolValue:
                                        controller.isCheckTermCondition.value,
                                  ),
                                ),
                                SizedBox(
                                  width: getWidth * 0.7,
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'auth.agreeToPooulp'.tr,
                                          style: const TextStyle(
                                            color: ColorsManager.primaryBlue,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'auth.privacy'.tr,
                                          style: const TextStyle(
                                            color: Colors.blue,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () async {
                                              urlLauncherUtils(
                                                thingToLaunch: UrlWebsiteStrings
                                                    .privacyPolicy,
                                                inApp: true,
                                              );
                                            },
                                        ),
                                        const TextSpan(
                                          text: ' & ',
                                          style: TextStyle(
                                            color: ColorsManager.primaryBlue,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'auth.term'.tr,
                                          style: const TextStyle(
                                            color: Colors.blue,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () async {
                                              urlLauncherUtils(
                                                thingToLaunch: UrlWebsiteStrings
                                                    .termsOfUse,
                                                inApp: true,
                                              );
                                            },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // SizedBox(
                                //   width: getWidth * 0.7,
                                //   child: GestureDetector(
                                //     onTap: () async {
                                //       urlLaucherUtils(
                                //         url:
                                //             'http://pooulp.com/privacy-policy/',
                                //         inApp: true,
                                //       );
                                //     },
                                //     child: const CustomTextWidget(
                                //       text:
                                //           "I agree to Pooulp Privacy Policy & Terms",
                                //       maxLine: 2,
                                //     ),
                                //   ),
                                // )
                              ],
                            ),
                            const SizedBox(height: AppSize.s5),
                            Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomIconButtonWidget(
                                  isConstraints: true,
                                  iconWidget:
                                      controller.isCheckMarketing.value == true
                                          ? const Icon(
                                              Icons.check_box,
                                              color: ColorsManager.primary,
                                            )
                                          : const Icon(
                                              Icons
                                                  .check_box_outline_blank_sharp,
                                              color: ColorsManager.grey,
                                            ),
                                  onClick: () =>
                                      controller.checkingBoolMarketing(
                                    boolValue:
                                        controller.isCheckMarketing.value,
                                  ),
                                ),
                                SizedBox(
                                  width: getWidth * 0.7,
                                  child: CustomTextWidget(
                                    text: 'auth.joinEmailListText'.tr,
                                    maxLine: 3,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            Obx(
                              () => Visibility(
                                visible: controller.isSubmitBtnProcessing.value,
                                child: const LoadingWidget(),
                              ),
                            ),
                            Obx(
                              () => Visibility(
                                visible:
                                    !controller.isSubmitBtnProcessing.value,
                                child: controller.isCheckTermCondition.value ==
                                        true
                                    ? CustomMaterialButton(
                                        text: 'auth.register'.tr,
                                        fontSize: 20.0,
                                        buttonWidth: getWidth,
                                        onPressed: () {
                                          unFocusKeyBoard(context);
                                          controller.registerButtonOnClick(
                                            userType: userType,
                                          );
                                        },
                                      )
                                    : CustomMaterialButton(
                                        text: 'auth.register'.tr,
                                        textColor: ColorsManager.primaryBlue,
                                        fontSize: 20.0,
                                        buttonWidth: getWidth,
                                        buttonColor: ColorsManager.grey300,
                                        onPressed: () {},
                                      ),
                              ),
                            ),
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
                                  msgContent:
                                      'This Page is only view.\n Data will not save.',
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    CircleAvatar(
                                      radius: 20.0,
                                      backgroundColor: ColorsManager.white,
                                      child: Image(
                                        image: AssetImage(
                                          AssetsManager.googleLogo,
                                        ),
                                      ),
                                    ),
                                    CircleAvatar(
                                      radius: 20.0,
                                      backgroundColor: ColorsManager.white,
                                      child: Image(
                                        image: AssetImage(
                                          AssetsManager.linkedInLogo,
                                        ),
                                      ),
                                    ),
                                    CircleAvatar(
                                      radius: 20.0,
                                      backgroundColor: ColorsManager.white,
                                      child: Image(
                                        image: AssetImage(
                                          AssetsManager.facebookLogo,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                CustomTextWidget(
                  text: 'auth.acountExist'.tr,
                  color: ColorsManager.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                  marginTop: AppSize.s16,
                  marginBottom: AppSize.s16,
                ),
                GestureDetector(
                  onTap: () => Get.offAllNamed(
                    Routes.signInRoute,
                  ),
                  child: CustomTextWidget(
                    text: 'auth.logIn'.tr,
                    color: ColorsManager.white,
                    textDecoration: TextDecoration.underline,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    marginBottom: AppSize.s48,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
