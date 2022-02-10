import 'package:flutter/material.dart';

import '../core.dart';

class CustomListTileWidget extends StatelessWidget {
  final String? text1;
  final double? text1FontSize;
  final Color? text1Color;
  final FontWeight? text1FontWeight;
  final String? text2;
  final double? text2FontSize;
  final Color? text2Color;
  final FontWeight? text2FontWeight;
  final String? text3;
  final bool? isLauching;
  final double? text3FontSize;
  final Color? text3Color;
  final FontWeight? text3FontWeight;
  final String? text4;
  final double? text4FontSize;
  final Color? text4Color;
  final FontWeight? text4FontWeight;
  final Widget? leftWidget;
  final Widget? rightWidget;
  final Function()? onClick;
  final bool? isDivider;
  final double? leftRightPadding;
  final double? topPadding;
  final double? bottomPadding;
  final Color? backgroundColor;

  const CustomListTileWidget({
    this.text1 = '',
    this.text1FontSize = 14.0,
    this.text1Color = ColorsManager.grey,
    this.text1FontWeight = FontWeight.w400,
    this.text2 = '',
    this.text2FontSize = 14.0,
    this.text2Color = ColorsManager.grey,
    this.text2FontWeight = FontWeight.w400,
    this.text3 = '',
    this.isLauching = false,
    this.text3FontSize = 12.0,
    this.text3Color = ColorsManager.grey800,
    this.text3FontWeight = FontWeight.w400,
    this.text4 = '',
    this.text4FontSize = 12.0,
    this.text4Color = ColorsManager.grey800,
    this.text4FontWeight = FontWeight.w400,
    this.leftWidget,
    this.rightWidget,
    this.onClick,
    this.isDivider = true,
    this.leftRightPadding = 0.0,
    this.topPadding = 10.0,
    this.bottomPadding = 0.0,
    this.backgroundColor = ColorsManager.white,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          border: leftWidget == null && isDivider == true
              ? const Border(
                  bottom: BorderSide(
                    color: ColorsManager.grey100,
                  ),
                )
              : null,
        ),
        padding: EdgeInsets.fromLTRB(
          leftRightPadding!,
          topPadding!,
          leftRightPadding!,
          bottomPadding!,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              width: 8.0,
            ),
            if (leftWidget != null)
              Expanded(
                flex: 10,
                child: leftWidget!,
              )
            else
              Container(),
            const SizedBox(
              width: 8.0,
            ),
            Flexible(
              flex: 90,
              child: Container(
                padding: const EdgeInsets.only(
                  bottom: 5.0,
                  // top: 10.0,
                ),
                decoration: BoxDecoration(
                  border: leftWidget != null && isDivider == true
                      ? const Border(
                          bottom: BorderSide(
                            color: ColorsManager.grey300,
                          ),
                        )
                      : null,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 90,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (text1 == '')
                            Container()
                          else
                            CustomTextWidget(
                              text: text1,
                              color: text1Color,
                              fontSize: text1FontSize,
                              fontWeight: text1FontWeight,
                              marginBottom: 5.0,
                              maxLine: 3,
                            ),
                          if (text2 == '')
                            Container()
                          else
                            CustomTextWidget(
                              text: text2,
                              color: text2Color,
                              fontSize: text2FontSize,
                              fontWeight: text2FontWeight,
                              textDecoration: isLauching == true
                                  ? TextDecoration.underline
                                  : TextDecoration.none,
                              marginBottom: 5.0,
                              maxLine: 2,
                            ),
                          if (text3 == '')
                            Container()
                          else
                            CustomTextWidget(
                              text: text3,
                              color: text3Color,
                              fontSize: text3FontSize,
                              fontWeight: text3FontWeight,
                              marginBottom: 5.0,
                              maxLine: 2,
                            ),
                          if (text4 == '')
                            Container()
                          else
                            CustomTextWidget(
                              text: text4,
                              color: text4Color,
                              fontSize: text4FontSize,
                              fontWeight: text4FontWeight,
                              maxLine: 2,
                            ),
                        ],
                      ),
                    ),
                    if (rightWidget != null)
                      Flexible(
                        flex: 10,
                        child: rightWidget!,
                      )
                    else
                      Container(),
                    const SizedBox(
                      width: 2.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
