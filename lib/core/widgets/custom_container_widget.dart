import 'package:flutter/material.dart';

import '../core.dart';

class CustomContainerWidget extends StatelessWidget {
  final String? leftTitle;
  final Widget? rightWidget;
  final double? titleFontSize;
  final double? titleLeftRightPadding;
  final Color? titleColor;
  final FontWeight? titleFontWeight;
  final Widget? child;
  final Function()? onTap;
  final double? borderRadius;
  final double? elevation;
  final bool? titleInSide;
  final double? childPadding;
  final double? leftMargin;
  final double? topMargin;
  final double? rightMargin;
  final double? bottomMargin;

  const CustomContainerWidget({
    Key? key,
    this.leftTitle = '',
    this.rightWidget,
    this.titleFontSize = 14.0,
    this.titleLeftRightPadding = 10,
    this.titleColor = ColorsManager.black,
    this.titleFontWeight = FontWeight.w600,
    this.child,
    this.onTap,
    this.borderRadius = 10.0,
    this.elevation = 5.0,
    this.titleInSide = true,
    this.childPadding = 0.0,
    this.leftMargin = 0.0,
    this.topMargin = 0.0,
    this.rightMargin = 0.0,
    this.bottomMargin = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.fromLTRB(
          leftMargin!,
          topMargin!,
          rightMargin!,
          bottomMargin!,
        ),
        decoration: BoxDecoration(
          color: titleInSide == true ? ColorsManager.white : Colors.transparent,
          borderRadius: BorderRadius.circular(borderRadius!),
          boxShadow: titleInSide == true
              ? [
                  const BoxShadow(
                    color: ColorsManager.grey400,
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ]
              : [],
        ),
        child: Column(
          children: [
            if (leftTitle == '')
              Container()
            else
              Container(
                alignment: Alignment.centerLeft,
                // height: 50,
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(
                  titleLeftRightPadding!,
                  10,
                  titleLeftRightPadding!,
                  10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidget(
                      text: leftTitle ?? '',
                      color: titleColor,
                      fontSize: titleFontSize,
                      fontWeight: titleFontWeight,
                    ),
                    // if (rightWidget != null)
                    rightWidget!
                    // else
                    //   CustomTextWidget(
                    //     text: rightTitle ?? '',
                    //     color: titleColor,
                    //     fontSize: titleFontSize,
                    //     fontWeight: titleFontWeight,
                    //   ),
                  ],
                ),
              ),
            SizedBox(
              width: double.infinity,
              child: Card(
                color: ColorsManager.white,
                elevation: titleInSide == true ? 0.0 : elevation,
                // margin: const EdgeInsets.all(5),
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius!),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Padding(
                  padding: EdgeInsets.all(childPadding!),
                  child: child,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
