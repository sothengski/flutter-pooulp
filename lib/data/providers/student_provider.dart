import 'package:flutter/material.dart';

import '../data.dart';

abstract class IStudentProvider {
  Future<EducationModel> postStudentEducation({
    EducationModel? educationData,
  });
}

class StudentProvider extends BaseProvider implements IStudentProvider {
  @override
  Future<EducationModel> postStudentEducation({
    EducationModel? educationData,
  }) async {
    try {
      debugPrint(
        'educationData: ${educationData!.toRawJson()}',
      );
      final dataResponse = await post(
        API.paths[Endpoint.postEducation].toString(),
        educationData.toRawJson(),
      );
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        debugPrint(
          'API: ${API.paths[Endpoint.postEducation].toString()}\n${dataResponse.body}',
        );
        return EducationModel.fromJson(
          dataResponse.body as Map<String, dynamic>,
        );
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
