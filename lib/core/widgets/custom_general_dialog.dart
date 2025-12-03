import 'package:flutter/material.dart';
import 'package:get/get.dart';

void customGeneralDialog({
  bool? barrierDismissible = false,
  required BuildContext context,
  required Widget widget,
}) {
  showGeneralDialog(
    barrierDismissible: barrierDismissible!,
    context: context,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black.withValues(alpha: 0.45),
    pageBuilder: (
      BuildContext buildContext,
      Animation animation,
      Animation secondaryAnimation,
    ) =>
        PopScope(
      onPopInvokedWithResult: (bool didPop, dynamic result) {
        Get.back();
      },
      child: widget,
    ),
  );
}
