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

  factory LoginModel.fromJson(String str) =>
      LoginModel.fromMap(json.decode(str) as Map<String, dynamic>);

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      token: map['token'] as String?,
      tokenType: map['tokenType'] as String?,
      expireIn: map['expireIn']?.toInt() as int?,
      accountType: map['accountType'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'token': token,
        'tokenType': tokenType,
        'expireIn': expireIn,
        'accountType': accountType,
      }..removeWhere((_, v) => v == null);

  @override
  String toString() {
    return '''
    LoginModel(
      token: $token,
      tokenType: $tokenType,
      expireIn: $expireIn,
      accountType: $accountType)''';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginModel &&
        other.token == token &&
        other.tokenType == tokenType &&
        other.expireIn == expireIn &&
        other.accountType == accountType;
  }

  @override
  int get hashCode {
    return token.hashCode ^
        tokenType.hashCode ^
        expireIn.hashCode ^
        accountType.hashCode;
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
