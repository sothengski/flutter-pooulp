import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';
import '../offer.dart';

class OfferFeedFilterSearch extends GetView<OfferFeedController> {
  final String? title;
  final Widget? contentWidget;
  final Widget? icon;
  final String? buttonLabel1;
  final String? buttonLabel2;
  final String? buttonLabel3;
  final String? routePath;
  final VoidCallback? onPressed1;
  final VoidCallback? onPressed2;
  final VoidCallback? onPressed3;

  const OfferFeedFilterSearch({
    Key? key,
    this.title = '',
    this.contentWidget,
    this.icon,
    this.buttonLabel1,
    this.buttonLabel2,
    this.buttonLabel3,
    this.routePath = '',
    this.onPressed1,
    this.onPressed2,
    this.onPressed3,
  }) : super(key: key);

  Future<PlaceDetailModel?> showSearchFunc(BuildContext context) async {
    return showSearch(
      context: context,
      delegate: GoogleAddressSearchBarWidget(
        placeDetailData: controller.placeDetail.value,
        sessionToken: UuidGenerator().uuidV4(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        // margin: const EdgeInsets.all(40),
        margin: const EdgeInsets.only(top: 40),
        // padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CustomTextWidget(
              marginTop: 16.0,
              marginBottom: 16.0,
              text: title,
              fontSize: 20.0,
              fontWeight: FontWeightManager.medium,
            ),
            const Divider(
              height: 1.0,
              color: ColorsManager.grey,
            ),
            // contentWidget!,
            ///===== Top of Body/Content Component =====//
            Obx(
              () => Container(
                height: getHeight * 0.80,
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(AppSize.s8),
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  children: [
                    ///===== Top of Job Title Component =====//
                    CustomTextInput(
                      leftPadding: AppSize.s8,
                      rightPadding: AppSize.s8,
                      controller: controller.keywordToBeSearchTextCtrl,
                      inputTitle: 'offer.jobTitle'.tr,
                      fontSizeTitle: AppSize.s16,
                      fontWeightTitle: FontWeight.w600,
                      hintText: 'offer.searchByTitle'.tr,
                      isFilled: true,
                      // validator: Validator().notEmptyValidator,
                    ),
                    //===== Bottom of Job Title Component =====//
                    const SizedBox(height: 8.0),

                    ///===== Top of Workplace Type Component =====//
                    CustomContainerWidget(
                      isBoxShadow: false,
                      leftTitle: 'offer.workplaceType'.tr,
                      titleTopPadding: AppSize.s5,
                      titleFontSize: AppSize.s16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RowDataSelectionWidget.radioButton(
                            isClickingValue: intComparation(
                              object1: controller.workPlaceTypesInFilter.value,
                              object2: 0,
                            ),
                            text: 'offer.onSite'.tr,
                            onPressed: () {
                              controller.workPlaceTypesInFilter.value = 0;
                              // controller.workPlaceTypesForSearch.value = 0;
                              // debugPrint(
                              //   'On-Site click:: ${controller.workPlaceTypesInFilter.value}',
                              // );
                            },
                          ),
                          RowDataSelectionWidget.radioButton(
                            isClickingValue: intComparation(
                              object1: controller.workPlaceTypesInFilter.value,
                              object2: 1,
                            ),
                            text: 'offer.remote'.tr,
                            onPressed: () {
                              controller.workPlaceTypesInFilter.value = 1;
                              // controller.workPlaceTypesForSearch.value = 1;
                              // debugPrint(
                              //   'Remote click:: ${controller.workPlaceTypesInFilter.value}',
                              // );
                            },
                          ),
                          RowDataSelectionWidget.radioButton(
                            isClickingValue: intComparation(
                              object1: controller.workPlaceTypesInFilter.value,
                              object2: 2,
                            ),
                            text: 'offer.hybrid'.tr,
                            onPressed: () {
                              controller.workPlaceTypesInFilter.value = 2;
                              // controller.workPlaceTypesForSearch.value = 2;
                              // debugPrint(
                              //   'Hybrid click:: ${controller.workPlaceTypesInFilter.value}',
                              // );
                            },
                          ),
                        ],
                      ),
                    ),
                    //===== Bottom of Workplace Type Component =====//
                    const SizedBox(height: 8.0),

                    ///===== Top of Job Type Component =====//
                    // CustomContainerWidget(
                    //   isBoxShadow: false,
                    //   leftTitle: 'Job Type',
                    //   titleTopPadding: AppSize.s5,
                    //   titleFontSize: AppSize.s16,
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       RowDataSelectionWidget.checkBox(
                    //         text: 'Internship',
                    //         onPressed: () {
                    //           debugPrint('Internship click');
                    //         },
                    //       ),
                    //       RowDataSelectionWidget.checkBox(
                    //         isClickingValue: true,
                    //         text: 'Study Subject',
                    //         onPressed: () {
                    //           debugPrint('Study Subject click');
                    //         },
                    //       ),
                    //       RowDataSelectionWidget.checkBox(
                    //         isClickingValue: true,
                    //         text: 'Job',
                    //         onPressed: () {
                    //           debugPrint('Job click');
                    //         },
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    //===== Bottom of Job Type Component =====//
                    // const SizedBox(height: 8.0),
                    ///===== Top of Fields Component =====//
                    CustomContainerWidget(
                      isBoxShadow: false,
                      leftTitle: 'offer.jobTypes'.tr,
                      titleTopPadding: AppSize.s5,
                      titleFontSize: AppSize.s16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: controller.listJobOfferTypes
                            .map(
                              (e) => RowDataSelectionWidget.checkBox(
                                isClickingValue:
                                    controller.typesListInFilter.contains(e),
                                text: e.label,
                                onPressed: () {
                                  controller
                                      .addingOrRemovingFieldInFieldListToBeSearch(
                                    list: controller.typesListInFilter,
                                    fieldValue: e,
                                  );
                                },
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    //===== Bottom of Fields Component =====//
                    const SizedBox(height: 8.0),

                    ///===== Top of Fields Component =====//
                    ContainerDialogWidget(
                      leftPadding: AppSize.s10,
                      rightPadding: AppSize.s10,
                      inputTitle: 'offer.fields'.tr,
                      fontSizeTitle: AppSize.s16,
                      fontWeightTitle: FontWeight.w600,
                      inputTitleMarginBottom: AppSize.s6,
                      // validatorFunction: (_) => Validator().notEmptyValidator(
                      //   controller.selectedLanguage.value.label ?? '',
                      // ),
                      dialogType: DialogType.bottomSheetDialog,
                      dialogWidget: Container(
                        height: getHeight,
                        decoration: const ShapeDecoration(
                          color: ColorsManager.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                AppSize.s16,
                              ),
                              topRight: Radius.circular(
                                AppSize.s16,
                              ),
                            ),
                          ),
                        ),
                        child: Obx(
                          () => controller.fieldListForSearch.isNotEmpty
                              ? FieldListMultipleSelector(
                                  inputHintText: 'core.search'.tr,
                                  dataListforSelected:
                                      controller.fieldListForSearch,
                                  selectedItems: controller.fieldListInFilter,
                                  onTap: (field) {
                                    controller
                                        .addingOrRemovingFieldInFieldListToBeSearch(
                                      list: controller.fieldListInFilter,
                                      fieldValue: field,
                                    );
                                  },
                                )
                              : const LoadingWidget(),
                        ),
                      ),
                      containerWidget: RowContentInputWidget(
                        centerWidget: CustomTextWidget(
                          text: 'offer.fields'.tr,
                          color: ColorsManager.grey400,
                          fontWeight: FontWeight.w400,
                          fontSize: AppSize.s16,
                        ),
                        suffixWidget: const Icon(
                          IconsManager.arrowDropDown,
                          color: ColorsManager.grey600,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        left: AppSize.s10,
                        right: AppSize.s10,
                      ),
                      child: Wrap(
                        children: [
                          for (var i = 0;
                              i < controller.fieldListInFilter.length;
                              i++)
                            RemovableTextCardWidget(
                              text: '${controller.fieldListInFilter[i].label}',
                              onRemove: () => controller
                                  .addingOrRemovingFieldInFieldListToBeSearch(
                                list: controller.fieldListInFilter,
                                fieldValue: controller.fieldListInFilter[i],
                              ),
                            )
                        ],
                      ),
                    ),
                    //===== Bottom of Fields Component =====//

                    ///===== Top of Fields Component =====//
                    // CustomContainerWidget(
                    //   isBoxShadow: false,
                    //   leftTitle: 'offer.fields'.tr,
                    //   titleTopPadding: AppSize.s5,
                    //   titleFontSize: AppSize.s16,
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: controller.fieldListForSearch
                    //         .map(
                    //           (e) => RowDataSelectionWidget.checkBox(
                    //             isClickingValue:
                    //                 controller.fieldListInFilter.contains(e),
                    //             text: e.label,
                    //             onPressed: () {
                    //               controller
                    //                   .addingOrRemovingFieldInFieldListToBeSearch(
                    //                 list: controller.fieldListInFilter,
                    //                 fieldValue: e,
                    //               );
                    //               // debugPrint(
                    //               //   'Fields on Click::${e.label}(${e.id})',
                    //               // );
                    //             },
                    //           ),
                    //         )
                    //         .toList(),
                    //   ),
                    // ),
                    //===== Bottom of Fields Component =====//
                    // const SizedBox(height: 8.0),

                    ///===== Top of Languages Component =====//
                    ContainerDialogWidget(
                      leftPadding: AppSize.s10,
                      rightPadding: AppSize.s10,
                      inputTitle: 'offer.languages'.tr,
                      fontSizeTitle: AppSize.s16,
                      fontWeightTitle: FontWeight.w600,
                      inputTitleMarginBottom: AppSize.s6,
                      // validatorFunction: (_) => Validator().notEmptyValidator(
                      //   controller.selectedLanguage.value.label ?? '',
                      // ),
                      dialogType: DialogType.bottomSheetDialog,
                      dialogWidget: Container(
                        height: getHeight,
                        decoration: const ShapeDecoration(
                          color: ColorsManager.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                AppSize.s16,
                              ),
                              topRight: Radius.circular(
                                AppSize.s16,
                              ),
                            ),
                          ),
                        ),
                        child: Obx(
                          () => controller.languageListForSearch.isNotEmpty
                              ? FieldListMultipleSelector(
                                  inputHintText: 'core.search'.tr,
                                  dataListforSelected:
                                      controller.languageListForSearch,
                                  selectedItems:
                                      controller.languageListInFilter,
                                  onTap: (field) {
                                    controller
                                        .addingOrRemovingFieldInFieldListToBeSearch(
                                      list: controller.languageListInFilter,
                                      fieldValue: field,
                                    );
                                  },
                                )
                              : const LoadingWidget(),
                        ),
                      ),
                      containerWidget: RowContentInputWidget(
                        centerWidget: CustomTextWidget(
                          text: 'offer.languages'.tr,
                          color: ColorsManager.grey400,
                          fontWeight: FontWeight.w400,
                          fontSize: AppSize.s16,
                        ),
                        suffixWidget: const Icon(
                          IconsManager.arrowDropDown,
                          color: ColorsManager.grey600,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        left: AppSize.s10,
                        right: AppSize.s10,
                      ),
                      child: Wrap(
                        children: [
                          for (var i = 0;
                              i < controller.languageListInFilter.length;
                              i++)
                            RemovableTextCardWidget(
                              text:
                                  '${controller.languageListInFilter[i].label}',
                              onRemove: () => controller
                                  .addingOrRemovingFieldInFieldListToBeSearch(
                                list: controller.languageListInFilter,
                                fieldValue: controller.languageListInFilter[i],
                              ),
                            )
                        ],
                      ),
                    ),
                    //===== Bottom of Languages Component =====//

                    // ///===== Top of Languages Component =====//
                    // CustomContainerWidget(
                    //   isBoxShadow: false,
                    //   leftTitle: 'offer.languages'.tr,
                    //   titleTopPadding: AppSize.s5,
                    //   titleFontSize: AppSize.s16,
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: controller.languageListForSearch
                    //         .map(
                    //           (e) => RowDataSelectionWidget.checkBox(
                    //             isClickingValue:
                    //                 controller.languageListInFilter.contains(e),
                    //             text: e.label,
                    //             onPressed: () {
                    //               controller
                    //                   .addingOrRemovingFieldInFieldListToBeSearch(
                    //                 list: controller.languageListInFilter,
                    //                 fieldValue: e,
                    //               );
                    //               // debugPrint(
                    //               //   'Languages on Click::${e.label}(${e.id})',
                    //               // );
                    //             },
                    //           ),
                    //         )
                    //         .toList(),
                    //   ),
                    // ),
                    // //===== Bottom of Languages Component =====//
                    // const SizedBox(height: 8.0),

                    ///===== Top of Location Component =====//
                    Container(
                      padding: const EdgeInsets.only(
                        left: AppSize.s10,
                        right: AppSize.s10,
                      ),
                      child: GestureDetector(
                        onTap: () async {
                          controller.placeDetail.value =
                              (await showSearchFunc(context))!;
                        },
                        child: AbsorbPointer(
                          child: CustomTextInput(
                            controller: controller.addressCtrl,
                            inputTitle: 'offer.location'.tr,
                            fontSizeTitle: AppSize.s16,
                            fontWeightTitle: FontWeight.w600,
                            hintText:
                                controller.placeDetail.value.fullAddress ??
                                    'Null',
                            hintTextColor: ColorsManager.black,
                            isFilled: true,
                            isReadOnly: true,
                            topContentPadding: 12.0,
                            bottomContentPadding: 12.0,
                            topPadding: AppSize.s12,
                            // counter: true,
                            maxLines: 5,
                            maxLength: 150,
                            keyboardType: TextInputType.multiline,
                          ),
                        ),
                      ),
                    ),
                    // CustomContainerWidget(
                    //   isBoxShadow: false,
                    //   // topMargin: AppSize.s12,
                    //   // bottomMargin: AppSize.s12,
                    //   leftTitle: 'offer.location'.tr,
                    //   titleTopPadding: AppSize.s5,
                    //   titleFontSize: AppSize.s16,
                    //   child: Container(
                    //     padding: const EdgeInsets.symmetric(
                    //       vertical: 8.0,
                    //       horizontal: 8.0,
                    //     ),
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         CustomTextWidget(
                    //           text: 'profile.country'.tr,
                    //           // marginTop: AppSize.s12,
                    //           textAlign: TextAlign.left,
                    //           // marginBottom: AppSize.s4,
                    //         ),
                    //         const SizedBox(
                    //           height: 3.0,
                    //         ),
                    //         GestureDetector(
                    //           onTap: () => Get.bottomSheet(
                    //             Container(
                    //               height: getHeight,
                    //               decoration: const ShapeDecoration(
                    //                 color: ColorsManager.white,
                    //                 shape: RoundedRectangleBorder(
                    //                   borderRadius: BorderRadius.only(
                    //                     topLeft: Radius.circular(
                    //                       16,
                    //                     ),
                    //                     topRight: Radius.circular(
                    //                       16,
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //               child: CountryListSelector(
                    //                 showPhoneCode: false,
                    //                 countrylist: countryList,
                    //                 selectedCountry: controller
                    //                     .selectedCountryInFilter.value,
                    //                 onTap: (country) {
                    //                   controller.selectedCountryOnClick(
                    //                     country,
                    //                   );
                    //                   Get.back();
                    //                 },
                    //               ),
                    //             ),
                    //           ),
                    //           child: Container(
                    //             alignment: Alignment.centerLeft,
                    //             padding: EdgeInsets.zero,
                    //             child: FormField(
                    //               // validator: (_) =>
                    //               //     controller.isPhoneNumberValidate(),
                    //               builder: (
                    //                 FormFieldState<String> state,
                    //               ) {
                    //                 return InputDecorator(
                    //                   // alignedDropdown: true,
                    //                   decoration: InputDecoration(
                    //                     contentPadding:
                    //                         const EdgeInsets.fromLTRB(
                    //                       4,
                    //                       0,
                    //                       4,
                    //                       0,
                    //                     ),
                    //                     fillColor: ColorsManager.grey100,
                    //                     filled: true,
                    //                     border: OutlineInputBorder(
                    //                       borderRadius: BorderRadius.circular(
                    //                         AppSize.s8,
                    //                       ),
                    //                     ),
                    //                     errorText: state.hasError
                    //                         ? state.errorText
                    //                         : null,
                    //                     enabledBorder: OutlineInputBorder(
                    //                       borderRadius: BorderRadius.circular(
                    //                         AppSize.s8,
                    //                       ),
                    //                       borderSide: const BorderSide(
                    //                         color: ColorsManager.grey100,
                    //                       ),
                    //                     ),
                    //                     errorBorder: OutlineInputBorder(
                    //                       borderRadius: BorderRadius.circular(
                    //                         AppSize.s8,
                    //                       ),
                    //                       borderSide: const BorderSide(
                    //                         color: ColorsManager.red900,
                    //                       ),
                    //                     ),
                    //                     focusedBorder: OutlineInputBorder(
                    //                       borderRadius: BorderRadius.circular(
                    //                         AppSize.s8,
                    //                       ),
                    //                       borderSide: const BorderSide(
                    //                         color: ColorsManager.grey300,
                    //                       ),
                    //                     ),
                    //                   ),
                    //                   child: Obx(
                    //                     () => controller.selectedCountryInFilter
                    //                                 .value.name ==
                    //                             null
                    //                         ? Row(
                    //                             mainAxisAlignment:
                    //                                 MainAxisAlignment
                    //                                     .spaceBetween,
                    //                             children: [
                    //                               CustomTextWidget(
                    //                                 marginLeft: AppSize.s8,
                    //                                 text: 'profile.country'.tr,
                    //                                 color:
                    //                                     ColorsManager.grey400,
                    //                                 fontWeight: FontWeight.w400,
                    //                                 fontSize: 16.0,
                    //                               ),
                    //                               const Icon(
                    //                                 Icons.arrow_drop_down,
                    //                                 color:
                    //                                     ColorsManager.grey600,
                    //                               ),
                    //                             ],
                    //                           )
                    //                         : Row(
                    //                             children: [
                    //                               SizedBox(
                    //                                 height: 15.0,
                    //                                 child: CircleFlag(
                    //                                   controller
                    //                                       .selectedCountryInFilter
                    //                                       .value
                    //                                       .isoCode
                    //                                       .toString(),
                    //                                 ),
                    //                               ),
                    //                               Expanded(
                    //                                 child: CustomTextWidget(
                    //                                   marginLeft: AppSize.s8,
                    //                                   text: controller
                    //                                       .selectedCountryInFilter
                    //                                       .value
                    //                                       .name,
                    //                                   color:
                    //                                       ColorsManager.black,
                    //                                   fontSize: 16.0,
                    //                                 ),
                    //                               ),
                    //                               const Icon(
                    //                                 Icons.arrow_drop_down,
                    //                                 color:
                    //                                     ColorsManager.grey600,
                    //                               ),
                    //                             ],
                    //                           ),
                    //                   ),
                    //                 );
                    //               },
                    //             ),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    //===== Bottom of Location Component =====//
                    const SizedBox(height: 8.0),
                  ],
                ),
              ),
            ),
            //===== Bottom Body/Content Component =====//
            const Divider(
              height: 1.0,
              color: ColorsManager.grey,
            ),

            ///===== Top of Button Actions List Component =====//
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ///===== Top of Clear All Button Component =====//
                Expanded(
                  flex: 50,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: CustomMaterialButton(
                      buttonColor: ColorsManager.white,
                      elevation: 0.0,
                      text: buttonLabel1 ?? 'offer.clearAllBtn'.tr,
                      textColor: ColorsManager.primaryBlue,
                      fontSize: 14,
                      onPressed: () {
                        controller.clearAllFilterToBeSearch();
                      },
                    ),
                  ),
                ),
                //===== Bottom of Clear All Button Component =====//

                ///===== Top of Dismiss Button Component =====//
                Expanded(
                  flex: 25,
                  child: CustomMaterialButton(
                    buttonColor: ColorsManager.white,
                    elevation: 0.0,
                    text: buttonLabel2 ?? 'offer.dismissBtn'.tr,
                    textColor: ColorsManager.primaryBlue,
                    fontSize: 14,
                    onPressed: () {
                      controller.dismissFilter();
                      Get.back();
                    },
                  ),
                ),
                //===== Bottom of Dismiss Button Component =====//

                ///===== Top of Apply Button Component =====//
                Expanded(
                  flex: 25,
                  child: CustomMaterialButton(
                    childWidget: CustomTextWidget(
                      textAlign: TextAlign.left,
                      text: buttonLabel3 ?? 'offer.applyBtn'.tr,
                    ),
                    buttonColor: ColorsManager.white,
                    elevation: 0.0,
                    onPressed: () {
                      controller.applyFilterToBeSearch();
                      Get.back();
                    },
                  ),
                ),
                //===== Bottom of Apply Button Component =====//
              ],
            ),
            //===== Bottom of Button Actions List Fields Component =====//
          ],
        ),
      ),
    );
  }
}
