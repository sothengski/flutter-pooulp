import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';
import '../../modules.dart';

class FromToHourSelectionWidget extends GetView<AvailabilityController> {
  final int? dayIndex;
  final String? dayLabel;
  final bool? swichingValue;
  final String? dateLanguage;
  final Function(bool)? swichingFunction;
  final FormFieldValidator<String>? validatorFunction;
  final List<SlotModel>? slotList;
  final bool? isUpdateTrigger;

  // final List<WeeklyModel>? weeklyList;

  // final VoidCallback? modifySlotListFunction;
  // final Function(DateTime)? onConfirmTimeFrom;
  // final String? timeFrom;
  // final Function(DateTime)? onConfirmTimeTo;
  // final String? timeTo;

  const FromToHourSelectionWidget({
    Key? key,
    required this.dayIndex,
    this.dayLabel = '',
    this.swichingValue = false,
    this.swichingFunction,
    this.dateLanguage,
    this.validatorFunction,
    this.slotList,
    this.isUpdateTrigger,
    // this.weeklyList,
    // this.modifySlotListFunction,
    // this.onConfirmTimeFrom,
    // this.timeFrom = '28800',
    // this.onConfirmTimeTo,
    // this.timeTo = '64800',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          RowContentInputWidget(
            centerWidget: CustomTextWidget(
              textAlign: TextAlign.center,
              text: dayLabel,
            ),
            suffixWidget: Switch(
              value: swichingValue!,
              onChanged: swichingFunction,
              activeTrackColor: ColorsManager.primary25,
              activeColor: ColorsManager.primary,
            ),
          ),
          if (slotList == [] || slotList == null)
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: controller.isUpdateTrigger.value == true
                        ? AppSize.s4
                        : AppSize.s4,
                  ),
                )
              ],
            )
          else if (swichingValue == false)
            Container(
              padding: EdgeInsets.symmetric(
                vertical: controller.isUpdateTrigger.value == true
                    ? AppSize.s4
                    : AppSize.s4,
              ),
              child: Center(
                child: CustomTextWidget(text: '$dayLabel not available'),
              ),
            )
          else
            ...slotList!.map(
              (e) => Wrap(
                children: [
                  ///===== Top of From Date & To Date Component =====//

                  // RowFromToHourSelectionWidget(
                  //   validatorFunction: validatorFunction,
                  //   dateLanguage: dateLanguage,
                  //   timeFrom: e.startTime,
                  //   onConfirmTimeFrom: (date) {
                  //     e.startTime = dateTimeConvertToSecond(
                  //       hour: date!.hour,
                  //       minute: date.minute,
                  //       second: date.second,
                  //     );
                  //     // print("timeFrom: ${e.startTime}");
                  //     controller.getUpdate();
                  //   },
                  //   // onConfirmTimeFrom: e.startTimeToHour,
                  //   timeTo: e.endTime,
                  //   onConfirmTimeTo: (date) {
                  //     e.endTime = dateTimeConvertToSecond(
                  //       hour: date!.hour,
                  //       minute: date.minute,
                  //       second: date.second,
                  //     );
                  //     // print("timeFrom: ${e.endTime}");
                  //     controller.getUpdate();
                  //   },
                  //   // onConfirmTimeTo: e.endTimeToHour,
                  //   isRemove: slotList!.indexOf(e) != 0,
                  //   isUpdateBool: controller.isUpdateTrigger.value,
                  // ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: controller.isUpdateTrigger.value == true
                          ? AppSize.s4
                          : AppSize.s4,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ///===== Top of From Date Component =====//
                        Expanded(
                          flex: 40,
                          child: ContainerDialogWidget(
                            // inputTitle: 'profile.from'.tr,
                            // inputTitleMarginTop: AppSize.s0,
                            // validatorFunction: validatorFunction,
                            dialogType: DialogType.timePickerDialog,
                            dateLocale: dateLanguage,
                            currentTime: DateTime(2022, 02, 22)
                                .add(Duration(seconds: e.startTime!)),
                            onConfirmDate: (date) {
                              e.startTime = dateTimeConvertToSecond(
                                hour: date.hour,
                                minute: date.minute,
                                second: date.second,
                              );
                              // print("timeFrom: ${e.startTime}");
                              controller.getUpdate();
                            },

                            containerWidget: e.startTime.toString() == ''
                                ? RowContentInputWidget(
                                    centerWidget: CustomTextWidget(
                                      text: 'profile.from'.tr,
                                      color: ColorsManager.grey400,
                                      fontWeight: FontWeight.w400,
                                      fontSize: AppSize.s16,
                                    ),
                                    suffixWidgetFlex: 20,
                                    suffixWidget: const Icon(
                                      IconsManager.schedule,
                                      color: ColorsManager.grey600,
                                    ),
                                  )
                                : RowContentInputWidget(
                                    centerWidget: CustomTextWidget(
                                      text: intToActuallyHoursMins(
                                        value: e.startTime,
                                      ),
                                      color: ColorsManager.black,
                                      fontSize: AppSize.s16,
                                    ),
                                    suffixWidgetFlex: 20,
                                    suffixWidget: const Icon(
                                      IconsManager.schedule,
                                      color: ColorsManager.grey600,
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
                            // inputTitle: 'profile.to'.tr,
                            inputTitleMarginBottom: AppSize.s0,
                            dialogType: DialogType.timePickerDialog,
                            dateLocale: dateLanguage,
                            currentTime: DateTime(2022, 02, 22)
                                .add(Duration(seconds: e.endTime!)),
                            // onConfirmDate: onConfirmTimeTo,
                            onConfirmDate: (date) {
                              e.endTime = dateTimeConvertToSecond(
                                hour: date.hour,
                                minute: date.minute,
                                second: date.second,
                              );
                              // print("timeFrom: ${e.endTime}");
                              controller.getUpdate();
                            },
                            containerWidget: e.endTime.toString() == ''
                                ? RowContentInputWidget(
                                    centerWidget: CustomTextWidget(
                                      text: 'profile.to'.tr,
                                      color: ColorsManager.grey400,
                                      fontWeight: FontWeight.w400,
                                      fontSize: AppSize.s16,
                                    ),
                                    suffixWidgetFlex: 20,
                                    suffixWidget: const Icon(
                                      IconsManager.schedule,
                                      color: ColorsManager.grey600,
                                    ),
                                  )
                                : RowContentInputWidget(
                                    centerWidget: CustomTextWidget(
                                      text: intToActuallyHoursMins(
                                        value: e.endTime,
                                      ),
                                      color: ColorsManager.black,
                                      fontSize: AppSize.s16,
                                    ),
                                    suffixWidgetFlex: 20,
                                    suffixWidget: const Icon(
                                      IconsManager.schedule,
                                      color: ColorsManager.grey600,
                                    ),
                                  ),
                          ),
                        ),
                        //===== Bottom of To Date Component =====//

                        ///===== Top of To Date Component =====//
                        Flexible(
                          flex: 20,
                          child: CustomMaterialButton(
                            buttonWidth: 40,
                            leftPadding: AppSize.s12,
                            buttonColor: slotList!.indexOf(e) != 0
                                ? ColorsManager.red
                                : ColorsManager.green,
                            childWidget: SizedBox(
                              height: 40,
                              child: Icon(
                                slotList!.indexOf(e) != 0
                                    ? Icons.close
                                    : Icons.add,
                              ),
                            ),
                            fontSize: AppSize.s20,
                            onPressed: //modifySlotListFunction,
                                () {
                              unFocusKeyBoard(context);
                              controller.modifySlotInWeekDay(
                                isRemove: slotList!.indexOf(e) != 0,
                                dayIndex: dayIndex,
                                removeIndex: slotList!.indexOf(e) != 0
                                    ? slotList!.indexOf(e)
                                    : -1,
                                slotToBeAdd: SlotModel(
                                  startTime: 28800, // 08:00
                                  endTime: 64800, // 18:00
                                ),
                                // slotList: slotList,
                              );
                              // if (!controller.isSubmitBtnProcessing.value == true) {
                              //   // controller.saveButtonOnClick();
                              // }
                            },
                          ),
                        ),
                        //===== Bottom of To Date Component =====//
                      ],
                    ),
                  ),

                  //===== Bottom of From Date & To Date Component =====//
                ],
              ),
            ),
        ],
      ),
    );
  }
}

