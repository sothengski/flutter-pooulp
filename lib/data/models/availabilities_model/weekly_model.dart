import 'dart:convert';

import 'package:get/get.dart';

import 'slot_model.dart';

class WeeklyModel {
  final int? day;
  final String? dayLabel;
  final List<SlotModel>? slots;
  bool isOpen;

  WeeklyModel({
    this.day,
    this.dayLabel,
    this.slots,
    this.isOpen = true,
  });

  String get getDayLabelByLanguage {
    if (day == 1) {
      return 'monday'.tr;
    } else if (day == 2) {
      return 'tuesday'.tr;
    } else if (day == 3) {
      return 'wednesday'.tr;
    } else if (day == 4) {
      return 'thursday'.tr;
    } else if (day == 5) {
      return 'friday'.tr;
    } else if (day == 6) {
      return 'saturday'.tr;
    } else {
      return 'sunday'.tr;
    }
  }

  factory WeeklyModel.fromRawJson(String str) =>
      WeeklyModel.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory WeeklyModel.fromJson(Map<String, dynamic> json) => WeeklyModel(
        day: json['day'] as int?,
        dayLabel: json['day_label'] as String?,
        slots: json['slots'] != null || json['slots'] != []
            ? (json['slots'] as List)
                .map(
                  (i) => SlotModel.fromJson(
                    i as Map<String, dynamic>,
                  ),
                )
                .toList()
            : [],
      );

  Map<String, dynamic> toJson() => {
        'day': day,
        'day_label': dayLabel,
        'slots': slots != null || slots != []
            ? List<dynamic>.from(slots!.map((x) => x.toJson()))
            : [],
      }..removeWhere((_, v) => v == null);

  @override
  String toString() => '''
  WeeklyModel(
    day: $day, 
    dayLabel: $dayLabel, 
    slots: $slots,
    isOpen: $isOpen,
  )''';
}
