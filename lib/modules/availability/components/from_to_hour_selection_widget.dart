import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../data/models/models.dart';

class FromToHourSelectionWidget extends StatelessWidget {
  final String? day;
  final bool? swichingValue;
  final String? dateLanguage;
  final Function(bool)? swichingFunction;
  final FormFieldValidator<String>? validatorFunction;
  final List<SlotModel>? slotList;
  final Function(DateTime)? onConfirmTimeFrom;
  final String? timeFrom;
  final Function(DateTime)? onConfirmTimeTo;
  final String? timeTo;

  const FromToHourSelectionWidget({
    Key? key,
    this.day = '',
    this.swichingValue = false,
    this.swichingFunction,
    this.dateLanguage,
    this.validatorFunction,
    this.slotList,
    this.onConfirmTimeFrom,
    this.timeFrom = '28800',
    this.onConfirmTimeTo,
    this.timeTo = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RowContentInputWidget(
          centerWidget: CustomTextWidget(
            textAlign: TextAlign.center,
            text: day,
          ),
          suffixWidget: Switch(
            value: swichingValue!,
            onChanged: swichingFunction,
            activeTrackColor: ColorsManager.primary25,
            activeColor: ColorsManager.primary,
          ),
        ),
        ...slotList!.map(
          (e) => Wrap(
            children: [
              ///===== Top of From Date & To Date Component =====//
              RowFromToHourSelectionWidget(
                validatorFunction: validatorFunction,
                dateLanguage: dateLanguage,
                timeFrom: e.startTimeToHour,
                onConfirmTimeFrom: onConfirmTimeFrom,
                timeTo: e.endTimeToHour,
                onConfirmTimeTo: onConfirmTimeTo,
                isRemove: slotList!.indexOf(e) != 0,
              ),
              //===== Bottom of From Date & To Date Component =====//

              // RowFromToHourSelectionWidget(
              //   validatorFunction: validatorFunction,
              //   dateLanguage: dateLanguage,
              //   timeFrom: timeFrom,
              //   onConfirmTimeFrom: onConfirmTimeFrom,
              //   timeTo: timeTo,
              //   onConfirmTimeTo: onConfirmTimeTo,
              // ),
            ],
          ),
        ),
      ],
    );
  }
}

class RowFromToHourSelectionWidget extends StatelessWidget {
  final FormFieldValidator<String>? validatorFunction;
  final String? dateLanguage;
  final String? timeFrom;
  final Function(DateTime p1)? onConfirmTimeFrom;
  final String? timeTo;
  final Function(DateTime p1)? onConfirmTimeTo;
  final bool? isRemove;

  const RowFromToHourSelectionWidget({
    Key? key,
    required this.validatorFunction,
    required this.dateLanguage,
    required this.timeFrom,
    required this.onConfirmTimeFrom,
    required this.timeTo,
    required this.onConfirmTimeTo,
    this.isRemove = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSize.s4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ///===== Top of From Date Component =====//
          Expanded(
            flex: 40,
            child: ContainerDialogWidget(
              // inputTitle: 'profile.from'.tr,
              // inputTitleMarginTop: AppSize.s0,
              validatorFunction: validatorFunction,
              dialogType: DialogType.timePickerDialog,
              dateLocale: dateLanguage,
              // currentTime: DateTime(2008, 12, 31, 08),
              currentTime:
                  DateTime.tryParse(timeFrom!) ?? DateTime(2008, 12, 31, 08),
              onConfirmDate: onConfirmTimeFrom,
              containerWidget: timeFrom == ''
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
                        text: timeFrom,
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
              currentTime: DateTime(2008, 12, 31, 18),
              // currentTime: DateTime.tryParse(
              //       timeTo!,
              //     ) ??
              //     DateTime.now(),
              onConfirmDate: onConfirmTimeTo,
              containerWidget: timeTo == ''
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
                        text: timeTo,
                        color: ColorsManager.black,
                        fontSize: AppSize.s16,
                      ),
                      suffixWidgetFlex: 20,
                      suffixWidget: const Icon(
                        IconsManager.schedule,
                        color: ColorsManager.grey600,
                      ),
                    ),
              // RowContentInputWidget(
              //     centerWidget: CustomTextWidget(
              //       text: dateFormatTo24HourMn(
              //         date: DateTime.tryParse(
              //           timeTo!,
              //         ),
              //       ),
              //       color: ColorsManager.black,
              //       fontSize: AppSize.s16,
              //     ),
              //     suffixWidgetFlex: 20,
              //     suffixWidget: const Icon(
              //       IconsManager.schedule,
              //       color: ColorsManager.grey600,
              //     ),
              //   ),
            ),
          ),
          //===== Bottom of To Date Component =====//

          ///===== Top of To Date Component =====//
          Flexible(
            flex: 20,
            child: CustomMaterialButton(
              buttonWidth: 40,
              leftPadding: AppSize.s12,
              buttonColor:
                  isRemove == true ? ColorsManager.red : ColorsManager.green,
              childWidget: SizedBox(
                height: 40,
                child: Icon(
                  isRemove == true ? Icons.close : Icons.add,
                ),
              ),
              fontSize: AppSize.s20,
              onPressed: () {
                unFocusKeyBoard(context);
                // if (!controller.isSubmitBtnProcessing.value == true) {
                //   // controller.saveButtonOnClick();
                // }
              },
            ),
          ),
          //===== Bottom of To Date Component =====//
        ],
      ),
    );
  }
}
