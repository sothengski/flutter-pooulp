import 'dart:convert';

import '../../../core/core.dart';
import '../../data.dart';

class JobOfferModel {
  final int? id;
  final String? title;
  final String? studySubject;
  final String? description;
  final bool? isDraft;
  final DateTime? dateOfferStart;
  final DateTime? dateOfferEnd;
  final DateTime? dateJobStart;
  final DateTime? dateJobEnd;
  final int? telecommuting;
  final int? shifting;
  final int? numberOfWorkingHourPerWeek;
  final String? addressStreet;
  final String? addressCity;
  final String? addressZip;
  final String? addressCountry;
  final String? addressLatitude;
  final String? addressLongitude;
  final List<FieldModel>? types;
  final List<FieldModel>? fields;
  final List<FieldModel>? spokenLanguages;
  final List<SkillModel>? skills;
  final ProfileModel? enterprise;
  final JobOfferStateModel? jobOfferStateModel;
  bool? applyState;
  bool? savedState;
  bool? rejectedState;
  bool? informationState;
  // String? jobOfferType;
  final String? location;
  final bool? isRangeSearch;
  final int? range;

  JobOfferModel({
    this.id,
    this.title,
    this.studySubject,
    this.description,
    this.isDraft,
    this.dateOfferStart,
    this.dateOfferEnd,
    this.dateJobStart,
    this.dateJobEnd,
    this.telecommuting = 2,
    this.shifting,
    this.numberOfWorkingHourPerWeek,
    this.addressStreet,
    this.addressCity,
    this.addressZip,
    this.addressCountry,
    this.addressLatitude,
    this.addressLongitude,
    this.types,
    this.fields,
    this.spokenLanguages,
    this.skills,
    this.enterprise,
    this.jobOfferStateModel,
    this.applyState = false,
    this.savedState = false,
    this.rejectedState = false,
    this.informationState = false,
    // this.jobOfferType = '',
    this.location = "",
    this.isRangeSearch = false,
    this.range = -1,
  });

  String? get numberOfWorkPerWeek => numberOfWorkingHourPerWeek == null
      ? 'N/A'
      : '$numberOfWorkingHourPerWeek hrs/week';

  String? get companyNameAndLocation =>
      '${enterprise!.name} ($companyLocation)';

  String? get companyLocation =>
      '${enterprise!.addressCity}, ${enterprise!.addressCountry}';

  String? get workPlaceType => telecommuting == 1 ? 'Remote' : 'On-Site';

  String? get dateOfferStartFormat =>
      dateFormatSlashDDMMYYYY(date: dateOfferStart);

  String? get dateOfferEndFormat => dateFormatSlashDDMMYYYY(date: dateOfferEnd);

  String? get dateJobStartFormat => dateFormatSlashDDMMYYYY(date: dateJobStart);
  String? get dateJobEndFormat => dateFormatSlashDDMMYYYY(date: dateJobEnd);

