import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String title;
  final Color titleColor;
  final bool centerTitle;
  final Color? backgroundColor;

  CustomAppBar({
    required this.title,
    this.titleColor = Colors.white,
    this.centerTitle = true,
    this.backgroundColor,
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
      systemOverlayStyle:
          SystemUiOverlayStyle.dark, // this makes status bar text color black
    );
  }
}
