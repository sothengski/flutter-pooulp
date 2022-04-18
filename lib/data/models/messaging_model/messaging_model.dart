import 'dart:convert';

import '../../data.dart';

class MessagingModel {
  MessagingModel({
    this.uuid,
    this.userUuid,
    this.message,
    this.isSeen,
    this.isOwner,
    this.name,
    this.firstName,
    this.lastName,
    this.pictureUrl,
    this.latestMessage,
    this.unseenMessages,
    this.participants,
    this.createdAt,
    this.updatedAt,
  });

  final String? uuid;
  final String? userUuid;
  final String? message;
  final int? isSeen;
  final int? isOwner;
  final String? name;
  final String? firstName;
  final String? lastName;
  final String? pictureUrl;

  final LatestMessageModel? latestMessage;
  final int? unseenMessages;
  final List<ParticipantModel>? participants;

  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory MessagingModel.fromRawJson(String str) =>
      MessagingModel.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory MessagingModel.fromJson(Map<String, dynamic> json) => MessagingModel(
        uuid: json["uuid"] as String?,
        userUuid: json["user_uuid"] as String?,
        message: json["message"] as String?,
        isSeen: json["is_seen"] as int?,
        isOwner: json["is_owner"] as int?,
        name: json["name"] as String?,
        firstName: json["first_name"] as String?,
        lastName: json["last_name"] as String?,
        pictureUrl: json["picture_url"] as String?,
        latestMessage: json['latest_message'] != null
            ? LatestMessageModel.fromJson(
                json['latest_message'] as Map<String, dynamic>,
              )
            : null,
        unseenMessages: json["unseen_messages"] as int?,
        participants: json['participants'] != null || json['participants'] != []
            ? (json['participants'] as List)
                .map(
                  (i) => ParticipantModel.fromJson(
                    i as Map<String, dynamic>,
                  ),
                )
                .toList()
            : [],
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
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
        "picture_url": pictureUrl,
        "latest_message": latestMessage!.toJson(),
        "unseen_messages": unseenMessages,
        "participants":
            List<dynamic>.from(participants!.map((x) => x.toJson())),
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };

  @override
  String toString() => '''
    MessagingModel(
      uuid: $uuid, userUuid: $userUuid,
      message: $message,
      isSeen: $isSeen,
      isOwner: $isOwner,
      name: $name,
      firstName: $firstName,
      lastName: $lastName,
      pictureUrl: $pictureUrl,
      latestMessage: $latestMessage,
      unseenMessages: $unseenMessages,
      participants: $participants,
      createdAt: $createdAt,
      updatedAt: $updatedAt,
    )''';
}