// class RowFromToHourSelectionWidget extends StatelessWidget {
//   final FormFieldValidator<String>? validatorFunction;
//   final String? dateLanguage;
//   final int? timeFrom;
//   final Function(DateTime?)? onConfirmTimeFrom;
//   final int? timeTo;
//   final Function(DateTime?)? onConfirmTimeTo;
//   final bool? isRemove;
//   final bool? isUpdateBool;

//   const RowFromToHourSelectionWidget({
//     Key? key,
//     required this.validatorFunction,
//     required this.dateLanguage,
//     required this.timeFrom,
//     required this.onConfirmTimeFrom,
//     required this.timeTo,
//     required this.onConfirmTimeTo,
//     this.isRemove = true,
//     this.isUpdateBool,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: AppSize.s4),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           ///===== Top of From Date Component =====//
//           Expanded(
//             flex: 40,
//             child: ContainerDialogWidget(
//               // inputTitle: 'profile.from'.tr,
//               // inputTitleMarginTop: AppSize.s0,
//               validatorFunction: validatorFunction,
//               dialogType: DialogType.timePickerDialog,
//               dateLocale: dateLanguage,
//               currentTime:
//                   DateTime(2022, 02, 22).add(Duration(seconds: timeFrom!)),
//               onConfirmDate: onConfirmTimeFrom,
//               // onConfirmDate: (date) {
//               //   timeFrom = dateTimeConvertToSecond(
//               //     hour: date.hour,
//               //     minute: date.minute,
//               //     second: date.second,
//               //   );
//               //   // print(
//               //   //   "date: hr:${date.hour} Min:${date.minute}",
//               //   // );
//               //   // print(
//               //   //   "timeFrom After Convert: ${dateTimeConvertToSecond(hour: date.hour, minute: date.minute)}",
//               //   // );
//               //   print("timeFrom: $timeFrom");

