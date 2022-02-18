import 'package:flutter/material.dart';

import '../core.dart';

Color containerColorState({
  String? object1,
  String? object2,
  bool? isTextColor = true, //true == text, false == background
  Color? equalStateColor = ColorsManager.white,
  Color? unEqualStateColor = ColorsManager.primary,
}) {
  if (object1 == object2) {
    return isTextColor! ? equalStateColor! : unEqualStateColor!;
  } else {
    return isTextColor! ? unEqualStateColor! : equalStateColor!;
  }
}
