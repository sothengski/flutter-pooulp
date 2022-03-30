import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import 'experience.dart';

class AddOrEditExperiencePage extends GetView<ExperienceController> {
  const AddOrEditExperiencePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///===== Top of appBar Component =====//
      appBar: CustomAppBar(
        title: '${controller.title} Experience',
        actions: [
          if (controller.title != Keys.editOperation)
            Container()
          else
            CustomIconButtonWidget(
              iconData: IconsManager.deleteForeverOutlined,
              iconColor: ColorsManager.white,
              tooltip: AppStrings.removeText,
              onClick: () => Get.dialog(
                MaterialDialogWidget(
                  title: AppStrings.confirmationText,
                  titleHorizontalMargin: AppSize.s12,
                  contentWidget: const Center(
                    child: CustomTextWidget(
                      marginTop: AppSize.s12,
                      marginBottom: AppSize.s12,
                      text: 'Would you like to remove this information?',
                    ),
                  ),
                  actionWidget: Row(
                    children: [
                      Expanded(
                        flex: 40,
                        child: OutlinedButton.icon(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            IconsManager.close,
                            color: Colors.white,
                          ),
                          label: const CustomTextWidget(
                            text: AppStrings.noText,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 40,
                        child: OutlinedButton.icon(
                          onPressed: () async => {
                            controller.makeRequestToExperienceAPI(
                              expId: controller.expId,
                              operation: Keys.deleteOperation,
                            ),
                            Get.back(),
                          },
                          icon: const Icon(
                            IconsManager.check,
                            color: Colors.white,
                          ),
                          label: const CustomTextWidget(
                            text: AppStrings.yesText,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
        ],
      ),
      //===== Bottom of appBar Component =====//

      ///===== Top of body Component =====//
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: controller.editExperienceFormKey,
          child: Padding(
            padding: const EdgeInsets.all(AppSize.s16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (controller.expType.value == AppStrings.professionalKey)

                  ///===== Top of Company Name Component =====//
                  CustomTextInput(
                    topPadding: AppSize.s16,
                    controller: controller.companyNameTextCtrl,
                    inputTitle: 'Company Name',
                    hintText: 'Enter the Company Name',
                    isFilled: true,
                    validator: Validator().notEmptyValidator,
                  )
                //===== Bottom of Company Name Component =====//
                else

                  ///===== Top of Type Component =====//
                  ContainerDialogWidget(
                    inputTitle: 'Experience Type',
                    validatorFunction: (_) => Validator().notEmptyValidator(
                      controller.selectedExperienceType.value.label ?? '',
                    ),
                    dialogWidget: MaterialDialogWidget(
                      title: 'Select Experience Type',
                      contentWidget: Obx(
                        () => controller.experienceTypeList.isNotEmpty
                            ? ListView.separated(
                                shrinkWrap: true,
                                itemCount: controller.experienceTypeList.length,
                                itemBuilder: (context, index) {
                                  return Obx(
                                    () => RowDataSelectionWidget.radioButton(
                                      isLeftSideText: false,
                                      isClickingValue: stringsComparation(
                                        object1: controller
                                            .experienceTypeList[index].label,
                                        object2: controller
                                            .selectedExperienceType.value.label,
                                      ),
                                      text: controller
                                          .experienceTypeList[index].label,
                                      onPressed: () {
                                        controller
                                                .selectedExperienceType.value =
                                            controller
                                                .selectedExperienceTypeOnClick(
                                          selectedItem: controller
                                              .experienceTypeList[index],
                                        );
                                        Navigator.pop(
                                          context,
                                          true,
                                        ); // Issue:: It's not working properly on first click with Get.back();
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
                              )
                            : const LoadingWidget(),
                      ),
                    ),
                    containerWidget: Obx(
                      () => controller.selectedExperienceType.value.id == null
                          ? const RowContentInputWidget(
                              centerWidget: CustomTextWidget(
                                text: 'Select your Experience Type',
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
                                text: controller
                                    .selectedExperienceType.value.label,
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

                //===== Bottom of Type Component =====//

                ///===== Top of Title Component =====//
                CustomTextInput(
                  topPadding: AppSize.s16,
                  controller: controller.titleTextCtrl,
                  inputTitle: 'Title',
                  hintText: 'Enter your Title',
                  isFilled: true,
                  validator: Validator().notEmptyValidator,
                ),
                //===== Bottom of Title Component =====//

                ///===== Top of Current Working CheckBox Component =====//
                Obx(
                  () => RowDataSelectionWidget.checkBox(
                    verticalPadding: AppSize.s16,
                    horizontalPadding: AppSize.s0,
                    isClickingValue: controller.isCheckStillWorking.value,
                    text: 'I am currently working in this role.',
                    isLeftSideText: false,
                    onPressed: () {
                      controller.isCheckStillWorking.value =
                          switchingBooleanValue(
                        boolValue: controller.isCheckStillWorking.value,
                      );
                    },
                  ),
                ),
                //===== Bottom of Current Working CheckBox Component =====//

                ///===== Top of Start Date & End Date Component =====//
                Row(
                  children: [
                    ///===== Top of Start Date Component =====//
                    Expanded(
                      flex: 40,
                      child: ContainerDialogWidget(
                        inputTitle: 'Start Date',
                        inputTitleMarginTop: AppSize.s0,
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
                        inputTitleMarginTop: AppSize.s0,
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

                ///===== Top of Start Locations Component =====//
                Row(
                  children: [
                    ///===== Top of City Component =====//
                    Expanded(
                      flex: 40,
                      child: CustomTextInput(
                        topPadding: AppSize.s16,
                        controller: controller.cityTextCtrl,
                        inputTitle: 'City',
                        hintText: 'Enter the City',
                        isFilled: true,
                        // validator: Validator().notEmptyValidator,
                      ),
                    ),
                    //===== Bottom of City Component =====//
                    const SizedBox(
                      width: AppSize.s12,
                    ),

                    ///===== Top of Country Component =====//
                    Expanded(
                      flex: 40,
                      child: CustomTextInput(
                        topPadding: AppSize.s16,
                        controller: controller.countryTextCtrl,
                        inputTitle: 'Country',
                        hintText: 'Enter the Country',
                        isFilled: true,
                        // validator: Validator().notEmptyValidator,
                      ),
                    ),
                    //===== Bottom of Country Component =====//
                  ],
                ),
                //===== Bottom of Locations Component =====//

                ///===== Top of Description Component =====//
                CustomTextInput(
                  topPadding: AppSize.s16,
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
      //===== Bottom of body Component =====//

      ///===== Top of bottomNavigationBar Component =====//
      bottomNavigationBar: Obx(
        () => CustomMaterialButton(
          leftPadding: AppSize.s12,
          rightPadding: AppSize.s12,
          bottomPadding: AppSize.s20,
          text: AppStrings.saveText,
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
      //===== Bottom of bottomNavigationBar Component =====//
    );
  }
}
