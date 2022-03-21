import 'package:flutter/material.dart';

InputBorder? outlineInputBorder({
  double? borderRadius = 8.0,
  double? borderWidth = 1.5,
  Color? borderColor = Colors.white,
}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(borderRadius!),
    borderSide: BorderSide(
      width: borderWidth!,
      color: borderColor!,
    ),
  );
}
