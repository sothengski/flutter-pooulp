import 'package:flutter/material.dart';

import '../core.dart';

class CustomContainerWidget extends StatelessWidget {
  final String? leftTitle;
  final String? rightTitle;
  final double? titleFontSize;
  final double? titleLeftRightPadding;
  final Color? titleColor;
  final FontWeight? titleFontWeight;
  final Widget? child;
  final Function()? onTap;
  final double? borderRadius;
  const CustomContainerWidget({
    Key? key,
    this.leftTitle,
    this.rightTitle,
    this.titleFontSize = 14.0,
    this.titleLeftRightPadding = 0,
    this.titleColor = ColorsManager.black,
    this.titleFontWeight = FontWeight.w600,
    this.child,
    this.onTap,
    this.borderRadius = 10.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            // height: 50,
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(
              titleLeftRightPadding!,
              5,
              titleLeftRightPadding!,
              1,
            ),
            // color: Colors.blueGrey[50],
            // color: primary,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextWidget(
                  text: leftTitle ?? '',
                  color: titleColor,
                  fontSize: titleFontSize,
                  fontWeight: titleFontWeight,
                ),
                CustomTextWidget(
                  text: rightTitle ?? '',
                  color: titleColor,
                  fontSize: titleFontSize,
                  fontWeight: titleFontWeight,
                ),
              ],
            ),
          ),
          Card(
            color: ColorsManager.white,
            elevation: 5,
            margin: const EdgeInsets.all(5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius!),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Container(
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
