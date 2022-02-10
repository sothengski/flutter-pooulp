import 'package:flutter/material.dart';

import '../core.dart';

class OutlineIconButtonWidget extends StatelessWidget {
  final IconData? iconData;
  final IconData? iconDataOnClick;
  final String? buttonTitle;
  final double? textSize;

  final Color? iconColor;
  final Color? iconColorOnClick;
  final double? iconSize;
  final bool? buttonState;
  final VoidCallback? onPressed;

  const OutlineIconButtonWidget({
    this.iconData = Icons.info_outline,
    this.iconDataOnClick = Icons.info,
    this.buttonTitle = '',
    this.textSize = AppSize.s14,
    this.iconColor = ColorsManager.primaryBlue,
    this.iconColorOnClick = ColorsManager.primary,
    this.iconSize = AppSize.s16,
    this.buttonState = false,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(AppSize.s8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              buttonState! ? iconDataOnClick : iconData,
              color: buttonState! ? iconColorOnClick : iconColor,
              size: iconSize,
            ),
            CustomTextWidget(
              text: buttonTitle,
              fontSize: textSize,
              color: buttonState! ? iconColorOnClick : iconColor,
              marginLeft: AppSize.s8,
            ),
          ],
        ),
      ),
    );
  }
}
