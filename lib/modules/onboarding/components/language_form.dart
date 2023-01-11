import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';
import '../../modules.dart';

class LanguageForm extends GetView<OnboardingController> {
  const LanguageForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.s4),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            ///===== Top of Mother Tongue Language Selection Component =====//
            Form(
              key: controller.editMontherTongueLangaugeFormKey,
              child: Wrap(
                children: [
                  ContainerDialogWidget(
                    inputTitle: 'motherTongue'.tr,
                    inputTitleColor: ColorsManager.white,
                    validatorFunction: (_) => Validator().notEmptyValidator(
                      controller.selectedMotherTongueLanguage.value.label ?? '',
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
                    fontSize: AppSize.s20,
                    buttonWidth: getWidth,
                    onPressed: () {
                      unFocusKeyBoard(context);
                      if (controller
                          .editMontherTongueLangaugeFormKey.currentState!
                          .validate()) {
                        controller.operationLanguageOnClick(
                          // formKey: controller.editMontherTongueLangaugeFormKey,
                          languageId:
                              controller.selectedMotherTongueLanguage.value.id,
                          languageLabel: controller
                              .selectedMotherTongueLanguage.value.label,
                          languageProficiencyLevel: 4,
                          spoken: 4,
                          written: 4,
                        );
                      }
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
              key: controller.editLangaugeFormKey,
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
                  Row(
                    children: [
                      ///===== Top of Spoken Proficiency Selection Component =====//
                      Expanded(
                        child: ContainerDialogWidget(
                          inputTitle: 'spoken'.tr,
                          inputTitleColor: ColorsManager.white,
                          inputTitleMarginTop: AppSize.s8,
                          validatorFunction: (_) =>
                              Validator().notEmptyValidator(
                            controller.selectedSpokenProficiency.value.label ??
                                '',
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
                                          .selectedSpokenProficiency
                                          .value
                                          .label!
                                          .toLowerCase(),
                                    ),
                                    text: translateStateWords(
                                      stateWord: controller
                                          .proficiencyList[index].label,
                                    ),
                                    onPressed: () {
                                      controller
                                              .selectedSpokenProficiency.value =
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
                            () => controller.selectedSpokenProficiency.value
                                        .label ==
                                    ''
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
                                            .selectedSpokenProficiency
                                            .value
                                            .label,
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
                      ),
                      //===== Bottom of Spoken Proficiency Selection Component =====//
                      const SizedBox(width: 4.0),

                      ///===== Top of Written Proficiency Selection Component =====//
                      Expanded(
                        child: ContainerDialogWidget(
                          inputTitle: 'written'.tr,
                          inputTitleColor: ColorsManager.white,
                          inputTitleMarginTop: AppSize.s8,
                          validatorFunction: (_) =>
                              Validator().notEmptyValidator(
                            controller.selectedWrittenProficiency.value.label ??
                                '',
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
                                          .selectedWrittenProficiency
                                          .value
                                          .label!
                                          .toLowerCase(),
                                    ),
                                    text: translateStateWords(
                                      stateWord: controller
                                          .proficiencyList[index].label,
                                    ),
                                    onPressed: () {
                                      controller.selectedWrittenProficiency
                                              .value =
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
                            () => controller.selectedWrittenProficiency.value
                                        .label ==
                                    ''
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
                                            .selectedWrittenProficiency
                                            .value
                                            .label,
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
                      ),
                      //===== Bottom of Written Proficiency Selection Component =====//
                    ],
                  ),

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
                      if (controller.editLangaugeFormKey.currentState!
                          .validate()) {
                        controller.operationLanguageOnClick(
                          // formKey: controller.editLangaugeFormKey,
                          languageId: controller.selectedLanguage.value.id,
                          languageLabel:
                              controller.selectedLanguage.value.label,
                          languageProficiencyLevel: 1,
                          spoken:
                              controller.selectedSpokenProficiency.value.level,
                          written:
                              controller.selectedWrittenProficiency.value.level,
                        );
                        controller.clearDataFromForm();
                      }
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
                  8.0,
                  0.0,
                  8.0,
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
                                    bottom: AppSize.s1,
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
                                              vertical: AppSize.s4,
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
                                                                .operationLanguageOnClick(
                                                              languageId:
                                                                  languageItem
                                                                      .tagId,
                                                              languageLabel:
                                                                  languageItem
                                                                      .label,
                                                              languageProficiencyLevel:
                                                                  4,
                                                              operation: 2,
                                                              indexForEditOrDelete:
                                                                  index,
                                                            );
                                                          },
                                                        ),
                                                        CustomTextWidget(
                                                          text:
                                                              '${languageItem.label}',
                                                          color: ColorsManager
                                                              .white,
                                                          fontSize: AppSize.s16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          marginLeft:
                                                              AppSize.s10,
                                                          marginTop: AppSize.s8,
                                                          marginBottom:
                                                              AppSize.s2,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Obx(
                                                  () => Container(
                                                    padding: controller.isUpdate
                                                                .value ==
                                                            false
                                                        ? EdgeInsets.zero
                                                        : EdgeInsets.zero,
                                                    child:
                                                        UrlLanguageInputOnboarding(
                                                      controller: controller,
                                                      languageItem:
                                                          languageItem,
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
                                  padding: const EdgeInsets.only(
                                    bottom: AppSize.s1,
                                  ),
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
                                                                  .operationLanguageOnClick(
                                                                languageId:
                                                                    languageItem
                                                                        .tagId,
                                                                languageLabel:
                                                                    languageItem
                                                                        .label,
                                                                languageProficiencyLevel:
                                                                    1,
                                                                operation: 2,
                                                                indexForEditOrDelete:
                                                                    index,
                                                              );
                                                            },
                                                          ),
                                                          CustomTextWidget(
                                                            text:
                                                                '${languageItem.label}',
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
                                                                AppSize.s2,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      ///===== Top of Spoken Proficiency Selection Component =====//
                                                      Expanded(
                                                        flex: 40,
                                                        child:
                                                            ContainerDialogWidget(
                                                          inputTitle:
                                                              'spoken'.tr,
                                                          inputTitleColor:
                                                              ColorsManager
                                                                  .white,
                                                          inputTitleMarginTop:
                                                              AppSize.s2,
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
                                                                              .languageSpokenLv,
                                                                    ),
                                                                    text:
                                                                        translateStateWords(
                                                                      stateWord:
                                                                          '${controller.proficiencyList[index].label}',
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      // print(
                                                                      //   'item index:$index $languageItem',
                                                                      // );
                                                                      controller
                                                                          .operationLanguageOnClick(
                                                                        generateId:
                                                                            languageItem.id,
                                                                        languageId:
                                                                            languageItem.tagId,
                                                                        languageLabel:
                                                                            languageItem.label,
                                                                        languageProficiencyLevel:
                                                                            languageItem.level,
                                                                        spoken: controller
                                                                            .proficiencyList[index]
                                                                            .level,
                                                                        written:
                                                                            languageItem.languageWrittenLv,
                                                                        languageVideoUrl:
                                                                            languageItem.videoUrl,
                                                                        operation:
                                                                            1,
                                                                        indexForEditOrDelete:
                                                                            index,
                                                                      );
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
                                                                  '${languageItem.getLabelSpokenProficiencyLevel}',
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
                                                      //===== Bottom of Spoken Proficiency Selection Component =====//
                                                      const SizedBox(
                                                        width: 4.0,
                                                      ),

                                                      ///===== Top of Written Proficiency Selection Component =====//
                                                      Expanded(
                                                        flex: 40,
                                                        child:
                                                            ContainerDialogWidget(
                                                          inputTitle:
                                                              'written'.tr,
                                                          inputTitleColor:
                                                              ColorsManager
                                                                  .white,
                                                          inputTitleMarginTop:
                                                              AppSize.s2,
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
                                                                              .languageWrittenLv,
                                                                    ),
                                                                    text:
                                                                        translateStateWords(
                                                                      stateWord:
                                                                          '${controller.proficiencyList[index].label}',
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      controller
                                                                          .operationLanguageOnClick(
                                                                        generateId:
                                                                            languageItem.id,
                                                                        languageId:
                                                                            languageItem.tagId,
                                                                        languageLabel:
                                                                            languageItem.label,
                                                                        languageProficiencyLevel:
                                                                            languageItem.level,
                                                                        spoken:
                                                                            languageItem.languageSpokenLv,
                                                                        written: controller
                                                                            .proficiencyList[index]
                                                                            .level,
                                                                        languageVideoUrl:
                                                                            languageItem.videoUrl,
                                                                        operation:
                                                                            1,
                                                                        indexForEditOrDelete:
                                                                            index,
                                                                      );
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
                                                                  //   translateStateWords(
                                                                  // stateWord:
                                                                  '${languageItem.getLabelWrittenProficiencyLevel}',
                                                              // ),
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
                                                      //===== Bottom of Written Proficiency Selection Component =====//
                                                    ],
                                                  ),
                                                  Obx(
                                                    () => Container(
                                                      padding: controller
                                                                  .isUpdate
                                                                  .value ==
                                                              false
                                                          ? EdgeInsets.zero
                                                          : EdgeInsets.zero,
                                                      child:
                                                          UrlLanguageInputOnboarding(
                                                        controller: controller,
                                                        languageItem:
                                                            languageItem,
                                                        index: index,
                                                      ),
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
    this.index,
  }) : super(key: key);

  final OnboardingController? controller;
  final FieldModel? languageItem;
  TextEditingController? vdoUrlCtrl;
  final int? index;

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
                  color: ColorsManager.white,
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
                    controller!.isUpdate.value = switchingBooleanValue(
                      boolValue: controller!.isUpdate.value,
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
                            controller!.isUpdate.value = switchingBooleanValue(
                              boolValue: controller!.isUpdate.value,
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
                      controller!.operationLanguageOnClick(
                        generateId: languageItem!.id,
                        languageId: languageItem!.tagId,
                        languageLabel: languageItem!.label,
                        languageProficiencyLevel: languageItem!.level,
                        spoken: languageItem!.languageSpokenLv,
                        written: languageItem!.languageWrittenLv,
                        languageVideoUrl: vdoUrlCtrl!.text,
                        operation: 1,
                        indexForEditOrDelete: index,
                      );
                      languageItem!.selected = false;
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
