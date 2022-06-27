import 'dart:convert';

import '/core/core.dart';

List<FieldModel>? proficiencyList = <FieldModel>[
  FieldModel(id: 0, label: LevelStrings.undefined, level: 0),
  FieldModel(id: 1, label: LevelStrings.beginner, level: 1),
  FieldModel(id: 2, label: LevelStrings.intermediate, level: 2),
  FieldModel(id: 3, label: LevelStrings.professional, level: 3),
  FieldModel(id: 4, label: LevelStrings.motherTongue, level: 4),
];

List<FieldModel>? skillCategoryList = <FieldModel>[
  FieldModel(id: 0, label: SkillCategoryStrings.hardSkill),
  FieldModel(id: 1, label: SkillCategoryStrings.softSkill),
];

List<FieldModel> fieldListFromJson(String str) => List<FieldModel>.from(
      (json.decode(str) as List)
          .map((x) => FieldModel.fromJson(x as Map<String, dynamic>)) as List,
    );

String fieldListToJson(List<FieldModel?>? data) =>
    json.encode(List<dynamic>.from(data!.map((x) => x!.toJson())));

class FieldModel {
  final int? id;
  final int? tagId;
  final String? type;
  final String? label;
  final int? level;
  final int? categoryId;
  final String? category;
  final String? videoUrl;
  int? total;
  bool? selected;
  final List<FieldModel>? subFieldList;

  FieldModel({
    this.id,
    this.tagId,
    this.type,
    this.label,
    this.level,
    this.categoryId,
    this.category,
    this.videoUrl,
    this.total,
    this.selected = false,
    this.subFieldList,
  });

  // FieldModel? get getProficiencyLevel =>
  //     proficiencyList.firstWhere((element) => element.level == level);

  String? get getLabelProficiencyLevel =>
      proficiencyList!.firstWhere((element) => element.level == level).label;

  // String? get displayLevel => level == null ? '' : 'Level $level';
  String? get displayLevel => level == null
      ? ''
      : //"${'profile.level'.tr} $level";
      getLevelString(level: level);

  String? get displayLabelAndLevel => level == null || level == 0
      ? '• $label'
      : "• $label - ${translateStateWords(stateWord: getLabelProficiencyLevel)}";

  factory FieldModel.fromRawJson(String str) => FieldModel.fromJson(
        json.decode(str) as Map<String, dynamic>,
      );

  String toRawJson() => json.encode(toJson());

  factory FieldModel.fromJson(Map<String, dynamic> json) => FieldModel(
        id: json['id'] as int?,
        tagId: json['tag_id'] as int?,
        type: json['type'] as String?,
        label: json['label'] as String?,
        level: json['level'] as int?,
        categoryId: json['category_id'] as int?,
        category: json['category'] as String?,
        videoUrl: json['video_url'] as String?,
        subFieldList: json['skills'] == null || json['skills'] == []
            ? []
            : (json['skills'] as List)
                .map(
                  (i) => FieldModel.fromJson(
                    i as Map<String, dynamic>,
                  ),
                )
                .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'tag_id': tagId,
        'type': type,
        'label': label,
        'level': level,
        'category_id': categoryId,
        'category': category,
        'video_url': videoUrl,
        'skills': subFieldList == null || subFieldList == []
            ? null
            : List<dynamic>.from(subFieldList!.map((x) => x.toJson())),
      }..removeWhere((_, v) => v == null);

  Map<String, dynamic> toJsonForOnboarding({bool? usedTagId = false}) => {
        usedTagId == true ? 'tag_id' : 'id': id,
        // 'id': usedTagId == true ? null : id,
        // 'tag_id': usedTagId == true ? id : null,
      }..removeWhere((_, v) => v == null);

  @override
  String toString() {
    return '''
    FieldModel(
      id: $id,
      tagId: $tagId,
      type: $type,
      label: $label,
      level: $level,
      categoryId: $categoryId,
      category: $category,
      video_url: $videoUrl,
      total: $total,
      subFieldList: $subFieldList
    )''';
  }
}
