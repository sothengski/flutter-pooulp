import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';

class EditUserInformationController extends GetxController {
  // EditingUserInformationController(this.repository);
  final List<String> genderList = [
    // 'unselect',
    'male',
    'female',
    'others',
  ];

  TextEditingController phoneNumberCtrl = TextEditingController();

  Rx<CountryModel> selectedCountry = const CountryModel().obs;

  CountryModel selectedCountryOnClick(CountryModel selectedItem) {
    return selectedCountry.value = selectedItem;
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
}
