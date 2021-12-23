import 'package:flutter/material.dart';

import '../core.dart';

class CustomTextWidget extends StatelessWidget {
  final String? text;
  final Color? color;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? marginBottom;
  final double? marginTop;
  final double? marginLeft;
  final double? marginRight;
  final double? letterSpacing;
  final int? maxLine;
  final Widget? inputIcon;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final TextDecoration? textDecoration;

  const CustomTextWidget({
    Key? key,
    this.text,
    this.color,
    this.fontFamily,
    this.fontWeight,
    this.fontSize,
    this.marginLeft = 0.0,
    this.marginTop = 0.0,
    this.marginBottom = 0.0,
    this.marginRight = 0.0,
    this.letterSpacing = 0.0,
    this.maxLine,
    this.inputIcon,
    this.textAlign = TextAlign.start,
    this.textStyle,
    this.textDecoration = TextDecoration.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
        marginLeft!,
        marginTop!,
        marginRight!,
        marginBottom!,
      ),
      child: Text(
        text ?? emptyText,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
        style: textStyle ??
            TextStyle(
              color: color,
              fontWeight: fontWeight,
              fontSize: fontSize,
              fontFamily: fontFamily,
              letterSpacing: letterSpacing,
              decoration: textDecoration,
              fontFamilyFallback: const [
                // typoRoundFont,
              ],
            ),
        textAlign: textAlign,
        maxLines: maxLine,
      ),
    );
  }
}
