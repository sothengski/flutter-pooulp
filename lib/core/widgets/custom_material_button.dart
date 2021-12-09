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

  const CustomMaterialButton({
    Key? key,
    this.buttonColor = AppColors.primaryColor,
    this.onPrimaryColor,
    this.shadowColor,
    this.sideColor = Colors.transparent,
    this.sideWidth = 1.0,
    this.elevation,
    this.text = '',
    this.textColor = AppColors.whiteColor,
    this.fontFamily,
    this.fontWeight,
    this.fontSize = 12.0,
    this.fontStyle,
    this.borderRedius = 5.0,
    required this.onPressed,
    this.buttonHeight = 50,
    this.buttonWidth = 100,
    this.leftPadding = 0.0,
    this.topPadding = 0.0,
    this.rightPadding = 0.0,
    this.bottomPadding = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        leftPadding!,
        topPadding!,
        rightPadding!,
        bottomPadding!,
      ),
      child: MaterialButton(
        color: buttonColor,
        minWidth: buttonWidth,
        height: buttonHeight,
        elevation: elevation,
        focusColor: onPrimaryColor,
        onPressed: onPressed,
        child: CustomTextWidget(
          text: text,
          color: AppColors.whiteColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
