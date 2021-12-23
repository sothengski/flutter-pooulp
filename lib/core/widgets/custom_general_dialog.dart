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
    barrierColor: Colors.black45,
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (
      BuildContext buildContext,
      Animation animation,
      Animation secondaryAnimation,
    ) =>
        WillPopScope(
      onWillPop: () {
        Get.back();
        return Future.value(true);
      },
      child: widget,
    ),
  );
}
