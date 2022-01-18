import 'dart:convert';

import 'weekly_model.dart';

class PeriodModel {
  final int? id;
  final DateTime? from;
  final DateTime? to;
  final int? isCustom;
  final List<WeeklyModel>? weekly;

  PeriodModel({
    this.id,
    this.from,
    this.to,
    this.isCustom,
    this.weekly,
  });

  factory PeriodModel.fromRawJson(String str) =>
      PeriodModel.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory PeriodModel.fromJson(Map<String, dynamic> json) => PeriodModel(
        id: json['id'] as int?,
        from: json['from'] != null
            ? DateTime.parse(
                json['from'].toString(),
              )
            : null,
        to: json['to'] != null
            ? DateTime.parse(
                json['to'].toString(),
              )
            : null,
        isCustom: json['is_custom'] as int?,
        weekly: json['weekly'] == null
            ? (json['weekly'] as List)
                .map(
                  (i) => WeeklyModel.fromJson(
                    i as Map<String, dynamic>,
                  ),
                )
                .toList()
            : [],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'from':
            "${from!.year.toString().padLeft(4, '0')}-${from!.month.toString().padLeft(2, '0')}-${from!.day.toString().padLeft(2, '0')}",
        'to':
            "${to!.year.toString().padLeft(4, '0')}-${to!.month.toString().padLeft(2, '0')}-${to!.day.toString().padLeft(2, '0')}",
        'is_custom': isCustom,
        'weekly': weekly != null
            ? List<dynamic>.from(weekly!.map((x) => x.toJson()))
            : [],
      };

  @override
  String toString() {
    return '''
    PeriodModel(
      id: $id,
      from: $from,
      to: $to,
      isCustom: $isCustom,
      weekly: $weekly,
    )''';
  }
}
