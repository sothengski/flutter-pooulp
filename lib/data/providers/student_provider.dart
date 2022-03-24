import '../data.dart';

abstract class IStudentProvider {
  // Future<EducationModel> postStudentEducation({
  //   EducationModel? educationData,
  // });
  // Future<EducationModel> putStudentEducation({
  //   required int? eduId,
  //   EducationModel? educationData,
  // });
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
}

class StudentProvider extends BaseProvider implements IStudentProvider {
  // @override
  // Future<EducationModel> postStudentEducation({
  //   EducationModel? educationData,
  // }) async {
  //   try {
  //     final dataResponse = await post(
  //       API.paths[Endpoint.postEducation].toString(),
  //       educationData!.toRawJson(),
  //     );
  //     if (dataResponse.hasError) {
  //       throw "(resp: ${dataResponse.bodyString})";
  //     } else {
  //       return EducationModel.fromJson(
  //         dataResponse.body as Map<String, dynamic>,
  //       );
  //     }
  //   } catch (e) {
  //     return Future.error(e.toString());
  //   }
  // }

  // @override
  // Future<EducationModel> putStudentEducation({
  //   required int? eduId,
  //   EducationModel? educationData,
  // }) async {
  //   try {
  //     // debugPrint(
  //     //   'educationData: ${educationData!.toRawJson()}',
  //     // );
  //     final dataResponse = await put(
  //       API.putOrdeleteEducation(eduId: eduId),
  //       educationData!.toRawJson(),
  //     );
  //     if (dataResponse.hasError) {
  //       throw "(resp: ${dataResponse.bodyString})";
  //     } else {
  //       // debugPrint(
  //       //   'API: ${API.putOrdeleteEducation(eduId: eduId)}\n${dataResponse.body}',
  //       // );
  //       return EducationModel.fromJson(
  //         dataResponse.body as Map<String, dynamic>,
  //       );
  //     }
  //   } catch (e) {
  //     return Future.error(e.toString());
  //   }
  // }

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
  Future<JsonResponse> deleteStudentEducation({required int? eduId}) async {
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

  // @override
  // Future<EducationModel> deleteStudentEducation({required int? eduId}) async {
  //   try {
  //     final dataResponse = await delete(
  //       API.putOrdeleteEducation(eduId: eduId),
  //     );
  //     if (dataResponse.hasError) {
  //       throw "(resp: ${dataResponse.bodyString})";
  //     } else {
  //       debugPrint(
  //         'API: ${API.putOrdeleteEducation(eduId: eduId)}\n${dataResponse.body}',
  //       );
  //       return EducationModel.fromJson(
  //         dataResponse.body as Map<String, dynamic>,
  //       );
  //     }
  //   } catch (e) {
  //     return Future.error(e.toString());
  //   }
  // }
}
