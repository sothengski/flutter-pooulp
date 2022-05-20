import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';
import '../../modules.dart';

class EditUserInformationController extends GetxController {
  final profileController = Get.put(ProfileController());
  final userInfoProvider = Get.find<UserInfoProvider>();
  final placeProvider = PlaceApiProvider();

  final editProfileFormKey = GlobalKey<FormState>();

  final List<String> genderList = [
    // '', //'unselect',
    'male',
    'female',
    'others',
    // 'Mr.',
    // 'Mrs.',
    // 'Others',
  ];

  String? sessionToken = '';

//save the result of gallery file
  Rx<String> selectedImagePath = ''.obs;
  Rx<String> selectedImageSize = ''.obs;

  Rx<String> cropImagePath = ''.obs;
  Rx<String> cropImageSize = ''.obs;

  Rx<String> compressImagePath = ''.obs;
  Rx<String> compressImageSize = ''.obs;

  Rx<bool> isUploadingImage = false.obs;

  // late File galleryFile;
  // String imagePath = '';
  // final imagePicker = ImagePicker();
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
  String addressLat = '';
  String addressLng = '';

  Rx<GooglePlaceDetailModel> googlePlaceDetail = GooglePlaceDetailModel().obs;

  Rx<CountryModel> selectedCountryPhoneNumber = const CountryModel().obs;
  Rx<String> selectedGender = ''.obs;

  Rx<DateTime> selectedBirthday = DateTime.now().obs;
  DateTime now = DateTime.now();

  Rx<CountryModel> selectedCountryAddress = const CountryModel().obs;

  Rx<bool> isSubmitBtnProcessing = false.obs;

  @override
  void onInit() {
    super.onInit();
    firstNameCtrl.text = profileController.userProfileInfo.value.firstName!;
    lastNameCtrl.text = profileController.userProfileInfo.value.lastName!;

    selectedGender.value =
        profileController.studentInfoRepsonse.value.gender ?? '';
    if (profileController.userProfileInfo.value.birthDate != null) {
      selectedBirthday.value =
          profileController.userProfileInfo.value.birthDate!;
    }
    phoneNumberCtrl.text = profileController.userProfileInfo.value.phone1!;
    // selectedCountryPhoneNumber.value =  profileController.userInfoRepsonse.value.profile!.phone1CountryCode!;
    initPhoneNumberCountryCode(
      phoneNumberCode:
          profileController.userProfileInfo.value.phone1CountryCode,
    );
    // selectedCountryPhoneNumber.value = countryList[20];

    linkedInProfileCtrl.text =
        profileController.studentInfoRepsonse.value.linkedinLink!;
    videoLinkCtrl.text =
        profileController.studentInfoRepsonse.value.youtubeLink!;
    descriptionCtrl.text = profileController.userProfileInfo.value.description!;

    countryCtrl.text = profileController.userProfileInfo.value.addressCountry!;
    cityStateCtrl.text = profileController.userProfileInfo.value.addressCity!;
    zipCodeCtrl.text = profileController.userProfileInfo.value.addressZip!;
    addressCtrl.text = profileController.userProfileInfo.value.addressStreet!;
    addressLat = profileController.userProfileInfo.value.addressLatitude!;
    addressLng = profileController.userProfileInfo.value.addressLongitude!;

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

  void uuidTokenGenerator() => sessionToken = UuidGenerator().uuidV4();

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
    return selectedGender.value = selectedItem!.toLowerCase();
  }

  DateTime selectedBirthdayOnClick({DateTime? selectedItem}) {
    return selectedBirthday.value = selectedItem!;
  }

  bool uploadImgBoolSwitching() =>
      isUploadingImage.value = !isUploadingImage.value;

  bool saveBtnBoolSwitching({bool? value}) =>
      isSubmitBtnProcessing.value = value!;

