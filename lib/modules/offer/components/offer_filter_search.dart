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
                      inputTitle: 'jobTitle'.tr,
                      fontSizeTitle: AppSize.s16,
                      fontWeightTitle: FontWeight.w600,
                      hintText: 'searchJobTitle'.tr,
                      isFilled: true,
                      // validator: Validator().notEmptyValidator,
                    ),
                    //===== Bottom of Job Title Component =====//
                    const SizedBox(height: 8.0),

                    ///===== Top of Workplace Type Component =====//
                    CustomContainerWidget(
                      isBoxShadow: false,
                      leftTitle: 'workplaceType'.tr,
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
                            text: 'onSite'.tr,
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
                            text: 'remote'.tr,
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
                            text: 'both'.tr,
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

                    ///===== Top of Job Types Component =====//
                    CustomContainerWidget(
                      isBoxShadow: false,
                      leftTitle: 'jobTypes'.tr,
                      titleTopPadding: AppSize.s5,
                      titleFontSize: AppSize.s16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: controller.listJobOfferTypes
                            .map(
                              (e) => RowDataSelectionWidget.checkBox(
                                isClickingValue: controller.typesListInFilter
                                    .where((item) => item.id == e.id)
                                    .isNotEmpty,
                                // controller.typesListInFilter.contains(e),
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
                    //===== Bottom of Job Types Component =====//
                    const SizedBox(height: 8.0),

                    ///===== Top of Fields Component =====//
                    ContainerDialogWidget(
                      leftPadding: AppSize.s10,
                      rightPadding: AppSize.s10,
                      inputTitle: 'fields'.tr,
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
                                  inputHintText: 'search'.tr,
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
                          text: 'fields'.tr,
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
                    // const SizedBox(height: 8.0),

                    ///===== Top of Languages Component =====//
                    ContainerDialogWidget(
                      leftPadding: AppSize.s10,
                      rightPadding: AppSize.s10,
                      inputTitle: 'languages'.tr,
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
                                  inputHintText: 'search'.tr,
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
                          text: 'languages'.tr,
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
                    // const SizedBox(height: 8.0),

                    ///===== Top of Availabilities Tags Component =====//
                    ContainerDialogWidget(
                      leftPadding: AppSize.s10,
                      rightPadding: AppSize.s10,
                      inputTitle: 'workAvailability'.tr, //'timeSlots'.tr,
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
                          () => controller
                                  .availabilitiesTagListForSearch.isNotEmpty
                              ? FieldListMultipleSelector(
                                  inputHintText: 'search'.tr,
                                  dataListforSelected:
                                      controller.availabilitiesTagListForSearch,
                                  selectedItems:
                                      controller.availabilitiesTagListInFilter,
                                  onTap: (field) {
                                    controller
                                        .addingOrRemovingFieldInFieldListToBeSearch(
                                      list: controller
                                          .availabilitiesTagListInFilter,
                                      fieldValue: field,
                                    );
                                  },
                                )
                              : const LoadingWidget(),
                        ),
                      ),
                      containerWidget: RowContentInputWidget(
                        centerWidget: CustomTextWidget(
                          text: 'workAvailability'.tr,
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
                              i <
                                  controller
                                      .availabilitiesTagListInFilter.length;
                              i++)
                            RemovableTextCardWidget(
                              text:
                                  '${controller.availabilitiesTagListInFilter[i].label}',
                              onRemove: () => controller
                                  .addingOrRemovingFieldInFieldListToBeSearch(
                                list: controller.availabilitiesTagListInFilter,
                                fieldValue:
                                    controller.availabilitiesTagListInFilter[i],
                              ),
                            )
                        ],
                      ),
                    ),
                    //===== Bottom of Availabilities Tags Component =====//
                    // const SizedBox(height: 8.0),

                    ///===== Top of Location Component =====//
                    Container(
                      padding: const EdgeInsets.only(
                        left: AppSize.s10,
                        right: AppSize.s10,
                      ),
                      child: Stack(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              controller.placeDetail.value =
                                  (await showSearchFunc(context))!;
                            },
                            child: AbsorbPointer(
                              child: Stack(
                                children: [
                                  // Container(
                                  //   alignment: Alignment.centerRight,
                                  //   padding:
                                  //       const EdgeInsets.only(top: AppSize.s16),
                                  //   child: const Icon(
                                  //     Icons.cancel,
                                  //     color: ColorsManager.red,
                                  //     size: AppSize.s16,
                                  //   ),
                                  // ),
                                  CustomTextInput(
                                    controller: controller.addressCtrl,
                                    inputTitle: 'location'.tr,
                                    fontSizeTitle: AppSize.s16,
                                    fontWeightTitle: FontWeight.w600,
                                    hintText: controller
                                            .placeDetail.value.fullAddress ??
                                        '',
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
                                    // suffixIcon: const Icon(
                                    //   Icons.cancel,
                                    //   color: ColorsManager.red,
                                    //   size: AppSize.s16,
                                    // ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (controller.placeDetail.value.fullAddress ==
                                  null ||
                              controller.placeDetail.value.fullAddress == '')
                            Container()
                          else
                            Positioned(
                              top: 50,
                              left: 0,
                              right: 10,
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                  onTap: () async {
                                    controller.clearPlaceDetail();
                                  },
                                  child: const Icon(
                                    Icons.cancel,
                                    color: ColorsManager.red,
                                    size: AppSize.s20,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    //===== Bottom of Location Component =====//
                    const SizedBox(height: 8.0),

                    ///===== Top of Radius Component =====//
                    RowContentInputWidget(
                      centerWidgetFlex: 50,
                      centerWidget: CustomTextWidget(
                        marginLeft: AppSize.s12,
                        textAlign: TextAlign.center,
                        text:
                            '${'radius'.tr}(Km): ${controller.radiusRxInt.value}',
                        fontSize: AppSize.s16,
                      ),
                      suffixWidgetFlex: 50,
                      suffixWidget: Slider(
                        value: controller.radiusRxInt.value.toDouble(),
                        min: 5.0,
                        max: 100.0,
                        divisions: 100,
                        activeColor: ColorsManager.primary,
                        inactiveColor: ColorsManager.grey300,
                        thumbColor: ColorsManager.primary,
                        label: '${controller.radiusRxInt.value}',
                        onChanged: (double newValue) {
                          controller.radiusRxInt.value = newValue.toInt();
                        },
                      ),
                    ),
                    //===== Bottom of Radius Component =====//
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
            Padding(
              padding:
                  const EdgeInsets.only(left: AppSize.s8, right: AppSize.s8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ///===== Top of Clear All Button Component =====//
                  Expanded(
                    flex: 40,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: CustomMaterialButton(
                        buttonColor: ColorsManager.white,
                        elevation: 0.0,
                        text: buttonLabel1 ?? 'clearAll'.tr,
                        textColor: ColorsManager.redAccent700,
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
                      text: buttonLabel2 ?? 'close'.tr,
                      textColor: ColorsManager.grey900,
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
                    flex: 35,
                    child: CustomMaterialButton(
                      childWidget: CustomTextWidget(
                        textAlign: TextAlign.left,
                        text: buttonLabel3 ?? 'applyFilter'.tr,
                        color: ColorsManager.white,
                      ),
                      // buttonColor: ColorsManager.primary,
                      elevation: 1.0,
                      onPressed: () {
                        controller.applyFilterToBeSearch();
                        Get.back();
                      },
                    ),
                  ),
                  //===== Bottom of Apply Button Component =====//
                ],
              ),
            ),
            //===== Bottom of Button Actions List Fields Component =====//
          ],
        ),
      ),
    );
  }
}
