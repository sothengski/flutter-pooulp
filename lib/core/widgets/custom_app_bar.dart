import 'package:flutter/material.dart';

import '../core.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String title;
  final Color titleColor;
  final bool centerTitle;
  final Color? backgroundColor;
  final List<Widget>? actions;
  final double? elevation;
  final double? fontSize;
  final FontWeight fontWeight;
  final PreferredSizeWidget? bottomPreferredSizeWidget;

  CustomAppBar({
    this.title = '',
    this.titleColor = Colors.white,
    this.fontSize = AppSize.s20,
    this.fontWeight = FontWeightManager.medium,
    this.centerTitle = true,
    this.backgroundColor,
    this.actions,
    this.elevation,
    this.bottomPreferredSizeWidget,
    Key? key,
  })  : preferredSize = bottomPreferredSizeWidget != null
            ? const Size.fromHeight(100.0)
            : const Size.fromHeight(60.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      title: CustomTextWidget(
        text: title,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: titleColor,
      ),
      backgroundColor: backgroundColor,
      elevation: elevation,
      actions: actions,
      bottom: bottomPreferredSizeWidget,
    );
  }
}
