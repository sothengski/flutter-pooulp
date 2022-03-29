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
        title: 'Languages',
      ),
      //===== Bottom of appBar Component =====//

      ///===== Top of body Component =====//
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: controller.editLangaugeFormKey,
          child: Padding(
            padding: const EdgeInsets.all(AppSize.s16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ///===== Top of Language Selection Component =====//
                ContainerDialogWidget(
                  inputTitle: 'Language',
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
                          ? LanguageListSelector(
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
                        ? const RowContentInputWidget(
                            centerWidget: CustomTextWidget(
                              text: 'Select your Language',
                              color: ColorsManager.grey400,
                              fontWeight: FontWeight.w400,
                              fontSize: AppSize.s16,
                            ),
                            suffixWidget: Icon(
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

                ///===== Top of Proficiency Selection Component =====//
                ContainerDialogWidget(
                  inputTitle: 'Proficiency',
                  inputTitleMarginTop: AppSize.s16,
                  validatorFunction: (_) => Validator().notEmptyValidator(
                    controller.selectedProficiency.value.label ?? '',
                  ),
                  dialogWidget: MaterialDialogWidget(
                    title: 'Select your Proficiency',
                    contentWidget: ListView.separated(
                      shrinkWrap: true,
                      itemCount: controller.proficiencyList.length,
                      itemBuilder: (context, index) {
                        return Obx(
                          () => RowDataSelectionWidget.radioButton(
                            isLeftSideText: false,
                            isClickingValue: stringsComparation(
                              object1: controller.proficiencyList[index].label!
                                  .toLowerCase(),
                              object2: controller
                                  .selectedProficiency.value.label!
                                  .toLowerCase(),
                            ),
                            text: controller.proficiencyList[index].label,
                            onPressed: () {
                              controller.selectedProficiency.value =
                                  controller.selectedLanguageOnClick(
                                selectedItem: controller.proficiencyList[index],
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
                        ? const RowContentInputWidget(
                            centerWidget: CustomTextWidget(
                              text: 'Select your Proficiency',
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
                              text: controller.selectedProficiency.value.label,
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
                    text: AppStrings.addText,
                    childWidget: controller.isSubmitBtnProcessing.value == true
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
                        controller.saveButtonOnClick();
                      }
                    },
                  ),
                ),
                //===== Bottom of Add Language Button Component =====//
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
                      24.0,
                      0.0,
                      24.0,
                    ),
                    child: controller.profileController.studentInfoRepsonse
                            .value.spokenLanguages!.isEmpty
                        ? const CustomTextWidget(
                            text: "You don't have any languages yet!",
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment:MainAxisAlignment.start,
                            children: controller.profileController
                                .studentInfoRepsonse.value.spokenLanguages!
                                .map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: AppSize.s8,
                                    ),
                                    // width: double.infinity,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Wrap(
                                          children: [
                                            CustomIconButtonWidget(
                                              iconData: Icons.remove_circle,
                                              iconColor: ColorsManager.red,
                                              isConstraints: true,
                                              iconSize: AppSize.s20,
                                              onClick: () {
                                                controller
                                                    .makeRequestToSpokenLanguageAPI(
                                                  spokenLanguageId: e.id,
                                                  operation:
                                                      Keys.deleteOperation,
                                                );
                                              },
                                            ),
                                            CustomTextWidget(
                                              text: '${e.label}',
                                              fontSize: AppSize.s16,
                                              fontWeight: FontWeight.w600,
                                              marginLeft: AppSize.s10,
                                              marginTop: AppSize.s8,
                                              marginBottom: AppSize.s24,
                                            ),
                                          ],
                                        ),
                                        CustomBoxWidget(
                                          leftPadding: AppSize.s12,
                                          child: GestureDetector(
                                            onTap: () {
                                              Get.dialog(
                                                MaterialDialogWidget(
                                                  title:
                                                      'Select your Proficiency',
                                                  contentWidget:
                                                      ListView.separated(
                                                    shrinkWrap: true,
                                                    itemCount: controller
                                                        .proficiencyList.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return Obx(
                                                        () =>
                                                            RowDataSelectionWidget
                                                                .radioButton(
                                                          isLeftSideText: false,
                                                          isClickingValue:
                                                              intComparation(
                                                            object1: controller
                                                                .proficiencyList[
                                                                    index]
                                                                .level,
                                                            object2: e.level,
                                                          ),
                                                          text:
                                                              '${controller.proficiencyList[index].label}',
                                                          onPressed: () {
                                                            controller
                                                                .makeRequestToSpokenLanguageAPI(
                                                              spokenLanguageId:
                                                                  e.id,
                                                              spokenLanguageData:
                                                                  FieldModel(
                                                                level: controller
                                                                    .proficiencyList[
                                                                        index]
                                                                    .level,
                                                                videoUrl: '',
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
                                                        color: ColorsManager
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
                                                  textAlign: TextAlign.center,
                                                  text:
                                                      '${e.getLabelProficiencyLevel}',
                                                  fontSize: AppSize.s16,
                                                  fontWeight: FontWeight.w400,
                                                  // marginTop: AppSize.s8,
                                                  // marginBottom: AppSize.s24,
                                                ),
                                                const Icon(
                                                  Icons.arrow_drop_down,
                                                  color: ColorsManager.grey600,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                  ),
                ),
                //===== Bottom of User Language List Component =====//
              ],
            ),
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
