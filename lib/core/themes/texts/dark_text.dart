import 'package:flutter/material.dart';

import 'text_theme.dart';

class TextThemeDark implements ITextTheme {
  @override
  late final TextTheme data;

  @override
  TextStyle? bodyText1;

  @override
  TextStyle? bodyText2;

  @override
  TextStyle? headline1;

  @override
  TextStyle? headline3;

  @override
  TextStyle? headline4;

  @override
  TextStyle? headline5;

  @override
  TextStyle? headline6;

  @override
  TextStyle? subtitle1;

  @override
  TextStyle? subtitle2;

  @override
  final Color? primaryColor;

  @override
  final Color? displayColor;

  @override
  String? fontFamily;

  @override
  TextStyle? button;

  @override
  TextStyle? caption;

  @override
  TextStyle? overline;

  @override
  List<String>? fontFamilyFallBack = [];

  TextThemeDark({
    this.primaryColor,
    this.displayColor,
  }) {
    data = const TextTheme(
      headline6: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
      subtitle1: TextStyle(fontSize: 16.0),
    ).apply(bodyColor: primaryColor);
  }
}
