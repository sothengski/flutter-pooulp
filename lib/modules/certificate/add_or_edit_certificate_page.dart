import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import '../modules.dart';

class AddOrEditCertificatePage extends GetView<CertificateController> {
  const AddOrEditCertificatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///===== Top of appBar Component =====//
      appBar: CustomAppBar(
        title: '${controller.title} Certificate',
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
                            controller.makeRequestToCertificateAPI(
                              certificateId: controller.certificateId,
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
          key: controller.editCertificateFormKey,
          child: Padding(
            padding: const EdgeInsets.all(AppSize.s16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ///===== Top of Certificate Title Component =====//
                CustomTextInput(
                  topPadding: AppSize.s16,
                  bottomPadding: AppSize.s16,
                  controller: controller.certificateTitleTextCtrl,
                  inputTitle: 'Title',
                  hintText: 'Enter the Certificate Title',
                  isFilled: true,
                  validator: Validator().notEmptyValidator,
                ),
                //===== Bottom of Certificate Title Component =====//
                ///===== Top of Start Date & End Date Component =====//
                Row(
                  children: [
                    ///===== Top of Received Date Component =====//
                    Expanded(
                      flex: 40,
                      child: ContainerDialogWidget(
                        inputTitle: 'Received Date',
                        inputTitleMarginTop: AppSize.s0,
                        validatorFunction: (_) => Validator().notEmptyValidator(
                          controller.selectedReceivedDateString.value,
                        ),
                        dialogType: DialogType.dateTimePickerDialog,
                        currentTime: DateTime.tryParse(
                              controller.selectedReceivedDateString.value,
                            ) ??
                            DateTime.now(),
                        onConfirmDate: (date) {
                          controller.selectedReceivedDateString.value =
                              dateTimeToString(selectedItem: date);
                        },
                        containerWidget: Obx(
                          () =>
                              controller.selectedReceivedDateString.value == ''
                                  ? const RowContentInputWidget(
                                      centerWidget: CustomTextWidget(
                                        text: 'Received Date',
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
                                                .selectedReceivedDateString
                                                .value,
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

                    ///===== Top of Expire Date Component =====//
                    Expanded(
                      flex: 40,
                      child: ContainerDialogWidget(
                        inputTitle: 'Expire Date',
                        inputTitleMarginTop: AppSize.s0,
                        dialogType: DialogType.dateTimePickerDialog,
                        currentTime: DateTime.tryParse(
                              controller.selectedExpireDateString.value,
                            ) ??
                            DateTime.now(),
                        onConfirmDate: (date) {
                          controller.selectedExpireDateString.value =
                              dateTimeToString(selectedItem: date);
                        },
                        containerWidget: Obx(
                          () => controller.selectedExpireDateString.value == ''
                              ? const RowContentInputWidget(
                                  centerWidget: CustomTextWidget(
                                    text: 'Expire Date',
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
                                        controller
                                            .selectedExpireDateString.value,
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
                    //===== Bottom of Expire Date Component =====//
                  ],
                ),
                //===== Bottom of Start Date & End Date Component =====//

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
