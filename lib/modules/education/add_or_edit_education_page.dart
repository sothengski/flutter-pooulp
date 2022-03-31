import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import 'education_controller.dart';

class AddOrEditEducationPage extends GetView<EducationController> {
  @override
  Widget build(BuildContext context) {
    controller.title = controller.title;
    return Scaffold(
      appBar: CustomAppBar(
        title: '${controller.title} Education',
        actions: [
          if (controller.title != Keys.editOperation)
            Container()
          else
            CustomIconButtonWidget(
              iconData: IconsManager.deleteForeverOutlined,
              iconColor: ColorsManager.white,
              tooltip: AppStrings.removeText,
              onClick: () => Get.dialog(
                ConfirmationDialogWidget(
                  onPressed: () => {
                    controller.makeRequestToEducationAPI(
                      eduId: controller.eduId,
                      operation: Keys.deleteOperation,
                    ),
                    Get.back(),
                  },
                ),
              ),
            )
        ],
      ),
      // backgroundColor: ColorsManager.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: controller.editEducationFormKey,
          child: Padding(
            padding: const EdgeInsets.all(AppSize.s16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ///===== Top of School Component =====//
                ContainerDialogWidget(
                  inputTitle: 'School',
                  validatorFunction: (_) => Validator().notEmptyValidator(
                    controller.selectedSchool.value.name ?? '',
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
                      () => controller.schoolList.isNotEmpty
                          ? SchoolListSelector(
                              dataListforSelected: controller.schoolList,
                              selectedItem: controller.selectedSchool.value,
                              onTap: (school) {
                                controller.selectedSchool.value =
                                    controller.selectedSchoolOnClick(
                                  selectedItem: school,
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
                    () => controller.selectedSchool.value.id == null
                        ? const RowContentInputWidget(
                            centerWidget: CustomTextWidget(
                              text: 'Select your School',
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
                              text: controller.selectedSchool.value.name,
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
                //===== Bottom of School Component =====//

                ///===== Top of Field of Study Component =====//
                CustomTextInput(
                  topPadding: AppSize.s16,
                  controller: controller.fieldOfStudyTextCtrl,
                  inputTitle: 'Field of Study',
                  hintText: 'Enter your Field of Study',
                  isFilled: true,
                  validator: Validator().notEmptyValidator,
                ),
                //===== Bottom of Field of Study Component =====//

                ///===== Top of Degree Component =====//
                CustomTextInput(
                  topPadding: AppSize.s16,
                  controller: controller.degreeTextCtrl,
                  inputTitle: 'Degree',
                  hintText: 'Enter your Degree',
                  isFilled: true,
                  validator: Validator().notEmptyValidator,
                ),
                //===== Bottom of Degree Component =====//

                ///===== Top of Start Date & End Date Component =====//
                Row(
                  children: [
                    ///===== Top of Start Date Component =====//
                    Expanded(
                      flex: 40,
                      child: ContainerDialogWidget(
                        inputTitle: 'Start Date',
                        inputTitleMarginTop: AppSize.s16,
                        validatorFunction: (_) => Validator().notEmptyValidator(
                          controller.selectedStartedDateString.value,
                        ),
                        dialogType: DialogType.dateTimePickerDialog,
                        currentTime: DateTime.tryParse(
                              controller.selectedStartedDateString.value,
                            ) ??
                            DateTime.now(),
                        onConfirmDate: (date) {
                          controller.selectedStartedDateString.value =
                              dateTimeToString(selectedItem: date);
                        },
                        containerWidget: Obx(
                          () => controller.selectedStartedDateString.value == ''
                              ? const RowContentInputWidget(
                                  centerWidget: CustomTextWidget(
                                    text: 'Start Date',
                                    color: ColorsManager.grey400,
                                    fontWeight: FontWeight.w400,
                                    fontSize: AppSize.s16,
                                  ),
                                  suffixWidgetFlex: 20,
                                  suffixWidget: Icon(
                                    IconsManager.dateRangeOutlined,
                                    color: ColorsManager.grey600,
                                  ),
                                )
                              : RowContentInputWidget(
                                  centerWidget: CustomTextWidget(
                                    text: dateFormatDashYYYYMMDD(
                                      date: DateTime.tryParse(
                                        controller
                                            .selectedStartedDateString.value,
                                      ),
                                    ),
                                    color: ColorsManager.black,
                                    fontSize: AppSize.s16,
                                  ),
                                  suffixWidgetFlex: 20,
                                  suffixWidget: const Icon(
                                    IconsManager.dateRangeOutlined,
                                    color: ColorsManager.grey600,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    //===== Bottom of Start Date Component =====//
                    const SizedBox(
                      width: AppSize.s12,
                    ),

                    ///===== Top of End Date Component =====//
                    Expanded(
                      flex: 40,
                      child: ContainerDialogWidget(
                        inputTitle: 'End Date(Or Expected)',
                        inputTitleMarginTop: AppSize.s16,
                        dialogType: DialogType.dateTimePickerDialog,
                        currentTime: DateTime.tryParse(
                              controller.selectedEndDateString.value,
                            ) ??
                            DateTime.now(),
                        onConfirmDate: (date) {
                          controller.selectedEndDateString.value =
                              dateTimeToString(selectedItem: date);
                        },
                        containerWidget: Obx(
                          () => controller.selectedEndDateString.value == ''
                              ? const RowContentInputWidget(
                                  centerWidget: CustomTextWidget(
                                    text: 'End Date',
                                    color: ColorsManager.grey400,
                                    fontWeight: FontWeight.w400,
                                    fontSize: AppSize.s16,
                                  ),
                                  suffixWidgetFlex: 20,
                                  suffixWidget: Icon(
                                    Icons.date_range_outlined,
                                    color: ColorsManager.grey600,
                                  ),
                                )
                              : RowContentInputWidget(
                                  centerWidget: CustomTextWidget(
                                    text: dateFormatDashYYYYMMDD(
                                      date: DateTime.tryParse(
                                        controller.selectedEndDateString.value,
                                      ),
                                    ),
                                    color: ColorsManager.black,
                                    fontSize: AppSize.s16,
                                  ),
                                  suffixWidgetFlex: 20,
                                  suffixWidget: const Icon(
                                    Icons.date_range_outlined,
                                    color: ColorsManager.grey600,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    //===== Bottom of End Date Component =====//
                  ],
                ),
                //===== Bottom of Start Date & End Date Component =====//

                ///===== Top of Graduated Component =====//
                Obx(
                  () => RowDataSelectionWidget.checkBox(
                    verticalPadding: AppSize.s16,
                    horizontalPadding: AppSize.s0,
                    isClickingValue: controller.isCheckGraduated.value,
                    text: 'Graduated',
                    isLeftSideText: false,
                    onPressed: () {
                      controller.isCheckGraduated.value = switchingBooleanValue(
                        boolValue: controller.isCheckGraduated.value,
                      );
                    },
                  ),
                ),
                //===== Bottom of Graduated Component =====//

                ///===== Top of Description Component =====//
                CustomTextInput(
                  controller: controller.descriptionTextCtrl,
                  inputTitle: 'Description',
                  hintText: 'Description...',
                  isFilled: true,
                  topContentPadding: AppSize.s12,
                  bottomContentPadding: AppSize.s12,
                  // topPadding: AppSize.s12,
                  counter: true,
                  maxLines: 10,
                  minLines: 5,
                  maxLength: 1000,
                  // validator: Validator().emailValidator,
                  keyboardType: TextInputType.multiline,
                ),
                //===== Bottom of Description Component =====//
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => Wrap(
          children: [
            Visibility(
              visible: controller.isSubmitBtnProcessing.value,
              child: CustomMaterialButton(
                leftPadding: AppSize.s12,
                rightPadding: AppSize.s12,
                bottomPadding: AppSize.s20,
                childWidget: const LoadingWidget(
                  isTreeBounceLoading: true,
                  color: ColorsManager.white,
                ),
                buttonWidth: getWidth,
                onPressed: () {
                  unFocusKeyBoard(context);
                },
              ),
            ),
            Visibility(
              visible: !controller.isSubmitBtnProcessing.value,
              child: CustomMaterialButton(
                leftPadding: AppSize.s12,
                rightPadding: AppSize.s12,
                bottomPadding: AppSize.s20,
                text: AppStrings.saveText,
                fontSize: AppSize.s20,
                buttonWidth: getWidth,
                onPressed: () {
                  unFocusKeyBoard(context);
                  controller.saveButtonOnClick();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
