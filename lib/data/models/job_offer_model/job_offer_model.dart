import 'dart:convert';

import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../data.dart';

class JobOfferModel {
  final int? id;
  final String? uuid;
  final String? title;
  final String? studySubject;
  final String? description;
  final String? longDescription;
  final String? expDescription;
  final String? additionalInfo;
  final bool? isDraft;
  final DateTime? dateOfferStart;
  final DateTime? dateOfferEnd;
  final DateTime? dateJobStart;
  final DateTime? dateJobEnd;
  final int? telecommuting;
  final int? shifting;
  final int? numberOfWorkingHour;
  final int? workingHourType;
  final int? drivingLicence;
  final String? remunerationMax;
  final String? remunerationMin;
  final String? currencySymbol;
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
  final List<FieldModel>? availabilities;
  final List<FieldModel>? internshipTypes;
  final List<FieldModel>? internshipPeriods;
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
  final String? youtubeLink;
  final int? searchId;
  final String? searchName;

  JobOfferModel({
    this.id,
    this.uuid,
    this.title,
    this.studySubject,
    this.description,
    this.longDescription,
    this.expDescription,
    this.additionalInfo,
    this.isDraft,
    this.dateOfferStart,
    this.dateOfferEnd,
    this.dateJobStart,
    this.dateJobEnd,
    this.telecommuting = 2,
    this.shifting,
    this.numberOfWorkingHour,
    this.workingHourType,
    this.drivingLicence,
    this.remunerationMax,
    this.remunerationMin,
    this.currencySymbol,
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
    this.availabilities,
    this.internshipTypes,
    this.internshipPeriods,
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
    this.youtubeLink,
    this.searchId,
    this.searchName,
  });

  String? get numberOfWorking => numberOfWorkingHour == null
      ? ''
      : "$numberOfWorkingHour ${'hrs'.tr}$getWorkingHourType";

  String? get getWorkingHourType {
    if (workingHourType == 1) {
      return "/${'day'.tr}";
    } else if (workingHourType == 2) {
      return "/${'week'.tr}";
    } else if (workingHourType == 3) {
      return "/${'month'.tr}";
    } else if (workingHourType == 4) {
      return "/${'year'.tr}";
    } else {
      return '';
    }
  }

  String? get remunerationMaxMin => remunerationMax == '' &&
          remunerationMin == ''
      ? ''
      : "${remunerationMin == null ? '' : '$remunerationMin${currencySymbol ?? ''}'} - ${remunerationMax == null ? '' : '$remunerationMax${currencySymbol ?? ''}'}/${'perHour'.tr}";

  String? get companyNameAndLocation =>
      '${enterprise!.name} ($companyLocation)';

  String? get companyLocation =>
      "${enterprise!.addressCity!.isNotEmpty ? '${enterprise!.addressCity}, ' : ''}${enterprise!.addressCountry}";

  String? get companyNameAndJobOfferOffice =>
      "${enterprise!.name} ${jobOfferOffice!.isEmpty ? '' : '($jobOfferOffice)'}";

  String? get jobOfferOffice =>
      "${addressCity!.isNotEmpty ? '$addressCity, ' : ''}$addressCountry";

  String? get jobOfferFullOfficeAddress =>
      "${addressStreet!.isNotEmpty ? '$addressStreet, ' : ''}${addressCity!.isNotEmpty ? '$addressCity, ' : ''}$addressCountry";

