import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';

class SignUpController extends GetxController {
  final registrationFormKey = GlobalKey<FormState>();
  final formFieldKey = GlobalKey<FormFieldState>();

  TextEditingController firstNameCtrl = TextEditingController();
  TextEditingController lastNameCtrl = TextEditingController();

  TextEditingController emailCtrl = TextEditingController();
  TextEditingController phoneNumberCtrl = TextEditingController();

  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController passwordConfirmationCtrl = TextEditingController();

  TextEditingController enterpriseNameCtrl = TextEditingController();
  TextEditingController enterpriseIDCtrl = TextEditingController();

  TextEditingController tokenCtrl = TextEditingController();

  Rx<CountryModel> selectedCountry = const CountryModel().obs;

  RxBool showPassword = false.obs;
  RxBool showPasswordConfirmation = false.obs;
  RxBool registerLoading = false.obs;

  late List<String> countries;

  @override
  void dispose() {
    super.dispose();
    // Clean up the controller when the Widget is disposed
    firstNameCtrl.dispose();
    lastNameCtrl.dispose();
    emailCtrl.dispose();
    phoneNumberCtrl.dispose();
    passwordCtrl.dispose();
    passwordConfirmationCtrl.dispose();
    enterpriseNameCtrl.dispose();
    enterpriseIDCtrl.dispose();
    tokenCtrl.dispose();
  }

  bool showPasswordBoolSwitching({bool? boolValue}) =>
      showPassword.value = !boolValue!;

  bool showPasswordConfirmationBoolSwitching({bool? boolValue}) =>
      showPasswordConfirmation.value = !boolValue!;

  CountryModel selectedCountryOnClick(CountryModel selectedItem) {
    return selectedCountry.value = selectedItem;
  }

  void clearData() {
    firstNameCtrl.clear();
    lastNameCtrl.clear();
    emailCtrl.clear();
    phoneNumberCtrl.clear();
    selectedCountry.value = const CountryModel();
    passwordCtrl.clear();
    passwordConfirmationCtrl.clear();
    enterpriseNameCtrl.clear();
    enterpriseIDCtrl.clear();
    tokenCtrl.clear();
  }

  bool matchingPassword() {
    if (passwordCtrl.text.trim() == passwordConfirmationCtrl.text.trim()) {
      return true;
    }
    return false;
  }

  dynamic registerButtonOnClick({String? userType}) async {
    registerLoading.value = true;
    if (registrationFormKey.currentState!.validate()) {
      if (!matchingPassword()) {
        customSnackbar(
          msgTitle: "Please check your password.",
          msgContent: "Your password does not match.",
          bgColor: AppColors.redColor,
        );
      } else {
        final registrationInputData = RegistrationModel(
          firstName: firstNameCtrl.text.trim(),
          lastName: lastNameCtrl.text.trim(),
          email: emailCtrl.text.trim(),
          phone1CountryCode: selectedCountry.value.displayCountryCode,
          phone1: phoneNumberCtrl.text.trim(),
          password: passwordCtrl.text.trim(),
          passwordConfirmation: passwordConfirmationCtrl.text.trim(),
          uiLanguage: "en",
          accountType: userType,
          invitationToken: tokenCtrl.text.trim(),
          enterpriseName: enterpriseNameCtrl.text.trim(),
          enterpriseID: enterpriseIDCtrl.text.trim(),
        );
        print("registrationInputData: $registrationInputData");
      }
    } else {
      customSnackbar(
        msgTitle: "Please check your input data.",
        msgContent: "Please fill out the require fields.",
        bgColor: AppColors.redColor,
      );
    }
  }
}
