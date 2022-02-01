import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';

class EditUserInformationController extends GetxController {
  // EditingUserInformationController(this.repository);

  TextEditingController phoneNumberCtrl = TextEditingController();

  Rx<CountryModel> selectedCountryPhoneNumber = const CountryModel().obs;
  Rx<String> selectedGender = ''.obs;
  Rx<String> selectedBirthday = ''.obs;
  Rx<CountryModel> selectedCountryAddress = const CountryModel().obs;

  final List<String> genderList = [
    // '', //'unselect',
    'Mr.',
    'Mrs.',
    'others',
  ];

  @override
  void onInit() {
    super.onInit();
    //TODO:: replace by data from API
    selectedCountryPhoneNumber.value = countryList[20];
    selectedCountryAddress.value = countryList[20];
  }

  CountryModel selectedCountryPhoneNumberOnClick(CountryModel selectedItem) {
    return selectedCountryPhoneNumber.value = selectedItem;
  }

  CountryModel selectedCountryAddressOnClick(CountryModel selectedItem) {
    return selectedCountryAddress.value = selectedItem;
  }

  String selectedGenderOnClick({String? selectedItem}) {
    return selectedGender.value = selectedItem!;
  }

  String selectedBirthdayOnClick({String? selectedItem}) {
    return selectedBirthday.value = selectedItem!;
  }

  String? isPhoneNumberValidate({bool? isPhoneNumberField = false}) {
    if (selectedCountryPhoneNumber.value.phoneCode == null ||
        phoneNumberCtrl.text.isEmpty ||
        Validator().isPhoneNumberValidate(
              phoneNumberCtrl.text,
            ) ==
            false) {
      if (selectedCountryPhoneNumber.value.phoneCode == null &&
          phoneNumberCtrl.text.isEmpty) {
        return isPhoneNumberField == false
            ? 'This field is required.'
            : 'This field is required.';
      }
      if (selectedCountryPhoneNumber.value.phoneCode == null &&
          Validator().isPhoneNumberValidate(
                phoneNumberCtrl.text,
              ) ==
              false) {
        return isPhoneNumberField == false
            ? 'This field is required.'
            : '${Validator().phoneNumberValidator(phoneNumberCtrl.text)}';
      }
      if (selectedCountryPhoneNumber.value.phoneCode == null) {
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
