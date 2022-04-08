import 'dart:convert';

import '../../data.dart';

// OnboardingModel onboardingModelFromJson(String str) =>
//     OnboardingModel.fromJson(json.decode(str) as Map<String, dynamic>);

// String onboardingModelToJson(OnboardingModel data) =>
//     json.encode(data.toJson());

class OnboardingModel {
  final int? totalPage;
  final List<OnboardingPageModel>? pages;

  /// Fields for POST Method API
  final List<FieldModel>? offerTypePreferences;
  final List<FieldModel>? fieldPreferences;
  final List<FieldModel>? skills;
  final List<FieldModel>? languages;

  OnboardingModel({
    this.totalPage,
    this.pages,
    this.offerTypePreferences,
    this.fieldPreferences,
    this.skills,
    this.languages,
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

  Map<String, dynamic> toJson() => {
        // "total_page": totalPage,
        // "pages": List<dynamic>.from(pages!.map((x) => x.toJson())),
        'offer_type_preferences': List<dynamic>.from(
          offerTypePreferences!.map((x) => x.toJsonForOnboarding()),
        ),
        'field_preferences': List<dynamic>.from(
          fieldPreferences!.map((x) => x.toJsonForOnboarding()),
        ),
        'skills':
            List<dynamic>.from(skills!.map((x) => x.toJsonForOnboarding())),
        'languages': List<dynamic>.from(
          languages!.map((x) => x.toJsonForOnboarding(usedTagId: true)),
        ),
      }..removeWhere((_, v) => v == null);

  @override
  String toString() => '''
    OnboardingModel(
      totalPage: $totalPage,
      pages: $pages,
      offerTypePreferences: $offerTypePreferences,
      fieldPreferences: $fieldPreferences,
      skills: $skills,
      languages: $languages,
    )''';
}
