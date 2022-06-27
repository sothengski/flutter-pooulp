import 'dart:convert';

class LatestMessageModel {
  LatestMessageModel({
    this.uuid,
    this.userUuid,
    this.message,
    this.isSeen,
    this.isOwner,
    this.firstName,
    this.lastName,
    this.pictureUrl,
    this.createdAt,
    this.updatedAt,
  });

  final String? uuid;
  final String? userUuid;
  final String? message;
  final int? isSeen;
  final int? isOwner;
  final String? firstName;
  final String? lastName;
  final String? pictureUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory LatestMessageModel.fromRawJson(String str) =>
      LatestMessageModel.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory LatestMessageModel.fromJson(Map<String, dynamic> json) =>
      LatestMessageModel(
        uuid: json["uuid"] as String?,
        userUuid: json["user_uuid"] as String?,
        message: json["message"] as String?,
        isSeen: json["is_seen"] as int?,
        isOwner: json["is_owner"] as int?,
        firstName: json["first_name"] as String?,
        lastName: json["last_name"] as String?,
        pictureUrl: json["picture_url"] as String?,
        createdAt: json['created_at'] != null && json['created_at'] != ''
            ? DateTime.parse(
                json['created_at'].toString(),
              )
            : null,
        updatedAt: json['updated_at'] != null && json['updated_at'] != ''
            ? DateTime.parse(
                json['updated_at'].toString(),
              )
            : null,
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "user_uuid": userUuid,
        "message": message,
        "is_seen": isSeen,
        "is_owner": isOwner,
        "first_name": firstName,
        "last_name": lastName,
        "picture_url": pictureUrl,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };

  @override
  String toString() => '''
    LatestMessageModel(uuid: $uuid,
      userUuid: $userUuid,
      message: $message,
      isSeen: $isSeen,
      isOwner: $isOwner,
      firstName: $firstName,
      lastName: $lastName,
      pictureUrl: $pictureUrl,
      createdAt: $createdAt,
      updatedAt: $updatedAt,
    )''';
}
