import 'dart:convert';

import '../../../core/core.dart';
import '../../data.dart';

class ProfileModel {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? description;
  final String? phone1CountryCode;
  final String? phone1;
  final String? phone2CountryCode;
  final String? phone2;
  final String? password;
  final String? passwordConfirmation;
  final String? uiLanguage;
  final String? accountType; //professional or //student
  final String? invitationToken;
  final String? enterpriseName;
  final String? enterpriseID;
  final String? jobTitle;
  final DateTime? birthDate;
  final String? pictureUrl;
  final bool? emailNotification;

  final String? addressStreet;
  final String? addressCity;
  final String? addressZip;
  final String? addressCountry;
  final String? addressLatitude;
  final String? addressLongitude;

  final int? id; //enterprise
  final String? name; //enterprise
  final String? subsidiaryOf; //enterprise
  final String? schoolID; //enterprise
  final String? logoUrn; //enterprise
  final DateTime? createdAt; //enterprise
  final DateTime? updatedAt; //enterprise
  final DateTime? establishedIn; //enterprise
  final String? legalStatusLabel; //enterprise
  final String? facebookLink; //enterprise
  final String? instagramLink; //enterprise
  final String? linkedinLink; //enterprise
  final String? whatsAppLink; //enterprise
  final String? youtubeLink; //enterprise
  final int? statusCode; //enterprise
  final String? uuid; //enterprise
  final FieldModel? enterpriseType; //enterprise
  // final Shool school; //offer in feed endpoint
  final List<FieldModel>? spokenLanguages; //offer in feed endpoint
  final List<FieldModel>? fields;
  final String? logoUrl; //offer in feed endpoint
  final List<UserModel>? managers; //offer in feed endpoint
  // final List<int>? spokenLanguagesList;
  // final List<String>? fields;

  final int? source;
//source: 1 | 2 | 3 | 4
// 1 = Web App
// 2 = Mobile App - iOS
// 3 = Mobile App - Android
// 4 = Website

  const ProfileModel({
    this.firstName,
    this.lastName,
    this.email,
    this.phone1CountryCode,
    this.phone1,
    this.password,
    this.passwordConfirmation,
    this.uiLanguage,
    this.accountType,
    this.invitationToken,
    this.enterpriseName,
    this.enterpriseID,
    this.jobTitle,
    this.description,
    this.phone2CountryCode,
    this.phone2,
    this.birthDate,
    this.pictureUrl,
    this.emailNotification,
    this.addressStreet,
    this.addressCity,
    this.addressZip,
    this.addressCountry,
    this.addressLatitude,
    this.addressLongitude,
    this.id,
    this.name,
    this.subsidiaryOf,
    this.schoolID,
    this.logoUrn,
    this.createdAt,
    this.updatedAt,
    this.establishedIn,
    this.legalStatusLabel,
    this.facebookLink,
    this.instagramLink,
    this.linkedinLink,
    this.whatsAppLink,
    this.youtubeLink,
    this.statusCode,
    this.uuid,
    this.enterpriseType,
    // this.school,
    this.spokenLanguages,
    this.fields,
    this.logoUrl,
    this.managers,
    this.source,
  });

  String get fullName => '$firstName $lastName';

  String get fullPhone1Format =>
      phone1CountryCode == null || phone1CountryCode == ''
          ? ''
          : '($phone1CountryCode) $phone1';

  String get fullPhone2Format =>
      phone2CountryCode == null || phone2CountryCode == ''
          ? ''
          : '($phone2CountryCode) $phone2';

  String? get birthDateFormat => dateFormatSlashDDMMYYYY(date: birthDate);

  String? get companyAddress =>
      addressStreet!.isNotEmpty ? '$addressStreet, ' : '';

