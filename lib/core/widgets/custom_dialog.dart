import 'package:flutter/material.dart';

import '../core.dart';

enum AlertDialogType { success, error, warning, info }

class CustomAlertDialog extends StatelessWidget {
  final String? title;
  final String? content;
  final Widget? icon;
  final String? buttonLabel;
  final String? routePath;
  final AlertDialogType? type;
  final VoidCallback? onPressed;

  const CustomAlertDialog({
    super.key,
    this.title = '',
    this.content = '',
    this.icon,
    this.buttonLabel = 'Dismiss',
    this.routePath = '',
    this.type = AlertDialogType.info,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        // color: labelTextColor.withOpacity(0.7),
        alignment: Alignment.center,
        child: Container(
          margin: const EdgeInsets.all(40),
          padding: const EdgeInsets.all(32.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              icon ?? getIconForType(type: type),
              const SizedBox(height: 15.0),
              CustomTextWidget(
                text: title,
                fontSize: 24.0,
                color: ColorsManager.primary,
              ),
              const SizedBox(height: 15.0),
              CustomTextWidget(text: content, maxLine: 5),
              const SizedBox(height: 5.0),
              const Divider(),
              MaterialButton(
                color: ColorsManager.primary.withValues(alpha: 0.75),
                minWidth: getWidth / 3,
                height: 35,
                elevation: 5.0,
                onPressed: onPressed,
                child: CustomTextWidget(
                  text: buttonLabel, //"Done",
                  color: ColorsManager.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String getButtonLabelForType({AlertDialogType? type}) {
  switch (type) {
    case AlertDialogType.warning:
      return 'Dismiss';
    case AlertDialogType.success:
      return 'Continue';
    case AlertDialogType.error:
      return 'Try again';
    case AlertDialogType.info:
      return 'Dismiss';
    default:
      return 'Dismiss';
  }
}

Color getColorForType({AlertDialogType? type}) {
  switch (type) {
    case AlertDialogType.warning:
      return Colors.orange;
    case AlertDialogType.success:
      return Colors.green;
    case AlertDialogType.error:
      return Colors.red;
    case AlertDialogType.info:
      return Colors.grey;
    default:
      return Colors.grey;
  }
}

Widget getIconForType({AlertDialogType? type, double? size = 80.0}) {
  switch (type) {
    case AlertDialogType.warning:
      return Icon(
        Icons.warning_amber_outlined,
        color: Colors.orange,
        size: size,
      );
    case AlertDialogType.success:
      return Icon(Icons.check_circle, color: Colors.green, size: size);
    case AlertDialogType.error:
      return Icon(Icons.highlight_off, color: Colors.red, size: size);
    case AlertDialogType.info:
      return Icon(Icons.info_outline_rounded, color: Colors.grey, size: size);
    default:
      return Icon(Icons.info_outline_rounded, color: Colors.grey, size: size);
  }
}
