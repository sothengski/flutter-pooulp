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
      final dataResponse = await post(
        API.paths[Endpoint.postOrGetOnBoardingData].toString(),
        onboardingData!.toRawJson(),
      );
      // debugPrint(
      //   'onboardingData: ${onboardingData.toRawJson()}',
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
        // debugPrint(
        //   'API: ${API.paths[Endpoint.postOrGetOnBoardingData]}\nresponse::$response',
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
