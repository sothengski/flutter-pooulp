import 'dart:convert';

import '../../data.dart';

OnboardingModel onboardingModelFromJson(String str) =>
    OnboardingModel.fromJson(json.decode(str) as Map<String, dynamic>);

String onboardingModelToJson(OnboardingModel data) =>
    json.encode(data.toJson());

class OnboardingModel {
  final int? totalPage;
  final List<OnboardingPageModel>? pages;

  /// Fields for POST Method API
  final List<FieldModel>? offerTypePreferences;
  final List<FieldModel>? internshipTypePreferences;
  final List<FieldModel>? internshipPeriodPreferences;
  final List<FieldModel>? fieldPreferences;
  final List<FieldModel>? skills;
  final List<FieldModel>? languages;
  final List<EducationModel>? educations;
  final FieldModel? source;
  final String? location;
  final String? locationStreet;
  final String? locationZipCode;
  final String? locationCity;
  final String? locationCountry;
  final String? locationLat;
  final String? locationLng;
  final int? locationRadius;
  final List<SearchPreferencesModel>? searches;

  const OnboardingModel({
    this.totalPage,
    this.pages,
    this.offerTypePreferences,
    this.internshipTypePreferences,
    this.internshipPeriodPreferences,
    this.fieldPreferences,
    this.skills,
    this.languages,
    this.educations,
    this.source,
    this.location,
    this.locationStreet,
    this.locationZipCode,
    this.locationCity,
    this.locationCountry,
    this.locationLat,
    this.locationLng,
    this.locationRadius,
    this.searches,
  });

  factory OnboardingModel.fromRawJson(String str) =>
      OnboardingModel.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory OnboardingModel.fromJson(Map<String, dynamic> json) =>
      OnboardingModel(
        totalPage: json["total_page"] as int?,
        pages: json['pages'] == null || json['pages'] == []
            ? []
            : (json['pages'] as List)
                .map(
                  (i) => OnboardingPageModel.fromJson(
                    i as Map<String, dynamic>,
                  ),
                )
                .toList(),
      );

  // Map<String, dynamic> toJsonV1() => {
  //       // "total_page": totalPage,
  //       // "pages": List<dynamic>.from(pages!.map((x) => x.toJson())),
  //       'offer_type_preferences': List<dynamic>.from(
  //         offerTypePreferences!.map((x) => x.toJsonForOnboarding()),
  //       ),
  //       'field_preferences': List<dynamic>.from(
  //         fieldPreferences!.map((x) => x.toJsonForOnboarding()),
  //       ),
  //       'skills':
  //           List<dynamic>.from(skills!.map((x) => x.toJsonForOnboarding())),
  //       'languages': List<dynamic>.from(
  //         languages!.map((x) => x.toJsonForOnboarding(usedTagId: true)),
  //       ),
  //       'location_preference': location,
  //       'location_street': locationStreet,
  //       'location_zip': locationZipCode,
  //       'location_city': locationCity,
  //       'location_country': locationCountry,
  //       'location_latitude': locationLat,
  //       'location_longitude': locationLng,
  //       'radius': locationRadius! * 1000,
  //       'source': source?.toJsonForOnboarding(),
  //       // List<dynamic>.from(source!.map((x) => x.toJsonForOnboarding())),
  //     }..removeWhere((_, v) => v == null);
  Map<String, dynamic> toJson() => {
        'source': source?.toJsonForOnboarding(),
        'skills': skills != null && skills != []
            ? List<dynamic>.from(
                skills!.map((x) => x.id),
              )
            : [],
        'educations': educations != null && educations != []
            ? List<dynamic>.from(
                educations!.map((x) => x.toJsonForOnboarding()),
              )
            : [],
        'searches': searches != null && searches != []
            ? List<dynamic>.from(searches!.map((x) => x.toJson()))
            : [],
        'languages': languages != null && languages != []
            ? List<dynamic>.from(
                languages!.map((x) => x.toJson()),
              )
            : [],
        // 'types': offerTypePreferences != null && offerTypePreferences != []
        //     ? List<dynamic>.from(offerTypePreferences!.map((x) => x.id))
        //     : [],
        // 'internship_types':
        //     internshipTypePreferences != null && internshipTypePreferences != []
        //         ? List<dynamic>.from(
        //             internshipTypePreferences!.map((x) => x.id),
        //           )
        //         : [],
        // 'internship_periods': internshipPeriodPreferences != null &&
        //         internshipPeriodPreferences != []
        //     ? List<dynamic>.from(
        //         internshipPeriodPreferences!.map((x) => x.id),
        //       )
        //     : [],
        // 'fields': fieldPreferences != null && fieldPreferences != []
        //     ? List<dynamic>.from(
        //         fieldPreferences!.map((x) => x.id),
        //       )
        //     : [],

        // 'languages': languages != null && languages != []
        //     ? List<dynamic>.from(
        //         languages!.map((x) => x.id),
        //       )
        //     : [],
        // 'location_preference': location,
        // 'location_street': locationStreet,
        // 'location_zip': locationZipCode,
        // 'location_city': locationCity,
        // 'location_country': locationCountry,
        // 'location_latitude': locationLat,
        // 'location_longitude': locationLng,
        // 'radius': locationRadius! * 1000,
        // List<dynamic>.from(source!.map((x) => x.toJsonForOnboarding())),
      }..removeWhere((_, v) => v == null);

  Map<String, dynamic> v1toJson() => {
        'types': offerTypePreferences != null && offerTypePreferences != []
            ? List<dynamic>.from(offerTypePreferences!.map((x) => x.id))
            : [],
        'internship_types':
            internshipTypePreferences != null && internshipTypePreferences != []
                ? List<dynamic>.from(
                    internshipTypePreferences!.map((x) => x.id),
                  )
                : [],
        'internship_periods': internshipPeriodPreferences != null &&
                internshipPeriodPreferences != []
            ? List<dynamic>.from(
                internshipPeriodPreferences!.map((x) => x.id),
              )
            : [],
        'fields': fieldPreferences != null && fieldPreferences != []
            ? List<dynamic>.from(
                fieldPreferences!.map((x) => x.id),
              )
            : [],
        'skills': skills != null && skills != []
            ? List<dynamic>.from(
                skills!.map((x) => x.id),
              )
            : [],
        'languages': languages != null && languages != []
            ? List<dynamic>.from(
                languages!.map((x) => x.id),
              )
            : [],
        'location_preference': location,
        'location_street': locationStreet,
        'location_zip': locationZipCode,
        'location_city': locationCity,
        'location_country': locationCountry,
        'location_latitude': locationLat,
        'location_longitude': locationLng,
        'radius': locationRadius! * 1000,
        'source': source?.toJsonForOnboarding(),
        // List<dynamic>.from(source!.map((x) => x.toJsonForOnboarding())),
      }..removeWhere((_, v) => v == null);

  @override
  String toString() => '''
    OnboardingModel(
      totalPage: $totalPage,
      pages: $pages,
      types: $offerTypePreferences,
      internshipTypes: $internshipTypePreferences,
      internshipPeriods: $internshipPeriodPreferences,
      fields: $fieldPreferences,
      skills: $skills,
      languages: $languages,
      location: $location,
      locationStreet: $locationStreet,
      locationZipCode': $locationZipCode,
      locationCity: $locationCity,
      locationCountry: $locationCountry,
      locationLat: $locationLat,
      locationLng: $locationLng,
      locationRadius: $locationRadius,
      source: $source,
    )''';
}
