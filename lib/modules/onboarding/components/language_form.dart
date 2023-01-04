import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                      // if (!controller.isSubmitBtnProcessing.value == true) {
                      //   controller.saveButtonOnClick(
                      //     formKey:
                      //         controller.editMontherTongueLangaugeFormKey,
                      //     languageTagId: controller
                      //         .selectedMotherTongueLanguage.value.id,
                      //     languageProficiencyLevel: 4,
                      //   );
                      // }
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
                    // childWidget:
                    //     controller.isSubmitBtnProcessing.value == true
                    //         ? const SizedBox(
                    //             height: 40,
                    //             child: LoadingWidget(
                    //               isTreeBounceLoading: true,
                    //               color: ColorsManager.white,
                    //             ),
                    //           )
                    //         : null,
                    fontSize: AppSize.s20,
                    buttonWidth: getWidth,
                    onPressed: () {
                      unFocusKeyBoard(context);
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
              color: ColorsManager.primaryBlue,
            ),
          ],
        ),
      ),
    );
  }
}
