import 'dart:ui';

import 'package:flutter/material.dart';
import '../../core.dart';

part 'dark_color.dart';
part 'light_color.dart';

abstract class IColors {
  Color? scaffoldBackgroundColor;
  Color? appBarColor;
  Color? tabBarColor;
  Color? tabbarSelectedColor;
  Color? tabbarNormalColor;
  Color? hintColor;
  Color? accentColor;
  Color? primaryColor;
  Color? cardColor;
  Brightness? brightness;
  ColorScheme? colorScheme;
  Color? iconColor;
  ButtonThemeData? buttonTheme;
  Color? buttonTextColor;
  Color? focusColor;
  Color? enabledColor;
  Color? errorColor;
  Color? focusErrorColor;
  Color? fillColor;
  Color? hoverColor;
  Color? highlightColor;
  Color? disabledColor;
}
