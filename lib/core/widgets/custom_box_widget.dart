import 'package:flutter/material.dart';

import '../core.dart';

class CustomBoxWidget extends StatelessWidget {
  final Widget? child;
  final Color? backgroundColor;
  final double? size;
  final double? borderRadius;
  final double? topPadding;
  final double? bottomPadding;
  final double? leftPadding;
  final double? rightPadding;
  final double? topMargin;
  final double? bottomMargin;
  final double? leftMargin;
  final double? rightMargin;

  final bool? isCircle;
  final double? borderWidth;
  final List<BoxShadow>? boxShadow;

  const CustomBoxWidget({
    this.child,
    this.backgroundColor = ColorsManager.grey100,
    this.size,
    this.borderRadius = 8.0,
    this.topPadding = 6.0,
    this.bottomPadding = 6.0,
    this.leftPadding = 6.0,
    this.rightPadding = 6.0,
    this.topMargin = 0.0,
    this.bottomMargin = 0.0,
    this.leftMargin = 0.0,
    this.rightMargin = 0.0,
    this.isCircle = false,
    this.borderWidth = 0.0,
    this.boxShadow,
    Key? key,
  }) : super(key: key);

  const CustomBoxWidget.chatAvatarDefault({
    this.child,
    this.backgroundColor = ColorsManager.white,
    this.size = 35,
    this.borderRadius = 8.0,
    this.topPadding = 2.0,
    this.bottomPadding = 2.0,
    this.leftPadding = 2.0,
    this.rightPadding = 2.0,
    this.topMargin = 0.0,
    this.bottomMargin = 0.0,
    this.leftMargin = 0.0,
    this.rightMargin = 0.0,
    this.isCircle = true,
    this.borderWidth = 0.0,
    this.boxShadow,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(borderRadius!)),
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          border: Border.all(
            color: borderWidth == 0.0
                ? ColorsManager.white
                : ColorsManager.grey400,
            width: borderWidth!,
          ),
          color: backgroundColor,
          shape: isCircle! ? BoxShape.circle : BoxShape.rectangle,
          boxShadow: boxShadow,
          borderRadius: isCircle! ? null : BorderRadius.circular(borderRadius!),
        ),
        padding: EdgeInsets.only(
          top: topPadding!,
          bottom: bottomPadding!,
          left: leftPadding!,
          right: rightPadding!,
        ),
        margin: EdgeInsets.only(
          top: topMargin!,
          bottom: bottomMargin!,
          left: leftMargin!,
          right: rightMargin!,
        ),
        child: child ??
            DecoratedBox(
              decoration: BoxDecoration(
                shape: isCircle! ? BoxShape.circle : BoxShape.rectangle,
                // border: Border.all(
                //   color: borderWidth == 0.0
                //       ? ColorsManager.white
                //       : ColorsManager.grey400,
                //   width: 0,
                // ),
                image: const DecorationImage(
                  image: AssetImage(AssetsManager.appLogoSymbol),
                  opacity: 0.75,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
      ),
    );
  }
}
