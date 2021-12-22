///==================== Keys ====================

class Keys {
  static const String localStorageKey = 'Pooulp';
}

const String textEnAppVersion = "App Version: 1.1.0";

class APIEndPoints {
// "Beta App Version: 1.1.0";
  static const String baseUrlPooulp =
      //'localhost:80'; //Local BASEURL
      'http://api.dev-lamp-01.srv.pooulp.eu'; //Development BASEURL
  // 'http://uat-api.pooulp.eu'; //QAS BASEURL
  // 'pooulp.eu'; //Production BASEURL

  static const String signInEndPoint = '/login';
  static const String signOutEndPoint = '/logout';

  static const String registerNewUserEndPoint = '/register';
}

class LocalStorage {
  static const credentialName = 'Pooulp';
  static const authTokenData = "authUserData";
  static const isLogged = 'isLogged';
}
