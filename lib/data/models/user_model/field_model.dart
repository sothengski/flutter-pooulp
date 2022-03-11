import 'dart:convert';

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
  });

  String? get displayLevel => level == null ? '' : 'Level $level';

  String? get displayLabelAndLevel =>
      level == null ? '• $label' : '• $label - Level $level';

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
      }..removeWhere((_, v) => v == null);

  @override
  String toString() {
    return '''
    FieldModel(id: $id,
      tagId: $tagId,
      type: $type,
      label: $label,
      'level': $level,
      categoryId: $categoryId,
      category: $category,
      video_url: $videoUrl,
      total: $total,
    )''';
  }
}
