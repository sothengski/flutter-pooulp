// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';

import '../data.dart';

class PaginationModel {
  final List<JobOfferModel>? data;
  final LinksModel? links;
  final MetaModel? meta;

  PaginationModel({
    this.data,
    this.links,
    this.meta,
  });

  factory PaginationModel.fromRawJson(String str) => PaginationModel.fromJson(
        json.decode(str) as Map<String, dynamic>,
      );

  String toRawJson() => json.encode(toJson());

  factory PaginationModel.fromJson(Map<String, dynamic> json) =>
      PaginationModel(
        data: json['data'] != null || json['data'] != []
            ? (json['data'] as List)
                .map(
                  (i) => JobOfferModel.fromJson(
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
        'data': List<dynamic>.from(data!.map((x) => x.toJson())),
        'links': links!.toJson(),
        'meta': meta!.toJson(),
      }..removeWhere((_, dynamic v) => v == null);

  @override
  String toString() => '''
  Pagination(
    data: $data,
    links: $links, 
    meta: $meta,
  )''';
}

class MetaModel {
  final int? currentPage;
  final int? from;
  final int? lastPage;
  final List<LinksModel>? links;
  final String? path;
  final int? perPage;
  final int? to;
  final int? total;

  MetaModel({
    this.currentPage = 0,
    this.from,
    this.lastPage = 1,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  factory MetaModel.fromRawJson(String str) => MetaModel.fromJson(
        json.decode(str) as Map<String, dynamic>,
      );

  String toRawJson() => json.encode(toJson());

  factory MetaModel.fromJson(Map<String, dynamic> json) => MetaModel(
        currentPage: json['current_page'] as int?,
        from: json['from'] as int?,
        lastPage: json['last_page'] as int?,
        links: json['links'] == null || json['links'] == []
            ? []
            : (json['links'] as List)
                .map(
                  (i) => LinksModel.fromJson(
                    i as Map<String, dynamic>,
                  ),
                )
                .toList(),
        // links: List<Links>.from(json['links'].map((x) => Links.fromEachJson(x))),
        path: json['path'] as String?,
        perPage: json['per_page'] as int?,
        to: json['to'] as int?,
        total: json['total'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'current_page': currentPage,
        'from': from,
        'last_page': lastPage,
        'links': links == null || links == []
            ? null
            : List<dynamic>.from(links!.map((x) => x.toJson())),
        'path': path,
        'per_page': perPage,
        'to': to,
        'total': total,
      }..removeWhere((_, dynamic v) => v == null);

  @override
  String toString() => '''
    Meta(
      currentPage: $currentPage,
      from: $from,
      lastPage: $lastPage,
      links: $links,
      path: $path,
      perPage: $perPage,
      to: $to,
      total: $total,
    ) ''';
}

String linksListToJson(List<LinksModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<LinksModel> linksListFromJson(String str) => List<LinksModel>.from(
      json.decode(str).map(
            (x) => LinksModel.fromJson(
              x as Map<String, dynamic>,
            ),
          ) as List,
    );

LinksModel linksFromJson(String str) =>
    LinksModel.fromJson(json.decode(str) as Map<String, dynamic>);

String linksToJson(LinksModel data) => json.encode(data.toJson());

class LinksModel {
  final String? first;
  final String? last;
  final String? prev;
  final String? next;
  final String? url;
  final String? label;
  final bool? active;

  LinksModel({
    this.first,
    this.last,
    this.prev,
    this.next,
    this.url,
    this.label,
    this.active,
  });

  factory LinksModel.fromRawJson(String str) => LinksModel.fromJson(
        json.decode(str) as Map<String, dynamic>,
      );

  String toRawJson() => json.encode(toJson());

  factory LinksModel.fromRawEachJson(String str) => LinksModel.fromEachJson(
        json.decode(str) as Map<String, dynamic>,
      );

  String toRawEachJson() => json.encode(toEachJson());

  factory LinksModel.fromJson(Map<String, dynamic> json) => LinksModel(
        first: json['first'] as String?,
        last: json['last'] as String?,
        prev: json['prev'] as String?,
        next: json['next'] as String?,
        url: json['url'] as String?,
        label: json['label'] as String?,
        active: json['active'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'first': first,
        'last': last,
        'prev': prev,
        'next': next,
        'url': url,
        'label': label,
        'active': active,
      }..removeWhere((_, dynamic v) => v == null);

  factory LinksModel.fromEachJson(Map<String, dynamic> json) => LinksModel(
        url: json['url'] as String?,
        label: json['label'] as String?,
        active: json['active'] as bool?,
      );

  Map<String, dynamic> toEachJson() => {
        'url': url,
        'label': label,
        'active': active,
      }..removeWhere((_, dynamic v) => v == null);

  @override
  String toString() => '''
    Links(
      first: $first,
      last: $last,
      prev: $prev,
      next: $next,
      url: $url,
      label: $label,
      active: $active,
    )''';
}
