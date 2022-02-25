import 'package:flutter/foundation.dart';
// import 'api_keys.dart';

enum Endpoint {
  signIn,
  signOut,
  registerNewUser,
  userInfo,
  studentInfo,
  getFeed,
  getFeedFresh,
  getPendingOffer,
  getMatchedOffer,
  getSavedOffer,
  getRejectedOffer,
  // postApplyOffer,
  // postUnApplyOffer,
  // postSavedOffer,
  // postUnSaveOffer,
  // postHideOffer,
  // postUnHideOffer,
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
    Endpoint.getFeed: '/offers',
    Endpoint.getFeedFresh: '/offers/fresh',
    Endpoint.getPendingOffer: '/offers/pending',
    Endpoint.getMatchedOffer: '/offers/matched',
    Endpoint.getSavedOffer: '/offers/saved',
    Endpoint.getRejectedOffer: '/offers/hidden',
  };
  static String postApplyOffer({required int? offerId}) =>
      '/offers/$offerId/like';
  static String postUnApplyOffer({required int? offerId}) =>
      '/offers/$offerId/unlike';
  static String postSavedOffer({required int? offerId}) =>
      '/offers/$offerId/save';
  static String postUnSaveOffer({required int? offerId}) =>
      '/offers/$offerId/unsave';
  static String postHideOffer({required int? offerId}) =>
      '/offers/$offerId/dislike';
  static String postUnHideOffer({required int? offerId}) =>
      '/offers/$offerId/undislike';
}
