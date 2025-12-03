import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../core.dart';

class LoadingWidget extends StatelessWidget {
  final Color? color;
  final double? size;
  final bool? isTreeBounceLoading;

  const LoadingWidget({
    super.key,
    this.color = ColorsManager.primary,
    this.size = 50.0,
    this.isTreeBounceLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: background,
      child: Center(
        child: isTreeBounceLoading == true
            ? SpinKitThreeBounce(color: color, size: size! * 0.4)
            : SpinKitFadingCircle(color: color, size: size!),
      ),
    );
  }
}
