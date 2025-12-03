import 'dart:async';

import '../data.dart';

class FakeAuthProvider {
  /// Fake login API that returns mock data for local testing
  Future<LoginModel> loginAPI({required ProfileModel? loginData}) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Validate credentials (optional - you can remove this if you want to always succeed)
    if (loginData?.email == 'john.appleseed@example.com' &&
        loginData?.password == '123456') {
      // Return mock login response
      return LoginModel.fromJson({
        'token':
            'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9hcGkuZGV2LWxhbXAtMDEuc3J2LnBvb3VscC5ldVwvbG9naW4iLCJpYXQiOjE2MzkwMzA3NDQsImV4cCI6MTYzOTExNzE0NCwibmJmIjoxNjM5MDMwNzQ0LCJqdGkiOiJhTDZxcVFvQXFva3R3MmFGIiwic3ViIjoxLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.eQlxq-xcBssX02jB8OaP3hquQn_TuA-Nw5iXtFRIDZ4',
        'token_type': 'bearer',
        'expires_in': 86400,
        'account_type': 'student',
      });
    } else {
      // Return error for invalid credentials
      return Future.error('Invalid email or password');
    }
  }
}
