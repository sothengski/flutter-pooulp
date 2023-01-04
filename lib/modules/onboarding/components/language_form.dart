import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pooulp_flutter/data/data.dart';

import '../../../core/core.dart';
import '../../modules.dart';

class LanguageForm extends GetView<OnboardingController> {
  const LanguageForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.s8),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            ///===== Top of Mother Tongue Language Selection Component =====//
            Form(
              // key: controller.editMontherTongueLangaugeFormKey,
              child: Wrap(
                children: [
                  ContainerDialogWidget(
                    inputTitle: 'motherTongue'.tr,
                    inputTitleColor: ColorsManager.white,
                    // validatorFunction: (_) => Validator().notEmptyValidator(
                    //   controller.selectedMotherTongueLanguage.value.label ?? '',
                    // ),
                    dialogType:
                        DialogType.bottomSheetDialog, // controller: controller,
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
                                  controller
                                          .selectedMotherTongueLanguage.value =
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
                      () => controller.selectedMotherTongueLanguage.value.id ==
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
                                    .selectedMotherTongueLanguage.value.label,
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
                  // Obx(
                  //   () =>
                  CustomMaterialButton(
                    topPadding: AppSize.s20,
                    bottomPadding: AppSize.s20,
                    text: 'add'.tr,
                    // childWidget: controller.isSubmitBtnProcessing.value == true
                    //     ? const SizedBox(
                    //         height: 40,
                    //         child: LoadingWidget(
                    //           isTreeBounceLoading: true,
                    //           color: ColorsManager.white,
                    //         ),
                    //       )
                    //     : null,
                    fontSize: AppSize.s20,
                    buttonWidth: getWidth,
                    onPressed: () {
                      unFocusKeyBoard(context);
                      controller.addOrRemoveLanguageOnClick(
                        languageId:
                            controller.selectedMotherTongueLanguage.value.id,
                        languageLabel:
                            controller.selectedMotherTongueLanguage.value.label,
                        languageProficiencyLevel: 4,
                      );
                    },
                  ),
                  // ),
                  //===== Bottom of Add Language Button Component =====//
                ],
              ),
            ),
            const Divider(
              height: 0.5,
              thickness: 0.5,
              color: ColorsManager.white,
            ),

            ///===== Top of Language Selection Component =====//
            Form(
              // key: controller.editLangaugeFormKey,
              child: Wrap(
                children: [
                  ContainerDialogWidget(
                    inputTitle: 'otherLanguage'.tr,
                    inputTitleColor: ColorsManager.white,
                    validatorFunction: (_) => Validator().notEmptyValidator(
                      controller.selectedLanguage.value.label ?? '',
                    ),
                    dialogType:
                        DialogType.bottomSheetDialog, // controller: controller,
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
                                selectedItem: controller.selectedLanguage.value,
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
                    inputTitleColor: ColorsManager.white,
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
                              isClickingValue: controller.selectedlanguageTypes
                                  .where(
                                    (p0) =>
                                        p0.label ==
                                        controller
                                            .languageTypeList[index].label,
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
                        centerWidget: controller
                                .selectedlanguageTypes.isNotEmpty
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
                                                .selectedlanguageTypes.length;
                                        i++)
                                      RemovableTextCardWidget(
                                        text:
                                            '${controller.selectedlanguageTypes[i].label}',
                                        onRemove: () =>
                                            addingOrRemovingFieldInFieldList(
                                          list:
                                              controller.selectedlanguageTypes,
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
                    inputTitleColor: ColorsManager.white,
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
                  // Obx(
                  //   () =>
                  CustomMaterialButton(
                    topPadding: AppSize.s20,
                    bottomPadding: AppSize.s20,
                    text: 'add'.tr,
                    fontSize: AppSize.s20,
                    buttonWidth: getWidth,
                    onPressed: () {
                      unFocusKeyBoard(context);
                      controller.addOrRemoveLanguageOnClick(
                        languageId: controller.selectedLanguage.value.id,
                        languageLabel: controller.selectedLanguage.value.label,
                        languageProficiencyLevel:
                            controller.selectedProficiency.value.level,
                        spoken: controller.selectedlanguageTypes
                            .where((element) => element.id == 1)
                            .isNotEmpty,
                        written: controller.selectedlanguageTypes
                            .where((element) => element.id == 2)
                            .isNotEmpty,
                      );
                      // if (!controller.isSubmitBtnProcessing.value == true) {
                      //   controller.saveButtonOnClick(
                      //     formKey: controller.editLangaugeFormKey,
                      //     languageTagId:
                      //         controller.selectedLanguage.value.id,
                      //     languageProficiencyLevel:
                      //         controller.selectedProficiency.value.level,
                      //     spoken: controller.selectedlanguageTypes
                      //         .where((element) => element.id == 1)
                      //         .isNotEmpty,
                      //     written: controller.selectedlanguageTypes
                      //         .where((element) => element.id == 2)
                      //         .isNotEmpty,
                      //   );
                      // }
                      controller.clearDataFromForm();
                    },
                  ),
                  // ),
                  //===== Bottom of Add Language Button Component =====//
                ],
              ),
            ),

            const Divider(
              height: 1,
              thickness: 1,
              color: ColorsManager.white,
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
                child: controller.languageSelectedList.isEmpty
                    ? CustomTextWidget(
                        text: 'noLanguagesFound'.tr,
                        color: ColorsManager.white,
                      )
                    : Wrap(
                        children: [
                          if (controller.languageSelectedList
                              .where((element) => element.level == 4)
                              .isEmpty)
                            Container()
                          else
                            Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: CustomTextWidget(
                                    text: 'motherTongue'.tr,
                                    color: ColorsManager.white,
                                    fontSize: AppSize.s20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const ScrollPhysics(),
                                  padding: const EdgeInsets.only(
                                    bottom: AppSize.s4,
                                  ),
                                  itemCount: controller
                                      .languageSelectedList
                                      // .where((element) => element.level == 4)
                                      .length,
                                  itemBuilder: (context, index) {
                                    final FieldModel languageItem =
                                        controller.languageSelectedList[index];
                                    // .where((element) => element.level == 4)
                                    // .first;
                                    return languageItem.level != 4
                                        ? Container()
                                        : Padding(
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
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Wrap(
                                                      children: [
                                                        CustomIconButtonWidget(
                                                          iconData: Icons
                                                              .remove_circle,
                                                          iconColor:
                                                              ColorsManager.red,
                                                          isConstraints: true,
                                                          iconSize: AppSize.s20,
                                                          onClick: () {
                                                            controller
                                                                .addOrRemoveLanguageOnClick(
                                                              languageId:
                                                                  languageItem
                                                                      .tagId,
                                                              languageLabel:
                                                                  languageItem
                                                                      .label,
                                                              languageProficiencyLevel:
                                                                  4,
                                                              operation: 2,
                                                            );
                                                          },
                                                        ),
                                                        CustomTextWidget(
                                                          text:
                                                              '${languageItem.label}(${languageItem.tagId})',
                                                          color: ColorsManager
                                                              .white,
                                                          fontSize: AppSize.s16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          marginLeft:
                                                              AppSize.s10,
                                                          marginTop: AppSize.s8,
                                                          marginBottom:
                                                              AppSize.s20,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                // Obx(
                                                //   () =>
                                                Container(
                                                  padding:
                                                      // controller.isUpdating
                                                      //             .value ==
                                                      //         false
                                                      //     ? EdgeInsets.zero
                                                      //     :
                                                      EdgeInsets.zero,
                                                  child:
                                                      UrlLanguageInputOnboarding(
                                                    controller: controller,
                                                    languageItem: languageItem,
                                                  ),
                                                ),
                                                // ),
                                              ],
                                            ),
                                          );
                                  },
                                ),
                              ],
                            ),
                          if (controller.languageSelectedList
                              .where((element) => element.level != 4)
                              .isEmpty)
                            Container()
                          else
                            Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: CustomTextWidget(
                                    text: 'otherLanguages'.tr,
                                    color: ColorsManager.white,
                                    fontSize: AppSize.s20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const ScrollPhysics(),
                                  itemCount: controller
                                      .languageSelectedList
                                      // .where((element) => element.level != 4)
                                      .length,
                                  itemBuilder: (context, index) {
                                    final FieldModel languageItem =
                                        controller.languageSelectedList[index];
                                    return languageItem.level == 4
                                        ? Container()
                                        : Obx(
                                            () => Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: AppSize.s8,
                                              ),
                                              // width: double.infinity,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Wrap(
                                                        children: [
                                                          CustomIconButtonWidget(
                                                            iconData: Icons
                                                                .remove_circle,
                                                            iconColor:
                                                                ColorsManager
                                                                    .red,
                                                            isConstraints: true,
                                                            iconSize:
                                                                AppSize.s20,
                                                            onClick: () {
                                                              controller
                                                                  .addOrRemoveLanguageOnClick(
                                                                languageId:
                                                                    languageItem
                                                                        .tagId,
                                                                languageLabel:
                                                                    languageItem
                                                                        .label,
                                                                languageProficiencyLevel:
                                                                    4,
                                                                operation: 2,
                                                              );
                                                            },
                                                          ),
                                                          CustomTextWidget(
                                                            text:
                                                                '${languageItem.label}(${languageItem.tagId})',
                                                            color: ColorsManager
                                                                .white,
                                                            fontSize:
                                                                AppSize.s16,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            marginLeft:
                                                                AppSize.s10,
                                                            marginTop:
                                                                AppSize.s8,
                                                            marginBottom:
                                                                AppSize.s20,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      ///===== Top of Types Selection Component =====//
                                                      Expanded(
                                                        flex: 55,
                                                        child:
                                                            ContainerDialogWidget(
                                                          dialogWidget:
                                                              MaterialDialogWidget(
                                                            title: 'types'.tr,
                                                            contentWidget:
                                                                ListView
                                                                    .separated(
                                                              shrinkWrap: true,
                                                              itemCount: controller
                                                                  .languageTypeList
                                                                  .length,
                                                              itemBuilder: (
                                                                context,
                                                                index,
                                                              ) {
                                                                return Obx(
                                                                  () => RowDataSelectionWidget
                                                                      .checkBox(
                                                                    isLeftSideText:
                                                                        false,
                                                                    isClickingValue: (controller.languageTypeList[index].label == 'spoken'.tr &&
                                                                            languageItem.languageSpokenLv ==
                                                                                1) ||
                                                                        (controller.languageTypeList[index].label == 'written'.tr &&
                                                                            languageItem.languageWrittenLv ==
                                                                                1),
                                                                    text: controller
                                                                        .languageTypeList[
                                                                            index]
                                                                        .label,
                                                                    onPressed:
                                                                        () {
                                                                      // controller
                                                                      //     .makeRequestToSpokenLanguageAPI(
                                                                      //   spokenLanguageId:
                                                                      //       languageItem
                                                                      //           .id,
                                                                      //   spokenLanguageData:
                                                                      //       FieldModel(
                                                                      //     level: languageItem
                                                                      //         .level,
                                                                      //     videoUrl:
                                                                      //         languageItem.videoUrl ??
                                                                      //             '',
                                                                      //     languageSpokenLv: controller.languageTypeList[index].label ==
                                                                      //             'spoken'.tr
                                                                      //         ? 1
                                                                      //         : languageItem.languageSpokenLv,
                                                                      //     languageWrittenLv: controller.languageTypeList[index].label ==
                                                                      //             'written'.tr
                                                                      //         ? 1
                                                                      //         : languageItem.languageWrittenLv,
                                                                      //   ),
                                                                      //   operation:
                                                                      //       Keys.editOperation,
                                                                      // );
                                                                      Navigator
                                                                          .pop(
                                                                        context,
                                                                        true,
                                                                      );
                                                                    },
                                                                  ),
                                                                );
                                                              },
                                                              separatorBuilder:
                                                                  (
                                                                context,
                                                                index,
                                                              ) {
                                                                return const Divider(
                                                                  height: 1.0,
                                                                  color: ColorsManager
                                                                      .grey300,
                                                                );
                                                              },
                                                            ),
                                                            //   actionWidget:
                                                            //       OutlinedButton
                                                            //           .icon(
                                                            //     onPressed:
                                                            //         () {
                                                            //       Navigator
                                                            //           .pop(
                                                            //         context,
                                                            //         true,
                                                            //       );
                                                            //     },
                                                            //     icon:
                                                            //         const Icon(
                                                            //       IconsManager
                                                            //           .close,
                                                            //       color: Colors
                                                            //           .white,
                                                            //     ),
                                                            //     label:
                                                            //         CustomTextWidget(
                                                            //       marginRight:
                                                            //           AppSize
                                                            //               .s24,
                                                            //       text:
                                                            //           'Close'
                                                            //               .tr,
                                                            //       color: Colors
                                                            //           .red,
                                                            //     ),
                                                            //   ),
                                                          ),
                                                          containerWidget:
                                                              // Obx(
                                                              //   () =>
                                                              RowContentInputWidget(
                                                            centerWidget: languageItem
                                                                            .languageSpokenLv ==
                                                                        1 ||
                                                                    languageItem
                                                                            .languageWrittenLv ==
                                                                        1
                                                                ? Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .only(
                                                                      top: AppSize
                                                                          .s4,
                                                                      bottom:
                                                                          AppSize
                                                                              .s4,
                                                                    ),
                                                                    child: Wrap(
                                                                      children: [
                                                                        if (languageItem.languageSpokenLv ==
                                                                            1)
                                                                          RemovableTextCardWidget(
                                                                            text:
                                                                                'spoken'.tr,
                                                                            onRemove: () =>
                                                                                '',
                                                                            //     controller.makeRequestToSpokenLanguageAPI(
                                                                            //   spokenLanguageId:
                                                                            //       languageItem.id,
                                                                            //   spokenLanguageData:
                                                                            //       FieldModel(
                                                                            //     level: languageItem.level,
                                                                            //     videoUrl: languageItem.videoUrl ?? '',
                                                                            //     languageSpokenLv: 0,
                                                                            //     languageWrittenLv: languageItem.languageWrittenLv,
                                                                            //   ),
                                                                            //   operation:
                                                                            //       Keys.editOperation,
                                                                            // ),
                                                                          ),
                                                                        if (languageItem.languageWrittenLv ==
                                                                            1)
                                                                          RemovableTextCardWidget(
                                                                            text:
                                                                                'written'.tr,
                                                                            onRemove: () =>
                                                                                'null',
                                                                            //     controller.makeRequestToSpokenLanguageAPI(
                                                                            //   spokenLanguageId:
                                                                            //       languageItem.id,
                                                                            //   spokenLanguageData:
                                                                            //       FieldModel(
                                                                            //     level: languageItem.level,
                                                                            //     videoUrl: languageItem.videoUrl ?? '',
                                                                            //     languageSpokenLv: languageItem.languageSpokenLv,
                                                                            //     languageWrittenLv: 0,
                                                                            //   ),
                                                                            //   operation:
                                                                            //       Keys.editOperation,
                                                                            // ),
                                                                          )
                                                                      ],
                                                                    ),
                                                                  )
                                                                : CustomTextWidget(
                                                                    text:
                                                                        'types'
                                                                            .tr,
                                                                    color: ColorsManager
                                                                        .grey400,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        AppSize
                                                                            .s16,
                                                                  ),
                                                            suffixWidget:
                                                                const Icon(
                                                              IconsManager
                                                                  .arrowDropDown,
                                                              color:
                                                                  ColorsManager
                                                                      .grey600,
                                                            ),
                                                          ),
                                                          // ),
                                                        ),
                                                      ),
                                                      //===== Bottom of Types Selection Component =====//
                                                      const SizedBox(
                                                        width: 4.0,
                                                      ),

                                                      ///===== Top of Proficiency Selection Component =====//
                                                      Expanded(
                                                        flex: 40,
                                                        child:
                                                            ContainerDialogWidget(
                                                          dialogWidget:
                                                              MaterialDialogWidget(
                                                            title:
                                                                'proficiencyHint'
                                                                    .tr,
                                                            contentWidget:
                                                                ListView
                                                                    .separated(
                                                              shrinkWrap: true,
                                                              itemCount: controller
                                                                  .proficiencyList
                                                                  .length,
                                                              itemBuilder: (
                                                                context,
                                                                index,
                                                              ) {
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
                                                                    onPressed:
                                                                        () {
                                                                      // controller
                                                                      //     .makeRequestToSpokenLanguageAPI(
                                                                      //   spokenLanguageId:
                                                                      //       languageItem
                                                                      //           .id,
                                                                      //   spokenLanguageData:
                                                                      //       FieldModel(
                                                                      //     level: controller
                                                                      //         .proficiencyList[index]
                                                                      //         .level,
                                                                      //     videoUrl:
                                                                      //         languageItem.videoUrl ??
                                                                      //             '',
                                                                      //     languageSpokenLv:
                                                                      //         languageItem.languageSpokenLv,
                                                                      //     languageWrittenLv:
                                                                      //         languageItem.languageWrittenLv,
                                                                      //   ),
                                                                      //   operation:
                                                                      //       Keys.editOperation,
                                                                      // );
                                                                      Navigator
                                                                          .pop(
                                                                        context,
                                                                        true,
                                                                      );
                                                                    },
                                                                  ),
                                                                );
                                                              },
                                                              separatorBuilder:
                                                                  (
                                                                context,
                                                                index,
                                                              ) {
                                                                return const Divider(
                                                                  height: 1.0,
                                                                  color: ColorsManager
                                                                      .grey300,
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                          containerWidget:
                                                              RowContentInputWidget(
                                                            centerWidget:
                                                                CustomTextWidget(
                                                              //marginLeft: 4.0,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              text:
                                                                  translateStateWords(
                                                                stateWord:
                                                                    '${languageItem.getLabelProficiencyLevel}',
                                                              ),
                                                              fontSize:
                                                                  AppSize.s16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                            suffixWidgetFlex:
                                                                15,
                                                            suffixWidget:
                                                                const Icon(
                                                              Icons
                                                                  .arrow_drop_down,
                                                              color:
                                                                  ColorsManager
                                                                      .grey600,
                                                            ),
                                                          ),
                                                          // ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    padding:
                                                        // controller.isUpdating
                                                        //             .value ==
                                                        //         false
                                                        //     ? EdgeInsets.zero
                                                        //     :
                                                        EdgeInsets.zero,
                                                    child:
                                                        UrlLanguageInputOnboarding(
                                                      controller: controller,
                                                      languageItem:
                                                          languageItem,
                                                    ),
                                                  ),
                                                ],
                                              ),
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
    );
  }
}

// ignore: must_be_immutable
class UrlLanguageInputOnboarding extends StatelessWidget {
  UrlLanguageInputOnboarding({
    Key? key,
    this.controller,
    required this.languageItem,
    this.vdoUrlCtrl,
  }) : super(key: key);

  final OnboardingController? controller;
  final FieldModel? languageItem;
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
                    // controller!.isUpdating.value = switchingBooleanValue(
                    //   boolValue: controller!.isUpdating.value,
                    // );
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
                            // controller!.isUpdating.value =
                            //     switchingBooleanValue(
                            //   boolValue: controller!.isUpdating.value,
                            // );
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
                    fontColor: ColorsManager.white,
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
                      // controller!.makeRequestToSpokenLanguageAPI(
                      //   spokenLanguageId: languageItem!.id,
                      //   spokenLanguageData: FieldModel(
                      //     level: languageItem!.level,
                      //     videoUrl: vdoUrlCtrl!.text,
                      //     // controller!.vdoUrlListTextCtrl[index!].text,
                      //   ),
                      //   operation: Keys.editOperation,
                      // );
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