  Future<void> getImage({
    bool? isCamera = false,
  }) async {
    final pickedFile = await ImagePicker().pickImage(
      source: isCamera == true ? ImageSource.camera : ImageSource.gallery,
    );

    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value =
          "${(File(selectedImagePath.value).lengthSync() / 1024 / 1024).toStringAsFixed(4)}Mb";
      // debugPrint('selectedImagePath:: ${selectedImagePath.value}');
      // debugPrint('selectedImageSize:: ${selectedImageSize.value}');

      ///Crop Image
      final cropImageFile = await ImageCropper().cropImage(
        sourcePath: selectedImagePath.value,
        compressQuality: 50,
        maxWidth: 512,
        maxHeight: 512,
        // compressFormat: ImageCompressFormat.jpg,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        cropStyle: CropStyle.circle,
        // androidUiSettings: const AndroidUiSettings(
        //   toolbarWidgetColor: ColorsManager.white,
        //   toolbarColor: ColorsManager.primary,
        //   toolbarTitle: "Crop Image",
        //   statusBarColor: ColorsManager.grey400,
        //   backgroundColor: ColorsManager.white,
        // ),
        uiSettings: [
          AndroidUiSettings(
            toolbarWidgetColor: ColorsManager.white,
            toolbarColor: ColorsManager.primary,
            toolbarTitle: "Crop Image",
            statusBarColor: ColorsManager.grey400,
            backgroundColor: ColorsManager.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
          ),
          IOSUiSettings(
            title: 'Crop Image',
          )
        ],
      );
      if (cropImageFile != null) {
        cropImagePath.value = cropImageFile.path;
        cropImageSize.value =
            "${(File(cropImagePath.value).lengthSync() / 1024 / 1024).toStringAsFixed(4)}Mb";
        // debugPrint('cropImagePath:: ${cropImagePath.value}');
        // debugPrint('cropImageSize:: ${cropImageSize.value}');

        ///Upload Image
        uploadImage(
          cropImageFile,
          "${firstNameCtrl.text}_${lastNameCtrl.text}",
        );
      }

      // final dir = Directory.systemTemp;
      // final targetPath = "${dir.absolute.path}/temp.jpg";
      // debugPrint('targetPath:: $targetPath');

      ///Compress Image

      // final compressedFile = await FlutterImageCompress.compressAndGetFile(
      //   cropImagePath.value,
      //   targetPath,
      //   quality: 90,
      // );
      // compressImagePath.value = compressedFile.path;
      // compressImageSize.value =
      //     "${(File(compressImagePath.value).lengthSync() / 1024 / 1024).toStringAsFixed(2)}Mb";

    } else {
      customSnackbar(msgTitle: 'No Image Selected', msgContent: '');
    }
  }

  Future<void> uploadImage(CroppedFile? file, String? fileName) async {
    uploadImgBoolSwitching();
    await userInfoProvider
        .uploadImage(filepath: file!.path, fileName: fileName)
        .then((resp) {
      if (resp.pictureUrl!.isNotEmpty) {
        profileController.userProfileInfo.value = resp;
        customSnackbar(
          msgTitle: 'Success',
          msgContent: 'File Uploaded',
        );
      } else {
        customSnackbar(
          msgTitle: 'Failed',
          msgContent: "Can't Uploaded your Image.",
        );
      }
    });
    uploadImgBoolSwitching();
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

  Future<Rx<GooglePlaceDetailModel>> getPlaceDetail({
    String? placeId,
    String? sessionToken,
  }) async {
    googlePlaceDetail.value = await placeProvider.getGooglePlaceDetail(
      placeId: placeId,
      sessionToken: sessionToken,
    );
    final data = googlePlaceDetail.value.result!.addressComponents;
    for (final c in data!) {
      if (c.types!.contains('country')) {
        countryCtrl.text = c.longName!;
      }
      if (c.types!.contains('administrative_area_level_2')) {
        // cityStateCtrl.text = c.longName!;
      }
      if (c.types!.contains('administrative_area_level_1')) {
        cityStateCtrl.text = c.longName!;
      }
      if (c.types!.contains('postal_code')) {
        zipCodeCtrl.text = c.longName!;
      }
    }
    addressLat =
        googlePlaceDetail.value.result!.geometry!.location!.lat!.toString();
    addressLng =
        googlePlaceDetail.value.result!.geometry!.location!.lng!.toString();
    // countryCtrl.text = googlePlaceDetail.value.result!.googlePlaceCountry;
    addressCtrl.text = googlePlaceDetail.value.result!.formattedAddress!;
    return googlePlaceDetail;
  }

  void saveButtonOnClick() {
    if (editProfileFormKey.currentState!.validate()) {
      saveBtnBoolSwitching(value: !isSubmitBtnProcessing.value);
      final String firstName = firstNameCtrl.text;
      final String lastName = lastNameCtrl.text;
      final String selectGender = selectedGender.value;
      // final String selectBD = selectedBirthday.value;
      final String phoneNumberCode =
          selectedCountryPhoneNumber.value.phoneCode.toString();
      final String phoneNum = phoneNumberCtrl.text;
      final String linkedInProfile = linkedInProfileCtrl.text;
      final String videoLink = videoLinkCtrl.text;
      final String description = descriptionCtrl.text;

      // final String countrySelected = selectedCountryAddress.value.name.toString();
      final String address = addressCtrl.text;
      final String countrySelected = countryCtrl.text;
      final String cityState = cityStateCtrl.text;
      final String zipCode = zipCodeCtrl.text;

      final ProfileModel profileInfoToBeUpdate = ProfileModel(
        firstName: firstName,
        lastName: lastName,
        birthDate: selectedBirthday.value.year != now.year
            ? selectedBirthday.value
            : null,
        phone1CountryCode: phoneNumberCode,
        phone1: phoneNum,
        linkedinLink: linkedInProfile,
        description: description,
        addressStreet: address,
        addressCountry: countrySelected,
        addressCity: cityState,
        addressZip: zipCode,
        addressLatitude: addressLat,
        addressLongitude: addressLng,
        emailNotification:
            profileController.userInfoRepsonse.value.profile!.emailNotification,
        uiLanguage:
            profileController.userInfoRepsonse.value.profile!.uiLanguage,
      );

      final StudentProfileModel studentProfileInfoToBeUpdate =
          StudentProfileModel(
        drivingLicense:
            profileController.studentInfoRepsonse.value.drivingLicense,
        shifting: profileController.studentInfoRepsonse.value.shifting,
        radius: profileController.studentInfoRepsonse.value.radius,
        telecommuting:
            profileController.studentInfoRepsonse.value.telecommuting,
        hasAutomobile:
            profileController.studentInfoRepsonse.value.hasAutomobile,
        facebookLink: profileController.studentInfoRepsonse.value.facebookLink,
        linkedinLink: linkedInProfile,
        whatsappLink: profileController.studentInfoRepsonse.value.whatsappLink,
        youtubeLink: videoLink,
        gender: selectGender,
        // gender: profileController.studentInfoRepsonse.value.gender,
      );

      userInfoProvider
          .putUpdateStudentProfileInfo(
        data: studentProfileInfoToBeUpdate,
      )
          .then((StudentProfileModel value) {
        profileController.studentInfoRepsonse.value = value;
        // customSnackbar(
        //   msgTitle: 'Success',
        //   msgContent: 'Student Profile Information Updated',
        //   bgColor: ColorsManager.green,
        // );
        // saveBtnBoolSwitching(value: !isSubmitBtnProcessing.value);
      });
      // } else {
      // customSnackbar(
      //   msgTitle: 'Required Fields',
      //   msgContent: 'Please Input the required fields.',
      //   bgColor: ColorsManager.orange,
      // );
      // }

      userInfoProvider
          .putUpdateUserProfileInfo(
        data: profileInfoToBeUpdate,
      )
          .then((ProfileModel value) {
        profileController.userProfileInfo.value = value;
        customSnackbar(
          msgTitle: 'core.success'.tr,
          msgContent: 'profile.editSucessMsg'.tr,
          bgColor: ColorsManager.green,
        );
        saveBtnBoolSwitching(value: !isSubmitBtnProcessing.value);
      });
    } else {
      customSnackbar(
        msgTitle: 'validator.requireFields'.tr,
        msgContent: 'validator.requireFieldsMsg'.tr,
        bgColor: ColorsManager.orange,
      );
    }
  }
}
