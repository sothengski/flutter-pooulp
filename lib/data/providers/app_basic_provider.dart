import 'dart:convert';

import '../data.dart';

abstract class IAppBasicProvider {
  Future<AppBasicModel> getAppBasicStatus();
  Future<JsonResponse> getAllTranslationLangs({required String? lang});
}

class AppBasicProvider extends BaseProvider implements IAppBasicProvider {
  ///===== Top of AppBasic Section =====//
  ///
  /// Get Method for the getting data Information from Server
  @override
  Future<AppBasicModel> getAppBasicStatus() async {
    try {
      final dataResponse = await get(
        API.paths[Endpoint.getStatus].toString(),
      );
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final apiResponse = json.decode(dataResponse.bodyString.toString());
        return AppBasicModel.fromJson(
          apiResponse as Map<String, dynamic>,
        );
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<JsonResponse> getAllTranslationLangs({required String? lang}) async {
    try {
      final dataResponse = await get(
        "${API.paths[Endpoint.getAllTranslationLangs].toString()}/$lang",
      );
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        // final apiResponse = json.decode(dataResponse.bodyString.toString());
        final JsonResponse apiResponse = JsonResponse(
          success: dataResponse.status.isOk,
          status: dataResponse.statusCode,
          message: dataResponse.statusText,
          data: dataResponse.body,
        );
        return apiResponse;
        // return JsonResponse.fromJson(
        //   apiResponse as Map<String, dynamic>,
        // );
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
