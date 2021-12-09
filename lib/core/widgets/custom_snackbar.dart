import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core.dart';

void customSnackbar({
  String? msgTitle = '--Title--',
  String? msgContent = '--Content--',
  Duration duration = duration4s,
  Color textColor = AppColors.whiteColor,
  Color bgColor = AppColors.grey800Color,
}) {
  Get.snackbar(
    msgTitle.toString(),
    msgContent.toString(),
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
