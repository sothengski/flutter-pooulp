import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as datetimepicker;
import 'package:get/get.dart';

import '../core.dart';

enum DialogType {
  bottomSheetDialog,
  alertDialog,
  dateTimePickerDialog,
  dateWithoutDayPickerDialog,
  timePickerDialog,
}

LocaleType localeTypeFunc({required String? dateLocale}) {
  return dateLocale == 'fr'
      ? LocaleType.fr
      : dateLocale == 'nl'
      ? LocaleType.nl
      : LocaleType.en;
}

class ContainerDialogWidget extends StatelessWidget {
  final String? inputTitle;
  final Color? inputTitleColor;
  final double? fontSizeTitle;
  final FontWeight? fontWeightTitle;
  final double? leftPadding;
  final double? rightPadding;
  final double? topPadding;
  final double? bottomPadding;
  final Widget? dialogWidget;
  final DateTime? currentTime;
  final DateTime? minTime;
  final String? dateLocale;
  final Function(DateTime)? onConfirmDate;
  final Widget? containerWidget;
  final DialogType? dialogType;
  final double? inputTitleMarginTop;
  final double? inputTitleMarginBottom;
  final FormFieldValidator<String>? validatorFunction;
  final bool? isTap;
  // final FormFieldValidator? validatorFunction;

  const ContainerDialogWidget({
    super.key,
    this.inputTitle = '',
    this.inputTitleColor = ColorsManager.primaryBlue,
    this.fontSizeTitle = AppSize.s14,
    this.fontWeightTitle = FontWeight.w400,
    this.dialogWidget,
    this.currentTime,
    this.minTime,
    this.dateLocale = 'en',
    this.onConfirmDate,
    this.containerWidget,
    this.dialogType = DialogType.alertDialog,
    this.inputTitleMarginTop = AppSize.s12,
    this.inputTitleMarginBottom = AppSize.s0,
    this.validatorFunction,
    this.isTap = true,
    this.leftPadding = 0.0,
    this.rightPadding = 0.0,
    this.topPadding = 0.0,
    this.bottomPadding = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: topPadding!,
        left: leftPadding!,
        right: rightPadding!,
        bottom: bottomPadding!,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (inputTitle!.isEmpty)
            Container()
          else
            CustomTextWidget(
              text: inputTitle,
              color: inputTitleColor,
              marginTop: inputTitleMarginTop,
              textAlign: TextAlign.left,
              fontSize: fontSizeTitle,
              fontWeight: fontWeightTitle,
              marginBottom: inputTitleMarginBottom,
            ),
          const SizedBox(height: 3.0),
          GestureDetector(
            onTap: isTap == false
                ? () {}
                : () => {
                    unFocusKeyBoard(context),
                    if (dialogType == DialogType.dateTimePickerDialog)
                      DatePicker.showDatePicker(
                        context,
                        locale: localeTypeFunc(dateLocale: dateLocale),
                        minTime: minTime ?? DateTime(1970),
                        // maxTime: DateTime(2009, 12, 31),
                        currentTime: currentTime,
                        // locale: LocaleType.kh,
                        theme: const datetimepicker.DatePickerTheme(
                          headerColor: ColorsManager.grey100,
                          backgroundColor: ColorsManager.grey100,
                          itemStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          doneStyle: TextStyle(
                            color: ColorsManager.primaryBlue,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onChanged: (date) {
                          // print(
                          //   'change $date in time zone ${date.timeZoneOffset.inHours}',
                          // );
                        },
                        onConfirm: onConfirmDate,
                        // (date) {
                        //   // print('confirm $date');
                        //   controller!.selectedBirthdayOnClick(
                        //     selectedItem: date,
                        //   );
                        //   // controller!.selectedBirthdayOnClick(
                        //   //   selectedItem: '${date.year}-${date.month}-${date.day}',
                        //   // );
                        // },
                      )
                    else if (dialogType ==
                        DialogType.dateWithoutDayPickerDialog)
                      DatePicker.showPicker(
                        context,
                        locale: localeTypeFunc(dateLocale: dateLocale),
                        pickerModel: CustomMonthPicker(
                          currentTime: currentTime,
                          locale: localeTypeFunc(dateLocale: dateLocale),
                          minTime: minTime ?? DateTime(1970),
                          // maxTime: DateTime(2009, 12, 31),
                          // locale: LocaleType.kh,
                        ),
                        theme: const datetimepicker.DatePickerTheme(
                          headerColor: ColorsManager.grey100,
                          backgroundColor: ColorsManager.grey100,
                          itemStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          doneStyle: TextStyle(
                            color: ColorsManager.primaryBlue,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onChanged: (date) {
                          // print(
                          //   'change $date in time zone ${date.timeZoneOffset.inHours}',
                          // );
                        },
                        onConfirm: onConfirmDate,
                        // (date) {
                        //   // print('confirm $date');
                        //   controller!.selectedBirthdayOnClick(
                        //     selectedItem: date,
                        //   );
                        //   // controller!.selectedBirthdayOnClick(
                        //   //   selectedItem: '${date.year}-${date.month}-${date.day}',
                        //   // );
                        // },
                      )
                    else if (dialogType == DialogType.timePickerDialog)
                      // DatePicker.showTimePicker(
                      //   context,
                      //   locale: dateLocale == 'fr'
                      //       ? LocaleType.fr
                      //       : dateLocale == 'nl'
                      //           ? LocaleType.nl
                      //           : LocaleType.en,
                      //   showSecondsColumn: false,
                      //   onChanged: (date) {
                      //     // print(
                      //     //   'change $date in time zone ${date.timeZoneOffset.inHours}',
                      //     // );
                      //   },
                      //   onConfirm: onConfirmDate,
                      //   currentTime: currentTime,
                      // )
                      DatePicker.showPicker(
                        context,
                        onChanged: (date) {
                          // print(
                          //   'change $date in time zone ${date.timeZoneOffset.inHours}',
                          // );
                        },
                        locale: localeTypeFunc(dateLocale: dateLocale),
                        onConfirm: onConfirmDate,
                        pickerModel: CustomPicker(
                          currentTime: currentTime,
                          // locale: dateLocale == 'fr'
                          //     ? LocaleType.fr
                          //     : dateLocale == 'nl'
                          //         ? LocaleType.nl
                          //         : LocaleType.en,
                        ),
                      )
                    else
                      dialogType == DialogType.bottomSheetDialog
                          ? Get.bottomSheet(dialogWidget!)
                          : Get.dialog(dialogWidget!),
                  },
            child: Container(
              // height: 50.0,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: FormField(
                validator: validatorFunction,
                // validator: (_) => controller
                //     .isPhoneNumberValidate(),
                builder: (FormFieldState<String> state) {
                  return InputDecorator(
                    // alignedDropdown: true,
                    decoration: InputDecoration(
                      // contentPadding: EdgeInsets.zero,
                      contentPadding: const EdgeInsets.fromLTRB(
                        12,
                        0,
                        4,
                        0,
                      ), //const EdgeInsets.fromLTRB(12, 20, 12, 20), //default value:
                      fillColor: ColorsManager.grey100,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppSize.s8),
                      ),
                      errorText: state.hasError ? state.errorText : null,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppSize.s8),
                        borderSide: const BorderSide(
                          color: ColorsManager.grey100,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppSize.s8),
                        borderSide: const BorderSide(
                          color: ColorsManager.red900,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppSize.s8),
                        borderSide: const BorderSide(
                          color: ColorsManager.grey300,
                        ),
                      ),
                    ),
                    child: containerWidget,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