  String? get workPlaceType => telecommuting == 1 ? 'remote'.tr : 'onSite'.tr;

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
        uuid: json['uuid'] as String?,
        title: json['title'] as String? ?? '',
        studySubject: json['study_subject'] as String? ?? '',
        description: json['description'] as String? ?? '',
        longDescription: json['long_description'] as String? ?? '',
        expDescription: json['experience_description'] as String? ?? '',
        additionalInfo: json['additional_information'] as String? ?? '',
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
        numberOfWorkingHour: json['number_of_working_hour'] as int?,
        workingHourType: json['time_type'] as int?,
        drivingLicence: json['driving_license_required'] as int?,
        remunerationMax: json['remuneration_max'] as String? ?? '',
        remunerationMin: json['remuneration_min'] as String? ?? '',
        currencySymbol: json['currency_symbol'] as String? ?? '',
        addressStreet: json['address_street'] as String? ?? '',
        addressCity: json['address_city'] as String? ?? '',
        addressZip: json['address_zip'] as String? ?? '',
        addressCountry: json['address_country'] as String? ?? '',
        youtubeLink: json['youtube_link'] as String? ?? '',
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
        availabilities:
            json['availabilities'] == null || json['availabilities'] == []
                ? []
                : (json['availabilities'] as List)
                    .map(
                      (i) => FieldModel.fromJson(
                        i as Map<String, dynamic>,
                      ),
                    )
                    .toList(),
        internshipTypes:
            json['internship_types'] == null || json['internship_types'] == []
                ? []
                : (json['internship_types'] as List)
                    .map(
                      (i) => FieldModel.fromJson(
                        i as Map<String, dynamic>,
                      ),
                    )
                    .toList(),
        internshipPeriods: json['internship_periods'] == null ||
                json['internship_periods'] == []
            ? []
            : (json['internship_periods'] as List)
                .map(
                  (i) => FieldModel.fromJson(
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
        'uuid': uuid,
        'title': title,
        'study_subject': studySubject,
        'description': description,
        'additional_information': additionalInfo,
        'is_draft': isDraft,
        'date_offer_start': dateOfferStart?.toIso8601String(),
        'date_offer_end': dateOfferEnd?.toIso8601String(),
        'date_job_start': dateJobStart?.toIso8601String(),
        'date_job_end': dateJobEnd?.toIso8601String(),
        'telecommuting': telecommuting,
        'shifting': shifting,
        'number_of_working_hour': numberOfWorkingHour,
        'time_type': workingHourType,
        'driving_license_required': drivingLicence,
        'address_street': addressStreet,
        'address_city': addressCity,
        'address_zip': addressZip,
        'address_country': addressCountry,
        'address_latitude': addressLatitude,
        'address_longitude': addressLongitude,
        'youtube_link': youtubeLink,
        'types': types == null || types == []
            ? []
            : List<dynamic>.from(
                // types!.map((x) => x.id),
                types!
                    .skipWhile(
                      (x) => x.id == null,
                    )
                    .map(
                      (e) => e.id,
                    ),
              ), //use only type ID
        'fields': fields == null || fields == []
            ? []
            : List<dynamic>.from(
                fields!
                    .skipWhile(
                      (x) => x.id == null,
                    )
                    .map(
                      (e) => e.id,
                    ),
              ),
        'languages': spokenLanguages == null || spokenLanguages == []
            ? []
            : List<dynamic>.from(
                spokenLanguages!
                    .skipWhile(
                      (x) => x.id == null,
                    )
                    .map(
                      (e) => e.id,
                    ),
              ),
        'availabilities': availabilities == null || availabilities == []
            ? []
            : List<dynamic>.from(
                availabilities!
                    .skipWhile(
                      (x) => x.id == null,
                    )
                    .map(
                      (e) => e.id,
                    ),
              ),
        'internship_types': internshipTypes == null || internshipTypes == []
            ? []
            : List<dynamic>.from(
                internshipTypes!
                    .skipWhile(
                      (x) => x.id == null,
                    )
                    .map(
                      (e) => e.id,
                    ),
              ),
        'internship_periods':
            internshipPeriods == null || internshipPeriods == []
                ? []
                : List<dynamic>.from(
                    internshipPeriods!
                        .skipWhile(
                          (x) => x.id == null,
                        )
                        .map(
                          (e) => e.id,
                        ),
                  ),
        // 'skills': skills != null || skills != []
        //     ? List<dynamic>.from(skills!.map((x) => x.toJson()))
        //     : null,
        // 'spoken_languages': spokenLanguages != null || spokenLanguages != []
        //     ? List<dynamic>.from(spokenLanguages!.map((x) => x.toJson()))
        //     : null,
        'enterprise': enterprise?.toJson(),
        'job_offer_state': jobOfferStateModel?.toJson(),
        'search_id': searchId,
        'search_name': searchName,
        'keywords': title, //'title': title,
        'street': addressStreet ?? '',
        'city': addressCity ?? '',
        'zipcode': addressZip ?? '',
        'country': addressCountry ?? '',
        'latitude': addressLatitude ?? '',
        'longitude': addressLongitude ?? '',
        'range': range! * 1000,
      }..removeWhere((_, v) => v == null);

  Map<String, dynamic> toSearchJson() => {
        'keywords': title, //'title': title,
        'telecommuting': telecommuting,
        'street': addressStreet ?? '',
        'city': addressCity ?? '',
        'zipcode': addressZip ?? '',
        'country': addressCountry ?? '',
        'latitude': addressLatitude ?? '',
        'longitude': addressLongitude ?? '',
        'types': types == null || types == []
            ? []
            : List<dynamic>.from(
                // types!.map((x) => x.id),
                types!
                    .skipWhile(
                      (x) => x.id == null,
                    )
                    .map(
                      (e) => e.id,
                    ),
              ), //use only type ID
        'fields': fields == null || fields == []
            ? []
            : List<dynamic>.from(
                fields!
                    .skipWhile(
                      (x) => x.id == null,
                    )
                    .map(
                      (e) => e.id,
                    ),
              ),
        'languages': spokenLanguages == null || spokenLanguages == []
            ? []
            : List<dynamic>.from(
                spokenLanguages!
                    .skipWhile(
                      (x) => x.id == null,
                    )
                    .map(
                      (e) => e.id,
                    ),
              ),
        'availabilities': availabilities == null || availabilities == []
            ? []
            : List<dynamic>.from(
                availabilities!
                    .skipWhile(
                      (x) => x.id == null,
                    )
                    .map(
                      (e) => e.id,
                    ),
              ),
        'internship_types': internshipTypes == null || internshipTypes == []
            ? []
            : List<dynamic>.from(
                internshipTypes!
                    .skipWhile(
                      (x) => x.id == null,
                    )
                    .map(
                      (e) => e.id,
                    ),
              ),
        'internship_periods':
            internshipPeriods == null || internshipPeriods == []
                ? []
                : List<dynamic>.from(
                    internshipPeriods!
                        .skipWhile(
                          (x) => x.id == null,
                        )
                        .map(
                          (e) => e.id,
                        ),
                  ),
        'date_job_start': dateJobStart?.toIso8601String() ?? '',
        'date_job_end': dateJobEnd?.toIso8601String() ?? '',
        'location': location ?? '',
        'is_range_search': isRangeSearch,
        'range': range! * 1000,
        'search_id': searchId,
        'search_name': searchName,
      }..removeWhere((_, v) => v == null);

  @override
  String toString() {
    return '''
    JobOfferModel(
      id: $id,
      uuid: $uuid,
      title: $title,
      studySubject: $studySubject,
      description: $description,
      additionalInfo: $additionalInfo,
      isDraft: $isDraft,
      dateOfferStart: $dateOfferStart,
      dateOfferEnd: $dateOfferEnd,
      dateJobStart: $dateJobStart,
      dateJobEnd: $dateJobEnd,
      telecommuting: $telecommuting,
      shifting: $shifting,
      numberOfWorkingHour: $numberOfWorkingHour,
      workingHourType: $workingHourType,
      drivingLicence: $drivingLicence,
      remunerationMax: $remunerationMax,
      remunerationMin: $remunerationMin,
      currencySymbol: $currencySymbol,
      addressStreet: $addressStreet,
      addressCity: $addressCity,
      addressZip: $addressZip,
      addressCountry: $addressCountry,
      addressLatitude: $addressLatitude,
      addressLongitude: $addressLongitude,
      youtubeLink: $youtubeLink,
      types: $types,
      fields: $fields,
      spokenLanguages: $spokenLanguages,
      skills: $skills,
      availabilities: $availabilities,
      internshipTypes: $internshipTypes,
      internshipPeriods: $internshipPeriods,
      enterprise: $enterprise,
      jobOfferStateModel: $jobOfferStateModel,
      'location': $location,
      'isRangeSearch': $isRangeSearch,
      'range': $range,
      'searchId':$searchId,
      'searchName': $searchName,
    )''';
  }
}