  factory JobOfferModel.fromRawJson(String str) =>
      JobOfferModel.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory JobOfferModel.fromJson(Map<String, dynamic> json) => JobOfferModel(
        id: json['id'] as int?,
        title: json['title'] as String?,
        studySubject: json['study_subject'] as String?,
        description: json['description'] as String?,
        isDraft: json['is_draft'] as bool?,
        dateOfferStart:
            json['date_offer_start'] != null && json['date_offer_start'] != ''
                ? DateTime.parse(
                    json['date_offer_start'].toString(),
                  )
                : null,
        dateOfferEnd:
            json['date_offer_end'] != null && json['date_offer_end'] != ''
                ? DateTime.parse(
                    json['date_offer_end'].toString(),
                  )
                : null,
        dateJobStart:
            json['date_job_start'] != null && json['date_job_start'] != ''
                ? DateTime.parse(
                    json['date_job_start'].toString(),
                  )
                : null,
        dateJobEnd: json['date_job_end'] != null && json['date_job_end'] != ''
            ? DateTime.parse(
                json['date_job_end'].toString(),
              )
            : null,
        telecommuting: json['telecommuting'] as int?,
        shifting: json['shifting'] as int?,
        numberOfWorkingHourPerWeek:
            json['number_of_working_hour_per_week'] as int?,
        addressStreet: json['address_street'] as String?,
        addressCity: json['address_city'] as String?,
        addressZip: json['address_zip'] as String?,
        addressCountry: json['address_country'] as String?,
        // addressLatitude: json['address_latitude'] as String?,
        // addressLongitude: json['address_longitude'] as String?,
        types: json['types'] == null || json['types'] == []
            ? []
            : (json['types'] as List)
                .map(
                  (i) => FieldModel.fromJson(
                    i as Map<String, dynamic>,
                  ),
                )
                .toList(),
        fields: json['fields'] == null || json['fields'] == []
            ? []
            : (json['fields'] as List)
                .map(
                  (i) => FieldModel.fromJson(
                    i as Map<String, dynamic>,
                  ),
                )
                .toList(),
        spokenLanguages:
            json['spoken_languages'] == null || json['spoken_languages'] == []
                ? []
                : (json['spoken_languages'] as List)
                    .map(
                      (i) => FieldModel.fromJson(
                        i as Map<String, dynamic>,
                      ),
                    )
                    .toList(),
        skills: json['skills'] == null || json['skills'] == []
            ? []
            : (json['skills'] as List)
                .map(
                  (i) => SkillModel.fromJson(
                    i as Map<String, dynamic>,
                  ),
                )
                .toList(),
        enterprise: json['enterprise'] == null
            ? null
            : ProfileModel.fromJson(
                json['enterprise'] as Map<String, dynamic>,
              ),
        jobOfferStateModel: json['job_offer_state'] == null
            ? null
            : JobOfferStateModel.fromJson(
                json['job_offer_state'] as Map<String, dynamic>,
              ),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'study_subject': studySubject,
        'description': description,
        'is_draft': isDraft,
        'date_offer_start': dateOfferStart?.toIso8601String(),
        'date_offer_end': dateOfferEnd?.toIso8601String(),
        'date_job_start': dateJobStart?.toIso8601String(),
        'date_job_end': dateJobEnd?.toIso8601String(),
        'telecommuting': telecommuting,
        'shifting': shifting,
        'number_of_working_hour_per_week': numberOfWorkingHourPerWeek,
        'address_street': addressStreet,
        'address_city': addressCity,
        'address_zip': addressZip,
        'address_country': addressCountry,
        'address_latitude': addressLatitude,
        'address_longitude': addressLongitude,
        'types': types != null || types != []
            ? List<dynamic>.from(types!.map((x) => x.toJson()))
            : null,
        'fields': fields != null || fields != []
            ? List<dynamic>.from(fields!.map((x) => x.toJson()))
            : null,
        'skills': skills != null || skills != []
            ? List<dynamic>.from(skills!.map((x) => x.toJson()))
            : null,
        'spoken_languages': spokenLanguages != null || spokenLanguages != []
            ? List<dynamic>.from(spokenLanguages!.map((x) => x.toJson()))
            : null,
        'enterprise': enterprise?.toJson(),
        'job_offer_state': jobOfferStateModel?.toJson(),
      }..removeWhere((_, v) => v == null);

  Map<String, dynamic> toSearchJson() => {
        'keywords': title, //'title': title,
        'telecommuting': telecommuting,
        'address_street': addressStreet,
        'address_city': addressCity,
        'address_zip': addressZip,
        'address_country': addressCountry,
        'address_latitude': addressLatitude,
        'address_longitude': addressLongitude,
        'types': types == null || types == []
            ? []
            : List<dynamic>.from(types!.map((x) => x.id)), //use only type ID
        'fields': fields == null || fields == []
            ? []
            : List<dynamic>.from(fields!.map((x) => x.toJson())),
        'location': location,
        'is_range_search': isRangeSearch,
        'range': range,
      }..removeWhere((_, v) => v == null);

  @override
  String toString() {
    return '''
    JobOfferModel(id: $id,
      title: $title,
      studySubject: $studySubject,
      description: $description,
      isDraft: $isDraft,
      dateOfferStart: $dateOfferStart,
      dateOfferEnd: $dateOfferEnd,
      dateJobStart: $dateJobStart,
      dateJobEnd: $dateJobEnd,
      telecommuting: $telecommuting,
      shifting: $shifting,
      numberOfWorkingHourPerWeek: $numberOfWorkingHourPerWeek,
      addressStreet: $addressStreet,
      addressCity: $addressCity,
      addressZip: $addressZip,
      addressCountry: $addressCountry,
      addressLatitude: $addressLatitude,
      addressLongitude: $addressLongitude,
      types: $types,
      fields: $fields,
      spokenLanguages: $spokenLanguages,
      skills: $skills,
      enterprise: $enterprise,
      jobOfferStateModel: $jobOfferStateModel,
      'location': $location,
      'isRangeSearch': $isRangeSearch,
      'range': $range,
    )''';
  }
}
