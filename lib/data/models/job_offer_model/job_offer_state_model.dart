import 'dart:convert';

class JobOfferStateModel {
  final int? id;
  final int? stateId;
  final int? reasonTagId;
  final String? reason;
  final DateTime? datetimeSaved; // Job Offer Saved
  final DateTime? datetimeRefused; // Job Offer Hided
  final DateTime? datetimeMatched; // Job Offer Pending
  final DateTime?
      datetimeEnterpriseMatched; //Job Offer Accepted from Enterprise
  final DateTime?
      datetimeEnterpriseRefused; //Job Offer Rejected from Enterprise
  final String? roomUUID;

  JobOfferStateModel({
    this.id,
    this.stateId = 0,
    this.reasonTagId,
    this.reason,
    this.datetimeSaved,
    this.datetimeRefused,
    this.datetimeMatched,
    this.datetimeEnterpriseMatched,
    this.datetimeEnterpriseRefused,
    this.roomUUID,
  });

  ///1 == true // 0 ==false
  int? get isPendingState =>
      (datetimeMatched != null && datetimeMatched.toString() != '') &&
              (datetimeRefused == null || datetimeRefused.toString() == '') &&
              // (datetimeSaved == null || datetimeSaved.toString() == '') &&
              (datetimeEnterpriseMatched == null ||
                  datetimeEnterpriseMatched.toString() == '') &&
              (datetimeEnterpriseRefused == null ||
                  datetimeEnterpriseRefused.toString() == '')
          ? 1
          : 0;

  ///1 == true // 0 ==false
  int? get isSavedState =>
      (datetimeSaved != null && datetimeSaved.toString() != '') &&
              (datetimeRefused == null || datetimeRefused.toString() == '') &&
              (datetimeMatched == null || datetimeMatched.toString() == '') &&
              (datetimeEnterpriseMatched == null ||
                  datetimeEnterpriseMatched.toString() == '') &&
              (datetimeEnterpriseRefused == null ||
                  datetimeEnterpriseRefused.toString() == '')
          ? 1
          : 0;

  ///1 == true // 0 ==false
  int? get isEnterpriseMatchedState => (datetimeEnterpriseMatched != null &&
              datetimeEnterpriseMatched.toString() != '') &&
          (datetimeRefused == null || datetimeRefused.toString() == '') &&
          // (datetimeSaved == null || datetimeSaved.toString() == '') &&
          // (datetimeMatched == null || datetimeMatched.toString() == '') &&
          (datetimeEnterpriseRefused == null ||
              datetimeEnterpriseRefused.toString() == '')
      ? 1
      : 0;

  ///1 == true // 0 ==false
  int? get isEnterpriseRefusedState => (datetimeEnterpriseRefused != null &&
              datetimeEnterpriseRefused.toString() != '') &&
          (datetimeRefused == null || datetimeRefused.toString() == '')
      //  &&
      // (datetimeSaved == null || datetimeSaved.toString() == '') &&
      // (datetimeEnterpriseMatched == null ||
      //     datetimeEnterpriseMatched.toString() == '') &&
      // (datetimeMatched == null || datetimeMatched.toString() == '')
      ? 1
      : 0;

  ///1 == true // 0 ==false
  int? get isRejectedState =>
      (datetimeRefused != null && datetimeRefused.toString() != '') ? 1 : 0;

  factory JobOfferStateModel.fromRawJson(String str) =>
      JobOfferStateModel.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory JobOfferStateModel.fromJson(Map<String, dynamic> json) =>
      JobOfferStateModel(
        id: json["id"] as int?,
        stateId: json['state_id'] as int?,
        reasonTagId: json['reason_tag_id'] as int?,
        reason: json['reason'] as String?,
        datetimeSaved:
            json['datetime_saved'] == null || json['datetime_saved'] == ''
                ? null
                : DateTime.parse(
                    json['datetime_saved'].toString(),
                  ),
        datetimeRefused:
            json['datetime_refused'] == null || json['datetime_refused'] == ''
                ? null
                : DateTime.parse(
                    json['datetime_refused'].toString(),
                  ),
        datetimeMatched:
            json['datetime_matched'] == null || json['datetime_matched'] == ''
                ? null
                : DateTime.parse(
                    json['datetime_matched'].toString(),
                  ),
        datetimeEnterpriseMatched:
            json['datetime_enterprise_matched'] == null ||
                    json['datetime_enterprise_matched'] == ''
                ? null
                : DateTime.parse(
                    json['datetime_enterprise_matched'].toString(),
                  ),
        datetimeEnterpriseRefused:
            json['datetime_enterprise_refused'] == null ||
                    json['datetime_enterprise_refused'] == ''
                ? null
                : DateTime.parse(
                    json['datetime_enterprise_refused'].toString(),
                  ),
        roomUUID: json['room_uuid'] as String?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "state_id": stateId,
        "reason_tag_id": reasonTagId,
        "reason": reason,
        "datetime_saved": datetimeSaved,
        "datetime_refused": datetimeRefused,
        "datetime_matched": datetimeMatched?.toIso8601String(),
        "datetime_enterprise_matched": datetimeEnterpriseMatched,
        "datetime_enterprise_refused": datetimeEnterpriseRefused,
        "room_uuid": roomUUID,
      }..removeWhere((_, v) => v == null);

  @override
  String toString() {
    return '''
    JobOfferStateModel(id: $id,
      stateID: $stateId,
      reasonTagId: $reasonTagId,
      reason: $reason,
      datetimeSaved: $datetimeSaved,
      datetimeRefused: $datetimeRefused,
      datetimeMatched: $datetimeMatched,
      datetimeEnterpriseMatched: $datetimeEnterpriseMatched,
      datetimeEnterpriseRefused: $datetimeEnterpriseRefused,
      roomUUID: $roomUUID,
    )''';
  }
}
