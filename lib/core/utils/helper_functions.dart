import 'package:flutter/material.dart';

import '../core.dart';

bool switchingBooleanValue({required bool? boolValue}) {
  return !boolValue!;
}

bool stringsComparation({
  required String? object1,
  required String? object2,
}) {
  if (object1 == object2) {
    return true;
  } else {
    return false;
  }
}

bool intComparation({
  required int? object1,
  required int? object2,
}) {
  if (object1 == object2) {
    return true;
  } else {
    return false;
  }
}

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
