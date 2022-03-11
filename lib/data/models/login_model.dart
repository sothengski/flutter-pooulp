import 'dart:convert';

class LoginModel {
  final String? token;
  final String? tokenType;
  final int? expireIn;
  final String? accountType;
  final DateTime? tokenExpirationDate;

  const LoginModel({
    this.token,
    this.tokenType,
    this.expireIn,
    this.accountType,
    this.tokenExpirationDate,
  });

  factory LoginModel.fromRawJson(String str) =>
      LoginModel.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      token: json['token'] as String?,
      tokenType: json['token_type'] as String?,
      expireIn: json['expires_in'] as int?,
      accountType: json['account_type'] as String?,
      tokenExpirationDate: json['token_expiration_date'] != null
          ? DateTime.parse(json['token_expiration_date'].toString())
          : null,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'token': token,
        'token_type': tokenType,
        'expires_in': expireIn,
        'account_type': accountType,
        'token_expiration_date': tokenExpirationDate?.toString(),
      }..removeWhere((_, dynamic v) => v == null);

  @override
  String toString() {
    return '''
    LoginModel(
      token: $token,
      tokenType: $tokenType,
      expireIn: $expireIn,
      accountType: $accountType,
      token_expiration_date: $tokenExpirationDate,
    )''';
  }
}

/*
{
    "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9hcGkuZGV2LWxhbXAtMDEuc3J2LnBvb3VscC5ldVwvcmVnaXN0ZXIiLCJpYXQiOjE2Mzk0NjgwNzcsImV4cCI6MTYzOTU1NDQ3NywibmJmIjoxNjM5NDY4MDc3LCJqdGkiOiJ2elBmeEFQVTF2OHRSaThPIiwic3ViIjoxMSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.YFxmdILgFcxtA-xKbVZFd-fW79kjOdAKjES9qAkP7N4",
    "token_type": "bearer",
    "expires_in": 86400,
    "account_type": "student"
}
 */