  factory ProfileModel.fromRawJson(String str) =>
      ProfileModel.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        firstName: json['first_name'] as String?,
        lastName: json['last_name'] as String?,
        email: json['email'] as String? ?? '',
        phone1CountryCode: json['phone1_country_code'] as String? ?? '',
        phone1: json['phone1'] as String? ?? '',
        password: json['password'] as String?,
        passwordConfirmation: json['password_confirmation'] as String?,
        uiLanguage: json['ui_language'] as String?,
        accountType: json['account_type'] as String?,
        invitationToken: json['invitation_token'] as String?,
        enterpriseName: json['enterprise_name'] as String?,
        enterpriseID: json['enterprise_id'] as String?,
        jobTitle: json['job_title'] as String?,
        description: json['description'] as String? ?? '',
        phone2CountryCode: json['phone2_country_code'] as String?,
        phone2: json['phone2'] as String?,
        birthDate: json['birthdate'] == null
            ? null
            : DateTime.parse(json['birthdate'].toString()),
        pictureUrl: json['picture_url'] as String?,
        emailNotification: json['settings_notifications_email'] as bool?,
        addressStreet: json['address_street'] as String?,
        addressCity: json['address_city'] as String?,
        addressZip: json['address_zip'] as String?,
        addressCountry: json['address_country'] as String?,
        addressLatitude: json['address_latitude'] as String?,
        addressLongitude: json['address_longitude'] as String?,
        id: json['id'] as int?,
        name: json['name'] as String?,
        // subsidiaryOf: json['subsidiary_of'] as String?,
        // schoolID: json['school_id'] as String?,
        logoUrn: json['logo_urn'] as String?,
        createdAt: json['created_at'] != null
            ? DateTime.parse(json['created_at'].toString())
            : null,
        updatedAt: json['updated_at'] != null
            ? DateTime.parse(json['updated_at'].toString())
            : null,
        establishedIn:
            json['established_in'] != null && json['established_in'] != ''
                ? DateTime.parse(json['established_in'].toString())
                : null,
        legalStatusLabel: json['legal_status_label'] as String?,
        facebookLink: json['facebook_link'] as String?,
        instagramLink: json['instagram_link'] as String? ?? '',
        linkedinLink: json['linkedin_link'] as String?,
        whatsAppLink: json['whatsapp_link'] as String?,
        youtubeLink: json['youtube_link'] as String?,
        statusCode: json['statecode'] as int?,
        uuid: json['uuid'] as String?,
        enterpriseType: json['enterprise_type'] != null
            ? FieldModel.fromJson(
                json['enterprise_type'] as Map<String, dynamic>,
              )
            : null,
        // school: School.fromJson(json['school']),
        spokenLanguages:
            json['spoken_languages'] == null || json['spoken_languages'] == []
                ? []
                : (json['spoken_languages'] as List)
                    .map(
                      (i) => FieldModel.fromJson(
                        i as Map<String, dynamic>,
                      ),
                    )
                    .toList(),
        fields: json['fields'] == null || json['fields'] == []
            ? []
            : (json['fields'] as List)
                .map(
                  (i) => FieldModel.fromJson(
                    i as Map<String, dynamic>,
                  ),
                )
                .toList(),
        logoUrl: json['logo_url'] as String?,
        managers: json['managers'] == [] || json['managers'] == null
            ? []
            : (json['managers'] as List)
                .map(
                  (i) => UserModel.fromJson(
                    i as Map<String, dynamic>,
                  ),
                )
                .toList(),
      );

  Map<String, dynamic> toJson() => {
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'phone1_country_code': phone1CountryCode,
        'phone1': phone1,
        'password': password,
        'password_confirmation': passwordConfirmation,
        'ui_language': uiLanguage,
        'account_type': accountType,
        'invitation_token': invitationToken,
        'enterprise_name': enterpriseName,
        'enterprise_id': enterpriseID,
        'job_title': jobTitle,
        'description': description,
        'phone2_country_code': phone2CountryCode,
        'phone2': phone2,
        // 'birthdate': birthDate?.toString(),
        'birthdate': birthDate == null
            ? null
            : "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
        'picture_url': pictureUrl,
        'settings_notifications_email': emailNotification,
        'address_street': addressStreet,
        'address_city': addressCity,
        'address_zip': addressZip,
        'address_country': addressCountry,
        'address_latitude': addressLatitude,
        'address_longitude': addressLongitude,
        'id': id,
        'name': name,
        'subsidiary_of': subsidiaryOf,
        'school_id': schoolID,
        'logo_urn': logoUrn,
        'created_at': createdAt?.toString(),
        'updated_at': updatedAt?.toString(),
        'established_in': establishedIn?.toString(),
        'legal_status_label': legalStatusLabel,
        'facebook_link': facebookLink,
        'instagram_link': instagramLink,
        'linkedin_link': linkedinLink,
        'whatsapp_link': whatsAppLink,
        'youtube_link': youtubeLink,
        'statecode': statusCode,
        'uuid': uuid,
        'enterprise_type': enterpriseType,
        // 'school': school.toJson(),
        'spoken_languages': spokenLanguages == null || spokenLanguages == []
            ? null
            : List<dynamic>.from(spokenLanguages!.map((x) => x.toJson())),
        'fields': fields == null || fields == []
            ? null
            : List<dynamic>.from(fields!.map((x) => x.toJson())),
        'logoUrl': logoUrl,
        'managers': managers == null || managers == []
            ? null
            : List<dynamic>.from(managers!.map((x) => x.toJson())),
        'source': source,
      }..removeWhere((_, v) => v == null);

  @override
  String toString() {
    return '''
    ProfileModel(
      firstName: $firstName,
      lastName: $lastName,
      email: $email,
      description: $description,
      phone1CountryCode: $phone1CountryCode,
      phone1: $phone1,
      phone2CountryCode: $phone2CountryCode,
      phone2: $phone2,
      password: $password,
      passwordConfirmation: $passwordConfirmation,
      uiLanguage: $uiLanguage,
      accountType: $accountType,
      invitationToken: $invitationToken,
      enterpriseName: $enterpriseName,
      enterpriseID: $enterpriseID,
      jobTitle: $jobTitle,
      birthDate: $birthDate,
      pictureUrl: $pictureUrl,
      emailNotification: $emailNotification,
      addressStreet: $addressStreet,
      addressCity: $addressCity,
      addressZip: $addressZip,
      addressCountry: $addressCountry,
      addressLatitude: $addressLatitude,
      addressLongitude: $addressLongitude,
      id: $id, 
      name: $name, 
      subsidiaryOf: $subsidiaryOf, 
      schoolID: $schoolID, 
      logoUrn: $logoUrn, 
      createdAt: $createdAt, 
      updatedAt: $updatedAt, 
      establishedIn: $establishedIn,
      legalStatusLabel: $legalStatusLabel,
      facebookLink: $facebookLink,       
      instagramLink: $instagramLink, 
      linkedinLink: $linkedinLink, 
      whatsAppLink: $whatsAppLink,
      youtubeLink: $youtubeLink,
      statusCode: $statusCode, 
      uuid: $uuid,
      enterpriseType: $enterpriseType,
      spokenLanguages: $spokenLanguages,
      fields: $fields,
      logoUrl: $logoUrl,
      managers: $managers,
    )''';
  }
}

