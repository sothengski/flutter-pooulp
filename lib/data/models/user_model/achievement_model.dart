import 'dart:convert';

import '../../../core/core.dart';
import '../../data.dart';

class AchievementModel {
  final int? id;
  final String? name;
  final String? description;
  final DateTime? dateCompletion;
  final List<FieldModel>? fields;

  AchievementModel({
    this.id,
    this.name,
    this.description,
    this.dateCompletion,
    this.fields,
  });
  String? get dateCompletionFormat =>
      dateFormatDashYYYYMMDD(date: dateCompletion);

  factory AchievementModel.fromRawJson(String str) =>
      AchievementModel.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory AchievementModel.fromJson(Map<String, dynamic> json) =>
      AchievementModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        dateCompletion: json['date_completion'] != null
            ? DateTime.parse(json['date_completion'].toString())
            : null,
        fields: json['fields'] != null || json['fields'] != []
            ? (json['fields'] as List)
                .map(
                  (i) => FieldModel.fromJson(
                    i as Map<String, dynamic>,
                  ),
                )
                .toList()
            : [],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        // 'date_completion': dateCompletion?.toString(),
        'date_completion':
            "${dateCompletion!.year.toString().padLeft(4, '0')}-${dateCompletion!.month.toString().padLeft(2, '0')}-${dateCompletion!.day.toString().padLeft(2, '0')}",
        'fields': fields != null || fields != []
            ? List<dynamic>.from(fields!.map((x) => x.toJson()))
            : null,
      }..removeWhere((_, v) => v == null);

  @override
  String toString() {
    return '''
    AchievementModel(
      id: $id,
      name: $name,
      description: $description,
      dateCompletion: $dateCompletion,
      fields: $fields,
    )''';
  }
}
