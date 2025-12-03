import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../core.dart';

class ShimmerWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? baseColor;
  final Color? highlightColor;
  final ShapeBorder? shapeBorder;

  const ShimmerWidget({
    super.key,
    this.width,
    this.height,
    this.baseColor,
    this.highlightColor,
    this.shapeBorder = const RoundedRectangleBorder(),
  });

  const ShimmerWidget.rectangular({
    super.key,
    this.width,
    this.height,
    this.baseColor,
    this.highlightColor,
    this.shapeBorder = const RoundedRectangleBorder(),
  });

  const ShimmerWidget.circular({
    this.width,
    this.height,
    this.baseColor,
    this.highlightColor,
    this.shapeBorder = const CircleBorder(),
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      // baseColor: baseColor!,
      // period: duration2s,
      baseColor: ColorsManager.greyBlue,
      highlightColor: ColorsManager.grey300,
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          color: Colors.grey[200],
          shape: shapeBorder!,
        ),
      ),
    );
  }
}
