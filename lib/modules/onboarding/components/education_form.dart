import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pooulp_flutter/modules/modules.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';

class EducationForm extends GetView<OnboardingController> {
  final int? eduIndex;
  final bool? isCurrentStudy;
  // final Function(bool)? swichingFunction;
  final SchoolModel? school;
  final List<FieldModel>? fieldList;
  // final TextEditingController? currentStudyYearTextCtrl;
  // final TextEditingController? degreeTextCtrl;

  final bool? isUpdateTrigger;

  const EducationForm({
    Key? key,
    this.eduIndex,
    this.isCurrentStudy,
    this.school,
    this.fieldList,
    // this.currentStudyYearTextCtrl,
    // this.degreeTextCtrl,
    this.isUpdateTrigger,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomContainerWidget(
        elevation: controller.isUpdate.value == true ? 0.0 : 0.0,
        topMargin: AppSize.s8,
        bottomMargin: AppSize.s8,
        childPadding: AppSize.s16,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///===== Top of Graduated Component =====//
            Row(
              children: [
                Flexible(
                  flex: 75,
                  child: Container(),
                  // RowDataSelectionWidget.checkBox(
                  //   // verticalPadding: AppSize.s8,
                  //   horizontalPadding: AppSize.s0,
                  //   isClickingValue: isCurrentStudy,
                  //   text: 'iAmCurrentlyStudying'.tr,
                  //   isLeftSideText: false,
                  //   onPressed: () {
                  //     controller.educationList[eduIndex!].completed =
                  //         switchingBooleanValue(
                  //       boolValue:
                  //           controller.educationList[eduIndex!].completed,
                  //     );
                  //     controller.getUpdate();
                  //   },
                  // ),
                ),
                Visibility(
                  visible: controller.educationList[eduIndex!].id !=
                      999, //id = 999 first index
                  child: CustomIconButtonWidget(
                    iconData: Icons.close,
                    iconColor: ColorsManager.red,
                    iconSize: AppSize.s28,
                    padding: 0.0,
                    isConstraints: true,
                    onClick: () => {
                      controller.addOrRemoveEduSlot(
                        isRemove: true,
                        eduIndex: eduIndex,
                      ),
                    },
                  ),
                ),
              ],
            ),
            //===== Bottom of Graduated Component =====//

            ///===== Top of School Component =====//
            ContainerDialogWidget(
              inputTitle: 'school'.tr,
              // validatorFunction: (_) => Validator().notEmptyValidator(
              //   school!.name ?? '',
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
                  () => controller.schoolList.isNotEmpty
                      ? SchoolListSelector(
                          dataListforSelected: controller.schoolList,
                          selectedItem:
                              controller.educationList[eduIndex!].school,
                          onTap: (school) {
                            controller.educationList[eduIndex!].school =
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
                () => controller.educationList[eduIndex!].school!.id == null
                    ? RowContentInputWidget(
                        centerWidget: CustomTextWidget(
                          text: 'schoolHint'.tr,
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
                          text:
                              controller.educationList[eduIndex!].school!.name,
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

            ///===== Top of Fields Component =====//
            ContainerDialogWidget(
              inputTitle: 'fields'.tr,
              fontSizeTitle: AppSize.s16,
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
                  () => controller.fieldListForSelect.isNotEmpty
                      ? FieldListMultipleSelector(
                          inputHintText: 'search'.tr,
                          dataListforSelected: controller.fieldListForSelect,
                          selectedItems: fieldList,
                          onTap: (field) {
                            controller.educationList[eduIndex!].fields!
                                .add(field);
                            controller.getUpdate();
                          },
                        )
                      : const LoadingWidget(),
                ),
              ),
              containerWidget: RowContentInputWidget(
                centerWidget: CustomTextWidget(
                  text: 'fieldsHint'.tr,
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
            Obx(
              () => Container(
                alignment: controller.isUpdate.value == true
                    ? AlignmentDirectional.centerStart
                    : AlignmentDirectional.centerStart,
                child: Wrap(
                  children: [
                    for (var i = 0; i < fieldList!.length; i++)
                      RemovableTextCardWidget(
                        text: '${fieldList![i].label}',
                        onRemove: () {
                          controller.educationList[eduIndex!].fields!
                              .removeWhere(
                            (element) => element.id == fieldList![i].id,
                          );
                          controller.getUpdate();
                        },
                      )
                  ],
                ),
              ),
            ),
            //===== Bottom of Fields Component =====//

            ///===== Top of Degree Component =====//
            // CustomTextInput(
            //   topPadding: AppSize.s16,
            //   controller: degreeTextCtrl,
            //   inputTitle: 'degree'.tr,
            //   hintText: 'degreeHint'.tr,
            //   isFilled: true,
            // ),
            //===== Bottom of Degree Component =====//

            ///===== Top of Current Year of Study Component =====//
            // Visibility(
            //   visible: isCurrentStudy == false,
            //   child: CustomTextInput(
            //     topPadding: AppSize.s16,
            //     bottomPadding: AppSize.s12,
            //     controller: currentStudyYearTextCtrl,
            //     inputTitle: 'currentStudyLabel'.tr,
            //     hintText: 'currentStudyLabel'.tr,
            //     isFilled: true,
            //     // validator: Validator().notEmptyValidator,
            //     keyboardType: TextInputType.number,
            //     maxLength: 12,
            //     inputFormatterList: [
            //       FilterTextInputFormat().digitsOnly(),
            //     ],
            //   ),
            // ),
            //===== Bottom of Current Year of Study Component =====//

            ///===== Top of Start Date Component =====//
            ContainerDialogWidget(
              inputTitle: 'startDate'.tr,
              inputTitleMarginTop: AppSize.s16,
              validatorFunction: (_) => Validator().notEmptyValidator(
                controller.selectedStartedDateString[eduIndex!],
              ),
              dialogType: DialogType.dateWithoutDayPickerDialog,
              dateLocale: LanguageController().currentLanguageStore.value,
              currentTime: DateTime.tryParse(
                    controller.selectedStartedDateString[eduIndex!],
                  ) ??
                  DateTime.now(),
              onConfirmDate: (date) {
                controller.selectedStartedDateString[eduIndex!] =
                    dateTimeToString(selectedItem: date);
              },
              containerWidget: Obx(
                () => controller.selectedStartedDateString[eduIndex!] == ''
                    ? RowContentInputWidget(
                        centerWidget: CustomTextWidget(
                          text: mmyyyyFormat,
                          color: ColorsManager.grey400,
                          fontWeight: FontWeight.w400,
                          fontSize: AppSize.s16,
                        ),
                        suffixWidget: const Icon(
                          IconsManager.dateRangeOutlined,
                          color: ColorsManager.grey600,
                        ),
                      )
                    : RowContentInputWidget(
                        centerWidget: CustomTextWidget(
                          text: dateFormatSlashMMYYYY(
                            date: DateTime.tryParse(
                              controller.selectedStartedDateString[eduIndex!],
                            ),
                          ),
                          color: ColorsManager.black,
                          fontSize: AppSize.s16,
                        ),
                        suffixWidget: const Icon(
                          IconsManager.dateRangeOutlined,
                          color: ColorsManager.grey600,
                        ),
                      ),
              ),
            ),

            ///===== Top of School Degree Component =====//
            ContainerDialogWidget(
              inputTitle: 'eduDegreeLabel'.tr,
              fontSizeTitle: AppSize.s16,
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
                  () => controller.schoolDegreeList.isNotEmpty
                      ? FieldListSelector(
                          inputHintText: 'search'.tr,
                          dataListforSelected: controller.schoolDegreeList,
                          selectedItem:
                              controller.educationList[eduIndex!].degreeTag,
                          onTap: (field) {
                            controller.educationList[eduIndex!].degreeTag =
                                field;
                            controller.getUpdate();
                            Navigator.pop(context, true);
                          },
                        )
                      : const LoadingWidget(),
                ),
              ),
              containerWidget: Obx(
                () => controller.educationList[eduIndex!].degreeTag!.id == null
                    ? RowContentInputWidget(
                        centerWidget: CustomTextWidget(
                          text: 'eduDegreeLabel'.tr,
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
                              .educationList[eduIndex!].degreeTag!.label,
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
            //===== Bottom of School Degree Component =====//
          ],
        ),
      ),
    );
  }
}
