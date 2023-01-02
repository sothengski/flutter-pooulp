import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import '../../data/data.dart';
import '../modules.dart';

class AddOrEditLanguageUsagePage extends GetView<LanguageUsageController> {
  const AddOrEditLanguageUsagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///===== Top of appBar Component =====//
      appBar: CustomAppBar(
        title: 'languages'.tr,
      ),
      //===== Bottom of appBar Component =====//

      ///===== Top of body Component =====//
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(AppSize.s16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ///===== Top of Mother Tongue Language Selection Component =====//
              Form(
                key: controller.editMontherTongueLangaugeFormKey,
                child: Wrap(
                  children: [
                    ContainerDialogWidget(
                      inputTitle: 'motherTongue'.tr,
                      validatorFunction: (_) => Validator().notEmptyValidator(
                        controller.selectedMotherTongueLanguage.value.label ??
                            '',
                      ),
                      dialogType: DialogType
                          .bottomSheetDialog, // controller: controller,
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
                          () => controller.languageListForSelection.isNotEmpty
                              ? FieldListSelector(
                                  inputHintText: 'search'.tr,
                                  dataListforSelected:
                                      controller.languageListForSelection,
                                  selectedItem: controller
                                      .selectedMotherTongueLanguage.value,
                                  onTap: (field) {
                                    controller.selectedMotherTongueLanguage
                                            .value =
                                        controller.selectedLanguageOnClick(
                                      selectedItem: field,
                                    );
                                    Navigator.pop(
                                      context,
                                      true,
                                    );
                                  },
                                )
                              : const LoadingWidget(),
                        ),
                      ),
                      containerWidget: Obx(
                        () =>
                            controller.selectedMotherTongueLanguage.value.id ==
                                    null
                                ? RowContentInputWidget(
                                    centerWidget: CustomTextWidget(
                                      text: 'languageHint'.tr,
                                      color: ColorsManager.grey400,
                                      fontWeight: FontWeight.w400,
                                      fontSize: AppSize.s16,
                                    ),
                                    suffixWidget: const Icon(
                                      IconsManager.arrowDropDown,
                                      color: ColorsManager.grey600,
                                    ),
                                  )
                                : RowContentInputWidget(
                                    centerWidget: CustomTextWidget(
                                      text: controller
                                          .selectedMotherTongueLanguage
                                          .value
                                          .label,
                                      color: ColorsManager.black,
                                      fontSize: AppSize.s16,
                                    ),
                                    suffixWidget: const Icon(
                                      IconsManager.arrowDropDown,
                                      color: ColorsManager.grey600,
                                    ),
                                  ),
                      ),
                    ),

                    //===== Bottom of Mother Tongue Language Selection Component =====//

                    ///===== Top of Add Language Button Component =====//
                    Obx(
                      () => CustomMaterialButton(
                        topPadding: AppSize.s20,
                        bottomPadding: AppSize.s20,
                        text: 'add'.tr,
                        childWidget:
                            controller.isSubmitBtnProcessing.value == true
                                ? const SizedBox(
                                    height: 40,
                                    child: LoadingWidget(
                                      isTreeBounceLoading: true,
                                      color: ColorsManager.white,
                                    ),
                                  )
                                : null,
                        fontSize: AppSize.s20,
                        buttonWidth: getWidth,
                        onPressed: () {
                          unFocusKeyBoard(context);
                          if (!controller.isSubmitBtnProcessing.value == true) {
                            controller.saveButtonOnClick(
                              formKey:
                                  controller.editMontherTongueLangaugeFormKey,
                              languageTagId: controller
                                  .selectedMotherTongueLanguage.value.id,
                              languageProficiencyLevel: 4,
                            );
                          }
                        },
                      ),
                    ),
                    //===== Bottom of Add Language Button Component =====//
                  ],
                ),
              ),
              const Divider(
                height: 0.5,
                thickness: 0.5,
                color: ColorsManager.primaryBlue,
              ),

              ///===== Top of Language Selection Component =====//
              Form(
                key: controller.editLangaugeFormKey,
                child: Wrap(
                  children: [
                    ContainerDialogWidget(
                      inputTitle: 'otherLanguage'.tr,
                      validatorFunction: (_) => Validator().notEmptyValidator(
                        controller.selectedLanguage.value.label ?? '',
                      ),
                      dialogType: DialogType
                          .bottomSheetDialog, // controller: controller,
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
                          () => controller.languageListForSelection.isNotEmpty
                              ? FieldListSelector(
                                  inputHintText: 'search'.tr,
                                  dataListforSelected:
                                      controller.languageListForSelection,
                                  selectedItem:
                                      controller.selectedLanguage.value,
                                  onTap: (field) {
                                    controller.selectedLanguage.value =
                                        controller.selectedLanguageOnClick(
                                      selectedItem: field,
                                    );
                                    Navigator.pop(
                                      context,
                                      true,
                                    );
                                  },
                                )
                              : const LoadingWidget(),
                        ),
                      ),
                      containerWidget: Obx(
                        () => controller.selectedLanguage.value.id == null
                            ? RowContentInputWidget(
                                centerWidget: CustomTextWidget(
                                  text: 'languageHint'.tr,
                                  color: ColorsManager.grey400,
                                  fontWeight: FontWeight.w400,
                                  fontSize: AppSize.s16,
                                ),
                                suffixWidget: const Icon(
                                  IconsManager.arrowDropDown,
                                  color: ColorsManager.grey600,
                                ),
                              )
                            : RowContentInputWidget(
                                centerWidget: CustomTextWidget(
                                  text: controller.selectedLanguage.value.label,
                                  color: ColorsManager.black,
                                  fontSize: AppSize.s16,
                                ),
                                suffixWidget: const Icon(
                                  IconsManager.arrowDropDown,
                                  color: ColorsManager.grey600,
                                ),
                              ),
                      ),
                    ),
                    //===== Bottom of Language Selection Component =====//

                    ///===== Top of Types Selection Component =====//
                    ContainerDialogWidget(
                      inputTitle: 'types'.tr,
                      inputTitleMarginTop: AppSize.s16,
                      validatorFunction: (_) => Validator().notEmptyValidator(
                        controller.selectedlanguageTypes.isEmpty ? '' : 'a',
                      ),
                      dialogWidget: MaterialDialogWidget(
                        title: 'types'.tr,
                        contentWidget: ListView.separated(
                          shrinkWrap: true,
                          itemCount: controller.languageTypeList.length,
                          itemBuilder: (context, index) {
                            return Obx(
                              () => RowDataSelectionWidget.checkBox(
                                isLeftSideText: false,
                                isClickingValue:
                                    controller.selectedlanguageTypes
                                        .where(
                                          (p0) =>
                                              p0.label ==
                                              controller.languageTypeList[index]
                                                  .label,
                                        )
                                        .isNotEmpty,
                                text: controller.languageTypeList[index].label,
                                onPressed: () {
                                  addingOrRemovingFieldInFieldList(
                                    list: controller.selectedlanguageTypes,
                                    fieldValue:
                                        controller.languageTypeList[index],
                                  );
                                  Navigator.pop(
                                    context,
                                    true,
                                  );
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
                        () => RowContentInputWidget(
                          centerWidget:
                              controller.selectedlanguageTypes.isNotEmpty
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                        top: AppSize.s4,
                                        bottom: AppSize.s4,
                                      ),
                                      child: Wrap(
                                        children: [
                                          for (var i = 0;
                                              i <
                                                  controller
                                                      .selectedlanguageTypes
                                                      .length;
                                              i++)
                                            RemovableTextCardWidget(
                                              text:
                                                  '${controller.selectedlanguageTypes[i].label}',
                                              onRemove: () =>
                                                  addingOrRemovingFieldInFieldList(
                                                list: controller
                                                    .selectedlanguageTypes,
                                                fieldValue: controller
                                                    .selectedlanguageTypes[i],
                                              ),
                                            )
                                        ],
                                      ),
                                    )
                                  : CustomTextWidget(
                                      text: 'types'.tr,
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
                    ),
                    //===== Bottom of Types Selection Component =====//

                    ///===== Top of Proficiency Selection Component =====//
                    ContainerDialogWidget(
                      inputTitle: 'proficiency'.tr,
                      inputTitleMarginTop: AppSize.s16,
                      validatorFunction: (_) => Validator().notEmptyValidator(
                        controller.selectedProficiency.value.label ?? '',
                      ),
                      dialogWidget: MaterialDialogWidget(
                        title: 'proficiencyHint'.tr,
                        contentWidget: ListView.separated(
                          shrinkWrap: true,
                          itemCount: controller.proficiencyList.length,
                          itemBuilder: (context, index) {
                            return Obx(
                              () => RowDataSelectionWidget.radioButton(
                                isLeftSideText: false,
                                isClickingValue: stringsComparation(
                                  object1: controller
                                      .proficiencyList[index].label!
                                      .toLowerCase(),
                                  object2: controller
                                      .selectedProficiency.value.label!
                                      .toLowerCase(),
                                ),
                                text: translateStateWords(
                                  stateWord:
                                      controller.proficiencyList[index].label,
                                ),
                                onPressed: () {
                                  controller.selectedProficiency.value =
                                      controller.selectedLanguageOnClick(
                                    selectedItem:
                                        controller.proficiencyList[index],
                                  );
                                  Navigator.pop(
                                    context,
                                    true,
                                  );
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
                        () => controller.selectedProficiency.value.label == ''
                            ? RowContentInputWidget(
                                centerWidget: CustomTextWidget(
                                  text: 'proficiencyHint'.tr,
                                  // marginLeft: AppSize.s8,
                                  color: ColorsManager.grey400,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.0,
                                ),
                                suffixWidget: const Icon(
                                  Icons.arrow_drop_down,
                                  color: ColorsManager.grey600,
                                ),
                              )
                            : RowContentInputWidget(
                                centerWidget: CustomTextWidget(
                                  //marginLeft: 4.0,
                                  text: translateStateWords(
                                    stateWord: controller
                                        .selectedProficiency.value.label,
                                  ),
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
                    //===== Bottom of Proficiency Selection Component =====//

                    ///===== Top of Add Language Button Component =====//
                    Obx(
                      () => CustomMaterialButton(
                        topPadding: AppSize.s20,
                        bottomPadding: AppSize.s20,
                        text: 'add'.tr,
                        childWidget:
                            controller.isSubmitBtnProcessing.value == true
                                ? const SizedBox(
                                    height: 40,
                                    child: LoadingWidget(
                                      isTreeBounceLoading: true,
                                      color: ColorsManager.white,
                                    ),
                                  )
                                : null,
                        fontSize: AppSize.s20,
                        buttonWidth: getWidth,
                        onPressed: () {
                          unFocusKeyBoard(context);
                          if (!controller.isSubmitBtnProcessing.value == true) {
                            controller.saveButtonOnClick(
                              formKey: controller.editLangaugeFormKey,
                              languageTagId:
                                  controller.selectedLanguage.value.id,
                              languageProficiencyLevel:
                                  controller.selectedProficiency.value.level,
                              spoken: controller.selectedlanguageTypes
                                  .where((element) => element.id == 1)
                                  .isNotEmpty,
                              written: controller.selectedlanguageTypes
                                  .where((element) => element.id == 2)
                                  .isNotEmpty,
                            );
                          }
                        },
                      ),
                    ),
                    //===== Bottom of Add Language Button Component =====//
                  ],
                ),
              ),

              const Divider(
                height: 1,
                thickness: 1,
                color: ColorsManager.primaryBlue,
              ),

              ///===== Top of User Language List Component =====//
              Obx(
                () => Container(
                  padding: const EdgeInsets.fromLTRB(
                    0.0,
                    16.0,
                    0.0,
                    16.0,
                  ),
                  child: controller.profileController.studentInfoRepsonse.value
                          .spokenLanguages!.isEmpty
                      ? CustomTextWidget(
                          text: 'noLanguagesFound'.tr,
                        )
                      : Wrap(
                          children: [
                            Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: CustomTextWidget(
                                    text: 'motherTongue'.tr,
                                    fontSize: AppSize.s20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const ScrollPhysics(),
                                  padding:
                                      const EdgeInsets.only(bottom: AppSize.s4),
                                  itemCount: controller
                                      .profileController
                                      .studentInfoRepsonse
                                      .value
                                      .spokenLanguages!
                                      .where((element) => element.level == 4)
                                      .length,
                                  itemBuilder: (context, index) {
                                    final FieldModel languageItem = controller
                                        .profileController
                                        .studentInfoRepsonse
                                        .value
                                        .spokenLanguages!
                                        .where((element) => element.level == 4)
                                        .first;
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: AppSize.s8,
                                      ),
                                      // width: double.infinity,
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Wrap(
                                                children: [
                                                  CustomIconButtonWidget(
                                                    iconData:
                                                        Icons.remove_circle,
                                                    iconColor:
                                                        ColorsManager.red,
                                                    isConstraints: true,
                                                    iconSize: AppSize.s20,
                                                    onClick: () {
                                                      controller
                                                          .makeRequestToSpokenLanguageAPI(
                                                        spokenLanguageId:
                                                            languageItem.id,
                                                        operation: Keys
                                                            .deleteOperation,
                                                      );
                                                    },
                                                  ),
                                                  CustomTextWidget(
                                                    text:
                                                        '${languageItem.label}',
                                                    fontSize: AppSize.s16,
                                                    fontWeight: FontWeight.w500,
                                                    marginLeft: AppSize.s10,
                                                    marginTop: AppSize.s8,
                                                    marginBottom: AppSize.s20,
                                                  ),
                                                ],
                                              ),
                                              // CustomBoxWidget(
                                              //   leftPadding: AppSize.s12,
                                              //   child: GestureDetector(
                                              //     onTap: () {
                                              //       Get.dialog(
                                              //         MaterialDialogWidget(
                                              //           title: 'proficiencyHint'
                                              //               .tr,
                                              //           contentWidget:
                                              //               ListView.separated(
                                              //             shrinkWrap: true,
                                              //             itemCount: controller
                                              //                 .proficiencyList
                                              //                 .length,
                                              //             itemBuilder: (
                                              //               context,
                                              //               index,
                                              //             ) {
                                              //               return Obx(
                                              //                 () => RowDataSelectionWidget
                                              //                     .radioButton(
                                              //                   isLeftSideText:
                                              //                       false,
                                              //                   isClickingValue:
                                              //                       intComparation(
                                              //                     object1: controller
                                              //                         .proficiencyList[
                                              //                             index]
                                              //                         .level,
                                              //                     object2:
                                              //                         languageItem
                                              //                             .level,
                                              //                   ),
                                              //                   text:
                                              //                       translateStateWords(
                                              //                     stateWord:
                                              //                         '${controller.proficiencyList[index].label}',
                                              //                   ),
                                              //                   onPressed: () {
                                              //                     controller
                                              //                         .makeRequestToSpokenLanguageAPI(
                                              //                       spokenLanguageId:
                                              //                           languageItem
                                              //                               .id,
                                              //                       spokenLanguageData:
                                              //                           FieldModel(
                                              //                         level: controller
                                              //                             .proficiencyList[
                                              //                                 index]
                                              //                             .level,
                                              //                         videoUrl:
                                              //                             languageItem.videoUrl ??
                                              //                                 '',
                                              //                       ),
                                              //                       operation: Keys
                                              //                           .editOperation,
                                              //                     );
                                              //                     Navigator.pop(
                                              //                       context,
                                              //                       true,
                                              //                     );
                                              //                   },
                                              //                 ),
                                              //               );
                                              //             },
                                              //             separatorBuilder: (
                                              //               context,
                                              //               index,
                                              //             ) {
                                              //               return const Divider(
                                              //                 height: 1.0,
                                              //                 color:
                                              //                     ColorsManager
                                              //                         .grey300,
                                              //               );
                                              //             },
                                              //           ),
                                              //         ),
                                              //       );
                                              //     },
                                              //     child: Row(
                                              //       // crossAxisAlignment:
                                              //       //     CrossAxisAlignment.end,
                                              //       children: [
                                              //         CustomTextWidget(
                                              //           textAlign:
                                              //               TextAlign.center,
                                              //           text:
                                              //               translateStateWords(
                                              //             stateWord:
                                              //                 '${languageItem.getLabelProficiencyLevel}',
                                              //           ),
                                              //           fontSize: AppSize.s16,
                                              //           fontWeight:
                                              //               FontWeight.w400,
                                              //           // marginTop: AppSize.s8,
                                              //           // marginBottom: AppSize.s24,
                                              //         ),
                                              //         const Icon(
                                              //           Icons.arrow_drop_down,
                                              //           color: ColorsManager
                                              //               .grey600,
                                              //         ),
                                              //       ],
                                              //     ),
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                          Obx(
                                            () => Container(
                                              padding:
                                                  controller.isUpdating.value ==
                                                          false
                                                      ? EdgeInsets.zero
                                                      : EdgeInsets.zero,
                                              child: UrlLanguageInput(
                                                controller: controller,
                                                languageItem: languageItem,
                                                index: index,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: CustomTextWidget(
                                    text: 'otherLanguages'.tr,
                                    fontSize: AppSize.s20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const ScrollPhysics(),
                                  itemCount: controller
                                      .profileController
                                      .studentInfoRepsonse
                                      .value
                                      .spokenLanguages!
                                      .length,
                                  itemBuilder: (context, index) {
                                    final FieldModel languageItem = controller
                                        .profileController
                                        .studentInfoRepsonse
                                        .value
                                        .spokenLanguages![index];
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: AppSize.s8,
                                      ),
                                      // width: double.infinity,
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Wrap(
                                                children: [
                                                  CustomIconButtonWidget(
                                                    iconData:
                                                        Icons.remove_circle,
                                                    iconColor:
                                                        ColorsManager.red,
                                                    isConstraints: true,
                                                    iconSize: AppSize.s20,
                                                    onClick: () {
                                                      controller
                                                          .makeRequestToSpokenLanguageAPI(
                                                        spokenLanguageId:
                                                            languageItem.id,
                                                        operation: Keys
                                                            .deleteOperation,
                                                      );
                                                    },
                                                  ),
                                                  CustomTextWidget(
                                                    text:
                                                        '${languageItem.label}',
                                                    fontSize: AppSize.s16,
                                                    fontWeight: FontWeight.w500,
                                                    marginLeft: AppSize.s10,
                                                    marginTop: AppSize.s8,
                                                    marginBottom: AppSize.s20,
                                                  ),
                                                ],
                                              ),
                                              CustomBoxWidget(
                                                leftPadding: AppSize.s12,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Get.dialog(
                                                      MaterialDialogWidget(
                                                        title: 'proficiencyHint'
                                                            .tr,
                                                        contentWidget:
                                                            ListView.separated(
                                                          shrinkWrap: true,
                                                          itemCount: controller
                                                              .proficiencyList
                                                              .length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return Obx(
                                                              () => RowDataSelectionWidget
                                                                  .radioButton(
                                                                isLeftSideText:
                                                                    false,
                                                                isClickingValue:
                                                                    intComparation(
                                                                  object1: controller
                                                                      .proficiencyList[
                                                                          index]
                                                                      .level,
                                                                  object2:
                                                                      languageItem
                                                                          .level,
                                                                ),
                                                                text:
                                                                    translateStateWords(
                                                                  stateWord:
                                                                      '${controller.proficiencyList[index].label}',
                                                                ),
                                                                onPressed: () {
                                                                  controller
                                                                      .makeRequestToSpokenLanguageAPI(
                                                                    spokenLanguageId:
                                                                        languageItem
                                                                            .id,
                                                                    spokenLanguageData:
                                                                        FieldModel(
                                                                      level: controller
                                                                          .proficiencyList[
                                                                              index]
                                                                          .level,
                                                                      videoUrl:
                                                                          languageItem.videoUrl ??
                                                                              '',
                                                                    ),
                                                                    operation: Keys
                                                                        .editOperation,
                                                                  );
                                                                  Navigator.pop(
                                                                    context,
                                                                    true,
                                                                  );
                                                                },
                                                              ),
                                                            );
                                                          },
                                                          separatorBuilder:
                                                              (context, index) {
                                                            return const Divider(
                                                              height: 1.0,
                                                              color:
                                                                  ColorsManager
                                                                      .grey300,
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Row(
                                                    // crossAxisAlignment:
                                                    //     CrossAxisAlignment.end,
                                                    children: [
                                                      CustomTextWidget(
                                                        textAlign:
                                                            TextAlign.center,
                                                        text:
                                                            translateStateWords(
                                                          stateWord:
                                                              '${languageItem.getLabelProficiencyLevel}',
                                                        ),
                                                        fontSize: AppSize.s16,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        // marginTop: AppSize.s8,
                                                        // marginBottom: AppSize.s24,
                                                      ),
                                                      const Icon(
                                                        Icons.arrow_drop_down,
                                                        color: ColorsManager
                                                            .grey600,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Obx(
                                            () => Container(
                                              padding:
                                                  controller.isUpdating.value ==
                                                          false
                                                      ? EdgeInsets.zero
                                                      : EdgeInsets.zero,
                                              child: UrlLanguageInput(
                                                controller: controller,
                                                languageItem: languageItem,
                                                index: index,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                ),
              ),
              //===== Bottom of User Language List Component =====//
            ],
          ),
        ),
      ),
      //===== Bottom of body Component =====//

      ///===== Top of bottomNavigationBar Component =====//
      // bottomNavigationBar: Obx(
      //   () => CustomMaterialButton(
      //     leftPadding: AppSize.s12,
      //     rightPadding: AppSize.s12,
      //     bottomPadding: AppSize.s20,
      //     text: AppStrings.saveText,
      //     childWidget: controller.isSubmitBtnProcessing.value == true
      //         ? const SizedBox(
      //             height: 40,
      //             child: LoadingWidget(
      //               isTreeBounceLoading: true,
      //               color: ColorsManager.white,
      //             ),
      //           )
      //         : null,
      //     fontSize: AppSize.s20,
      //     buttonWidth: getWidth,
      //     onPressed: () {
      //       unFocusKeyBoard(context);
      //       if (!controller.isSubmitBtnProcessing.value == true) {
      //         controller.saveButtonOnClick();
      //       }
      //     },
      //   ),
      // ),
      //===== Bottom of bottomNavigationBar Component =====//
    );
  }
}

// ignore: must_be_immutable
class UrlLanguageInput extends StatelessWidget {
  UrlLanguageInput({
    Key? key,
    this.controller,
    required this.languageItem,
    this.index,
    this.vdoUrlCtrl,
  }) : super(key: key);

  final LanguageUsageController? controller;
  final FieldModel? languageItem;
  final int? index;
  TextEditingController? vdoUrlCtrl;

  @override
  Widget build(BuildContext context) {
    vdoUrlCtrl = TextEditingController(text: languageItem!.videoUrl);
    return Wrap(
      children: [
        if (languageItem!.videoUrl != null && languageItem!.selected == false)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 90,
                child: CustomTextWidget(
                  textAlign: TextAlign.left,
                  text: languageItem!.videoUrl ?? 'no link',
                  maxLine: 2,
                  fontSize: AppSize.s16,
                  fontWeight: FontWeight.w400,
                  textDecoration: TextDecoration.underline,
                  marginLeft: AppSize.s48,
                  // marginBottom: AppSize.s24,
                ),
              ),
              const SizedBox(
                width: AppSize.s8,
              ),
              Expanded(
                flex: 5,
                child: CustomIconButtonWidget(
                  padding: 0.0,
                  iconData: Icons.edit,
                  iconSize: AppSize.s20,
                  onClick: () {
                    controller!.isUpdating.value = switchingBooleanValue(
                      boolValue: controller!.isUpdating.value,
                    );
                    languageItem!.selected = true;
                  },
                ),
              ),
            ],
          )
        else
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 5,
                  child: languageItem!.videoUrl == null
                      ? Container()
                      : CustomIconButtonWidget(
                          padding: 0.0,
                          iconData: Icons.close,
                          iconColor: ColorsManager.red,
                          iconSize: AppSize.s20,
                          onClick: () {
                            languageItem!.selected = false;
                            controller!.isUpdating.value =
                                switchingBooleanValue(
                              boolValue: controller!.isUpdating.value,
                            );
                          },
                        ),
                ),
                const SizedBox(
                  width: AppSize.s8,
                ),
                Flexible(
                  flex: 90,
                  child: CustomTextInput(
                    controller: vdoUrlCtrl,
                    // controller: controller!.vdoUrlListTextCtrl[index!],
                    // leftPadding: AppSize.s48,
                    hintText: 'addLanguageVideoPresentationLink'.tr,
                  ),
                ),
                const SizedBox(
                  width: AppSize.s8,
                ),
                Expanded(
                  flex: 5,
                  child: CustomIconButtonWidget(
                    padding: 0.0,
                    iconData: Icons.check,
                    iconColor: ColorsManager.green,
                    iconSize: AppSize.s20,
                    onClick: () {
                      controller!.makeRequestToSpokenLanguageAPI(
                        spokenLanguageId: languageItem!.id,
                        spokenLanguageData: FieldModel(
                          level: languageItem!.level,
                          videoUrl: vdoUrlCtrl!.text,
                          // controller!.vdoUrlListTextCtrl[index!].text,
                        ),
                        operation: Keys.editOperation,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
