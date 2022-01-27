import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
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
      backgroundColor: ColorsManager.grey100,
      appBar: CustomAppBar(
        title: 'Edit Information',
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container(
            //   width: 120,
            //   height: 120,
            //   margin: const EdgeInsets.only(
            //     top: AppSize.s16,
            //   ),
            //   decoration: BoxDecoration(
            //     color: ColorsManager.white,
            //     shape: BoxShape.circle,
            //     border: Border.all(
            //       color: ColorsManager.white,
            //       width: 3,
            //     ),
            //     boxShadow: const [
            //       BoxShadow(
            //         color: ColorsManager.grey300,
            //         blurRadius: 3.0,
            //         offset: Offset(1.0, 1.0),
            //         spreadRadius: 3.0,
            //       )
            //     ],
            //     // image: const DecorationImage(
            //     //   fit: BoxFit.cover,
            //     //   image: AssetImage(ImageAssets.appLogoSymbol),
            //     // ),
            //   ),
            //   child: const CustomBoxWidget(
            //     size: 120,
            //     backgroundColor: ColorsManager.white,
            //     isCircle: true,
            //   ),
            // ),

            ///===== Personal Information Component =====//
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
                      ///===== First name Component =====//
                      CustomTextInput(
                        // controller: controller.firstNameCtrl,
                        inputTitle: 'First name',
                        hintText: 'Enter your first name',
                        isFilled: true,
                        validator: Validator().notEmptyValidator,
                        // onChanged: (value) => null,
                        // onSaved: (value) => controller
                        //     .firstNameCtrl.text = value.toString(),
                      ),
                      //===== First name Component =====//

                      ///===== Last name Component =====//
                      CustomTextInput(
                        // controller: controller.lastNameCtrl,
                        inputTitle: 'Last name',
                        hintText: 'Enter your last name',
                        isFilled: true,
                        topPadding: AppSize.s12,
                        validator: Validator().notEmptyValidator,
                      ),
                      //===== Last name Component =====//

                      ///===== Title Component =====//
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomTextWidget(
                            text: 'Title',
                            marginTop: AppSize.s12,
                            textAlign: TextAlign.left,
                            // marginBottom: AppSize.s4,
                          ),
                          const SizedBox(
                            height: 3.0,
                          ),
                          GestureDetector(
                            onTap: () => {
                              unFocusKeyBoard(context),
                              genderSelectedDialog(context),
                            },
                            child: Container(
                              // height: 50.0,
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.zero,
                              margin: EdgeInsets.zero,
                              child: FormField(
                                // validator: (_) => controller
                                //     .isPhoneNumberValidate(),
                                builder: (
                                  FormFieldState<String> state,
                                ) {
                                  return InputDecorator(
                                    // alignedDropdown: true,
                                    decoration: InputDecoration(
                                      // contentPadding: EdgeInsets.zero,
                                      contentPadding: const EdgeInsets.fromLTRB(
                                        12,
                                        0,
                                        12,
                                        0,
                                      ), //const EdgeInsets.fromLTRB(12, 20, 12, 20), //default value:
                                      fillColor: ColorsManager.grey100,
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          AppSize.s8,
                                        ),
                                      ),
                                      errorText: state.hasError
                                          ? state.errorText
                                          : null,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          AppSize.s8,
                                        ),
                                        borderSide: const BorderSide(
                                          color: ColorsManager.grey100,
                                        ),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          AppSize.s8,
                                        ),
                                        borderSide: const BorderSide(
                                          color: ColorsManager.red900,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          AppSize.s8,
                                        ),
                                        borderSide: const BorderSide(
                                          color: ColorsManager.grey300,
                                        ),
                                      ),
                                    ),
                                    child: Obx(
                                      () => controller.selectedGender.value ==
                                              ''
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: const [
                                                CustomTextWidget(
                                                  text: 'Select a title',
                                                  // marginLeft: AppSize.s8,
                                                  color: ColorsManager.grey400,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16.0,
                                                ),
                                                Icon(
                                                  Icons.arrow_drop_down,
                                                  color: ColorsManager.grey600,
                                                )
                                              ],
                                            )
                                          : Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                CustomTextWidget(
                                                  //marginLeft: 4.0,
                                                  text: controller
                                                      .selectedGender.value,
                                                  color: ColorsManager.black,
                                                  fontSize: 16.0,
                                                ),
                                                const Icon(
                                                  Icons.arrow_drop_down,
                                                  color: ColorsManager.grey600,
                                                )
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
                      //===== Title Component =====//

                      ///===== Birthday Component =====//
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomTextWidget(
                            text: 'Birthday',
                            marginTop: AppSize.s12,
                            textAlign: TextAlign.left,
                            // marginBottom: AppSize.s4,
                          ),
                          const SizedBox(
                            height: 3.0,
                          ),
                          // TextButton(
                          //   style: TextButton.styleFrom(
                          //     minimumSize: Size.zero,
                          //     padding: EdgeInsets.zero,
                          //     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          //   ),
                          //   onPressed:
                          GestureDetector(
                            onTap: () => {
                              unFocusKeyBoard(context),
                              DatePicker.showDatePicker(
                                context,
                                minTime: DateTime(1970),
                                maxTime: DateTime(2009, 12, 31),
                                currentTime: DateTime(2000),
                                // locale: LocaleType.kh,
                                theme: const DatePickerTheme(
                                  headerColor: ColorsManager.grey100,
                                  backgroundColor: ColorsManager.grey100,
                                  itemStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                  doneStyle: TextStyle(
                                    color: ColorsManager.primaryBlue,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onChanged: (date) {
                                  // print(
                                  //   'change $date in time zone ${date.timeZoneOffset.inHours}',
                                  // );
                                },
                                onConfirm: (date) {
                                  // print('confirm $date');
                                  controller.selectedBirthdayOnClick(
                                    selectedItem:
                                        '${date.year}-${date.month}-${date.day}',
                                  );
                                },
                              )
                            },
                            child: Container(
                              // height: 50.0,
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.zero,
                              margin: EdgeInsets.zero,
                              child: FormField(
                                // validator: (_) => controller
                                //     .isPhoneNumberValidate(),
                                builder: (
                                  FormFieldState<String> state,
                                ) {
                                  return InputDecorator(
                                    // alignedDropdown: true,
                                    decoration: InputDecoration(
                                      // contentPadding: EdgeInsets.zero,
                                      contentPadding: const EdgeInsets.fromLTRB(
                                        12,
                                        0,
                                        12,
                                        0,
                                      ), //const EdgeInsets.fromLTRB(12, 20, 12, 20), //default value:
                                      fillColor: ColorsManager.grey100,
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          AppSize.s8,
                                        ),
                                      ),
                                      errorText: state.hasError
                                          ? state.errorText
                                          : null,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          AppSize.s8,
                                        ),
                                        borderSide: const BorderSide(
                                          color: ColorsManager.grey100,
                                        ),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          AppSize.s8,
                                        ),
                                        borderSide: const BorderSide(
                                          color: ColorsManager.red900,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          AppSize.s8,
                                        ),
                                        borderSide: const BorderSide(
                                          color: ColorsManager.grey300,
                                        ),
                                      ),
                                    ),
                                    child: Obx(
                                      () => controller.selectedBirthday.value ==
                                              ''
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: const [
                                                CustomTextWidget(
                                                  text: 'Select your Birthday',
                                                  color: ColorsManager.grey400,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16.0,
                                                ),
                                                Icon(
                                                  Icons.date_range_outlined,
                                                  color: ColorsManager.grey600,
                                                )
                                              ],
                                            )
                                          : Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                CustomTextWidget(
                                                  //marginLeft: 4.0,
                                                  text: controller
                                                      .selectedBirthday.value,
                                                  color: ColorsManager.black,
                                                  fontSize: 16.0,
                                                ),
                                                const Icon(
                                                  Icons.date_range_outlined,
                                                  color: ColorsManager.grey600,
                                                )
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
                      //===== Birthday Component =====//

                      ///===== Phone Number Component =====//
                      Row(
                        children: [
                          Expanded(
                            flex: 40,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                      height: getHeight * 0.5,
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
                                        onTap: (country) {
                                          controller
                                              .selectedCountryPhoneNumberOnClick(
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
                                      validator: (_) =>
                                          controller.isPhoneNumberValidate(),
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
                                            fillColor: ColorsManager.grey100,
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
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                AppSize.s8,
                                              ),
                                              borderSide: const BorderSide(
                                                color: ColorsManager.grey100,
                                              ),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                AppSize.s8,
                                              ),
                                              borderSide: const BorderSide(
                                                color: ColorsManager.red900,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                AppSize.s8,
                                              ),
                                              borderSide: const BorderSide(
                                                color: ColorsManager.grey300,
                                              ),
                                            ),
                                          ),
                                          child: Obx(
                                            () => controller
                                                        .selectedCountryPhoneNumber
                                                        .value
                                                        .phoneCode ==
                                                    null
                                                ? const CustomTextWidget(
                                                    marginLeft: AppSize.s8,
                                                    text: 'Country Code',
                                                    color:
                                                        ColorsManager.grey400,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16.0,
                                                  )
                                                : Row(
                                                    children: [
                                                      SizedBox(
                                                        height: 15.0,
                                                        child: CircleFlag(
                                                          controller
                                                              .selectedCountryPhoneNumber
                                                              .value
                                                              .isoCode
                                                              .toString(),
                                                        ),
                                                      ),
                                                      CustomTextWidget(
                                                        marginLeft: AppSize.s4,
                                                        text: controller
                                                            .selectedCountryPhoneNumber
                                                            .value
                                                            .phoneCode,
                                                        color:
                                                            ColorsManager.black,
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
                      //===== Phone Number Component =====//

                      ///===== Phone Number 2 Component =====//
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
                      //===== Phone Number 2 Component =====//

                      ///===== Facebook profile Component =====//
                      // CustomTextInput(
                      //   // controller: controller.emailCtrl,
                      //   inputTitle: 'Facebook profile',
                      //   hintText: 'Enter your Facebook profile',
                      //   isFilled: true,
                      //   topPadding: AppSize.s12,
                      //   validator: Validator().emailValidator,
                      //   keyboardType: TextInputType.emailAddress,
                      // ),
                      //===== Facebook profile Component =====//

                      ///===== Linkedin profile Component =====//
                      CustomTextInput(
                        // controller: controller.emailCtrl,
                        inputTitle: 'Linkedin profile',
                        hintText: 'Enter your Linkedin profile',
                        isFilled: true,
                        topPadding: AppSize.s12,
                        validator: Validator().emailValidator,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      //===== Linkedin profile Component =====//

                      ///===== Whatapp contact Component =====//
                      // CustomTextInput(
                      //   // controller: controller.emailCtrl,
                      //   inputTitle: 'Whatapp contact',
                      //   hintText: 'Enter your Whatapp contact',
                      //   isFilled: true,
                      //   topPadding: AppSize.s12,
                      //   validator: Validator().emailValidator,
                      //   keyboardType: TextInputType.emailAddress,
                      // ),
                      //===== Whatapp contact Component =====//

                      ///===== Video presentation link Component =====//
                      CustomTextInput(
                        // controller: controller.emailCtrl,
                        inputTitle: 'Video presentation link',
                        hintText: 'Enter your Video presentation link',
                        isFilled: true,
                        topPadding: AppSize.s12,
                        validator: Validator().emailValidator,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      //===== Video presentation link Component =====//

                      ///===== Description Component =====//
                      CustomTextInput(
                        // controller: controller.emailCtrl,
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
                        validator: Validator().emailValidator,
                        keyboardType: TextInputType.multiline,
                      ),
                      //===== Description Component =====//

                      ///===== Address Information Component =====//
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
                      //===== Address Information Component =====//

                      ///===== Country & City/State Component =====//
                      Row(
                        children: [
                          //===== Country Component =====//
                          Expanded(
                            flex: 50,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CustomTextWidget(
                                  text: 'Country',
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
                                      height: getHeight * 0.5,
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
                                        onTap: (country) {
                                          controller
                                              .selectedCountryAddressOnClick(
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
                                      validator: (_) =>
                                          controller.isPhoneNumberValidate(),
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
                                            fillColor: ColorsManager.grey100,
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
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                AppSize.s8,
                                              ),
                                              borderSide: const BorderSide(
                                                color: ColorsManager.grey100,
                                              ),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                AppSize.s8,
                                              ),
                                              borderSide: const BorderSide(
                                                color: ColorsManager.red900,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                AppSize.s8,
                                              ),
                                              borderSide: const BorderSide(
                                                color: ColorsManager.grey300,
                                              ),
                                            ),
                                          ),
                                          child: Obx(
                                            () => controller
                                                        .selectedCountryAddress
                                                        .value
                                                        .name ==
                                                    null
                                                ? Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: const [
                                                      CustomTextWidget(
                                                        marginLeft: AppSize.s8,
                                                        text: 'Country',
                                                        color: ColorsManager
                                                            .grey400,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 16.0,
                                                      ),
                                                      Icon(
                                                        Icons.arrow_drop_down,
                                                        color: ColorsManager
                                                            .grey600,
                                                      ),
                                                    ],
                                                  )
                                                : Row(
                                                    children: [
                                                      SizedBox(
                                                        height: 15.0,
                                                        child: CircleFlag(
                                                          controller
                                                              .selectedCountryAddress
                                                              .value
                                                              .isoCode
                                                              .toString(),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: CustomTextWidget(
                                                          marginLeft:
                                                              AppSize.s8,
                                                          text: controller
                                                              .selectedCountryAddress
                                                              .value
                                                              .name,
                                                          color: ColorsManager
                                                              .black,
                                                          fontSize: 16.0,
                                                        ),
                                                      ),
                                                      const Icon(
                                                        Icons.arrow_drop_down,
                                                        color: ColorsManager
                                                            .grey600,
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
                          //===== Country Component =====//

                          const SizedBox(
                            width: AppSize.s8,
                          ),

                          ///===== City/State Component =====//
                          Expanded(
                            flex: 50,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CustomTextWidget(
                                  text: 'City/State',
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
                                      height: getHeight * 0.5,
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
                                        onTap: (country) {
                                          controller
                                              .selectedCountryAddressOnClick(
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
                                      validator: (_) =>
                                          controller.isPhoneNumberValidate(),
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
                                            fillColor: ColorsManager.grey100,
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
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                AppSize.s8,
                                              ),
                                              borderSide: const BorderSide(
                                                color: ColorsManager.grey100,
                                              ),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                AppSize.s8,
                                              ),
                                              borderSide: const BorderSide(
                                                color: ColorsManager.red900,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                AppSize.s8,
                                              ),
                                              borderSide: const BorderSide(
                                                color: ColorsManager.grey300,
                                              ),
                                            ),
                                          ),
                                          child: Obx(
                                            () => controller
                                                        .selectedCountryAddress
                                                        .value
                                                        .phoneCode ==
                                                    null
                                                ? Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: const [
                                                      CustomTextWidget(
                                                        marginLeft: AppSize.s8,
                                                        text: 'City/State',
                                                        color: ColorsManager
                                                            .grey400,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 16.0,
                                                      ),
                                                      Icon(
                                                        Icons.arrow_drop_down,
                                                        color: ColorsManager
                                                            .grey600,
                                                      ),
                                                    ],
                                                  )
                                                : Row(
                                                    children: [
                                                      SizedBox(
                                                        height: 15.0,
                                                        child: CircleFlag(
                                                          controller
                                                              .selectedCountryAddress
                                                              .value
                                                              .isoCode
                                                              .toString(),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: CustomTextWidget(
                                                          marginLeft:
                                                              AppSize.s8,
                                                          text: controller
                                                              .selectedCountryAddress
                                                              .value
                                                              .phoneCode,
                                                          color: ColorsManager
                                                              .black,
                                                          fontSize: 16.0,
                                                        ),
                                                      ),
                                                      const Icon(
                                                        Icons.arrow_drop_down,
                                                        color: ColorsManager
                                                            .grey600,
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
                          //===== City/State Component =====//
                        ],
                      ),
                      //===== Country & City/State Component =====//

                      ///===== Zip Code Component =====//
                      const CustomTextInput(
                        // controller: controller.emailCtrl,
                        inputTitle: 'Zip Code',
                        hintText: 'Enter your Zip Code',
                        isFilled: true,
                        maxLength: 10,
                        topPadding: AppSize.s12,
                        // validator: Validator().emailValidator,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      //===== Zip Code Component =====//

                      ///===== Address Component =====//
                      CustomTextInput(
                        // controller: controller.emailCtrl,
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
                        validator: Validator().emailValidator,
                        keyboardType: TextInputType.multiline,
                      ),
                      //===== Address Component =====//
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
          customSnackbar(
            msgTitle: 'This Page is under construction!',
            msgContent: 'This Page is only view.\n Data will not save.',
          );
          // controller.registerButtonOnClick(
          //   userType: userType,
          // );
        },
      ),
      //   ),
      // ),
    );
  }

  void genderSelectedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (builder) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          title: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              color: ColorsManager.primary,
            ),
            child: const CustomTextWidget(
              text: 'Title',
              fontSize: AppSize.s18,
              color: ColorsManager.white,
              textAlign: TextAlign.center,
              marginTop: AppSize.s14,
              marginBottom: AppSize.s14,
            ),
          ),
          titlePadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          // actions: <Widget>[
          //   // TextButton(
          //   //   // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          //   //   // textColor: Theme.of(context).colorScheme.secondary,
          //   //   onPressed: () {
          //   //     //widget.onOk();
          //   //   },
          //   //   child: const Text('OK'),
          //   // ),
          //   CustomMaterialButton(
          //     elevation: 0,
          //     text: 'CANCEL',
          //     textColor: ColorsManager.red,
          //     buttonColor: ColorsManager.white,
          //     onPressed: () {
          //       //widget.onCancel();
          //     },
          //   ),
          //   TextButton(
          //     // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          //     // textColor: Theme.of(context).colorScheme.secondary,
          //     onPressed: () {
          //       //widget.onOk();
          //     },
          //     child: const Text('OK'),
          //   ),
          // ],
          content: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // const Divider(
                //   color: ColorsManager.grey600,
                // ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: getHeight * 0.5,
                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: controller.genderList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          controller.selectedGenderOnClick(
                            selectedItem: controller.genderList[index],
                          );
                          Get.back();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 24.0,
                            top: 16.0,
                            bottom: 16.0,
                          ),
                          child: Row(
                            children: <Widget>[
                              // if (LanguageController().languageOptions[index].key ==
                              //     LanguageController().currentLanguageStore.toString())
                              //   const Icon(
                              //     Icons.radio_button_checked,
                              //     color: ColorsManager.primary,
                              //   )
                              // else
                              const Icon(
                                Icons.radio_button_unchecked,
                                color: ColorsManager.grey600,
                              ),
                              const SizedBox(
                                width: 15.0,
                              ),
                              CustomTextWidget(
                                text: controller.genderList[index],
                                fontSize: AppSize.s16,
                                color:
                                    // LanguageController().languageOptions[index].key ==
                                    //         LanguageController()
                                    //             .currentLanguageStore
                                    //             .toString()
                                    //     ? ColorsManager.primary
                                    //     :
                                    ColorsManager.grey600,
                              ),
                            ],
                          ),
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
                // const Divider(
                //   color: ColorsManager.grey600,
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
