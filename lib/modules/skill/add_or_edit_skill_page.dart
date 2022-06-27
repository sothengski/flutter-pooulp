import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import '../../data/data.dart';
import '../modules.dart';

class AddOrEditSkillPage extends GetView<SkillController> {
  const AddOrEditSkillPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///===== Top of appBar Component =====//
      appBar: CustomAppBar(
        title: 'skills'.tr,
      ),
      //===== Bottom of appBar Component =====//

      ///===== Top of body Component =====//
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: controller.editSkillFormKey,
          child: Padding(
            padding: const EdgeInsets.all(AppSize.s16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ///===== Top of Category Selection Component =====//
                ContainerDialogWidget(
                  inputTitle: 'category'.tr,
                  inputTitleMarginTop: AppSize.s16,
                  validatorFunction: (_) => Validator().notEmptyValidator(
                    controller.selectedSkillCategory.value.label ?? '',
                  ),
                  dialogWidget: MaterialDialogWidget(
                    title: 'categoryHint'.tr,
                    contentWidget: ListView.separated(
                      shrinkWrap: true,
                      itemCount: skillCategoryList!.length,
                      itemBuilder: (context, index) {
                        return Obx(
                          () => RowDataSelectionWidget.radioButton(
                            isLeftSideText: false,
                            isClickingValue: stringsComparation(
                              object1: skillCategoryList![index]
                                  .label!
                                  .toLowerCase(),
                              object2: controller
                                  .selectedSkillCategory.value.label!
                                  .toLowerCase(),
                            ),
                            text: translateStateWords(
                              stateWord: skillCategoryList![index].label,
                            ),
                            onPressed: () {
                              controller.selectedSkillCategory.value =
                                  controller.selectedSkillOnClick(
                                selectedItem: skillCategoryList![index],
                                resetDependencyValue: true,
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
                    () => controller.selectedSkillCategory.value.label == ''
                        ? RowContentInputWidget(
                            centerWidget: CustomTextWidget(
                              text: 'categoryHint'.tr,
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
                                    .selectedSkillCategory.value.label,
                              ),
                              // controller.selectedSkillCategory.value.label,
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
                //===== Bottom of Category Selection Component =====//

                ///===== Top of Skill Selection Component =====//
                Obx(
                  () => ContainerDialogWidget(
                    isTap: !stringsComparation(
                      object1: controller.selectedSkillCategory.value.label,
                      object2: '',
                    ),
                    inputTitle: 'skill'.tr,
                    validatorFunction: (_) => Validator().notEmptyValidator(
                      controller.selectedSkill.value.label ?? '',
                    ),
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
                        () => controller.selectedSkillCategory.value.label ==
                                SkillCategoryStrings.softSkill
                            ? controller.softSkillListForSelection.isNotEmpty
                                ? FieldListSelector(
                                    inputHintText: 'search'.tr,
                                    dataListforSelected:
                                        controller.softSkillListForSelection,
                                    selectedItem:
                                        controller.selectedSkill.value,
                                    onTap: (field) {
                                      controller.selectedSkill.value =
                                          controller.selectedSkillOnClick(
                                        selectedItem: field,
                                      );
                                      Navigator.pop(
                                        context,
                                        true,
                                      );
                                    },
                                  )
                                : const LoadingWidget()
                            : controller.hardSkillListForSelection.isNotEmpty
                                ? FieldListSelector(
                                    inputHintText: 'search'.tr,
                                    dataListforSelected:
                                        controller.hardSkillListForSelection,
                                    selectedItem:
                                        controller.selectedSkill.value,
                                    onTap: (field) {
                                      controller.selectedSkill.value =
                                          controller.selectedSkillOnClick(
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
                    containerWidget: controller.selectedSkill.value.id == null
                        ? RowContentInputWidget(
                            centerWidget: CustomTextWidget(
                              text: 'skillHint'.tr,
                              color: ColorsManager.grey400,
                              fontWeight: FontWeight.w400,
                              fontSize: AppSize.s16,
                            ),
                            suffixWidget:
                                controller.selectedSkillCategory.value.label ==
                                        ''
                                    ? const Icon(
                                        IconsManager.arrowDropDown,
                                        color: ColorsManager.grey400,
                                      )
                                    : const Icon(
                                        IconsManager.arrowDropDown,
                                        color: ColorsManager.grey600,
                                      ),
                          )
                        : RowContentInputWidget(
                            centerWidget: CustomTextWidget(
                              text: controller.selectedSkill.value.label,
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
                Obx(
                  () => Visibility(
                    visible: stringsComparation(
                      object1: controller.selectedSkillCategory.value.label,
                      object2: SkillCategoryStrings.hardSkill,
                    ),
                    child: ContainerDialogWidget(
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
                                isClickingValue: intComparation(
                                  object1:
                                      controller.proficiencyList[index].level,
                                  object2: controller
                                      .selectedProficiency.value.level,
                                ),
                                text: controller
                                    .proficiencyList[index].displayLevel,
                                onPressed: () {
                                  controller.selectedProficiency.value =
                                      controller.selectedSkillOnClick(
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
                                  text: controller
                                      .selectedProficiency.value.displayLevel,
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
                ),
                //===== Bottom of Proficiency Selection Component =====//

                ///===== Top of Add Language Button Component =====//
                Obx(
                  () => CustomMaterialButton(
                    topPadding: AppSize.s20,
                    bottomPadding: AppSize.s20,
                    text: 'add'.tr,
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
                            .value.skills!.isEmpty
                        ? CustomTextWidget(
                            text: 'noSkillsFound'.tr,
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment:MainAxisAlignment.start,
                            children: [
                              CustomTextWidget(
                                text: 'hardSkills'.tr,
                                marginBottom: AppSize.s12,
                                fontSize: AppSize.s16,
                                fontWeight: FontWeight.w400,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: controller.profileController
                                    .studentInfoRepsonse.value.skills!
                                    .map(
                                      (e) => e.type == Type.hardSkill
                                          ? Padding(
                                              padding: const EdgeInsets.only(
                                                bottom: AppSize.s16,
                                              ),
                                              child: Row(
                                                // crossAxisAlignment:
                                                //     CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  // Flexible(
                                                  //   flex: 73,
                                                  //   child: Wrap(
                                                  //     children: [
                                                  //       CustomIconButtonWidget(
                                                  //         iconData:
                                                  //             Icons.remove_circle,
                                                  //         iconColor:
                                                  //             ColorsManager.red,
                                                  //         isConstraints: true,
                                                  //         iconSize: AppSize.s20,
                                                  //         onClick: () {
                                                  //           controller
                                                  //               .makeRequestToSkillAPI(
                                                  //             skillId: e.id,
                                                  //             operation: Keys
                                                  //                 .deleteOperation,
                                                  //           );
                                                  //         },
                                                  //       ),
                                                  //       CustomTextWidget(
                                                  //         maxLine: 3,
                                                  //         text: '${e.label}',
                                                  //         fontSize: AppSize.s16,
                                                  //         fontWeight:
                                                  //             FontWeight.w500,
                                                  //         marginLeft: AppSize.s10,
                                                  //         marginTop: AppSize.s8,
                                                  //         marginBottom:
                                                  //             AppSize.s24,
                                                  //       ),
                                                  //     ],
                                                  //   ),
                                                  // ),
                                                  CustomIconButtonWidget(
                                                    iconData:
                                                        Icons.remove_circle,
                                                    iconColor:
                                                        ColorsManager.red,
                                                    isConstraints: true,
                                                    iconSize: AppSize.s20,
                                                    onClick: () {
                                                      controller
                                                          .makeRequestToSkillAPI(
                                                        skillId: e.id,
                                                        operation: Keys
                                                            .deleteOperation,
                                                      );
                                                    },
                                                  ),
                                                  Expanded(
                                                    child: CustomTextWidget(
                                                      maxLine: 3,
                                                      text: '${e.label}',
                                                      fontSize: AppSize.s16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      marginLeft: AppSize.s10,
                                                      marginTop: AppSize.s8,
                                                      // marginBottom: AppSize.s12,
                                                    ),
                                                  ),
                                                  CustomBoxWidget(
                                                    leftPadding: AppSize.s12,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Get.dialog(
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
                                                                      object2: e
                                                                          .level,
                                                                    ),
                                                                    text:
                                                                        '${controller.proficiencyList[index].displayLevel}',
                                                                    onPressed:
                                                                        () {
                                                                      controller
                                                                          .makeRequestToSkillAPI(
                                                                        skillId:
                                                                            e.id,
                                                                        skillData:
                                                                            FieldModel(
                                                                          level: controller
                                                                              .proficiencyList[index]
                                                                              .level,
                                                                          videoUrl:
                                                                              '',
                                                                        ),
                                                                        operation:
                                                                            Keys.editOperation,
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
                                                        );
                                                      },
                                                      child: Row(
                                                        children: [
                                                          CustomTextWidget(
                                                            textAlign: TextAlign
                                                                .center,
                                                            text:
                                                                '${e.displayLevel}',
                                                            fontSize:
                                                                AppSize.s16,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                          const Icon(
                                                            Icons
                                                                .arrow_drop_down,
                                                            color: ColorsManager
                                                                .grey600,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          : Container(),
                                    )
                                    .toList(),
                              ),
                              CustomTextWidget(
                                text: 'softSkills'.tr,
                                marginTop: AppSize.s12,
                                marginBottom: AppSize.s12,
                                fontSize: AppSize.s16,
                                fontWeight: FontWeight.w400,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: controller.profileController
                                    .studentInfoRepsonse.value.skills!
                                    .map(
                                      (e) => e.type == Type.softSkill
                                          ? Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                            .makeRequestToSkillAPI(
                                                          skillId: e.id,
                                                          operation: Keys
                                                              .deleteOperation,
                                                        );
                                                      },
                                                    ),
                                                    CustomTextWidget(
                                                      text: '${e.label}',
                                                      fontSize: AppSize.s16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      marginLeft: AppSize.s10,
                                                      marginTop: AppSize.s8,
                                                      marginBottom: AppSize.s24,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          : Container(),
                                    )
                                    .toList(),
                              )
                            ],
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
