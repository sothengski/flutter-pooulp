import 'dart:convert';

class AppBasicModel {
  final String? status;
  final String? version;
  final int? enterprises;
  final int? offers;
  final int? matchings;
  final DateTime? latestTranslationUpdate;

  AppBasicModel({
    this.status,
    this.version,
    this.enterprises,
    this.offers,
    this.matchings,
    this.latestTranslationUpdate,
  });

  factory AppBasicModel.fromRawJson(String str) =>
      AppBasicModel.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory AppBasicModel.fromJson(Map<String, dynamic> json) => AppBasicModel(
        status: json['status'] as String?,
        version: json['version'] as String?,
        enterprises: json['enterprises'] as int?,
        offers: json['offers'] as int?,
        matchings: json['matchings'] as int?,
        latestTranslationUpdate: json['latestTranslationUpdate'] != null
            ? DateTime.parse(json['latestTranslationUpdate'].toString())
            : null,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'version': version,
        'enterprises': enterprises,
        'offers': offers,
        'matchings': matchings,
        'latestTranslationUpdate': latestTranslationUpdate?.toString(),
      }..removeWhere((_, dynamic v) => v == null);

  @override
  String toString() => '''
    AppBasicModel(
      status: $status,
      version: $version,
      enterprises: $enterprises,
      offers: $offers,
      matchings: $matchings,
      latestTranslationUpdate: $latestTranslationUpdate,
      ''';
}
