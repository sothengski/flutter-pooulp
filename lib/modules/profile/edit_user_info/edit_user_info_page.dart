import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';
import '../../modules.dart';

class EditUserInformationPage extends GetView<EditUserInformationController> {
  final String? profileImg;

  const EditUserInformationPage({
    this.profileImg = AssetsManager.coverImg,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorsManager.grey100,
      appBar: CustomAppBar(
        title: 'Edit Information',
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///===== Top of Profile Image Component =====//
            CustomBoxWidget(
              size: 150,
              topMargin: AppSize.s16,
              backgroundColor: ColorsManager.grey200,
              isCircle: true,
              insideObj: Stack(
                children: [
                  Obx(
                    () => CachedNetworkImgWidget(
                      imgUrl: controller
                          .profileController.userProfileInfo.value.pictureUrl,
                      borderRadius: 75,
                    ),
                  ),
                  Align(
                    alignment: const Alignment(1.25, 1.25),
                    child: MaterialButton(
                      minWidth: 0,
                      onPressed: () {
                        Get.dialog(
                          MaterialDialogWidget(
                            // title: '',
                            contentWidget: Column(
                              children: [
                                RowDataSelectionWidget(
                                  iconDataUnClick: Icons.camera_alt_outlined,
                                  iconColorUnClick: ColorsManager.grey600,
                                  isLeftSideText: false,
                                  text: 'Take a Picture',
                                  onPressed: () {
                                    controller.getImage(isCamera: true);
                                    Navigator.pop(
                                      context,
                                      true,
                                    );
                                  },
                                ),
                                const Divider(
                                  height: 5,
                                ),
                                RowDataSelectionWidget(
                                  iconDataUnClick: Icons.image_outlined,
                                  iconColorUnClick: ColorsManager.grey600,
                                  isLeftSideText: false,
                                  text: 'Phone Gallery',
                                  onPressed: () {
                                    controller.getImage();
                                    Navigator.pop(
                                      context,
                                      true,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      textColor: Colors.white,
                      color: ColorsManager.primary,
                      elevation: 0,
                      shape: const CircleBorder(),
                      child: const Icon(
                        Icons.add_a_photo_rounded,
                        size: 18,
                      ),
                    ),
                  ),
                  Obx(
                    () => Visibility(
                      visible: controller.isUploadingImage.value,
                      child: const LoadingWidget(
                        color: ColorsManager.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //===== Bottom of Profile Image Component =====//

            ///===== Top of Personal Information Component =====//
            Padding(
              padding: const EdgeInsets.all(AppSize.s16),
              child: CustomContainerWidget(
                leftTitle: 'Personal Information',
                titleColor: ColorsManager.primary,
                titleFontWeight: FontWeightManager.regular,
                titleFontSize: AppSize.s20,
                elevation: 0.0,
                childPadding: 16.0,
                titleBottomPadding: 0.0,
                titleLeftPadding: AppSize.s16,
                // titleInSide: false,
                child: Form(
                  key: controller.editProfileFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ///===== Top of First name Component =====//
                      CustomTextInput(
                        controller: controller.firstNameCtrl,
                        inputTitle: 'First name',
                        hintText: 'Enter your first name',
                        isFilled: true,
                        validator: Validator().notEmptyValidator,
                        // onChanged: (value) => null,
                        // onSaved: (value) => controller
                        //     .firstNameCtrl.text = value.toString(),
                      ),
                      //===== Bottom of First name Component =====//

                      ///===== Top of Last name Component =====//
                      CustomTextInput(
                        controller: controller.lastNameCtrl,
                        inputTitle: 'Last name',
                        hintText: 'Enter your last name',
                        isFilled: true,
                        topPadding: AppSize.s12,
                        validator: Validator().notEmptyValidator,
                      ),
                      //===== Bottom of Last name Component =====//

                      ///===== Top of Title Component =====//
                      ContainerDialogWidget(
                        inputTitle: 'Gender',
                        dialogWidget: MaterialDialogWidget(
                          title: 'Select your Gender',
                          contentWidget: ListView.separated(
                            shrinkWrap: true,
                            itemCount: controller.genderList.length,
                            itemBuilder: (context, index) {
                              return Obx(
                                () => RowDataSelectionWidget.radioButton(
                                  isLeftSideText: false,
                                  isClickingValue: stringsComparation(
                                    object1: controller.genderList[index]
                                        .toLowerCase(),
                                    object2: controller.selectedGender.value,
                                  ),
                                  text: controller.genderList[index]
                                      .toLowerCase(),
                                  onPressed: () {
                                    controller.selectedGenderOnClick(
                                      selectedItem:
                                          controller.genderList[index],
                                    );
                                    Navigator.pop(
                                      context,
                                      true,
                                    ); // Issue:: It's not working properly on first click with Get.back();
                                  },
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Divider(
                                height: 1.0,
                                color: ColorsManager.grey300,
                              );
                            },
                          ),
                        ),
                        containerWidget: Obx(
                          () => controller.selectedGender.value == ''
                              ? const RowContentInputWidget(
                                  centerWidget: CustomTextWidget(
                                    text: 'Select your gender',
                                    // marginLeft: AppSize.s8,
                                    color: ColorsManager.grey400,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.0,
                                  ),
                                  suffixWidget: Icon(
                                    Icons.arrow_drop_down,
                                    color: ColorsManager.grey600,
                                  ),
                                )
                              : RowContentInputWidget(
                                  centerWidget: CustomTextWidget(
                                    //marginLeft: 4.0,
                                    text: controller.selectedGender.value,
                                    color: ColorsManager.black,
                                    fontSize: 16.0,
                                  ),
                                  suffixWidget: const Icon(
                                    Icons.arrow_drop_down,
                                    color: ColorsManager.grey600,
                                  ),
                                ),
                        ),
                      ),
                      //===== Bottom of Title Component =====//

                      ///===== Top of Birthday Component =====//
                      Obx(
                        () => ContainerDialogWidget(
                          inputTitle: 'Birthday',
                          dialogType: DialogType.dateTimePickerDialog,
                          currentTime: controller.selectedBirthday.value,
                          onConfirmDate: (date) {
                            controller.selectedBirthdayOnClick(
                              selectedItem: date,
                            );
                          },
                          containerWidget: controller
                                      .selectedBirthday.value.year ==
                                  controller.now.year
                              ? const RowContentInputWidget(
                                  centerWidget: CustomTextWidget(
                                    text: 'Select your Birthday',
                                    color: ColorsManager.grey400,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.0,
                                  ),
                                  suffixWidget: Icon(
                                    Icons.date_range_outlined,
                                    color: ColorsManager.grey600,
                                  ),
                                )
                              : RowContentInputWidget(
                                  centerWidget: CustomTextWidget(
                                    //marginLeft: 4.0,
                                    text: dateFormatDashYYYYMMDD(
                                      date: controller.selectedBirthday.value,
                                    ),
                                    color: ColorsManager.black,
                                    fontSize: 16.0,
                                  ),
                                  suffixWidget: const Icon(
                                    Icons.date_range_outlined,
                                    color: ColorsManager.grey600,
                                  ),
                                ),
                        ),
                      ),
                      //===== Bottom of Birthday Component =====//

                      ///===== Top of Phone Number Component =====//
                      Row(
                        children: [
                          Expanded(
                            flex: 40,
                            child: ContainerDialogWidget(
                              inputTitle: 'Phone Number',
                              dialogType: DialogType.bottomSheetDialog,
                              dialogWidget: Container(
                                height: getHeight,
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
                                child: Obx(
                                  () => CountryListSelector(
                                    countrylist: countryList,
                                    selectedCountry: controller
                                        .selectedCountryPhoneNumber.value,
                                    onTap: (country) {
                                      controller
                                          .selectedCountryPhoneNumberOnClick(
                                        country,
                                      );
                                      Navigator.pop(
                                        context,
                                        true,
                                      ); // Issue:: It's not working properly on first click with Get.back();
                                    },
                                  ),
                                ),
                              ),
                              containerWidget: Obx(
                                () => controller.selectedCountryPhoneNumber
                                            .value.phoneCode ==
                                        null
                                    ? const RowContentInputWidget(
                                        centerWidget: CustomTextWidget(
                                          text: 'Country Code',
                                          color: ColorsManager.grey400,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.0,
                                        ),
                                      )
                                    : RowContentInputWidget(
                                        prefixWidgetFlex: 25,
                                        prefixWidget: CircleFlag(
                                          controller.selectedCountryPhoneNumber
                                              .value.isoCode
                                              .toString(),
                                        ),
                                        prefixWidgetRightPadding: AppSize.s12,
                                        centerWidgetFlex: 75,
                                        centerWidget: CustomTextWidget(
                                          //marginLeft: 4.0,
                                          text: controller
                                              .selectedCountryPhoneNumber
                                              .value
                                              .phoneCode,
                                          color: ColorsManager.black,
                                          fontSize: 16.0,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: AppSize.s8,
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
                              validator: Validator().notEmptyValidator,
                              // validator: (_) =>
                              //     controller.isPhoneNumberValidate(
                              //   isPhoneNumberField: true,
                              // ),
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
                      //===== Bottom of Phone Number Component =====//

                      ///===== Top of Linkedin profile Component =====//
                      CustomTextInput(
                        controller: controller.linkedInProfileCtrl,
                        inputTitle: 'Linkedin profile',
                        hintText: 'Enter your Linkedin profile',
                        isFilled: true,
                        topPadding: AppSize.s12,
                        // validator: Validator().emailValidator,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      //===== Bottom of Linkedin profile Component =====//

                      ///===== Top of Video presentation link Component =====//
                      CustomTextInput(
                        controller: controller.videoLinkCtrl,
                        inputTitle: 'Video presentation link',
                        hintText: 'Enter your Video presentation link',
                        isFilled: true,
                        topPadding: AppSize.s12,
                      ),
                      //===== Bottom of Video presentation link Component =====//

                      ///===== Top of Description Component =====//
                      CustomTextInput(
                        controller: controller.descriptionCtrl,
                        inputTitle: 'Description',
                        hintText: 'Description...',
                        isFilled: true,
                        topContentPadding: 12.0,
                        bottomContentPadding: 12.0,
                        topPadding: AppSize.s12,
                        counter: true,
                        maxLines: 10,
                        minLines: 3,
                        maxLength: 1000,
                        // validator: Validator().emailValidator,
                        keyboardType: TextInputType.multiline,
                      ),
                      //===== Bottom of Description Component =====//

                      ///===== Top of Address Information Component =====//
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: CustomTextWidget(
                          text: 'Address Information',
                          fontWeight: FontWeightManager.regular,
                          fontSize: AppSize.s20,
                          color: ColorsManager.primary,
                          marginTop: AppSize.s12,
                        ),
                      ),
                      //===== Bottom of Address Information Component =====//

                      ///===== Top of Address Component =====//
                      GestureDetector(
                        onTap: () async {
                          controller.uuidTokenGenerator();
                          await showSearch(
                            context: context,
                            delegate: AddressSearchBarWidget(),
                          );
                        },
                        child: AbsorbPointer(
                          child: CustomTextInput(
                            controller: controller.addressCtrl,
                            inputTitle: 'Address',
                            hintText: 'Address...',
                            isFilled: true,
                            isReadOnly: true,
                            topContentPadding: 12.0,
                            bottomContentPadding: 12.0,
                            topPadding: AppSize.s12,
                            // counter: true,
                            maxLines: 5,
                            minLines: 2,
                            maxLength: 150,
                            keyboardType: TextInputType.multiline,
                          ),
                        ),
                      ),
                      //===== Bottom of Address Component =====//

                      ///===== Top of Country & City/State Component =====//
                      CustomTextInput(
                        controller: controller.countryCtrl,
                        inputTitle: 'Country',
                        hintText: 'Country',
                        isFilled: true,
                        maxLength: 10,
                        topPadding: AppSize.s12,
                      ),
                      CustomTextInput(
                        controller: controller.cityStateCtrl,
                        inputTitle: 'City/State',
                        hintText: 'City/State',
                        isFilled: true,
                        maxLength: 10,
                        topPadding: AppSize.s12,
                      ),
                      //=====  Bottom of Country & City/State Component =====//

                      ///===== Top of Zip Code Component =====//
                      CustomTextInput(
                        controller: controller.zipCodeCtrl,
                        inputTitle: 'Zip Code',
                        hintText: 'Zip Code',
                        isFilled: true,
                        maxLength: 10,
                        topPadding: AppSize.s12,
                      ),
                      //===== Bottom of Zip Code Component =====//
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => Wrap(
          children: [
            Visibility(
              visible: controller.isSubmitBtnProcessing.value,
              child: CustomMaterialButton(
                leftPadding: AppSize.s12,
                rightPadding: AppSize.s12,
                bottomPadding: AppSize.s20,
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
            Visibility(
              visible: !controller.isSubmitBtnProcessing.value,
              child: CustomMaterialButton(
                leftPadding: AppSize.s12,
                rightPadding: AppSize.s12,
                bottomPadding: AppSize.s20,
                text: 'Save',
                fontSize: AppSize.s20,
                // buttonHeight: 45,
                buttonWidth: getWidth,
                onPressed: () {
                  unFocusKeyBoard(context);
                  controller.saveButtonOnClick();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
