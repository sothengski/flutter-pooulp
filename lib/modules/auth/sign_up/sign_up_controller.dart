import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';
import '../../../routes/routes.dart';

class SignUpController extends GetxController with StateMixin<dynamic> {
  final AuthProvider authProvider = Get.find<AuthProvider>();

  final GlobalKey<FormState> registrationFormKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState> formFieldKey = GlobalKey<FormFieldState>();

  TextEditingController firstNameCtrl = TextEditingController();
  TextEditingController lastNameCtrl = TextEditingController();

  TextEditingController emailCtrl = TextEditingController();
  TextEditingController phoneNumberCtrl = TextEditingController();

  TextEditingController passwordCtrl = TextEditingController();
  // TextEditingController passwordConfirmationCtrl = TextEditingController();

  TextEditingController enterpriseNameCtrl = TextEditingController();
  TextEditingController enterpriseIDCtrl = TextEditingController();

  TextEditingController tokenCtrl = TextEditingController();

  Rx<CountryModel> selectedCountry = const CountryModel().obs;

  RxBool showPassword = false.obs;
  // RxBool showPasswordConfirmation = false.obs;
  RxBool isSubmitBtnProcessing = false.obs;

  late List<String> countries;

  late LoginModel loginRepsonseData;

  @override
  void dispose() {
    super.dispose();
    // Clean up the controller when the Widget is disposed
    firstNameCtrl.dispose();
    lastNameCtrl.dispose();
    emailCtrl.dispose();
    phoneNumberCtrl.dispose();
    passwordCtrl.dispose();
    // passwordConfirmationCtrl.dispose();
    enterpriseNameCtrl.dispose();
    enterpriseIDCtrl.dispose();
    tokenCtrl.dispose();
  }

  bool showPasswordBoolSwitching({bool? boolValue}) =>
      showPassword.value = !boolValue!;

  // bool showPasswordConfirmationBoolSwitching({bool? boolValue}) =>
  //     showPasswordConfirmation.value = !boolValue!;

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
    // passwordConfirmationCtrl.clear();
    enterpriseNameCtrl.clear();
    enterpriseIDCtrl.clear();
    tokenCtrl.clear();
    isSubmitBtnProcessing.value = false;
  }

  // bool isMatchingPassword() {
  //   if (passwordCtrl.text.trim() == passwordConfirmationCtrl.text.trim()) {
  //     return true;
  //   }
  //   return false;
  // }

  // String? matchingPasswords() {
  //   if (isMatchingPassword()) {
  //     return Validator().passwordValidator(passwordConfirmationCtrl.text);
  //   } else {
  //     return 'Mismatched passwords.';
  //   }
  // }

  bool swithcingBoolValueRegisterBtn({bool? boolValue}) {
    return isSubmitBtnProcessing.value = boolValue!;
  }

  String? isPhoneNumberValidate({bool? isPhoneNumberField = false}) {
    if (selectedCountry.value.phoneCode == null ||
        phoneNumberCtrl.text.isEmpty ||
        Validator().isPhoneNumberValidate(
              phoneNumberCtrl.text,
            ) ==
            false) {
      if (selectedCountry.value.phoneCode == null &&
          phoneNumberCtrl.text.isEmpty) {
        return isPhoneNumberField == false
            ? 'This field is required.'
            : 'This field is required.';
      }
      if (selectedCountry.value.phoneCode == null &&
          Validator().isPhoneNumberValidate(
                phoneNumberCtrl.text,
              ) ==
              false) {
        return isPhoneNumberField == false
            ? 'This field is required.'
            : '${Validator().phoneNumberValidator(phoneNumberCtrl.text)}';
      }
      if (selectedCountry.value.phoneCode == null) {
        return isPhoneNumberField == false ? 'This field is required.' : '';
      }
      if (phoneNumberCtrl.text.isEmpty) {
        return isPhoneNumberField == false ? '' : 'This field is required.';
      }
      //else condition
      return isPhoneNumberField == false
          ? ''
          : '${Validator().phoneNumberValidator(phoneNumberCtrl.text)}';
    }
    return null;
  }

  dynamic registerButtonOnClick({String? userType}) async {
    if (registrationFormKey.currentState!.validate()) {
      // if (!isMatchingPassword()) {
      //   customSnackbar(
      //     msgTitle: 'Please check your password.',
      //     msgContent: 'Your password does not match.',
      //     bgColor: AppColors.redColor,
      //   );
      // } else {
      swithcingBoolValueRegisterBtn(boolValue: true);
      final UserModel registrationInputData = UserModel(
        firstName: firstNameCtrl.text.trim(),
        lastName: lastNameCtrl.text.trim(),
        email: emailCtrl.text.trim(),
        phone1CountryCode: selectedCountry.value.phoneCode,
        phone1: phoneNumberCtrl.text.trim(),
        password: passwordCtrl.text.trim(),
        // passwordConfirmation: passwordConfirmationCtrl.text.trim(),
        uiLanguage: 'en',
        accountType: userType!.toLowerCase(),
        invitationToken: tokenCtrl.text.trim(),
        enterpriseName: enterpriseNameCtrl.text.trim(),
        enterpriseID: enterpriseIDCtrl.text.trim(),
      );
      authProvider
          .registerNewUserAPI(
        registrationData: registrationInputData,
      )
          .then(
        (LoginModel value) {
          Get.dialog(
            const CustomAlertDialog(
              title: 'SUCCESS!',
              content: "You're now a member of Pooulp.",
              routePath: Routes.homeRoute,
              type: AlertDialogType.success,
              buttonLabel: 'Continue',
            ),
            barrierDismissible: true,
          );
          clearData();
          change(value, status: RxStatus.success());
        },
        onError: (error) {
          customSnackbar(
            msgTitle: 'Something went wrong!',
            msgContent: '$error',
            bgColor: AppColors.redColor,
          );
          change(
            null,
            status: RxStatus.error(error.toString()),
          );
        },
      );
      swithcingBoolValueRegisterBtn(boolValue: false);
      // }
    } else {
      customSnackbar(
        msgTitle: 'Please Complete the required fields.',
        msgContent: '',
        bgColor: AppColors.redColor,
      );
    }
  }
}
