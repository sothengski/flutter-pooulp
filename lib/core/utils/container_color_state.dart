import 'package:flutter/material.dart';

import '../core.dart';

Color containerColorState({
  String? object1,
  String? object2,
  bool? isText = true, //true == text, false == background
}) {
  if (object1 == object2) {
    return isText! ? ColorsManager.white : ColorsManager.primary;
  } else {
    return isText! ? ColorsManager.primaryBlue : ColorsManager.white;
  }
}
