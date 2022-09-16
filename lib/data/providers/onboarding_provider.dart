import '../data.dart';

abstract class IOnboardingProvider {
  ///===== Top of Onboarding Section =====//
  Future<OnboardingModel> getOnboardingDataList();
  Future<JsonResponse> postOnboarding({
    required OnboardingModel? onboardingData,
  });
  //===== Bottom of Onboarding Section =====//
}

class OnboardingProvider extends BaseProvider implements IOnboardingProvider {
  ///===== Top of Onboarding Section =====//
  ///
  /// POST Method for the onboarding data Information to Server
  @override
  Future<JsonResponse> postOnboarding({
    required OnboardingModel? onboardingData,
  }) async {
    try {
      // const String endpoint = "${API.host}/onboarding";
      // final String userToken = AuthServices().getStringToken().toString();
      // final Map<String, String> headers = {
      //   HttpHeaders.contentTypeHeader: 'application/json',
      //   // 'Content-Type': 'application/json',
      //   "accept": "application/json",
      //   "Authorization": "Bearer $userToken",
      //   "Accept-Encoding": "gzip, deflate",
      // };
      // final dataResponse = await http.post(
      //   Uri.parse(endpoint),
      //   headers: headers,
      //   body: onboardingData!.toRawJson(),
      //   encoding: Encoding.getByName('utf-8'),
      // );
      // if (dataResponse.statusCode > 300) {
      //   throw "(resp: ${dataResponse.bodyBytes})";
      // } else {
      //   final JsonResponse response = JsonResponse(
      //     success: dataResponse.statusCode == 200,
      //     status: dataResponse.statusCode,
      //     message: dataResponse.statusCode.toString(),
      //     data: dataResponse.body,
      //   );

      final dataResponse = await post(
        "${API.paths[Endpoint.postOrGetOnBoardingData]}/v2",
        onboardingData!.toRawJson(),
      );
      // debugPrint('onboardingData: ${onboardingData.toRawJson()}');
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
        //   'API: ${API.paths[Endpoint.postOrGetOnBoardingData]}\nresponse::${response.data}',
        // );
        return response;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  /// GET Method for getting the onboarding data list Information
  @override
  Future<OnboardingModel> getOnboardingDataList() async {
    try {
      final dataResponse = await get(
        API.paths[Endpoint.postOrGetOnBoardingData].toString(),
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
        //   'API: ${API.paths[Endpoint.getOnBoardingData]}\nresponse::$response',
        // );
        return OnboardingModel.fromJson(
          response.data as Map<String, dynamic>,
        );
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
