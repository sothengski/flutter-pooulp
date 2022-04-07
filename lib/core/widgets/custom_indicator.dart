import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CustomIndicator extends StatelessWidget {
  final int? length;
  final int? location;
  final double? size;
  final double? spaceBtwIndicator;

  const CustomIndicator({
    Key? key,
    required this.length,
    required this.location,
    this.size = 12.0,
    this.spaceBtwIndicator = 6.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length!,
        (index) => Container(
          margin: EdgeInsets.all(spaceBtwIndicator!),
          width: size,
          height: size,
          decoration: BoxDecoration(
            color:
                index == location ? ColorsManager.primary : ColorsManager.white,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
