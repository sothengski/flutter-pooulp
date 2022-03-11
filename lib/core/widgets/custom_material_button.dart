import 'package:flutter/material.dart';

import '../core.dart';

class CustomMaterialButton extends StatelessWidget {
  final Color? buttonColor; //backgroundColor
  final Color? onPrimaryColor; //foregroundColor
  final Color? shadowColor;
  final Color? sideColor; //border Color
  final double? sideWidth;
  final double? buttonHeight;
  final double? buttonWidth;
  final double? elevation;
  final String? text;
  final Color? textColor;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final double? fontSize;
  final FontStyle? fontStyle;
  final double? borderRedius;
  final VoidCallback? onPressed;
  final double? leftPadding;
  final double? topPadding;
  final double? rightPadding;
  final double? bottomPadding;
  final Widget? childWidget;

  const CustomMaterialButton({
    Key? key,
    this.buttonColor = ColorsManager.primary,
    this.onPrimaryColor,
    this.shadowColor,
    this.sideColor = Colors.transparent,
    this.sideWidth = 1.0,
    this.elevation,
    this.text = '',
    this.textColor = ColorsManager.white,
    this.fontFamily,
    this.fontWeight,
    this.fontSize = 12.0,
    this.fontStyle,
    this.borderRedius = 5.0,
    required this.onPressed,
    this.buttonHeight = 40,
    this.buttonWidth = 100,
    this.leftPadding = 0.0,
    this.topPadding = 0.0,
    this.rightPadding = 0.0,
    this.bottomPadding = 0.0,
    this.childWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        leftPadding!,
        topPadding!,
        rightPadding!,
        bottomPadding!,
      ),
      child: MaterialButton(
        // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.zero,
        color: buttonColor,
        minWidth: buttonWidth,
        height: buttonHeight,
        elevation: elevation,
        focusColor: onPrimaryColor,
        onPressed: onPressed,
        child: childWidget ??
            CustomTextWidget(
              text: text,
              color: textColor,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
      ),
    );
  }
}
