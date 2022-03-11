import 'dart:convert';

enum Type { softSkill, hardSkill }

EnumValues<Type> typeValues = EnumValues({
  'hard skill': Type.hardSkill,
  'soft skill': Type.softSkill,
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(
    this.map,
  );

  Map<T, String> get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}

class SkillModel {
  final int? id;
  final int? tagId;
  final String? label;
  final int? categoryId;
  final String? category;
  final Type? type;
  final int? level;

  SkillModel({
    this.id,
    this.tagId,
    this.label,
    this.categoryId,
    this.category,
    this.type,
    this.level,
  });

  String? get displayLevel => level == null ? '' : 'Level $level';

  String? get displayLabelAndLevel =>
      level == null ? '• $label' : '• $label - Level $level';

  String? get displayLabelAndCategory =>
      category == null ? '• $label' : '• $label - $category';

  factory SkillModel.fromRawJson(String str) => SkillModel.fromJson(
        json.decode(str) as Map<String, dynamic>,
      );

  String toRawJson() => json.encode(toJson());

  factory SkillModel.fromJson(Map<String, dynamic> json) => SkillModel(
        id: json['id'] as int?,
        tagId: json['tag_id'] as int?,
        label: json['label'] as String?,
        categoryId: json['category_id'] as int?,
        category: json['category'] as String?,
        type: typeValues.map![json['type']],
        level: json['level'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'tag_id': tagId,
        'label': label,
        'category_id': categoryId,
        'category': category,
        'type': typeValues.reverse[type],
        'level': level,
      }..removeWhere((_, v) => v == null);

  @override
  String toString() {
    return '''
    SkillModel(
      id: $id,
      tagId: $tagId,
      label: $label,
      categoryId: $categoryId,
      category: $category,
      type: $type,
      level: $level,
    )''';
  }
}

//enum Type { SOFT_SKILL, HARD_SKILL }

// final typeValues = EnumValues({
//     "hard skill": Type.HARD_SKILL,
//     "soft skill": Type.SOFT_SKILL
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         if (reverseMap == null) {
//             reverseMap = map.map((k, v) => new MapEntry(v, k));
//         }
//         return reverseMap;
//     }
// }