///==================== Registration API Schema ====================
/*
/// Student Registration API Scheme
{
  "invitation_token": "123123",
  "first_name": "Sotheng",
  "last_name": "Chheang",
  "email": "asdasd@gmail.com",
  "phone1_country_code": "+7 840",
  "phone1": "070434448",
  "password": "123123123",
  "password_confirmation": "123123123",
  "ui_language": "en",
  "account_type": "student",
  "enterprise_name": null,        //Missing
  "enterprise_id": null,          //Missing
}

/// Enterprise Registration API Scheme
{
  "invitation_token": "123123",
  "first_name": "Sotheng",
  "last_name": "Chheang",
  "email": "chheangsotheng@gmail.com",
  "phone1_country_code": "+355",
  "phone1": "070434448",
  "password": "123123123",
  "password_confirmation": "123123123",
  "account_type": "professional",
  "ui_language": "en",                //Missing
  "enterprise_name": "Orange France", //Missing
  "enterprise_id": "123 123 321 333", //Missing
  "address_street": "",               //Better to Cut
  "address_city": "",                 //Better to Cut
  "address_zip": "",                  //Better to Cut
  "address_country": "",              //Better to Cut
  "spoken_languages": [1],            //Better to Cut
  "fields": []                        //Better to Cut
}
*/
