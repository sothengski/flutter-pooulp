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

  CustomAppBar({
    this.title = '',
    this.titleColor = Colors.white,
    this.centerTitle = true,
    this.backgroundColor,
    this.actions,
    this.elevation,
    Key? key,
  })  : preferredSize = const Size.fromHeight(60.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      title: CustomTextWidget(
        text: title,
        color: titleColor,
      ),
      backgroundColor: backgroundColor,
      elevation: elevation,
      actions: actions,
    );
  }
}
