import 'package:flutter/material.dart';

class RowContentInputWidget extends StatelessWidget {
  final Widget? prefixWidget;
  final Widget? centerWidget;
  final Widget? suffixWidget;
  final int? prefixWidgetFlex;
  final int? centerWidgetFlex;
  final int? suffixWidgetFlex;
  final double? prefixWidgetRightPadding;
  final double? suffixWidgetLeftPadding;
  final FormFieldValidator? validatorFunction;

  const RowContentInputWidget({
    super.key,
    this.prefixWidget,
    this.centerWidget,
    this.suffixWidget,
    this.prefixWidgetFlex = 10,
    this.centerWidgetFlex = 80,
    this.suffixWidgetFlex = 10,
    this.prefixWidgetRightPadding = 0.0,
    this.suffixWidgetLeftPadding = 8.0,
    this.validatorFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (prefixWidget != null)
          Expanded(flex: prefixWidgetFlex!, child: prefixWidget!)
        else
          Container(),
        if (centerWidget != null)
          Expanded(
            flex: centerWidgetFlex!,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(
                left: prefixWidgetRightPadding!,
                right: suffixWidgetLeftPadding!,
              ),
              child: centerWidget,
            ),
          )
        else
          Container(),
        if (suffixWidget != null)
          Expanded(flex: suffixWidgetFlex!, child: suffixWidget!)
        else
          Container(),
      ],
    );
  }
}
