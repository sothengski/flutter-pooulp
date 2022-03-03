// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';

import '../data.dart';

class Pagination {
  final List<JobOfferModel>? data;
  final Links? links;
  final Meta? meta;

  Pagination({
    this.data,
    this.links,
    this.meta,
  });

  factory Pagination.fromRawJson(String str) => Pagination.fromJson(
        json.decode(str) as Map<String, dynamic>,
      );

  String toRawJson() => json.encode(toJson());

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
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
            ? Links.fromJson(
                json['links'] as Map<String, dynamic>,
              )
            : null,
        meta: json['meta'] != null
            ? Meta.fromJson(
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

class Meta {
  final int? currentPage;
  final int? from;
  final int? lastPage;
  final List<Links>? links;
  final String? path;
  final int? perPage;
  final int? to;
  final int? total;

  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  factory Meta.fromRawJson(String str) => Meta.fromJson(
        json.decode(str) as Map<String, dynamic>,
      );

  String toRawJson() => json.encode(toJson());

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json['current_page'] as int?,
        from: json['from'] as int?,
        lastPage: json['last_page'] as int?,
        links: json['links'] == null || json['links'] == []
            ? []
            : (json['links'] as List)
                .map(
                  (i) => Links.fromJson(
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

String linksListToJson(List<Links> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<Links> linksListFromJson(String str) => List<Links>.from(
      json.decode(str).map(
            (x) => Links.fromJson(
              x as Map<String, dynamic>,
            ),
          ) as List,
    );

Links linksFromJson(String str) =>
    Links.fromJson(json.decode(str) as Map<String, dynamic>);

String linksToJson(Links data) => json.encode(data.toJson());

class Links {
  final String? first;
  final String? last;
  final String? prev;
  final String? next;
  final String? url;
  final String? label;
  final bool? active;

  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
    this.url,
    this.label,
    this.active,
  });

  factory Links.fromRawJson(String str) => Links.fromJson(
        json.decode(str) as Map<String, dynamic>,
      );

  String toRawJson() => json.encode(toJson());

  factory Links.fromRawEachJson(String str) => Links.fromEachJson(
        json.decode(str) as Map<String, dynamic>,
      );

  String toRawEachJson() => json.encode(toEachJson());

  factory Links.fromJson(Map<String, dynamic> json) => Links(
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

  factory Links.fromEachJson(Map<String, dynamic> json) => Links(
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
