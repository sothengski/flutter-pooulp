import '../data.dart';

abstract class IStudentProvider {
  ///===== Top of Education Section =====//
  Future<JsonResponse> postStudentEducation({
    EducationModel? educationData,
  });
  Future<JsonResponse> putStudentEducation({
    required int? eduId,
    EducationModel? educationData,
  });
  Future<JsonResponse> deleteStudentEducation({
    required int? eduId,
  });
  //===== Bottom of Education Section =====//

  ///===== Top of Experience Section =====//
  Future<JsonResponse> postStudentExperience({
    ExperienceModel? experienceData,
  });
  Future<JsonResponse> putStudentExperience({
    required int? expId,
    ExperienceModel? experienceData,
  });
  Future<JsonResponse> deleteStudentExperience({
    required int? expId,
  });
  //===== Bottom of Experience Section =====//

  ///===== Top of Achievement Section =====//
  Future<JsonResponse> postStudentAchievement({
    AchievementModel? achievementData,
  });
  Future<JsonResponse> putStudentAchievement({
    required int? achievementId,
    AchievementModel? achievementData,
  });
  Future<JsonResponse> deleteStudentAchievement({
    required int? achievementId,
  });
  //===== Bottom of Achievement Section =====//

  ///===== Top of Certificate Section =====//
  Future<JsonResponse> postStudentCertificate({
    CertificateModel? certificateData,
  });
  Future<JsonResponse> putStudentCertificate({
    required int? certificateId,
    CertificateModel? certificateData,
  });
  Future<JsonResponse> deleteStudentCertificate({
    required int? certificateId,
  });
  //===== Bottom of Certificate Section =====//

  ///===== Top of Spoken Language Section =====//
  Future<JsonResponse> postStudentSpokenLanguageList({
    List<FieldModel>? languageListData,
  });
  Future<JsonResponse> postStudentSpokenLanguage({
    required int? languageId,
    FieldModel? languageData,
  });
  Future<JsonResponse> putStudentSpokenLanguage({
    required int? spokenLanguageId,
    FieldModel? spokenLanguageData,
  });
  Future<JsonResponse> deleteStudentSpokenLanguage({
    required int? spokenLanguageId,
  });
  //===== Bottom of Spoken Language Section =====//

  ///===== Top of Skill Section =====//
  Future<JsonResponse> postStudentSkillList({
    List<FieldModel>? skillData,
  });
  Future<JsonResponse> postStudentSkill({
    required String? skillCategory,
    FieldModel? skillData,
  });
  Future<JsonResponse> putStudentSkill({
    required int? skillId,
    FieldModel? skillData,
  });
  Future<JsonResponse> deleteStudentSkill({
    required int? skillId,
  });
  //===== Bottom of Skill Section =====//

  ///===== Top of Availability Section =====//
  Future<JsonResponse> postStudentAvailability({
    PeriodModel? availabilityData,
  });
  Future<JsonResponse> putStudentAvailability({
    required int? availabilityId,
    PeriodModel? availabilityData,
  });
  Future<JsonResponse> deleteStudentAvailability({
    required int? availabilityId,
  });
  //===== Bottom of Availability Section =====//
}

