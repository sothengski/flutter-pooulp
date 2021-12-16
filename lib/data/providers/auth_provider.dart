import 'dart:convert';

import '../../core/core.dart';
import '../data.dart';

class AuthProvider extends BaseProvider {
  Future<LoginModel> postNewUserRegistrationAPI({
    required RegistrationModel? registrationData,
  }) async {
    try {
      final response = await post(
        APIEndPoints.registerNewUserEndPoint,
        registrationData!.toJson(),
      );
      if (response.statusCode! < 205) {
        final apiResponse = json.decode(response.bodyString.toString());
        return LoginModel.fromMap(apiResponse as Map<String, dynamic>);
      } else {
        customSnackbar(
          msgTitle: "Failure to register!",
          msgContent: "${response.body}",
          duration: const Duration(seconds: 5),
          bgColor: AppColors.redAccent400Color,
        );
        throw "${response.statusCode}";
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
