import 'dart:convert';

import 'slot_model.dart';

class WeeklyModel {
  final int? day;
  final String? dayLabel;
  final List<SlotModel>? slots;

  WeeklyModel({
    this.day,
    this.dayLabel,
    this.slots,
  });

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
  )''';
}
