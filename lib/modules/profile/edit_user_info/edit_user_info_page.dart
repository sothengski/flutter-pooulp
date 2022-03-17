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
                        // controller.uploadImgBoolSwitching();
                        // controller.getImage();
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
                  // key: controller.registrationFormKey,
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
                        inputTitle: 'Title',
                        dialogWidget: MaterialDialogWidget(
                          title: 'Select Title',
                          contentWidget: ListView.separated(
                            shrinkWrap: true,
                            itemCount: controller.genderList.length,
                            itemBuilder: (context, index) {
                              return Obx(
                                () => RowDataSelectionWidget.radioButton(
                                  isLeftSideText: false,
                                  isClickingValue: stringsComparation(
                                    object1: controller.genderList[index],
                                    object2: controller.selectedGender.value,
                                  ),
                                  text: controller.genderList[index],
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
                                    text: 'Select a title',
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
                      ContainerDialogWidget(
                        inputTitle: 'Birthday',
                        dialogType: DialogType.dateTimePickerDialog,
                        controller: controller,
                        containerWidget: Obx(
                          () => controller.selectedBirthday.value == ''
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
                                      date: DateTime.tryParse(
                                        controller.selectedBirthday.value,
                                      ),
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
                      //===== Bottom of Phone Number Component =====//

                      ///===== Top of Phone Number 2 Component =====//
                      // Row(
                      //   children: [
                      //     Expanded(
                      //       flex: 40,
                      //       child: Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           const CustomTextWidget(
                      //             text: 'Phone Line 2',
                      //             marginTop: AppSize.s12,
                      //             textAlign: TextAlign.left,
                      //             // marginBottom: AppSize.s4,
                      //           ),
                      //           const SizedBox(
                      //             height: 3.0,
                      //           ),
                      //           GestureDetector(
                      //             onTap: () => Get.bottomSheet(
                      //               Container(
                      //                 height: getHeight * 0.5,
                      //                 decoration: const ShapeDecoration(
                      //                   color: ColorsManager.white,
                      //                   shape: RoundedRectangleBorder(
                      //                     borderRadius: BorderRadius.only(
                      //                       topLeft: Radius.circular(
                      //                         16,
                      //                       ),
                      //                       topRight: Radius.circular(
                      //                         16,
                      //                       ),
                      //                     ),
                      //                   ),
                      //                 ),
                      //                 child: CountryListSelector(
                      //                   countrylist: countryList,
                      //                   onTap: (country) {
                      //                     controller.selectedCountryOnClick(
                      //                       country,
                      //                     );
                      //                     Get.back();
                      //                   },
                      //                 ),
                      //               ),
                      //             ),
                      //             child: Container(
                      //               alignment: Alignment.centerLeft,
                      //               padding: EdgeInsets.zero,
                      //               child: FormField(
                      //                 validator: (_) =>
                      //                     controller.isPhoneNumberValidate(),
                      //                 builder: (
                      //                   FormFieldState<String> state,
                      //                 ) {
                      //                   return InputDecorator(
                      //                     // alignedDropdown: true,
                      //                     decoration: InputDecoration(
                      //                       contentPadding:
                      //                           const EdgeInsets.fromLTRB(
                      //                         4,
                      //                         0,
                      //                         4,
                      //                         0,
                      //                       ),
                      //                       fillColor: ColorsManager.grey100,
                      //                       filled: true,
                      //                       border: OutlineInputBorder(
                      //                         borderRadius:
                      //                             BorderRadius.circular(
                      //                           AppSize.s8,
                      //                         ),
                      //                       ),
                      //                       errorText: state.hasError
                      //                           ? state.errorText
                      //                           : null,
                      //                       enabledBorder: OutlineInputBorder(
                      //                         borderRadius:
                      //                             BorderRadius.circular(
                      //                           AppSize.s8,
                      //                         ),
                      //                         borderSide: const BorderSide(
                      //                           color: ColorsManager.grey100,
                      //                         ),
                      //                       ),
                      //                       errorBorder: OutlineInputBorder(
                      //                         borderRadius:
                      //                             BorderRadius.circular(
                      //                           AppSize.s8,
                      //                         ),
                      //                         borderSide: const BorderSide(
                      //                           color: ColorsManager.red900,
                      //                         ),
                      //                       ),
                      //                       focusedBorder: OutlineInputBorder(
                      //                         borderRadius:
                      //                             BorderRadius.circular(
                      //                           AppSize.s8,
                      //                         ),
                      //                         borderSide: const BorderSide(
                      //                           color: ColorsManager.grey300,
                      //                         ),
                      //                       ),
                      //                     ),
                      //                     child: Obx(
                      //                       () => controller.selectedCountry
                      //                                   .value.phoneCode ==
                      //                               null
                      //                           ? const CustomTextWidget(
                      //                               marginLeft: AppSize.s8,
                      //                               text: 'Country Code',
                      //                               color:
                      //                                   ColorsManager.grey400,
                      //                               fontWeight: FontWeight.w400,
                      //                               fontSize: 16.0,
                      //                             )
                      //                           : Row(
                      //                               children: [
                      //                                 SizedBox(
                      //                                   height: 15.0,
                      //                                   child: CircleFlag(
                      //                                     controller
                      //                                         .selectedCountry
                      //                                         .value
                      //                                         .isoCode
                      //                                         .toString(),
                      //                                   ),
                      //                                 ),
                      //                                 CustomTextWidget(
                      //                                   marginLeft: AppSize.s8,
                      //                                   text: controller
                      //                                       .selectedCountry
                      //                                       .value
                      //                                       .phoneCode,
                      //                                   color:
                      //                                       ColorsManager.black,
                      //                                   fontSize: 16.0,
                      //                                 ),
                      //                                 // const Icon(
                      //                                 //   Icons
                      //                                 //       .arrow_drop_down,
                      //                                 // ),
                      //                               ],
                      //                             ),
                      //                     ),
                      //                   );
                      //                 },
                      //               ),
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //     const SizedBox(
                      //       width: AppSize.s8,
                      //     ),
                      //     Expanded(
                      //       flex: 60,
                      //       child: CustomTextInput(
                      //         controller: controller.phoneNumberCtrl,
                      //         inputTitle: "",
                      //         hintText: 'Enter Phone Number',
                      //         keyboardType: TextInputType.phone,
                      //         isFilled: true,
                      //         topPadding: AppSize.s12,
                      //         leftPadding: AppSize.s4,
                      //         validator: (_) =>
                      //             controller.isPhoneNumberValidate(
                      //           isPhoneNumberField: true,
                      //         ),
                      //         maxLength: 13,
                      //         inputFormatterList: [
                      //           FilteringTextInputFormatter.deny(
                      //             RegExp(
                      //               Validator.avoidSpaceRegExpPattern,
                      //             ),
                      //           ),
                      //           FilteringTextInputFormatter.allow(
                      //             RegExp(
                      //               Validator.numberRegExpPattern,
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      //===== Bottom of Phone Number 2 Component =====//

                      ///===== Top of Facebook profile Component =====//
                      // CustomTextInput(
                      //   // controller: controller.emailCtrl,
                      //   inputTitle: 'Facebook profile',
                      //   hintText: 'Enter your Facebook profile',
                      //   isFilled: true,
                      //   topPadding: AppSize.s12,
                      //   validator: Validator().emailValidator,
                      //   keyboardType: TextInputType.emailAddress,
                      // ),
                      //===== Bottom of Facebook profile Component =====//

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

                      ///===== Top of Whatapp contact Component =====//
                      // CustomTextInput(
                      //   // controller: controller.emailCtrl,
                      //   inputTitle: 'Whatapp contact',
                      //   hintText: 'Enter your Whatapp contact',
                      //   isFilled: true,
                      //   topPadding: AppSize.s12,
                      //   validator: Validator().emailValidator,
                      //   keyboardType: TextInputType.emailAddress,
                      // ),
                      //===== Bottom of Whatapp contact Component =====//

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

                      ///===== Top of Country & City/State Component =====//
                      CustomTextInput(
                        controller: controller.countryCtrl,
                        inputTitle: 'Country',
                        hintText: 'Country',
                        isFilled: true,
                        maxLength: 10,
                        topPadding: AppSize.s12,
                      ),
                      // Row(
                      //   children: [
                      //===== Top of Country Component =====//

                      // Expanded(
                      //   flex: 50,
                      //   child: ContainerDialogWidget(
                      //     inputTitle: 'Country',
                      //     dialogType: DialogType.bottomSheetDialog,
                      //     dialogWidget: Container(
                      //       height: getHeight,
                      //       decoration: const ShapeDecoration(
                      //         color: ColorsManager.white,
                      //         shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.only(
                      //             topLeft: Radius.circular(
                      //               16,
                      //             ),
                      //             topRight: Radius.circular(
                      //               16,
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //       child: Obx(
                      //         () => CountryListSelector(
                      //           showPhoneCode: false,
                      //           countrylist: countryList,
                      //           selectedCountry:
                      //               controller.selectedCountryAddress.value,
                      //           onTap: (country) {
                      //             controller.selectedCountryAddressOnClick(
                      //               country,
                      //             );
                      //             Navigator.pop(
                      //               context,
                      //               true,
                      //             ); // Issue:: It's not working properly on first click with Get.back();
                      //           },
                      //         ),
                      //       ),
                      //     ),
                      //     containerWidget: Obx(
                      //       () => controller.selectedCountryAddress.value
                      //                   .name ==
                      //               null
                      //           ? const RowContentInputWidget(
                      //               centerWidget: CustomTextWidget(
                      //                 text: 'Country',
                      //                 color: ColorsManager.grey400,
                      //                 fontWeight: FontWeight.w400,
                      //                 fontSize: 16.0,
                      //               ),
                      //               suffixWidget: Icon(
                      //                 Icons.arrow_drop_down,
                      //                 color: ColorsManager.grey600,
                      //               ),
                      //             )
                      //           : RowContentInputWidget(
                      //               prefixWidget: CircleFlag(
                      //                 controller.selectedCountryAddress
                      //                     .value.isoCode
                      //                     .toString(),
                      //               ),
                      //               prefixWidgetRightPadding: AppSize.s12,
                      //               // centerWidgetFlex: 75,
                      //               centerWidget: CustomTextWidget(
                      //                 //marginLeft: 4.0,
                      //                 text: controller
                      //                     .selectedCountryAddress
                      //                     .value
                      //                     .name,
                      //                 color: ColorsManager.black,
                      //                 fontSize: 16.0,
                      //               ),
                      //               suffixWidget: const Icon(
                      //                 Icons.arrow_drop_down,
                      //                 color: ColorsManager.grey600,
                      //               ),
                      //             ),
                      //     ),
                      //   ),
                      // ),
                      //===== Bottom of Country Component =====//

                      // const SizedBox(
                      //   width: AppSize.s8,
                      // ),

                      ///===== Top of City/State Component =====//

                      // Expanded(
                      //   flex: 50,
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       const CustomTextWidget(
                      //         text: 'City/State',
                      //         marginTop: AppSize.s12,
                      //         textAlign: TextAlign.left,
                      //         // marginBottom: AppSize.s4,
                      //       ),
                      //       const SizedBox(
                      //         height: 3.0,
                      //       ),
                      //       GestureDetector(
                      //         onTap: () => {
                      //           // Get.bottomSheet(
                      //           //   Container(
                      //           //     height: getHeight * 0.5,
                      //           //     decoration: const ShapeDecoration(
                      //           //       color: ColorsManager.white,
                      //           //       shape: RoundedRectangleBorder(
                      //           //         borderRadius: BorderRadius.only(
                      //           //           topLeft: Radius.circular(
                      //           //             16,
                      //           //           ),
                      //           //           topRight: Radius.circular(
                      //           //             16,
                      //           //           ),
                      //           //         ),
                      //           //       ),
                      //           //     ),
                      //           //     child: CountryListSelector(
                      //           //       countrylist: countryList,
                      //           //       onTap: (country) {
                      //           //         controller
                      //           //             .selectedCountryAddressOnClick(
                      //           //           country,
                      //           //         );
                      //           //         Get.back();
                      //           //       },
                      //           //     ),
                      //           //   ),
                      //           // ),
                      //         },
                      //         child: Container(
                      //           alignment: Alignment.centerLeft,
                      //           padding: EdgeInsets.zero,
                      //           child: FormField(
                      //             validator: (_) =>
                      //                 controller.isPhoneNumberValidate(),
                      //             builder: (
                      //               FormFieldState<String> state,
                      //             ) {
                      //               return InputDecorator(
                      //                 // alignedDropdown: true,
                      //                 decoration: InputDecoration(
                      //                   contentPadding:
                      //                       const EdgeInsets.fromLTRB(
                      //                     4,
                      //                     0,
                      //                     4,
                      //                     0,
                      //                   ),
                      //                   fillColor: ColorsManager.grey100,
                      //                   filled: true,
                      //                   border: OutlineInputBorder(
                      //                     borderRadius:
                      //                         BorderRadius.circular(
                      //                       AppSize.s8,
                      //                     ),
                      //                   ),
                      //                   errorText: state.hasError
                      //                       ? state.errorText
                      //                       : null,
                      //                   enabledBorder: OutlineInputBorder(
                      //                     borderRadius:
                      //                         BorderRadius.circular(
                      //                       AppSize.s8,
                      //                     ),
                      //                     borderSide: const BorderSide(
                      //                       color: ColorsManager.grey100,
                      //                     ),
                      //                   ),
                      //                   errorBorder: OutlineInputBorder(
                      //                     borderRadius:
                      //                         BorderRadius.circular(
                      //                       AppSize.s8,
                      //                     ),
                      //                     borderSide: const BorderSide(
                      //                       color: ColorsManager.red900,
                      //                     ),
                      //                   ),
                      //                   focusedBorder: OutlineInputBorder(
                      //                     borderRadius:
                      //                         BorderRadius.circular(
                      //                       AppSize.s8,
                      //                     ),
                      //                     borderSide: const BorderSide(
                      //                       color: ColorsManager.grey300,
                      //                     ),
                      //                   ),
                      //                 ),
                      //                 child:
                      //                     // Obx(
                      //                     //   () =>
                      //                     // controller
                      //                     //             .selectedCountryAddress
                      //                     //             .value
                      //                     //             .phoneCode ==
                      //                     //         null
                      //                     //     ?
                      //                     Row(
                      //                   mainAxisAlignment:
                      //                       MainAxisAlignment.spaceBetween,
                      //                   children: const [
                      //                     CustomTextWidget(
                      //                       marginLeft: AppSize.s8,
                      //                       text: 'City/State',
                      //                       color: ColorsManager.grey400,
                      //                       fontWeight: FontWeight.w400,
                      //                       fontSize: 16.0,
                      //                     ),
                      //                     Icon(
                      //                       Icons.arrow_drop_down,
                      //                       color: ColorsManager.grey300,
                      //                     ),
                      //                   ],
                      //                 ),
                      //                 // : Row(
                      //                 //     children: [
                      //                 //       SizedBox(
                      //                 //         height: 15.0,
                      //                 //         child: CircleFlag(
                      //                 //           controller
                      //                 //               .selectedCountryAddress
                      //                 //               .value
                      //                 //               .isoCode
                      //                 //               .toString(),
                      //                 //         ),
                      //                 //       ),
                      //                 //       Expanded(
                      //                 //         child: CustomTextWidget(
                      //                 //           marginLeft:
                      //                 //               AppSize.s8,
                      //                 //           text: controller
                      //                 //               .selectedCountryAddress
                      //                 //               .value
                      //                 //               .phoneCode,
                      //                 //           color: ColorsManager
                      //                 //               .black,
                      //                 //           fontSize: 16.0,
                      //                 //         ),
                      //                 //       ),
                      //                 //       const Icon(
                      //                 //         Icons.arrow_drop_down,
                      //                 //         color: ColorsManager
                      //                 //             .grey600,
                      //                 //       ),
                      //                 //     ],
                      //                 //   ),
                      //                 // ),
                      //               );
                      //             },
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      //===== Bottom of City/State Component =====//
                      //   ],
                      // ),
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

                      ///===== Top of Address Component =====//
                      // GestureDetector(
                      // child:
                      CustomTextInput(
                        controller: controller.addressCtrl,
                        inputTitle: 'Address',
                        hintText: 'Address...',
                        isFilled: true,
                        topContentPadding: 12.0,
                        bottomContentPadding: 12.0,
                        topPadding: AppSize.s12,
                        // counter: true,
                        maxLines: 3,
                        minLines: 2,
                        maxLength: 150,
                        keyboardType: TextInputType.multiline,
                      ),
                      // onTap: () async {
                      // print('onTap: address');
                      // generate a new token here
                      // const sessionToken = 'Uuid().v4()';
                      // final Suggestion? result = await showSearch(
                      //   context: context,
                      //   delegate: AddressSearch(sessionToken),
                      // );
                      // This will change the text displayed in the TextField
                      // final placeDetails =
                      //     await PlaceApiProvider(sessionToken)
                      //         .getPlaceDetailFromId(result.placeId);
                      // setState(() {
                      //   _controller.text = result.description;
                      //   _streetNumber = placeDetails.streetNumber;
                      //   _street = placeDetails.street;
                      //   _city = placeDetails.city;
                      //   _zipCode = placeDetails.zipCode;
                      // });
                      //   },
                      // ),
                      //===== Bottom of Address Component =====//
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: // Obx(
          //   () => Visibility(
          //     visible: controller.isSubmitBtnProcessing.value,
          //     child: const LoadingWidget(),
          //   ),
          // ),
          // Obx(
          //   () => Visibility(
          //     visible:
          //         !controller.isSubmitBtnProcessing.value,
          // child:
          CustomMaterialButton(
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
      //   ),
      // ),
    );
  }

  void genderSelectedDialog(BuildContext context) {
    // showDialog(
    //   context: context,
    //   builder: (builder) {
    //     return AlertDialog(
    //       shape: const RoundedRectangleBorder(
    //         borderRadius: BorderRadius.all(Radius.circular(10.0)),
    //       ),
    //       title: Container(
    //         decoration: const BoxDecoration(
    //           borderRadius: BorderRadius.only(
    //             topLeft: Radius.circular(10.0),
    //             topRight: Radius.circular(10.0),
    //           ),
    //           color: ColorsManager.primary,
    //         ),
    //         child: const CustomTextWidget(
    //           text: 'Title',
    //           fontSize: AppSize.s18,
    //           color: ColorsManager.white,
    //           textAlign: TextAlign.center,
    //           marginTop: AppSize.s14,
    //           marginBottom: AppSize.s14,
    //         ),
    //       ),
    //       titlePadding: EdgeInsets.zero,
    //       contentPadding: EdgeInsets.zero,
    //       content: SizedBox(
    //         width: double.maxFinite,
    //         child: Column(
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             ConstrainedBox(
    //               constraints: BoxConstraints(
    //                 maxHeight: getHeight * 0.5,
    //               ),
    //               child: ListView.separated(
    //                 shrinkWrap: true,
    //                 itemCount: controller.genderList.length,
    //                 itemBuilder: (context, index) {
    //                   return Obx(
    //                     () => RowDataSelectionWidget.radioButton(
    //                       isLeftSideText: false,
    //                       isClickingValue: stringsComparation(
    //                         object1: controller.genderList[index],
    //                         object2: controller.selectedGender.value,
    //                       ),
    //                       text: controller.genderList[index],
    //                       onPressed: () {
    //                         controller.selectedGender.value =
    //                             controller.genderList[index];
    //                         // controller.selectedGenderOnClick(
    //                         //   selectedItem: controller.genderList[index],
    //                         // );
    //                         Get.back();
    //                       },
    //                     ),
    //                   );
    //                 },
    //                 separatorBuilder: (context, index) {
    //                   return const Divider(
    //                     height: 1.0,
    //                     color: ColorsManager.grey300,
    //                   );
    //                 },
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     );
    //   },
    // );
  }
}
