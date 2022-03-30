import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';

import '../core.dart';

enum DialogType { bottomSheetDialog, alertDialog, dateTimePickerDialog }

class ContainerDialogWidget extends StatelessWidget {
  final String? inputTitle;
  final Widget? dialogWidget;
  final DateTime? currentTime;
  final Function(DateTime)? onConfirmDate;
  final Widget? containerWidget;
  final DialogType? dialogType;
  final double? inputTitleMarginTop;
  final double? inputTitleMarginBottom;
  final FormFieldValidator<String>? validatorFunction;
  final bool? isTap;
  // final FormFieldValidator? validatorFunction;

  const ContainerDialogWidget({
    Key? key,
    this.inputTitle = '',
    this.dialogWidget,
    this.currentTime,
    this.onConfirmDate,
    this.containerWidget,
    this.dialogType = DialogType.alertDialog,
    this.inputTitleMarginTop = AppSize.s12,
    this.inputTitleMarginBottom = AppSize.s12,
    this.validatorFunction,
    this.isTap = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(
          text: inputTitle,
          marginTop: inputTitleMarginTop,
          textAlign: TextAlign.left,
          // marginBottom: inputTitleMarginBottom,
        ),
        const SizedBox(
          height: 3.0,
        ),
        GestureDetector(
          onTap: isTap == false
              ? () {}
              : () => {
                    unFocusKeyBoard(context),
                    if (dialogType == DialogType.dateTimePickerDialog)
                      DatePicker.showDatePicker(
                        context,
                        minTime: DateTime(1970),
                        // maxTime: DateTime(2009, 12, 31),
                        currentTime: currentTime,
                        // locale: LocaleType.kh,
                        theme: const DatePickerTheme(
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
                    else
                      dialogType == DialogType.bottomSheetDialog
                          ? Get.bottomSheet(
                              dialogWidget!,
                            )
                          : Get.dialog(
                              dialogWidget!,
                            )
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
              builder: (
                FormFieldState<String> state,
              ) {
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
                      borderRadius: BorderRadius.circular(
                        AppSize.s8,
                      ),
                    ),
                    errorText: state.hasError ? state.errorText : null,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        AppSize.s8,
                      ),
                      borderSide: const BorderSide(
                        color: ColorsManager.grey100,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        AppSize.s8,
                      ),
                      borderSide: const BorderSide(
                        color: ColorsManager.red900,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        AppSize.s8,
                      ),
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
    );
  }
}
