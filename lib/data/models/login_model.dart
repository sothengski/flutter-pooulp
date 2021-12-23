import 'dart:convert';

class LoginModel {
  final String? token;
  final String? tokenType;
  final int? expireIn;
  final String? accountType;

  const LoginModel({
    this.token,
    this.tokenType,
    this.expireIn,
    this.accountType,
  });

  factory LoginModel.loginFromJson(String str) =>
      LoginModel.fromJson(json.decode(str) as Map<String, dynamic>);

  factory LoginModel.fromJson(Map<String, dynamic> map) {
    return LoginModel(
      token: map['token'] as String?,
      tokenType: map['token_type'] as String?,
      expireIn: map['expires_in']?.toInt() as int?,
      accountType: map['account_type'] as String?,
    );
  }

  String logintoJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => <String, dynamic>{
        'token': token,
        'token_type': tokenType,
        'expires_in': expireIn,
        'account_type': accountType,
      }..removeWhere((_, dynamic v) => v == null);

  @override
  String toString() {
    return '''
    LoginModel(
      token: $token,
      tokenType: $tokenType,
      expireIn: $expireIn,
      accountType: $accountType)''';
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
