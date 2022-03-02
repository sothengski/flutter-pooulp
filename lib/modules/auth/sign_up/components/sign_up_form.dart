import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
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
      backgroundColor: ColorsManager.primary,
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
                Padding(
                  padding: const EdgeInsets.only(
                    top: kBottomNavigationBarHeight + 48,
                    left: AppSize.s72,
                    right: AppSize.s72,
                    bottom: AppSize.s12,
                  ),
                  child: SvgPicture.asset(
                    AssetsManager.appLogoWhiteSvg,
                    height: 80,
                    matchTextDirection: true,
                  ),
                  // child: Image(
                  //   image: AssetImage(AssetsManager.appLogoWhite),
                  // ),
                ),
                Padding(
                  padding: const EdgeInsets.all(AppSize.s16),
                  child: CustomContainerWidget(
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
                              text:
                                  "Create ${isStudent == true ? 'Student' : 'Enterprise'} Account",
                              fontSize: 24.0,
                              fontWeight: FontWeight.w700,
                              color: ColorsManager.primary,
                              marginBottom: AppSize.s24,
                            ),
                            CustomTextInput(
                              controller: controller.tokenCtrl,
                              inputTitle: "Token",
                              hintText: "Enter the Token",
                              isFilled: true,
                              topPadding: AppSize.s12,
                              validator: Validator().notEmptyValidator,
                            ),
                            CustomTextInput(
                              controller: controller.firstNameCtrl,
                              inputTitle: "First name",
                              hintText: "Enter your first name",
                              isFilled: true,
                              topPadding: AppSize.s12,
                              validator: Validator().notEmptyValidator,
                              // onChanged: (value) => null,
                              // onSaved: (value) => controller
                              //     .firstNameCtrl.text = value.toString(),
                            ),
                            CustomTextInput(
                              controller: controller.lastNameCtrl,
                              inputTitle: "Last name",
                              hintText: "Enter your last name",
                              isFilled: true,
                              topPadding: AppSize.s12,
                              validator: Validator().notEmptyValidator,
                            ),
                            CustomTextInput(
                              controller: controller.emailCtrl,
                              inputTitle: "Email",
                              hintText: "Enter your email",
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
                                      const CustomTextWidget(
                                        text: 'Phone Number',
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
                                                    4,
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
                                                      ? const CustomTextWidget(
                                                          marginLeft:
                                                              AppSize.s8,
                                                          text: 'Country Code',
                                                          color: ColorsManager
                                                              .grey400,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 16.0,
                                                        )
                                                      : Row(
                                                          children: [
                                                            SizedBox(
                                                              height: 15.0,
                                                              child: CircleFlag(
                                                                controller
                                                                    .selectedCountry
                                                                    .value
                                                                    .isoCode
                                                                    .toString(),
                                                              ),
                                                            ),
                                                            CustomTextWidget(
                                                              marginLeft:
                                                                  AppSize.s8,
                                                              text: controller
                                                                  .selectedCountry
                                                                  .value
                                                                  .phoneCode,
                                                              color:
                                                                  ColorsManager
                                                                      .black,
                                                              fontSize: 16.0,
                                                            ),
                                                            // const Icon(
                                                            //   Icons
                                                            //       .arrow_drop_down,
                                                            // ),
                                                          ],
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
                                    hintText: 'Enter Phone Number',
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
                              inputTitle: "Password",
                              hintText: "Enter your password",
                              suffixIcon: true,
                              obscureText: !controller.showPassword.value,
                              isFilled: true,
                              topPadding: AppSize.s12,
                              bottomPadding:
                                  isStudent == true ? AppSize.s16 : 0.0,
                              validator: Validator().passwordValidator,
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
                            // CustomTextInput(
                            //   controller: controller.passwordConfirmationCtrl,
                            //   inputTitle: "Password Confirmation",
                            //   hintText: "Enter your password confirmation",
                            //   suffixIcon: true,
                            //   obscureText:
                            //       !controller.showPasswordConfirmation.value,
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
                                inputTitle: "Enterprise Name",
                                hintText: "Enter your enterprise name",
                                isFilled: true,
                                topPadding: AppSize.s12,
                                validator: Validator().notEmptyValidator,
                              ),
                            if (isStudent == true)
                              Container()
                            else
                              CustomTextInput(
                                controller: controller.enterpriseIDCtrl,
                                inputTitle: "Enterprise ID",
                                hintText: "Enter your enterprise ID",
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
                                        const TextSpan(
                                          text: 'I agree to Pooulp ',
                                          style: TextStyle(
                                            color: ColorsManager.primaryBlue,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Privacy Policy',
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
                                          text: 'Terms',
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
                                  child: const CustomTextWidget(
                                    text:
                                        "Join our Pooulp emailing list to be updated with our latest news!",
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
                                        text: "Register",
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
                                        text: "Register",
                                        textColor: ColorsManager.primaryBlue,
                                        fontSize: 20.0,
                                        buttonWidth: getWidth,
                                        buttonColor: ColorsManager.grey300,
                                        onPressed: () {},
                                      ),
                              ),
                            ),
                            Row(
                              children: const [
                                Expanded(
                                  child: Divider(
                                    thickness: 1,
                                    color: ColorsManager.grey600,
                                  ),
                                ),
                                SizedBox(width: 10),
                                CustomTextWidget(
                                  text: 'Or',
                                  fontSize: 20.0,
                                  marginTop: AppSize.s16,
                                  marginBottom: AppSize.s16,
                                ),
                                SizedBox(width: 10),
                                Expanded(
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
                const CustomTextWidget(
                  text: "You already have an account?",
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
                  child: const CustomTextWidget(
                    text: "Login",
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
