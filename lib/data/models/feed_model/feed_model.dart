import 'dart:convert';

import '../../data.dart';

class FeedModel {
  final int? id;
  final DateTime? datetimeCreated;
  final DateTime? datetimeSaved;
  final DateTime? datetimeRefused;
  final DateTime? datetimeMatched;
  final JobOfferModel? jobOffer;

  FeedModel({
    this.id,
    this.datetimeCreated,
    this.datetimeSaved,
    this.datetimeRefused,
    this.datetimeMatched,
    this.jobOffer,
  });

  factory FeedModel.fromRawJson(String str) =>
      FeedModel.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory FeedModel.fromJson(Map<String, dynamic> json) => FeedModel(
        id: json['id'] as int?,
        datetimeCreated: json['datetime_created'] != null
            ? DateTime.parse(
                json['datetime_created'].toString(),
              )
            : null,
        datetimeSaved: json['datetime_saved'] != null
            ? DateTime.parse(
                json['datetime_saved'].toString(),
              )
            : null,
        datetimeRefused: json['datetime_refused'] != null
            ? DateTime.parse(
                json['datetime_refused'].toString(),
              )
            : null,
        datetimeMatched: json['datetime_matched'] != null
            ? DateTime.parse(
                json['datetime_matched'].toString(),
              )
            : null,
        jobOffer: json['job_offer'] != null
            ? JobOfferModel.fromJson(
                json['job_offer'] as Map<String, dynamic>,
              )
            : null,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'datetime_created': datetimeCreated?.toString(),
        'datetime_saved': datetimeSaved?.toString(),
        'datetime_refused': datetimeRefused?.toString(),
        'datetime_matched': datetimeMatched?.toString(),
        'job_offer': jobOffer?.toJson(),
      }..removeWhere((_, v) => v == null);

  @override
  String toString() {
    return '''
    FeedModel(
      id: $id,
      datetimeCreated: $datetimeCreated,
      datetimeSaved: $datetimeSaved,
      datetimeRefused: $datetimeRefused,
      datetimeMatched: $datetimeMatched,
      jobOffer: $jobOffer,
    )''';
  }
}
