import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';
import '../../modules.dart';

class EditUserInformationController extends GetxController {
  // EditingUserInformationController(this.repository);
  final profileController = Get.put(ProfileController());

  final List<String> genderList = [
    // '', //'unselect',
    'Mr.',
    'Mrs.',
    'Others',
  ];

//save the result of gallery file
  late File galleryFile;
  String imagePath = '';
  final imagePicker = ImagePicker();
//save the result of camera file
  // late File cameraFile;

  TextEditingController firstNameCtrl = TextEditingController();
  TextEditingController lastNameCtrl = TextEditingController();
  TextEditingController phoneNumberCtrl = TextEditingController();

  TextEditingController linkedInProfileCtrl = TextEditingController();
  TextEditingController videoLinkCtrl = TextEditingController();
  TextEditingController descriptionCtrl = TextEditingController();

  TextEditingController countryCtrl = TextEditingController();
  TextEditingController cityStateCtrl = TextEditingController();
  TextEditingController zipCodeCtrl = TextEditingController();
  TextEditingController addressCtrl = TextEditingController();

  Rx<CountryModel> selectedCountryPhoneNumber = const CountryModel().obs;
  Rx<String> selectedGender = ''.obs;
  Rx<String> selectedBirthday = ''.obs;

  Rx<CountryModel> selectedCountryAddress = const CountryModel().obs;

  @override
  void onInit() {
    super.onInit();
    firstNameCtrl.text =
        profileController.userInfoRepsonse.value.profile!.firstName!;
    lastNameCtrl.text =
        profileController.userInfoRepsonse.value.profile!.lastName!;

    selectedBirthday.value =
        profileController.userInfoRepsonse.value.profile!.birthDate!.toString();
    phoneNumberCtrl.text =
        profileController.userInfoRepsonse.value.profile!.phone1!;
    // selectedCountryPhoneNumber.value =  profileController.userInfoRepsonse.value.profile!.phone1CountryCode!;
    initPhoneNumberCountryCode(
      phoneNumberCode:
          profileController.userInfoRepsonse.value.profile!.phone1CountryCode,
    );
    // selectedCountryPhoneNumber.value = countryList[20];

    linkedInProfileCtrl.text =
        profileController.studentInfoRepsonse.value.linkedinLink!;
    videoLinkCtrl.text =
        profileController.studentInfoRepsonse.value.youtubeLink!;
    descriptionCtrl.text =
        profileController.userInfoRepsonse.value.profile!.description!;

    countryCtrl.text =
        profileController.userInfoRepsonse.value.profile!.addressCountry!;
    cityStateCtrl.text =
        profileController.userInfoRepsonse.value.profile!.addressCity!;
    zipCodeCtrl.text =
        profileController.userInfoRepsonse.value.profile!.addressZip!;
    addressCtrl.text =
        profileController.userInfoRepsonse.value.profile!.addressStreet!;

    selectedCountryAddress.value = countryList[20];
  }

  // @override
  // void dispose() {
  //   firstNameCtrl.dispose();
  //   lastNameCtrl.dispose();
  //   phoneNumberCtrl.dispose();
  //   linkedInProfileCtrl.dispose();
  //   videoLinkCtrl.dispose();
  //   descriptionCtrl.dispose();
  //   cityStateCtrl.dispose();
  //   zipCodeCtrl.dispose();
  //   addressCtrl.dispose();
  //   super.dispose();
  // }

  void initPhoneNumberCountryCode({String? phoneNumberCode}) {
    selectedCountryPhoneNumber.value = countryList
        .firstWhere((element) => element.phoneCode == phoneNumberCode);
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

  Future<void> getImage() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      galleryFile = File(pickedFile.path);
      imagePath = pickedFile.path;
      // print(imagePath);
      update();
    } else {
      // print('No image selected.');
    }
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

  void saveButtonOnClick() {
    final String firstName = firstNameCtrl.text;
    final String lastName = lastNameCtrl.text;
    final String selectGender = selectedGender.value;
    final String selectBD = selectedBirthday.value;
    final String phoneNumberCode =
        selectedCountryPhoneNumber.value.phoneCode.toString();
    final String phoneNum = phoneNumberCtrl.text;
    final String linkedInProfile = linkedInProfileCtrl.text;
    final String videoLink = videoLinkCtrl.text;
    final String description = descriptionCtrl.text;

    final String countrySelected = selectedCountryAddress.value.name.toString();
    final String cityState = cityStateCtrl.text;
    final String zipCode = zipCodeCtrl.text;
    final String address = addressCtrl.text;

    debugPrint('firstName:: $firstName');
    debugPrint('lastName:: $lastName');
    debugPrint('selectGender:: $selectGender');
    debugPrint('selectBD:: $selectBD');
    debugPrint('phoneNumberCode + phoneNum:: $phoneNumberCode - $phoneNum');
    debugPrint('linkedInProfile:: $linkedInProfile');
    debugPrint('videoLink:: $videoLink');
    debugPrint('description:: $description');
    debugPrint('countrySelected:: $countrySelected');
    debugPrint('cityState:: $cityState');
    debugPrint('zipCode:: $zipCode');
    debugPrint('address:: $address');
  }
}
