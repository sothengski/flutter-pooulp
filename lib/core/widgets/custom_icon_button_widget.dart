import 'package:flutter/material.dart';

import '../core.dart';

class CustomIconButtonWidget extends StatelessWidget {
  final String? tooltip;
  final Widget? iconWidget;
  final double? iconSize;
  final IconData? iconData;
  final Color? iconColor;
  final Function()? onClick;
  final double? padding;
  final bool? isConstraints;
  final double? splashRadius;

  const CustomIconButtonWidget({
    this.tooltip = "",
    this.iconWidget,
    this.iconSize = 24.0,
    this.iconData,
    this.iconColor = ColorsManager.grey600,
    this.onClick,
    this.padding = 8.0,
    this.isConstraints = false,
    this.splashRadius = 1.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      constraints: isConstraints == false ? null : const BoxConstraints(),
      padding: EdgeInsets.all(padding!),
      iconSize: iconSize,
      splashRadius: splashRadius,
      icon:
          iconWidget ??
          Icon(
            iconData,
            color: iconColor,
            // size: AppSize.s24,
          ),
      onPressed: onClick,
    );
  }
}
