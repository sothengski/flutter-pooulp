import 'dart:convert';

import '../../data.dart';

class MessagingPaginationModel {
  MessagingPaginationModel({
    this.data,
    this.links,
    this.meta,
  });

  final List<MessagingModel>? data;
  final LinksModel? links;
  final MetaModel? meta;

  factory MessagingPaginationModel.fromRawJson(String str) =>
      MessagingPaginationModel.fromJson(
        json.decode(str) as Map<String, dynamic>,
      );

  String toRawJson() => json.encode(toJson());

  factory MessagingPaginationModel.fromJson(Map<String, dynamic> json) =>
      MessagingPaginationModel(
        data: json['data'] != null || json['data'] != []
            ? (json['data'] as List)
                .map(
                  (i) => MessagingModel.fromJson(
                    i as Map<String, dynamic>,
                  ),
                )
                .toList()
            : [],
        links: json['links'] != null
            ? LinksModel.fromJson(
                json['links'] as Map<String, dynamic>,
              )
            : null,
        meta: json['meta'] != null
            ? MetaModel.fromJson(
                json['meta'] as Map<String, dynamic>,
              )
            : null,
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "links": links!.toJson(),
        "meta": meta!.toJson(),
      };

  @override
  String toString() => '''
    MessagingPaginationModel(
      data: $data, 
      links: $links, 
      meta: $meta
    )''';
}
