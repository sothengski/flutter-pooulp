import 'package:flutter/foundation.dart';
// import 'api_keys.dart';

enum Endpoint {
  signIn,
  signOut,
  registerNewUser,
  userInfo,
  studentInfo,
  feed,
  feedFresh,
  pendingOffer,
  matchedOffer,
  savedOffer,
  rejectedOffer,
  savedAnOfferPOST,
}

class API {
  API({@required this.apiKey});
  final String? apiKey;

  // factory API.dev() => API(apiKey: APIKeys.pooulpDevKey);

  /// Based API End Point URLs
  static const String host =
      //'localhost:80'; //Local BASEURL
      'http://api.dev-lamp-01.srv.pooulp.eu'; //Development BASEURL
  // 'http://uat-api.pooulp.eu'; //UAT BASEURL
  // 'pooulp.eu'; //Production BASEURL

  /// API End Point Path URLs
  static final Map<Endpoint, String> paths = {
    Endpoint.signIn: '/login',
    Endpoint.signOut: '/logout',
    Endpoint.registerNewUser: '/register',
    Endpoint.userInfo: '/users/me',
    Endpoint.studentInfo: '/users/me/student_profile',
    Endpoint.feed: '/offers',
    Endpoint.feedFresh: '/offers/fresh',
    Endpoint.pendingOffer: '/offers/pending',
    Endpoint.matchedOffer: '/offers/matched',
    Endpoint.savedOffer: '/offers/saved',
    Endpoint.rejectedOffer: '',
  };

  static String savedAnOfferPostMethod(int offerId) => '/offers/$offerId/save';
}
