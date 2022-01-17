import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core.dart';

void customSnackbar({
  String? msgTitle = '--Title--',
  String? msgContent = '--Content--',
  Duration duration = DurationConstant.d4000,
  Color textColor = ColorsManager.white,
  Color bgColor = ColorsManager.grey800,
}) {
  Get.snackbar(
    msgTitle.toString(),
    msgContent.toString(),
    messageText: CustomTextWidget(
      text: msgContent,
      fontWeight: FontWeight.w500,
      color: textColor,
      maxLine: 5,
    ),
    snackPosition: SnackPosition.TOP,
    duration: duration,
    backgroundColor: bgColor,
    colorText: textColor,
    // onTap: () async {},
    // icon: Icon(Icons.alarm),
    shouldIconPulse: true,
    barBlur: 20,
    isDismissible: true,
  );
}
