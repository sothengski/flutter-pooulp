import 'package:flutter/material.dart';

///==================== Colors ====================
class ColorsManager {
  static const primary = Color(0xFFFC247F); // before 0xFFFF7E65
  static const primary75 =
      Color(0xFFFD5B9F); //primaryColor with 75% Opacity // before 0xFFFF9E8B
  static const primary50 =
      Color(0xFFFE92BF); //primaryColor with 50% Opacity // before 0xFFFFBFB3
  static const primary25 =
      Color(0xFFFEC8DF); //primaryColor with 25% Opacity // before 0xFFFFDFD8
  static const primaryBlue = Color(0xFF000E8A); // before 0xFF364454
  static const primaryBlue75 = Color(0xFF000E8A);
  static const primaryBlue50 = Color(0xFF000E8A);
  static const primaryBlue25 = Color(0xFF000E8A);

  static const white = Color(0xFFFFFFFF);

  static const black = Color(0xFF000000);

  static const grey100 = Color(0xFFF5F5F5);
  static const grey200 = Color(0xFFEEEEEE);
  static const grey300 = Color(0xFFE0E0E0);
  static const grey400 = Color(0xFFBDBDBD);
  static const grey = Colors.grey; //9E9E9E
  static const grey600 = Color(0xFF757575);
  static const grey800 = Color(0xFF424242);
  static const grey850 = Color(0xFF303030);
  static const grey900 = Color(0xFF212121);
  static const greyBlue = Color(0xFFEBEEF0);

  static const red200 = Color(0xFFEF9A9A);
  static const red = Colors.red;
  static const red700 = Color(0xFFD32F2F);
  static const red900 = Color(0xFFB71C1C);
  static const redAccent = Colors.redAccent;
  static const redAccent400 = Color(0xFFFF1744);
  static const redAccent700 = Color(0xFFD50000);

  static const pink = Colors.pink;
  static const pinkAccent = Colors.pinkAccent;

  static const green = Colors.green;
  static const green900 = Color(0xFF1B5E20);
  static const greenAccent = Colors.greenAccent;
  static const greenAccent400 = Color(0xFF00E676);
  static const lightGreen = Colors.lightGreen;
  static const lightGreenAccent = Colors.lightGreenAccent;

  static const lime = Colors.lime;
  static const limeAccent = Colors.limeAccent;

  static const yellow = Colors.yellow;
  static const yellowAccent = Colors.yellowAccent;

  static const amber = Colors.amber;
  static const amberAccent = Colors.amberAccent;

  static const orange = Colors.orange; //FF9800
  static const deepOrangeAccent = Colors.deepOrangeAccent;

  static const teal = Colors.teal;
  static const tealAccent = Colors.tealAccent;

  static const cyan = Colors.cyan;
  static const cyanAccent = Colors.cyanAccent;

  static const blue = Colors.blue;
  static const blueAccent = Colors.blueAccent;
  static const lightBlue = Colors.lightBlue;
  static const lightBlueAccent = Colors.lightBlueAccent;
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString.replaceAll('#', '');
    return Color(int.parse("FF$hexColorString", radix: 16));
  }
}
