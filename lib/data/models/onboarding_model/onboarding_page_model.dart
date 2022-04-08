import 'dart:convert';

import '../models.dart';

class OnboardingPageModel {
  final int? pageIndex;
  final String? title;
  final String? subtitle;
  final String? imgUrl;
  final bool? isSkippable;
  final List<FieldModel>? selectionItems;
  final List<FieldModel>? allSkills;

  OnboardingPageModel({
    this.pageIndex,
    this.title,
    this.subtitle,
    this.imgUrl,
    this.isSkippable,
    this.selectionItems,
    this.allSkills,
  });

  factory OnboardingPageModel.fromRawJson(String str) =>
      OnboardingPageModel.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory OnboardingPageModel.fromJson(Map<String, dynamic> json) =>
      OnboardingPageModel(
        pageIndex: json["page"] as int?,
        title: json["title"] as String?,
        subtitle: json["subtitle"] as String?,
        isSkippable: json["is_skippable"] as bool?,
        selectionItems:
            json['selection_items'] == null || json['selection_items'] == []
                ? []
                : (json['selection_items'] as List)
                    .map(
                      (i) => FieldModel.fromJson(
                        i as Map<String, dynamic>,
                      ),
                    )
                    .toList(),
        allSkills: json['all_skills'] == null || json['all_skills'] == []
            ? []
            : (json['all_skills'] as List)
                .map(
                  (i) => FieldModel.fromJson(
                    i as Map<String, dynamic>,
                  ),
                )
                .toList(),
      );

  Map<String, dynamic> toJson() => {
        "page": pageIndex,
        "title": title,
        "subtitle": subtitle,
        "is_skippable": isSkippable,
        "selection_items":
            List<dynamic>.from(selectionItems!.map((x) => x.toJson())),
        "all_skills": List<dynamic>.from(allSkills!.map((x) => x.toJson())),
      }..removeWhere((_, v) => v == null);

  @override
  String toString() => '''
    OnboardingPageModel(
      pageIndex: $pageIndex, 
      title: $title, 
      subtitle: $subtitle, 
      isSkippable: $isSkippable, 
      selectionItems: $selectionItems, 
      allSkills: $allSkills,
    )''';
}
