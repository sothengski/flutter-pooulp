import 'package:flutter/material.dart';

class CircleFlag extends StatelessWidget {
  final String? countryCode;
  final double? width;
  final double? height;
  final double? padding;

  CircleFlag(
    String countryCode, {
    this.width = 40.0,
    this.height,
    this.padding = 0.0,
  }) : countryCode = countryCode.toLowerCase();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding!),
      child: Image.asset(
        'assets/icons/flags/$countryCode.png',
        fit: BoxFit.fitWidth,
        // package: 'circle_flags',
      ),
    );
  }
}
