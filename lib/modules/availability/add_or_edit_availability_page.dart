import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import '../modules.dart';

class AddOrEditAvailabilityPage extends GetView<AvailabilityController> {
  const AddOrEditAvailabilityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///===== Top of appBar Component =====//
      appBar: CustomAppBar(
        title: controller.title == AppStrings.addText
            ? 'profile.addAvailability'.tr
            : 'profile.editAvailability'.tr,
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
                    // controller.makeRequestToCertificateAPI(
                    //   certificateId: controller.certificateId,
                    //   operation: Keys.deleteOperation,
                    // ),
                    Get.back(),
                  },
                ),
              ),
            )
        ],
      ),
      //===== Bottom of appBar Component =====//

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: controller.editAvailabilityFormKey,
          child: Padding(
            padding: const EdgeInsets.all(AppSize.s16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///===== Top of period Component =====//
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(
                          left: AppSize.s4,
                          right: AppSize.s4,
                        ),
                        child: const Divider(
                          color: Colors.black,
                          height: 10,
                        ),
                      ),
                    ),
                    CustomTextWidget(
                      text: 'profile.period'.tr,
                      fontSize: AppSize.s16,
                      fontWeight: FontWeight.w500,
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(
                          left: AppSize.s4,
                          right: AppSize.s4,
                        ),
                        child: const Divider(
                          color: Colors.black,
                          height: 10,
                        ),
                      ),
                    ),
                  ],
                ),
                //===== Bottom of period Component =====//

                ///===== Top of From Date & To Date Component =====//
                Row(
                  children: [
                    ///===== Top of From Date Component =====//
                    Expanded(
                      flex: 40,
                      child: ContainerDialogWidget(
                        inputTitle: 'profile.from'.tr,
                        inputTitleMarginTop: AppSize.s16,
                        validatorFunction: (_) => Validator().notEmptyValidator(
                          controller.selectedFromDateString.value,
                        ),
                        dialogType: DialogType.dateTimePickerDialog,
                        dateLocale: controller
                            .profileController.userProfileInfo.value.uiLanguage,
                        currentTime: DateTime.tryParse(
                              controller.selectedFromDateString.value,
                            ) ??
                            DateTime.now(),
                        onConfirmDate: (date) {
                          controller.selectedFromDateString.value =
                              dateTimeToString(selectedItem: date);
                        },
                        containerWidget: Obx(
                          () => controller.selectedFromDateString.value == ''
                              ? RowContentInputWidget(
                                  centerWidget: CustomTextWidget(
                                    text: 'profile.from'.tr,
                                    color: ColorsManager.grey400,
                                    fontWeight: FontWeight.w400,
                                    fontSize: AppSize.s16,
                                  ),
                                  suffixWidgetFlex: 20,
                                  suffixWidget: const Icon(
                                    IconsManager.dateRangeOutlined,
                                    color: ColorsManager.grey600,
                                  ),
                                )
                              : RowContentInputWidget(
                                  centerWidget: CustomTextWidget(
                                    text: dateFormatDashYYYYMMDD(
                                      date: DateTime.tryParse(
                                        controller.selectedFromDateString.value,
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
                    //===== Bottom of From Date Component =====//
                    const SizedBox(
                      width: AppSize.s12,
                    ),

                    ///===== Top of To Date Component =====//
                    Expanded(
                      flex: 40,
                      child: ContainerDialogWidget(
                        inputTitle: 'profile.to'.tr,
                        // 'End Date(Or Expected)',
                        inputTitleMarginTop: AppSize.s16,
                        validatorFunction: (_) => Validator().notEmptyValidator(
                          controller.selectedToDateString.value,
                        ),
                        dialogType: DialogType.dateTimePickerDialog,
                        dateLocale: controller
                            .profileController.userProfileInfo.value.uiLanguage,
                        currentTime: DateTime.tryParse(
                              controller.selectedToDateString.value,
                            ) ??
                            DateTime.now(),
                        onConfirmDate: (date) {
                          controller.selectedToDateString.value =
                              dateTimeToString(selectedItem: date);
                        },
                        containerWidget: Obx(
                          () => controller.selectedToDateString.value == ''
                              ? RowContentInputWidget(
                                  centerWidget: CustomTextWidget(
                                    text: 'profile.to'.tr,
                                    color: ColorsManager.grey400,
                                    fontWeight: FontWeight.w400,
                                    fontSize: AppSize.s16,
                                  ),
                                  suffixWidgetFlex: 20,
                                  suffixWidget: const Icon(
                                    Icons.date_range_outlined,
                                    color: ColorsManager.grey600,
                                  ),
                                )
                              : RowContentInputWidget(
                                  centerWidget: CustomTextWidget(
                                    text: dateFormatDashYYYYMMDD(
                                      date: DateTime.tryParse(
                                        controller.selectedToDateString.value,
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
                    //===== Bottom of To Date Component =====//
                  ],
                ),
                //===== Bottom of From Date & To Date Component =====//

                // Container(
                //   margin: const EdgeInsets.symmetric(
                //     vertical: AppSize.s8,
                //     horizontal: AppSize.s2,
                //   ),
                //   child: const Divider(
                //     color: Colors.black,
                //     height: 10,
                //   ),
                // ),

                ///===== Top of Custom Availabilities Component =====//
                Obx(
                  () => RowDataSelectionWidget.checkBox(
                    verticalPadding: AppSize.s16,
                    horizontalPadding: AppSize.s0,
                    isClickingValue: controller.isCustomAvailability.value,
                    text: 'profile.customAvailabilities'.tr,
                    isLeftSideText: false,
                    onPressed: () {
                      controller.isCustomAvailability.value =
                          switchingBooleanValue(
                        boolValue: controller.isCustomAvailability.value,
                      );
                    },
                  ),
                ),
                //===== Bottom of Custom Availabilities Component =====//

                Container(
                  margin: const EdgeInsets.only(
                    bottom: AppSize.s8,
                  ),
                  child: const Divider(
                    color: Colors.black,
                    height: 10,
                  ),
                ),

                ///===== Top of Custom Availabilities Component =====//
                ///
                Obx(
                  () => Wrap(
                    children: [
                      ...controller.weeklyAvailability
                          .map(
                            (element) => FromToHourSelectionWidget(
                              dayIndex: element.day,
                              dayLabel: element.dayLabel,
                              dateLanguage: controller.profileController
                                  .userProfileInfo.value.uiLanguage,
                              swichingValue: element.isOpen,
                              // controller
                              //     .weeklyAvailabilitiesList[element.day! - 1],
                              swichingFunction: (value) {
                                element.isOpen = switchingBooleanValue(
                                  boolValue: element.isOpen,
                                );
                                controller.getUpdate();
                              },
                              slotList: element.slots,
                              isUpdateTrigger: controller.isUpdateTrigger.value,
                              // modifySlotListFunction: () {
                              //   controller.modifySlotInWeekDay(
                              //     isRemove: controller.weeklyAvailability[0].slots!.map((e) => e.id),
                              //     removeWhichIndex: -1,
                              //     slotToBeAdd: controller.defaultSlotValue,
                              //     slotList: controller.weeklyAvailability[0].slots,
                              //   );
                              // },
                              // timeFrom: controller.selectedFromDateString.value,
                              // onConfirmTimeFrom: (date) {
                              //   controller.selectedFromDateString.value =
                              //       dateTimeToString(selectedItem: date);
                              // },
                              // timeTo: controller.selectedToDateString.value,
                              // onConfirmTimeTo: (date) {
                              //   controller.selectedToDateString.value =
                              //       dateTimeToString(selectedItem: date);
                              // },
                              validatorFunction: (_) =>
                                  Validator().notEmptyValidator(
                                controller.selectedFromDateString.value,
                              ),
                            ),
                          )
                          .toList()
                    ],
                  ),
                ),
                // Obx(
                //   () => FromToHourSelectionWidget(
                //     day: 'Monday',
                //     dateLanguage: controller
                //         .profileController.userProfileInfo.value.uiLanguage,
                //     swichingValue: controller.isCustomAvailability.value,
                //     swichingFunction: (value) {
                //       controller.isCustomAvailability.value =
                //           switchingBooleanValue(
                //         boolValue: controller.isCustomAvailability.value,
                //       );
                //     },
                //     timeFrom: controller.selectedFromDateString.value,
                //     onConfirmTimeFrom: (date) {
                //       controller.selectedFromDateString.value =
                //           dateTimeToString(selectedItem: date);
                //     },
                //     timeTo: controller.selectedToDateString.value,
                //     onConfirmTimeTo: (date) {
                //       controller.selectedToDateString.value =
                //           dateTimeToString(selectedItem: date);
                //     },
                //     validatorFunction: (_) => Validator().notEmptyValidator(
                //       controller.selectedFromDateString.value,
                //     ),
                //   ),
                // ),

                // Obx(
                //   () => Column(
                //     children: [
                //       RowContentInputWidget(
                //         centerWidget: const CustomTextWidget(
                //           textAlign: TextAlign.center,
                //           text: 'Tuesday',
                //         ),
                //         suffixWidget: Switch(
                //           value: controller.isCustomAvailability.value,
                //           onChanged: (value) {
                //             controller.isCustomAvailability.value =
                //                 switchingBooleanValue(
                //               boolValue: controller.isCustomAvailability.value,
                //             );
                //           },
                //           activeTrackColor: ColorsManager.primary25,
                //           activeColor: ColorsManager.primary,
                //         ),
                //       ),

                //       ///===== Top of From Date & To Date Component =====//
                //       Row(
                //         children: [
                //           ///===== Top of From Date Component =====//
                //           Expanded(
                //             flex: 40,
                //             child: ContainerDialogWidget(
                //               // inputTitle: 'profile.from'.tr,
                //               // inputTitleMarginTop: AppSize.s0,
                //               validatorFunction: (_) =>
                //                   Validator().notEmptyValidator(
                //                 controller.selectedFromDateString.value,
                //               ),
                //               dialogType: DialogType.dateTimePickerDialog,
                //               dateLocale: controller.profileController
                //                   .userProfileInfo.value.uiLanguage,
                //               currentTime: DateTime.tryParse(
                //                     controller.selectedFromDateString.value,
                //                   ) ??
                //                   DateTime.now(),
                //               onConfirmDate: (date) {
                //                 controller.selectedFromDateString.value =
                //                     dateTimeToString(selectedItem: date);
                //               },
                //               containerWidget: Obx(
                //                 () => controller.selectedFromDateString.value ==
                //                         ''
                //                     ? RowContentInputWidget(
                //                         centerWidget: CustomTextWidget(
                //                           text: 'profile.from'.tr,
                //                           color: ColorsManager.grey400,
                //                           fontWeight: FontWeight.w400,
                //                           fontSize: AppSize.s16,
                //                         ),
                //                         suffixWidgetFlex: 20,
                //                         suffixWidget: const Icon(
                //                           IconsManager.schedule,
                //                           color: ColorsManager.grey600,
                //                         ),
                //                       )
                //                     : RowContentInputWidget(
                //                         centerWidget: CustomTextWidget(
                //                           text: dateFormatDashYYYYMMDD(
                //                             date: DateTime.tryParse(
                //                               controller
                //                                   .selectedFromDateString.value,
                //                             ),
                //                           ),
                //                           color: ColorsManager.black,
                //                           fontSize: AppSize.s16,
                //                         ),
                //                         suffixWidgetFlex: 20,
                //                         suffixWidget: const Icon(
                //                           IconsManager.schedule,
                //                           color: ColorsManager.grey600,
                //                         ),
                //                       ),
                //               ),
                //             ),
                //           ),
                //           //===== Bottom of From Date Component =====//
                //           const SizedBox(
                //             width: AppSize.s12,
                //           ),

                //           ///===== Top of To Date Component =====//
                //           Expanded(
                //             flex: 40,
                //             child: ContainerDialogWidget(
                //               // inputTitle: 'profile.to'.tr,
                //               inputTitleMarginBottom: AppSize.s0,
                //               dialogType: DialogType.dateTimePickerDialog,
                //               dateLocale: controller.profileController
                //                   .userProfileInfo.value.uiLanguage,
                //               currentTime: DateTime.tryParse(
                //                     controller.selectedToDateString.value,
                //                   ) ??
                //                   DateTime.now(),
                //               onConfirmDate: (date) {
                //                 controller.selectedToDateString.value =
                //                     dateTimeToString(selectedItem: date);
                //               },
                //               containerWidget: Obx(
                //                 () =>
                //                     controller.selectedToDateString.value == ''
                //                         ? RowContentInputWidget(
                //                             centerWidget: CustomTextWidget(
                //                               text: 'profile.to'.tr,
                //                               color: ColorsManager.grey400,
                //                               fontWeight: FontWeight.w400,
                //                               fontSize: AppSize.s16,
                //                             ),
                //                             suffixWidgetFlex: 20,
                //                             suffixWidget: const Icon(
                //                               IconsManager.schedule,
                //                               color: ColorsManager.grey600,
                //                             ),
                //                           )
                //                         : RowContentInputWidget(
                //                             centerWidget: CustomTextWidget(
                //                               text: dateFormatDashYYYYMMDD(
                //                                 date: DateTime.tryParse(
                //                                   controller
                //                                       .selectedToDateString
                //                                       .value,
                //                                 ),
                //                               ),
                //                               color: ColorsManager.black,
                //                               fontSize: AppSize.s16,
                //                             ),
                //                             suffixWidgetFlex: 20,
                //                             suffixWidget: const Icon(
                //                               IconsManager.schedule,
                //                               color: ColorsManager.grey600,
                //                             ),
                //                           ),
                //               ),
                //             ),
                //           ),
                //           //===== Bottom of To Date Component =====//
                //         ],
                //       ),
                //       //===== Bottom of From Date & To Date Component =====//
                //     ],
                //   ),
                // ),
                //===== Bottom of Custom Availabilities Component =====//
              ],
            ),
          ),
        ),
      ),

      ///===== Top of bottomNavigationBar Component =====//
      bottomNavigationBar: Obx(
        () => CustomMaterialButton(
          leftPadding: AppSize.s12,
          rightPadding: AppSize.s12,
          bottomPadding: AppSize.s20,
          text: 'core.saveBtn'.tr,
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
