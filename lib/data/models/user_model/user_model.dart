import 'dart:convert';

import '../../data.dart';

class UserModel {
  final int? id;
  final String? uuid;
  final String? email;
  final bool? isActivated;
  final ProfileModel? profile;
  final ProfileModel? enterprise;

  final String? role; //offer in feed endpoint
  final UserModel? user; //offer in feed endpoint

  UserModel({
    this.id,
    this.uuid,
    this.email,
    this.isActivated,
    this.profile,
    this.enterprise,
    this.role,
    this.user,
  });
  String get managerPhoneContact =>
      '${user!.profile!.phone1CountryCode} ${user!.profile!.phone1}';

  String get managerEmailContact => '${user!.email}';

  factory UserModel.fromRawJson(String str) => UserModel.fromJson(
        json.decode(str) as Map<String, dynamic>,
      );

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] as int?,
        uuid: json['uuid'] as String?,
        email: json['email'] as String?,
        isActivated: json['is_activated'] as bool?,
        profile: json['profile'] == null
            ? null
            : ProfileModel.fromJson(
                json['profile'] as Map<String, dynamic>,
              ),
        enterprise: json['enterprise'] == null
            ? null
            : ProfileModel.fromJson(
                json['enterprise'] as Map<String, dynamic>,
              ),
        role: json['role'] as String?,
        user: json['user'] == null
            ? null
            : UserModel.fromJson(
                json['user'] as Map<String, dynamic>,
              ),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'uuid': uuid,
        'email': email,
        'is_activated': isActivated,
        'profile': profile?.toJson(),
        'enterprise': enterprise?.toJson(),
        'role': role,
        'user': user?.toJson(),
      }..removeWhere((_, v) => v == null);

  @override
  String toString() {
    return '''
    UserModel(
      id: $id,
      uuid: $uuid,
      email: $email,
      isActivated: $isActivated,
      profile: $profile,
      enterprise: $enterprise,
      role: $role,
      user: $user,
    )''';
  }
}

///==================== User API Schema ====================
/*
/// End point: {{base_url}}/users/me
{
    "id": 2,
    "uuid": "",
    "email": "barbara.appleseed@example.com",
    "is_activated": true,
    "profile": {
        "account_type": "professional",
        "first_name": "Barbara",
        "last_name": "Appleseed",
        "description": null,
        "phone1_country_code": "+33",
        "phone1": "07 87 98 07 79",
        "phone2_country_code": null,
        "phone2": null,
        "birthdate": null,
        "address_street": null,
        "address_city": null,
        "address_zip": null,
        "address_country": null,
        "address_latitude": null,
        "address_longitude": null,
        "picture_url": null,
        "ui_language": "en",
        "settings_notifications_email": true
    },
    "enterprise": {
        "id": 1,
        "name": "Orange France",
        "enterprise_id": "380 129 866 46850",
        "description": null,
        "address_street": "6 place d'Alleray",
        "address_city": "Paris",
        "address_zip": "75015",
        "address_country": "France",
        "address_latitude": null,
        "address_longitude": null,
        "subsidiary_of": null,
        "school_id": null,
        "logo_urn": "c89865c0-2de2-419d-bbe0-e99e20b64dc1",
        "created_at": "2021-10-14T13:35:38.000000Z",
        "updated_at": "2022-01-04T03:24:38.000000Z",
        "facebook_link": null,
        "linkedin_link": null,
        "whatsapp_link": null,
        "statecode": 1,
        "uuid": ""
    }
}
*/
