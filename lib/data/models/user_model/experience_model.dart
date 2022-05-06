import 'dart:convert';

import '../../../core/core.dart';

class ExperienceModel {
  final int? id;
  final String? type; //professional //personal
  final String? name;
  final String? description;
  final String? company;
  final DateTime? dateStart;
  final DateTime? dateEnd;
  final int? completed;
  final String? addressCity;
  final String? addressCountry;
  // final dynamic? job;
  final List<dynamic>? tags;

  ExperienceModel({
    this.id,
    this.type,
    this.name,
    this.description,
    this.company,
    this.dateStart,
    this.dateEnd,
    this.completed = 0,
    this.addressCity,
    this.addressCountry,
    // this.job,
    this.tags,
  });

  String? get attendedFrom => dateFormatSlashDDMMYYYY(date: dateStart);
  String? get attendedTo => dateFormatSlashDDMMYYYY(date: dateEnd);
  String? get attendedFromTo =>
      '$attendedFrom ${attendedTo == null || attendedTo == '' ? '' : '- $attendedTo'}';

  String? get companyCityAndCountry =>
      '$addressCity ${addressCountry == null || addressCountry == '' ? '' : '- $addressCountry'}';

  factory ExperienceModel.fromRawJson(String str) => ExperienceModel.fromJson(
        json.decode(str) as Map<String, dynamic>,
      );

  String toRawJson() => json.encode(toJson());

  factory ExperienceModel.fromJson(Map<String, dynamic> json) =>
      ExperienceModel(
        id: json['id'] as int?,
        type: json['type'] as String?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        company: json['company'] as String?,
        dateStart: json['date_start'] != null
            ? DateTime.parse(json['date_start'].toString())
            : null,
        dateEnd: json['date_end'] != null
            ? DateTime.parse(json['date_end'].toString())
            : null,
        completed: json['completed'] as int?,
        addressCity: json['address_city'] as String?,
        addressCountry: json['address_country'] as String?,
        // job: json['job']as String?,
        // job: json['job']as String?,
        tags: json['tags'] as List<dynamic>?,
        // tags: json['tags'] != null || json['tags'] != []
        //     ? (json['tags'] as List)
        //         .map(
        //           (i) => FieldModel.fromJson(
        //             i as Map<String, dynamic>,
        //           ),
        //         )
        //         .toList()
        //     : [],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'name': name,
        'description': description,
        'company': company,
        'date_start': dateStart == null
            ? null
            : "${dateStart!.year.toString().padLeft(4, '0')}-${dateStart!.month.toString().padLeft(2, '0')}-${dateStart!.day.toString().padLeft(2, '0')}",
        'date_end': dateEnd == null
            ? null
            : "${dateEnd!.year.toString().padLeft(4, '0')}-${dateEnd!.month.toString().padLeft(2, '0')}-${dateEnd!.day.toString().padLeft(2, '0')}",
        'completed': completed,
        'address_city': addressCity,
        'address_country': addressCountry,
        // 'job': job,
        // 'tags': tags == null //|| tags == []
        //     ? null
        //     : List<dynamic>.from(tags!.map((x) => x.toJson())),
        'tags': tags == null || tags == []
            ? null
            : List<dynamic>.from(tags!.map((x) => x)),
      }..removeWhere((_, v) => v == null);

  @override
  String toString() {
    return '''
    ExperienceModel(
      id: $id,
      type: $type,
      name: $name,
      description: $description,
      company: $company,
      dateStart: $dateStart,
      dateEnd: $dateEnd,
      completed: $completed,
      addressCity: $addressCity,       
      addressCountry: $addressCountry,
      tags: $tags
    )''';
    // tags: $tags
  }
}
