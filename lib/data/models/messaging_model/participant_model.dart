import 'dart:convert';

class ParticipantModel {
  ParticipantModel({
    this.userUuid,
    this.firstName,
    this.lastName,
    this.accountType,
    this.pictureUrl,
  });

  final String? userUuid;
  final String? firstName;
  final String? lastName;
  final String? accountType;
  final String? pictureUrl;

  String? get fullName => '$firstName $lastName';

  factory ParticipantModel.fromRawJson(String str) =>
      ParticipantModel.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory ParticipantModel.fromJson(Map<String, dynamic> json) =>
      ParticipantModel(
        userUuid: json["user_uuid"] as String?,
        firstName: json["first_name"] as String?,
        lastName: json["last_name"] as String?,
        accountType: json["account_type"] as String?,
        pictureUrl: json["picture_url"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "user_uuid": userUuid,
        "first_name": firstName,
        "last_name": lastName,
        "account_type": accountType,
        "picture_url": pictureUrl,
      };

  @override
  String toString() => '''
    ParticipantModel(
      userUuid: $userUuid,
      firstName: $firstName,
      lastName: $lastName,
      accountType: $accountType,
      pictureUrl: $pictureUrl,
    )''';
}
