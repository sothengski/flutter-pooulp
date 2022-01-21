import 'package:flutter/foundation.dart';
// import 'api_keys.dart';

enum Endpoint {
  signIn,
  signOut,
  registerNewUser,
  userInfo,
  studentInfo,
}

class API {
  API({@required this.apiKey});
  final String? apiKey;

  // factory API.dev() => API(apiKey: APIKeys.pooulpDevKey);

  static const String host =
      //'localhost:80'; //Local BASEURL
      'http://api.dev-lamp-01.srv.pooulp.eu'; //Development BASEURL
  // 'http://uat-api.pooulp.eu'; //QAS BASEURL
  // 'pooulp.eu'; //Production BASEURL

  static final Map<Endpoint, String> paths = {
    Endpoint.signIn: '/login',
    Endpoint.signOut: '/login',
    Endpoint.registerNewUser: '/register',
    Endpoint.userInfo: '/users/me',
    Endpoint.studentInfo: '/users/me/student_profile',
  };
}
