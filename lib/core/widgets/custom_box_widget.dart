import 'package:flutter/material.dart';

import '../core.dart';

class CustomBoxWidget extends StatelessWidget {
  final Widget? insideObj;
  final Color? backgroundColor;
  final double? size;
  final double? borderRadius;
  final double? objPadding;

  const CustomBoxWidget({
    this.insideObj,
    this.backgroundColor = ColorsManager.grey100,
    this.size = 40.0,
    this.borderRadius = 8.0,
    this.objPadding = 6.0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius!)),
        child: Container(
          color: backgroundColor,
          padding: EdgeInsets.all(objPadding!),
          child: insideObj ??
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AssetsManager.appLogoSymbol),
                    opacity: 0.75,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
        ),
      ),
    );
  }
}
