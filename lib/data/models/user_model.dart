import 'dart:convert';

class UserModel {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone1CountryCode;
  final String? phone1;
  final String? password;
  final String? passwordConfirmation;
  final String? uiLanguage;
  final String? accountType; //professional or //student
  final String? invitationToken;
  final String? enterpriseName;
  final String? enterpriseID;
  // final String? addressStreet;
  // final String? addressCity;
  // final String? addressZip;
  // final String? addressCountry;
  // final List<int>? spokenLanguagesList;
  // final List<String>? fields;

  const UserModel({
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
    // this.addressStreet,
    // this.addressCity,
    // this.addressZip,
    // this.addressCountry,
    // this.spokenLanguagesList,
    // this.fields,
  });

  factory UserModel.userFromJson(String str) =>
      UserModel.fromJson(json.decode(str) as Map<String, dynamic>);

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      firstName: map['first_name'] as String?,
      lastName: map['last_name'] as String?,
      email: map['email'] as String?,
      phone1CountryCode: map['phone1_country_code'] as String?,
      phone1: map['phone1'] as String?,
      password: map['password'] as String?,
      passwordConfirmation: map['password_confirmation'] as String?,
      uiLanguage: map['ui_language'] as String?,
      accountType: map['account_type'] as String?,
      invitationToken: map['invitation_token'] as String?,
      enterpriseName: map['enterprise_name'] as String?,
      enterpriseID: map['enterprise_id'] as String?,
    );
  }

  String userToJson() => json.encode(toJson());

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
      }..removeWhere((_, v) => v == null);

  @override
  String toString() {
    return '''
    RegistrationModel(
      firstName: $firstName, 
      lastName: $lastName, 
      email: $email, 
      phone1CountryCode: $phone1CountryCode, 
      phone1: $phone1, 
      password: $password, 
      passwordConfirmation: $passwordConfirmation, 
      uiLanguage: $uiLanguage, 
      accountType: $accountType, 
      invitationToken: $invitationToken,
      enterpriseName: $enterpriseName,
      enterpriseID: $enterpriseID,
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
