import 'package:flutter/foundation.dart';
// import 'api_keys.dart';

enum Endpoint {
  signIn,
  signOut,
  registerNewUser,
  putChangePassword,
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
  getJobOfferTypes,
  getFields,
  getLanguages,
  //postProfilePicture
  putUpdateProfileInfo,
  putUpdateStudentProfileInfo,
  getSchools,
  postEducation,
  // putOrdeleteEducation,
  getExperienceTypes,
  postExperience,
  // putOrDeleteExperience,
  postAchievement,
  // putOrDeleteAchievement,
  postCertificate,
  // putOrDeleteCertificate,
  postSpokenLanguageList,
  postSpokenLanguage,
  // putOrDeleteSpokenLanguage,
  getHardAndSoftSkills,
  getOnlyHardSkills,
  getOnlySoftSkills,
  postOrGetOnBoardingData,
  // getMessagingRoomList,
  // getMessagesByRoomID,
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
    Endpoint.putChangePassword: '/users/change-password',
    Endpoint.userInfo: '/users/me',
    Endpoint.studentInfo: '/users/me/student_profile',
    Endpoint.getFeed: '/offers',
    Endpoint.getFeedFresh: '/offers/fresh',
    Endpoint.getPendingOffer: '/offers/pending',
    Endpoint.getMatchedOffer: '/offers/matched',
    Endpoint.getSavedOffer: '/offers/saved',
    Endpoint.getRejectedOffer: '/offers/hidden',
    Endpoint.getJobOfferTypes: '/tags/offers',
    Endpoint.getFields: '/tags/fields',
    Endpoint.getLanguages: '/tags/languages',
    Endpoint.putUpdateProfileInfo: '/users/me/profile',
    Endpoint.putUpdateStudentProfileInfo: '/users/me/student_profile',
    Endpoint.getSchools: '/schools',
    Endpoint.postEducation: '/users/me/student_profile/educations',
    Endpoint.postExperience: '/users/me/student_profile/experiences',
    Endpoint.getExperienceTypes: '/tags/experiences',
    Endpoint.postAchievement: '/users/me/student_profile/achievements',
    Endpoint.postCertificate: '/users/me/student_profile/certificates',
    Endpoint.postSpokenLanguageList: '/users/me/student_profile/languages',
    Endpoint.getHardAndSoftSkills: '/tags/skills',
    Endpoint.getOnlyHardSkills: '/tags/hardskills',
    Endpoint.getOnlySoftSkills: '/tags/softskills',
    Endpoint.postOrGetOnBoardingData: '/onboarding',
  };
  static String postSearchOffer({int? pageNumber = 1}) =>
      '/search/offers?page=$pageNumber';
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

  static String postProfilePicture() => '/users/me/profile/picture';

  static String putOrDeleteEducation({required int? eduId}) =>
      '/users/me/student_profile/educations/$eduId';

  static String putOrDeleteExperience({required int? expId}) =>
      '/users/me/student_profile/experiences/$expId';

  static String putOrDeleteAchievement({required int? achievementId}) =>
      '/users/me/student_profile/achievements/$achievementId';

  static String putOrDeleteCertificate({required int? certificateId}) =>
      '/users/me/student_profile/certificates/$certificateId';

  static String postSpokenLanguage({required int? languageId}) =>
      '/users/me/student_profile/languages/$languageId';

  static String putOrDeleteSpokenLanguage({required int? spokenLanguageId}) =>
      '/users/me/student_profile/languages/$spokenLanguageId';

  static String postSkillByCategory({required String? skillCategory}) =>
      '/users/me/student_profile/$skillCategory';

  static String putOrDeleteSkillByCategoryAndID({
    required String? skillCategory,
    required int? skillId,
  }) =>
      '/users/me/student_profile/$skillCategory/$skillId';

  static String getMessagingRoomList({
    int? pageNumber = 1,
  }) =>
      '/rooms?page=$pageNumber';

  static String getMessagesByRoomID({
    required String? roomId,
    int? pageNumber = 1,
  }) =>
      '/rooms/$roomId/messages?page=$pageNumber';
}
