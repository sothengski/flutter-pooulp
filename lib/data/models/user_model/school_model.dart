import 'dart:convert';

import '../../data.dart';

class SchoolModel {
  final int? id;
  final String? name;
  final String? description;
  final String? website;
  final String? addressStreet;
  final String? addressCity;
  final String? addressZip;
  final String? addressCountry;
  final List<FieldModel>? fields;

  SchoolModel({
    this.id,
    this.name,
    this.description,
    this.website,
    this.addressStreet,
    this.addressCity,
    this.addressZip,
    this.addressCountry,
    this.fields,
  });

  factory SchoolModel.fromRawJson(String str) => SchoolModel.fromJson(
        json.decode(str) as Map<String, dynamic>,
      );

  String toRawJson() => json.encode(toJson());

  factory SchoolModel.fromJson(Map<String, dynamic> json) => SchoolModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        website: json['website'] as String?,
        addressStreet: json['address_street'] as String?,
        addressCity: json['address_city'] as String?,
        addressZip: json['address_zip'] as String?,
        addressCountry: json['address_country'] as String?,
        fields: json['fields'] == null || json['fields'] != []
            ? []
            : (json['fields'] as List)
                .map(
                  (i) => FieldModel.fromJson(
                    i as Map<String, dynamic>,
                  ),
                )
                .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'website': website,
        'address_street': addressStreet,
        'address_city': addressCity,
        'address_zip': addressZip,
        'address_country': addressCountry,
        'fields': fields == null || fields == []
            ? []
            : List<dynamic>.from(fields!.map((x) => x.toJson())),
      }..removeWhere((_, v) => v == null);

  @override
  String toString() {
    return '''
    SchoolModel(
      id: $id,
      name: $name,
      description: $description,
      website: $website,
      addressStreet: $addressStreet,
      addressCity: $addressCity,
      addressZip: $addressZip,
      addressCountry: $addressCountry,
      fields: $fields,
    )''';
  }
}
