import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../core.dart';

class LoadingWidget extends StatelessWidget {
  final Color? color;
  final double? size;

  const LoadingWidget({
    Key? key,
    this.color = ColorManager.primary,
    this.size = 50.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: background,
      child: Center(
        child: SpinKitFadingCircle(
          color: color,
          size: size!,
        ),
      ),
    );
  }
}
