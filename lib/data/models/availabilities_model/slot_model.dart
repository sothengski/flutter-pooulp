import 'dart:convert';

import '../../../core/core.dart';

class SlotModel {
  final int? id;
  final int? startTime;
  final int? endTime;

  SlotModel({
    this.id,
    this.startTime,
    this.endTime,
  });

  String? get startTimeToHour => intToActuallyHoursMins(value: startTime);

  String? get endTimeToHour => intToActuallyHoursMins(value: endTime);

  factory SlotModel.fromRawJson(String str) =>
      SlotModel.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory SlotModel.fromJson(Map<String, dynamic> json) => SlotModel(
        id: json['id'] as int?,
        startTime: json['start_time'] as int?,
        endTime: json['end_time'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'start_time': startTime,
        'end_time': endTime,
      }..removeWhere((_, v) => v == null);

  @override
  String toString() => '''
  SlotModel(
    id: $id,
    startTime: $startTime,
    endTime: $endTime,
  )''';
}
