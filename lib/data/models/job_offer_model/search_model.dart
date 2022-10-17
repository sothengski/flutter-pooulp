// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

import 'package:pooulp_flutter/data/data.dart';

class SearchModel {
  final int? id;
  final String? searchName;
  final FieldModel? type;
  final SearchPreferencesModel? search;

  SearchModel({
    this.id,
    this.searchName,
    this.type,
    this.search,
  });

  factory SearchModel.fromRawJson(String str) =>
      SearchModel.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        id: json['id'] as int?,
        searchName: json['search_name'] as String?,
        type: json['type'] == null
            ? null
            : FieldModel.fromJson(
                json['type'] as Map<String, dynamic>,
              ),
        search: json['search'] == null
            ? null
            : SearchPreferencesModel.fromJson(
                json['search'] as Map<String, dynamic>,
              ),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'search_name': searchName,
        'type': type?.toJson(),
        'search': search?.toJson(),
      };

  @override
  String toString() => '''
      SearchModel(
        id: $id, 
        searchName: $searchName, 
        type: $type, 
        search: $search,
      )''';
}
