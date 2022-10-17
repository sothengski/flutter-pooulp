import 'dart:convert';

import '../../../core/core.dart';
import '../../data.dart';

class EducationModel {
  final int? id;
  final int? schoolId;
  final String? name;
  final String? description;
  final String? degree;
  final int? studyingYear;
  final DateTime? dateStart;
  final DateTime? dateEnd;
  bool? completed;
  SchoolModel? school;
  List<FieldModel>? fields;

  EducationModel({
    this.id,
    this.schoolId,
    this.name,
    this.description,
    this.degree,
    this.studyingYear,
    this.dateStart,
    this.dateEnd,
    this.completed,
    this.school,
    this.fields,
  });

  String? get attendedFrom => dateFormatSlashMMYYYY(date: dateStart);
  String? get attendedTo => dateFormatSlashMMYYYY(date: dateEnd);
  String? get attendedFromTo =>
      '$attendedFrom ${attendedTo == null || attendedTo == '' ? '' : '- $attendedTo'}';

  String? get schoolCityAndCountry =>
      '${school!.addressCity} ${school!.addressCountry == null || school!.addressCountry == '' ? '' : '- ${school!.addressCountry}'}';

  factory EducationModel.fromRawJson(String str) => EducationModel.fromJson(
        json.decode(str) as Map<String, dynamic>,
      );

  String toRawJson() => json.encode(toJson());

  factory EducationModel.fromJson(Map<String, dynamic> json) => EducationModel(
        id: json['id'] as int?,
        schoolId: json['school_id'] as int?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        degree: json['degree'] as String?,
        studyingYear: json['studying_year'] as int?,
        dateStart: json['date_start'] != null
            ? DateTime.parse(json['date_start'].toString())
            : null,
        dateEnd: json['date_end'] != null
            ? DateTime.parse(json['date_end'].toString())
            : null,
        completed: json['completed'] as bool?,
        school: json['school'] != null
            ? SchoolModel.fromJson(
                json['school'] as Map<String, dynamic>,
              )
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
        'school_id': schoolId,
        'name': name,
        'description': description,
        'degree': degree,
        'studying_year': studyingYear,
        'date_start': dateStart == null
            ? null
            : "${dateStart!.year.toString().padLeft(4, '0')}-${dateStart!.month.toString().padLeft(2, '0')}-${dateStart!.day.toString().padLeft(2, '0')}",
        'date_end': dateEnd == null
            ? null
            : "${dateEnd!.year.toString().padLeft(4, '0')}-${dateEnd!.month.toString().padLeft(2, '0')}-${dateEnd!.day.toString().padLeft(2, '0')}",
        'completed': completed,
        'school': school?.toJson(),
        'fields': fields == null //|| fields == []
            ? null
            : List<dynamic>.from(fields!.map((x) => x.toJson())),
      }..removeWhere((_, v) => v == null);

  Map<String, dynamic> toJsonForOnboarding() => {
        // 'id': id,
        'school_id': schoolId,
        'name': name ?? '',
        'description': description ?? '',
        'degree': degree ?? '',
        'studying_year': studyingYear ?? 0,
        'date_start': '',
        // 'date_start': dateStart == null
        //     ? null
        //     : "${dateStart!.year.toString().padLeft(4, '0')}-${dateStart!.month.toString().padLeft(2, '0')}-${dateStart!.day.toString().padLeft(2, '0')}",
        'date_end': '',
        // 'date_end': dateEnd == null
        //     ? null
        //     : "${dateEnd!.year.toString().padLeft(4, '0')}-${dateEnd!.month.toString().padLeft(2, '0')}-${dateEnd!.day.toString().padLeft(2, '0')}",
        'completed': completed,
        // 'school': school?.toJson(),
        'fields': fields == null //|| fields == []
            ? null
            : List<dynamic>.from(fields!.map((x) => x.id)),
      }..removeWhere((_, v) => v == null);

  @override
  String toString() {
    return '''
    EducationModel(
      id: $id,
      'schoolId': $schoolId,
      name: $name,
      description: $description,
      degree: $degree,
      studyingYear: $studyingYear,
      dateStart: $dateStart,
      dateEnd: $dateEnd,
      completed: $completed,
      school: $school,
      fields: $fields,
    )''';
  }
}