class StudentProvider extends BaseProvider implements IStudentProvider {
  ///===== Top of Education Section =====//
  ///
  ///POST Method for Add New Education Information
  @override
  Future<JsonResponse> postStudentEducation({
    EducationModel? educationData,
  }) async {
    try {
      final dataResponse = await post(
        API.paths[Endpoint.postEducation].toString(),
        educationData!.toRawJson(),
      );
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final JsonResponse response = JsonResponse(
          success: dataResponse.status.isOk,
          status: dataResponse.statusCode,
          message: dataResponse.statusText,
          data: dataResponse.body,
        );
        // debugPrint(
        //   'API: ${API.paths[Endpoint.postEducation].toString()}\nresponse::$response',
        // );
        return response;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  ///PUT Method for Update by Replacing Education Information by ID
  @override
  Future<JsonResponse> putStudentEducation({
    required int? eduId,
    EducationModel? educationData,
  }) async {
    try {
      // debugPrint(
      //   'educationData: ${educationData!.toRawJson()}',
      // );
      final dataResponse = await put(
        API.putOrDeleteEducation(eduId: eduId),
        educationData!.toRawJson(),
      );
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final JsonResponse response = JsonResponse(
          success: dataResponse.status.isOk,
          status: dataResponse.statusCode,
          message: dataResponse.statusText,
          data: dataResponse.body,
        );
        // debugPrint(
        //   'API: ${API.putOrdeleteEducation(eduId: eduId)}\nresponse::$response',
        // );
        return response;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  ///DELETE Method for Removing Education Information by ID
  @override
  Future<JsonResponse> deleteStudentEducation({
    required int? eduId,
  }) async {
    try {
      final dataResponse = await delete(
        API.putOrDeleteEducation(eduId: eduId),
      );
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final JsonResponse response = JsonResponse(
          success: dataResponse.status.isOk,
          status: dataResponse.statusCode,
          message: dataResponse.statusText,
          data: dataResponse.body,
        );
        return response;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
  //===== Bottom of Education Section =====//

  ///===== Top of Experience Section =====//
  ///
  ///POST Method for Add New Experience Information
  @override
  Future<JsonResponse> postStudentExperience({
    ExperienceModel? experienceData,
  }) async {
    try {
      final dataResponse = await post(
        API.paths[Endpoint.postExperience].toString(),
        experienceData!.toRawJson(),
      );
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final JsonResponse response = JsonResponse(
          success: dataResponse.status.isOk,
          status: dataResponse.statusCode,
          message: dataResponse.statusText,
          data: dataResponse.body,
        );
        return response;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  ///PUT Method for Update by Replacing Experience Information by ID
  @override
  Future<JsonResponse> putStudentExperience({
    required int? expId,
    ExperienceModel? experienceData,
  }) async {
    try {
      final dataResponse = await put(
        API.putOrDeleteExperience(expId: expId),
        experienceData!.toRawJson(),
      );
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final JsonResponse response = JsonResponse(
          success: dataResponse.status.isOk,
          status: dataResponse.statusCode,
          message: dataResponse.statusText,
          data: dataResponse.body,
        );
        return response;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  ///DELETE Method for Removing Experience Information by ID
  @override
  Future<JsonResponse> deleteStudentExperience({
    required int? expId,
  }) async {
    try {
      final dataResponse = await delete(
        API.putOrDeleteExperience(expId: expId),
      );
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final JsonResponse response = JsonResponse(
          success: dataResponse.status.isOk,
          status: dataResponse.statusCode,
          message: dataResponse.statusText,
          data: dataResponse.body,
        );
        return response;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
  //===== Bottom of Experience Section =====//

  ///===== Top of Achievement Section =====//
  ///
  ///POST Method for Add New Achievement Information
  @override
  Future<JsonResponse> postStudentAchievement({
    AchievementModel? achievementData,
  }) async {
    try {
      final dataResponse = await post(
        API.paths[Endpoint.postAchievement].toString(),
        achievementData!.toRawJson(),
      );
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final JsonResponse response = JsonResponse(
          success: dataResponse.status.isOk,
          status: dataResponse.statusCode,
          message: dataResponse.statusText,
          data: dataResponse.body,
        );
        return response;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  ///PUT Method for Update by Replacing Achievement Information by ID
  @override
  Future<JsonResponse> putStudentAchievement({
    required int? achievementId,
    AchievementModel? achievementData,
  }) async {
    try {
      final dataResponse = await put(
        API.putOrDeleteAchievement(achievementId: achievementId),
        achievementData!.toRawJson(),
      );
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final JsonResponse response = JsonResponse(
          success: dataResponse.status.isOk,
          status: dataResponse.statusCode,
          message: dataResponse.statusText,
          data: dataResponse.body,
        );
        return response;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  ///DELETE Method for Removing Achievement Information by ID
  @override
  Future<JsonResponse> deleteStudentAchievement({
    required int? achievementId,
  }) async {
    try {
      final dataResponse = await delete(
        API.putOrDeleteAchievement(achievementId: achievementId),
      );
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final JsonResponse response = JsonResponse(
          success: dataResponse.status.isOk,
          status: dataResponse.statusCode,
          message: dataResponse.statusText,
          data: dataResponse.body,
        );
        return response;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  //===== Bottom of Achievement Section =====//

  ///===== Top of Certificate Section =====//
  ///
  ///POST Method for Add New Certificate Information
  @override
  Future<JsonResponse> postStudentCertificate({
    CertificateModel? certificateData,
  }) async {
    try {
      final dataResponse = await post(
        API.paths[Endpoint.postCertificate].toString(),
        certificateData!.toRawJson(),
      );
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final JsonResponse response = JsonResponse(
          success: dataResponse.status.isOk,
          status: dataResponse.statusCode,
          message: dataResponse.statusText,
          data: dataResponse.body,
        );
        return response;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  ///PUT Method for Update by Replacing Certificate Information by ID
  @override
  Future<JsonResponse> putStudentCertificate({
    required int? certificateId,
    CertificateModel? certificateData,
  }) async {
    try {
      final dataResponse = await put(
        API.putOrDeleteCertificate(certificateId: certificateId),
        certificateData!.toRawJson(),
      );
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final JsonResponse response = JsonResponse(
          success: dataResponse.status.isOk,
          status: dataResponse.statusCode,
          message: dataResponse.statusText,
          data: dataResponse.body,
        );
        return response;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  ///DELETE Method for Removing Certificate Information by ID
  @override
  Future<JsonResponse> deleteStudentCertificate({
    required int? certificateId,
  }) async {
    try {
      final dataResponse = await delete(
        API.putOrDeleteCertificate(certificateId: certificateId),
      );
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final JsonResponse response = JsonResponse(
          success: dataResponse.status.isOk,
          status: dataResponse.statusCode,
          message: dataResponse.statusText,
          data: dataResponse.body,
        );
        return response;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  //===== Bottom of Certificate Section =====//

  ///===== Top of Spoken Language Section =====//
  ///
  ///POST Method for Add a New Spoken Language Information
  @override
  Future<JsonResponse> postStudentSpokenLanguage({
    required int? languageId,
    FieldModel? languageData,
  }) async {
    try {
      final dataResponse = await post(
        API.postSpokenLanguage(languageId: languageId),
        languageData!.toRawJson(),
      );
      // debugPrint(
      //   '''
      //   ${API.postSpokenLanguage(languageId: languageId)},
      //   languageData: ${languageData.toRawJson()}
      //   ''',
      // );
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final JsonResponse response = JsonResponse(
          success: dataResponse.status.isOk,
          status: dataResponse.statusCode,
          message: dataResponse.statusText,
          data: dataResponse.body,
        );
        return response;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  ///POST Method for Add a New Spoken Languages List Information
  @override
  Future<JsonResponse> postStudentSpokenLanguageList({
    List<FieldModel>? languageListData,
  }) async {
    // final List<FieldModel?> body = [spokenlanguageData];
    try {
      final dataResponse = await post(
        API.paths[Endpoint.postSpokenLanguageList].toString(),
        // spokenlanguageData!.toRawJson(),
        fieldListToJson(languageListData),
      );
      // debugPrint(
      //   '''
      //   API: ${API.paths[Endpoint.postSpokenLanguageList].toString()}\n
      //   POST Data: ${fieldListToJson(languageListData)}\n
      //   response::${dataResponse.bodyString}''',
      // );
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final JsonResponse response = JsonResponse(
          success: dataResponse.status.isOk,
          status: dataResponse.statusCode,
          message: dataResponse.statusText,
          data: dataResponse.body,
        );
        return response;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  ///PUT Method for Update by Replacing Spoken Language Information by ID
  @override
  Future<JsonResponse> putStudentSpokenLanguage({
    required int? spokenLanguageId,
    FieldModel? spokenLanguageData,
  }) async {
    try {
      final dataResponse = await put(
        API.putOrDeleteSpokenLanguage(spokenLanguageId: spokenLanguageId),
        spokenLanguageData!.toRawJson(),
      );
      // debugPrint(
      //   '''
      //   ${API.putOrDeleteSpokenLanguage(spokenLanguageId: spokenLanguageId)}\n
      //   POST Data: ${spokenLanguageData.toRawJson()}\n
      //   response::${dataResponse.bodyString}''',
      // );
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final JsonResponse response = JsonResponse(
          success: dataResponse.status.isOk,
          status: dataResponse.statusCode,
          message: dataResponse.statusText,
          data: dataResponse.body,
        );
        return response;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  ///DELETE Method for Removing Spoken Language Information by ID
  @override
  Future<JsonResponse> deleteStudentSpokenLanguage({
    required int? spokenLanguageId,
  }) async {
    try {
      final dataResponse = await delete(
        API.putOrDeleteSpokenLanguage(spokenLanguageId: spokenLanguageId),
      );
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final JsonResponse response = JsonResponse(
          success: dataResponse.status.isOk,
          status: dataResponse.statusCode,
          message: dataResponse.statusText,
          data: dataResponse.body,
        );
        return response;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  //===== Bottom of Spoken Language Section =====//

  ///===== Top of Skill Section =====//
  ///
  ///POST Method for Add a New Skill Information
  @override
  Future<JsonResponse> postStudentSkill({
    required String? skillCategory,
    FieldModel? skillData,
  }) async {
    try {
      final dataResponse = await post(
        API.postSkillByCategory(skillCategory: skillCategory),
        skillData!.toRawJson(),
      );
      // debugPrint(
      //   '''
      //   ${API.postSkillByCategory(skillCategory: skillCategory)},
      //   skillData: ${skillData.toRawJson()}
      //   ''',
      // );
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final JsonResponse response = JsonResponse(
          success: dataResponse.status.isOk,
          status: dataResponse.statusCode,
          message: dataResponse.statusText,
          data: dataResponse.body,
        );
        return response;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  ///POST Method for Add a New Skills List Information
  @override
  Future<JsonResponse> postStudentSkillList({
    List<FieldModel>? skillData,
  }) async {
    // final List<FieldModel?> body = [spokenlanguageData];
    try {
      final dataResponse = await post(
        API.paths[Endpoint.postSpokenLanguageList].toString(),
        // spokenlanguageData!.toRawJson(),
        fieldListToJson(skillData),
      );
      // debugPrint(
      //   '''
      //   API: ${API.paths[Endpoint.postSpokenLanguageList].toString()}\n
      //   POST Data: ${fieldListToJson(languageListData)}\n
      //   response::${dataResponse.bodyString}''',
      // );
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final JsonResponse response = JsonResponse(
          success: dataResponse.status.isOk,
          status: dataResponse.statusCode,
          message: dataResponse.statusText,
          data: dataResponse.body,
        );
        return response;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  ///PUT Method for Update by Replacing Skill Information by ID
  @override
  Future<JsonResponse> putStudentSkill({
    required int? skillId,
    FieldModel? skillData,
  }) async {
    try {
      final dataResponse = await put(
        API.putOrDeleteSkillByCategoryAndID(
          skillCategory: 'hardskills',
          skillId: skillId,
        ),
        skillData!.toRawJson(),
      );
      // debugPrint(
      //   '''
      //   ${API.putOrDeleteSpokenLanguage(spokenLanguageId: spokenLanguageId)}\n
      //   POST Data: ${spokenLanguageData.toRawJson()}\n
      //   response::${dataResponse.bodyString}''',
      // );
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final JsonResponse response = JsonResponse(
          success: dataResponse.status.isOk,
          status: dataResponse.statusCode,
          message: dataResponse.statusText,
          data: dataResponse.body,
        );
        return response;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  ///DELETE Method for Removing Skill Information by ID
  @override
  Future<JsonResponse> deleteStudentSkill({required int? skillId}) async {
    try {
      final dataResponse = await delete(
        API.putOrDeleteSkillByCategoryAndID(
          skillCategory: 'skills',
          skillId: skillId,
        ),
      );
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final JsonResponse response = JsonResponse(
          success: dataResponse.status.isOk,
          status: dataResponse.statusCode,
          message: dataResponse.statusText,
          data: dataResponse.body,
        );
        return response;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
  //===== Bottom of Skill Section =====//

  ///===== Top of Availability Section =====//
  ///
  ///POST Method for Add a New Availability Information
  @override
  Future<JsonResponse> postStudentAvailability({
    PeriodModel? availabilityData,
  }) async {
    try {
      final dataResponse = await post(
        API.paths[Endpoint.postOrGetAvailabilities].toString(),
        availabilityData!.toRawJson(),
      );
      // debugPrint(
      //   '''
      //   ${API.paths[Endpoint.postOrGetAvailabilities]},
      //   availabilityData: ${availabilityData.toRawJson()}
      //   ''',
      // );
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final JsonResponse response = JsonResponse(
          success: dataResponse.status.isOk,
          status: dataResponse.statusCode,
          message: dataResponse.statusText,
          data: dataResponse.body,
        );
        return response;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  ///PUT Method for Editing/Updating an Availability Information
  @override
  Future<JsonResponse> putStudentAvailability({
    required int? availabilityId,
    PeriodModel? availabilityData,
  }) async {
    try {
      final dataResponse = await put(
        API.putOrDeleteAvailabilities(availabilityId: availabilityId),
        availabilityData!.toRawJson(),
      );
      // debugPrint(
      //   '''
      //   ${API.putOrDeleteSpokenLanguage(spokenLanguageId: spokenLanguageId)}\n
      //   POST Data: ${spokenLanguageData.toRawJson()}\n
      //   response::${dataResponse.bodyString}''',
      // );
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final JsonResponse response = JsonResponse(
          success: dataResponse.status.isOk,
          status: dataResponse.statusCode,
          message: dataResponse.statusText,
          data: dataResponse.body,
        );
        return response;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  ///DELETE Method for Deleting an Availability Information by ID
  @override
  Future<JsonResponse> deleteStudentAvailability({
    required int? availabilityId,
  }) async {
    try {
      final dataResponse = await delete(
        API.putOrDeleteAvailabilities(availabilityId: availabilityId),
      );
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final JsonResponse response = JsonResponse(
          success: dataResponse.status.isOk,
          status: dataResponse.statusCode,
          message: dataResponse.statusText,
          data: dataResponse.body,
        );
        return response;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  //===== Bottom of Availability Section =====//
}
