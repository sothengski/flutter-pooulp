import 'package:flutter/material.dart';

import '../data.dart';

abstract class IStudentProvider {
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
}

class StudentProvider extends BaseProvider implements IStudentProvider {
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
        API.putOrdeleteEducation(eduId: eduId),
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

  @override
  Future<JsonResponse> deleteStudentEducation({
    required int? eduId,
  }) async {
    try {
      final dataResponse = await delete(
        API.putOrdeleteEducation(eduId: eduId),
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
        debugPrint(
          'API: ${API.paths[Endpoint.postExperience].toString()}\nresponse::$response',
        );
        return response;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<JsonResponse> putStudentExperience({
    required int? expId,
    ExperienceModel? experienceData,
  }) async {
    try {
      // debugPrint(
      //   'educationData: ${educationData!.toRawJson()}',
      // );
      final dataResponse = await put(
        API.putOrdeleteExperience(expId: expId),
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
        // debugPrint(
        //   'API: ${API.putOrdeleteEducation(eduId: eduId)}\nresponse::$response',
        // );
        return response;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<JsonResponse> deleteStudentExperience({
    required int? expId,
  }) async {
    try {
      final dataResponse = await delete(
        API.putOrdeleteExperience(expId: expId),
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
}
