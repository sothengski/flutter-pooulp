import 'dart:convert';

class JobOfferMatchingModel {
  final int? id;
  final int? stateId;
  final int? reasonTagId;
  final String? reason;
  final DateTime? datetimeSaved;
  final DateTime? datetimeRefused;
  final DateTime? datetimeMatched;
  final DateTime? datetimeEnterpriseMatched;
  final DateTime? datetimeEnterpriseRefused;
  final int? jobOfferId;
  final String? roomUuid;

  JobOfferMatchingModel({
    this.id,
    this.stateId,
    this.reasonTagId,
    this.reason,
    this.datetimeSaved,
    this.datetimeRefused,
    this.datetimeMatched,
    this.datetimeEnterpriseMatched,
    this.datetimeEnterpriseRefused,
    this.jobOfferId,
    this.roomUuid,
  });

  factory JobOfferMatchingModel.fromRawJson(String str) =>
      JobOfferMatchingModel.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory JobOfferMatchingModel.fromJson(Map<String, dynamic> json) =>
      JobOfferMatchingModel(
        id: json['id'] as int?,
        stateId: json['state_id'] as int?,
        reasonTagId: json['reason_tag_id'] as int?,
        reason: json['reason'] as String?,
        // datetimeSaved: json['datetime_saved'] as int?,
        // datetimeRefused: json['datetime_refused'] as int?,
        // datetimeMatched: DateTime.parse(json['datetime_matched']) as int?,
        // datetimeEnterpriseMatched:
        //     DateTime.parse(json['datetime_enterprise_matched']) as int?,
        // datetimeEnterpriseRefused: json['datetime_enterprise_refused'] as int?,
        jobOfferId: json['job_offer_id'] as int?,
        roomUuid: json['room_uuid'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'state_id': stateId,
        'reason_tag_id': reasonTagId,
        'reason': reason,
        // 'datetime_saved': datetimeSaved,
        // 'datetime_refused': datetimeRefused,
        // 'datetime_matched': datetimeMatched?.toIso8601String(),
        // 'datetime_enterprise_matched':
        //     datetimeEnterpriseMatched?.toIso8601String(),
        // 'datetime_enterprise_refused': datetimeEnterpriseRefused,
        'job_offer_id': jobOfferId,
        'room_uuid': roomUuid,
      };

  @override
  String toString() => '''
    JobOfferMatchingModel(
      id: $id,
      stateId: $stateId,
      reasonTagId: $reasonTagId,
      reason: $reason,
      datetimeSaved: $datetimeSaved,
      datetimeRefused: $datetimeRefused,
      datetimeMatched: $datetimeMatched,
      datetimeEnterpriseMatched: $datetimeEnterpriseMatched,
      datetimeEnterpriseRefused: $datetimeEnterpriseRefused,
      jobOfferId: $jobOfferId,
      roomUuid: $roomUuid,
    )''';
}
