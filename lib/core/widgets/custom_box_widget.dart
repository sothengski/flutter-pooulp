import 'package:flutter/material.dart';

import '../core.dart';

class CustomBoxWidget extends StatelessWidget {
  final Widget? insideObj;
  final Color? backgroundColor;
  final double? size;
  final double? borderRadius;
  final double? objPadding;
  final bool? isCircle;
  final double? borderWidth;
  final List<BoxShadow>? boxShadow;

  const CustomBoxWidget({
    this.insideObj,
    this.backgroundColor = ColorsManager.grey100,
    this.size = 40.0,
    this.borderRadius = 8.0,
    this.objPadding = 6.0,
    this.isCircle = false,
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
        ),
        padding: EdgeInsets.all(objPadding!),
        child: insideObj ??
            Container(
              decoration: BoxDecoration(
                shape: isCircle! ? BoxShape.circle : BoxShape.rectangle,
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
