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
      backgroundColor: AppColors.primaryColor,
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
                const Padding(
                  padding: EdgeInsets.only(
                    top: 100.0,
                    left: double72,
                    right: double72,
                  ),
                  child: Image(
                    image: AssetImage(appLogoWhiteImg),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomContainerWidget(
                    child: Padding(
                      padding: const EdgeInsets.all(double24),
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
                                color: AppColors.primaryColor,
                              ),
                              CustomTextInput(
                                controller: controller.tokenCtrl,
                                inputTitle: "Token",
                                hintText: "Enter the Token",
                                isFilled: true,
                                topPadding: double12,
                                validator: Validator().notEmptyValidator,
                              ),
                              CustomTextInput(
                                controller: controller.firstNameCtrl,
                                inputTitle: "First name",
                                hintText: "Enter your first name",
                                isFilled: true,
                                topPadding: double12,
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
                                topPadding: double12,
                                validator: Validator().notEmptyValidator,
                              ),
                              CustomTextInput(
                                controller: controller.emailCtrl,
                                inputTitle: "Email",
                                hintText: "Enter your email",
                                isFilled: true,
                                topPadding: double12,
                                validator: Validator().emailValidator,
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
                                          marginTop: double12,
                                          textAlign: TextAlign.left,
                                          // marginBottom: double4,
                                        ),
                                        const SizedBox(
                                          height: 3.0,
                                        ),
                                        GestureDetector(
                                          onTap: () => Get.bottomSheet(
                                            Container(
                                              height: getHeight * 0.5,
                                              decoration: const ShapeDecoration(
                                                color: AppColors.whiteColor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
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
                                            // height: 60,
                                            // color: AppColors.grey100Color,
                                            padding: EdgeInsets.zero,
                                            child: FormField(
                                              validator: (_) {
                                                if (controller.selectedCountry
                                                            .value.phoneCode !=
                                                        null &&
                                                    controller.phoneNumberCtrl
                                                        .text.isNotEmpty) {
                                                  return null;
                                                }
                                                return '';
                                              },
                                              builder: (
                                                FormFieldState<String> state,
                                              ) {
                                                return InputDecorator(
                                                  // alignedDropdown: true,
                                                  decoration: InputDecoration(
                                                    fillColor:
                                                        AppColors.grey100Color,
                                                    filled: true,
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        8.0,
                                                      ),
                                                    ),
                                                    errorText: state.hasError
                                                        ? state.errorText
                                                        : null,
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        8.0,
                                                      ),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: AppColors
                                                            .grey300Color,
                                                      ),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        8.0,
                                                      ),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: AppColors
                                                            .red900Color,
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        8.0,
                                                      ),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: AppColors
                                                            .grey800Color,
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
                                                            text:
                                                                "Country Code",
                                                            color: AppColors
                                                                .grey400Color,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          )
                                                        : Row(
                                                            children: [
                                                              SizedBox(
                                                                height: 15.0,
                                                                child:
                                                                    CircleFlag(
                                                                  controller
                                                                      .selectedCountry
                                                                      .value
                                                                      .isoCode
                                                                      .toString(),
                                                                ),
                                                              ),
                                                              CustomTextWidget(
                                                                marginLeft: 4.0,
                                                                text: controller
                                                                    .selectedCountry
                                                                    .value
                                                                    .displayCountryCode,
                                                                color: AppColors
                                                                    .blackColor,
                                                              ),
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
                                      isFilled: true,
                                      topPadding: double12,
                                      leftPadding: double4,
                                      validator:
                                          Validator().phoneNumberValidator,
                                      maxLength: 13,
                                      inputFormatterList: [
                                        FilteringTextInputFormatter.deny(
                                          RegExp(
                                            Validator.avoidSpaceRegExpPattern,
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
                                topPadding: double12,
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
                              CustomTextInput(
                                controller: controller.passwordConfirmationCtrl,
                                inputTitle: "Password Confirmation",
                                hintText: "Enter your password confirmation",
                                suffixIcon: true,
                                obscureText:
                                    !controller.showPasswordConfirmation.value,
                                isFilled: true,
                                topPadding: double12,
                                bottomPadding:
                                    isStudent == true ? double32 : 0.0,
                                validator: Validator().passwordValidator,
                                inputFormatterList: [
                                  FilteringTextInputFormatter.deny(
                                    RegExp(Validator.avoidSpaceRegExpPattern),
                                  ),
                                ],
                                changeShowPassword: () => controller
                                    .showPasswordConfirmationBoolSwitching(
                                  boolValue:
                                      controller.showPasswordConfirmation.value,
                                ),
                              ),
                              if (isStudent == true)
                                Container()
                              else
                                CustomTextInput(
                                  controller: controller.enterpriseNameCtrl,
                                  inputTitle: "Enterprise Name",
                                  hintText: "Enter your enterprise name",
                                  isFilled: true,
                                  topPadding: double12,
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
                                  topPadding: double12,
                                  bottomPadding: double32,
                                  // validator: Validator().password,
                                ),
                              Obx(
                                () => Visibility(
                                  visible:
                                      controller.isSubmitBtnProcessing.value,
                                  child: const LoadingWidget(),
                                ),
                              ),
                              Obx(
                                () => Visibility(
                                  visible:
                                      !controller.isSubmitBtnProcessing.value,
                                  child: CustomMaterialButton(
                                    text: "Register",
                                    fontSize: 20.0,
                                    buttonWidth: getWidth,
                                    onPressed: () {
                                      unFocusKeyBoard(context);
                                      controller.registerButtonOnClick(
                                        userType: userType,
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Row(
                                children: const [
                                  Expanded(
                                    child: Divider(
                                      thickness: 1,
                                      color: AppColors.grey600Color,
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
                                      color: AppColors.grey600Color,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    CircleAvatar(
                                      radius: 30.0,
                                      backgroundColor: AppColors.whiteColor,
                                      child: Image(
                                        image: AssetImage(googleLogoImg),
                                      ),
                                    ),
                                    CircleAvatar(
                                      radius: 30.0,
                                      backgroundColor: AppColors.whiteColor,
                                      child: Image(
                                        image: AssetImage(linkedInLogoImg),
                                      ),
                                    ),
                                    CircleAvatar(
                                      radius: 30.0,
                                      backgroundColor: AppColors.whiteColor,
                                      child: Image(
                                        image: AssetImage(facebookLogoImg),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const CustomTextWidget(
                  text: "You already have an account?",
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                  marginTop: double16,
                  marginBottom: double16,
                ),
                GestureDetector(
                  onTap: () => Get.offAllNamed(
                    Routes.signInRoute,
                  ),
                  child: const CustomTextWidget(
                    text: "Login",
                    color: AppColors.whiteColor,
                    textDecoration: TextDecoration.underline,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    marginBottom: double48,
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