//               // },
//               containerWidget: timeFrom.toString() == ''
//                   ? RowContentInputWidget(
//                       centerWidget: CustomTextWidget(
//                         text: 'profile.from'.tr,
//                         color: ColorsManager.grey400,
//                         fontWeight: FontWeight.w400,
//                         fontSize: AppSize.s16,
//                       ),
//                       suffixWidgetFlex: 20,
//                       suffixWidget: const Icon(
//                         IconsManager.schedule,
//                         color: ColorsManager.grey600,
//                       ),
//                     )
//                   : RowContentInputWidget(
//                       centerWidget: CustomTextWidget(
//                         text: intToActuallyHoursMins(value: timeFrom),
//                         //timeTo!.toString(),
//                         // dateFormatTo24HourMn(
//                         //   date: DateTime.tryParse(
//                         //     timeTo!.toString(),
//                         //   ),
//                         // ),
//                         color: ColorsManager.black,
//                         fontSize: AppSize.s16,
//                       ),
//                       suffixWidgetFlex: 20,
//                       suffixWidget: const Icon(
//                         IconsManager.schedule,
//                         color: ColorsManager.grey600,
//                       ),
//                     ),
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
//               dialogType: DialogType.timePickerDialog,
//               dateLocale: dateLanguage,
//               currentTime:
//                   DateTime(2022, 02, 22).add(Duration(seconds: timeTo!)),
//               onConfirmDate: onConfirmTimeTo,
//               containerWidget: timeTo.toString() == ''
//                   ? RowContentInputWidget(
//                       centerWidget: CustomTextWidget(
//                         text: 'profile.to'.tr,
//                         color: ColorsManager.grey400,
//                         fontWeight: FontWeight.w400,
//                         fontSize: AppSize.s16,
//                       ),
//                       suffixWidgetFlex: 20,
//                       suffixWidget: const Icon(
//                         IconsManager.schedule,
//                         color: ColorsManager.grey600,
//                       ),
//                     )
//                   : RowContentInputWidget(
//                       centerWidget: CustomTextWidget(
//                         text: intToActuallyHoursMins(value: timeTo),
//                         color: ColorsManager.black,
//                         fontSize: AppSize.s16,
//                       ),
//                       suffixWidgetFlex: 20,
//                       suffixWidget: const Icon(
//                         IconsManager.schedule,
//                         color: ColorsManager.grey600,
//                       ),
//                     ),
//             ),
//           ),
//           //===== Bottom of To Date Component =====//

//           ///===== Top of To Date Component =====//
//           Flexible(
//             flex: 20,
//             child: CustomMaterialButton(
//               buttonWidth: 40,
//               leftPadding: AppSize.s12,
//               buttonColor:
//                   isRemove == true ? ColorsManager.red : ColorsManager.green,
//               childWidget: SizedBox(
//                 height: 40,
//                 child: Icon(
//                   isRemove == true ? Icons.close : Icons.add,
//                 ),
//               ),
//               fontSize: AppSize.s20,
//               onPressed: () {
//                 unFocusKeyBoard(context);
//                 // if (!controller.isSubmitBtnProcessing.value == true) {
//                 //   // controller.saveButtonOnClick();
//                 // }
//               },
//             ),
//           ),
//           //===== Bottom of To Date Component =====//
//         ],
//       ),
//     );
//   }
// }
