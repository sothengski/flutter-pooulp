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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          RowContentInputWidget(
            centerWidget: CustomTextWidget(
              textAlign: controller.isUpdateTrigger.value == true
                  ? TextAlign.center
                  : TextAlign.center,
              text: dayLabel,
              fontSize: AppSize.s16,
            ),
            suffixWidget: Switch(
              value: swichingValue!,
              onChanged: swichingFunction,
              activeTrackColor: ColorsManager.primary25,
              activeColor: ColorsManager.primary,
            ),
          ),
          if (slotList!.isEmpty)
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppSize.s4,
                  ),
                )
              ],
            )
          else if (swichingValue == false)
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: AppSize.s4,
              ),
              child: Center(
                child: CustomTextWidget(
                  text: 'profile.dayNotAvailable'.trParams(
                    {
                      'day': dayLabel!,
                    },
                  ),
                ),
              ),
            )
          else
            ...slotList!.map(
              (e) => Wrap(
                children: [
                  ///===== Top of From Date & To Date Component =====//
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSize.s4,
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
                                : ColorsManager.primaryBlue,
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
                              );
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
