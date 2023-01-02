import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/data.dart';
import '../core.dart';

bool switchingBooleanValue({required bool? boolValue}) {
  return !boolValue!;
}

String dateTimeToString({DateTime? selectedItem}) {
  return selectedItem!.toString();
}

bool stringsComparation({
  required String? object1,
  required String? object2,
}) {
  if (object1!.toLowerCase() == object2!.toLowerCase()) {
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

void addingOrRemovingFieldInFieldList({
  RxList<FieldModel>? list,
  FieldModel? fieldValue,
  bool? isList = true,
}) {
  /// select/add multiple items to the list
  if (isList == true) {
    if (list!.contains(fieldValue)) {
      list.removeWhere((element) => element.id == fieldValue!.id);
    } else {
      list.add(fieldValue!);
    }
  }
  // else select only one item to the list
  else {
    list!.clear();
    list.add(fieldValue!);
  }
}

List<FieldModel> matchingObjBw2Lists({
  required List<FieldModel> list1,
  required List<FieldModel> list2,
}) {
  final List<FieldModel> matchObjList = [];
  for (var i = 0; i < list1.length; i++) {
    for (var j = 0; j < list2.length; j++) {
      if (list1[i].id == list2[j].id) {
        matchObjList.add(list2[j]);
      }
    }
  }
  return matchObjList;
}

extension IterableDistinctExt<T> on Iterable<T> {
  Iterable<T> distinct() sync* {
    final visited = <T>{};
    for (final el in this) {
      if (visited.contains(el)) continue;
      yield el;
      visited.add(el);
    }
  }
}
