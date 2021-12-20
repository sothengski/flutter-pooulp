import 'package:get/get.dart';

import '../../core/core.dart';
import '../data.dart';

// abstract class IAuthProvider {
//   Future<Response<LoginModel>> postNewUserRegistrationAPI({
//     required RegistrationModel? registrationData,
//   });
// }

class AuthProvider extends BaseProvider {
  Future<Response<LoginModel>> loginAPI({
    required UserModel? loginData,
  }) async {
    final dataResponse = await post(
      APIEndPoints.signInEndPoint,
      loginData!.toJson(),
    );
    print('Response Data: ${dataResponse.body}');

    if (dataResponse.hasError) {
      return Future.error(dataResponse.body.toString());
    }
    return dataResponse.body
        as Response<LoginModel>; //LoginModel.fromJson(dataResponse.toString());
  }

  //implements IAuthProvider {
  // @override
  // Future<Response<LoginModel>> postNewUserRegistrationAPI({
  //   required RegistrationModel? registrationData,
  // }) async {
  //   final response = await post(
  //     "/register",
  //     registrationData,
  //   );
  //   final data = LoginModel.fromJson(response.body.toString());
  //   return Response(
  //     statusCode: response.statusCode,
  //     statusText: response.statusText,
  //     body: data,
  //   );
  // }
  Future<Response<LoginModel>> registerNewUserAPI({
    required UserModel? registrationData,
  }) async {
    // LoginModel? retrievedResponse;
    // try {
    final dataResponse = await post(
      APIEndPoints.registerNewUserEndPoint,
      registrationData!.toJson(),
    );
    print('User created: ${dataResponse.body}');

    if (dataResponse.hasError) {
      return Future.error(dataResponse.body.toString());
      // throw Exception('Error: ${dataResponse.statusText}');
    }
    // if (response.statusCode! < 205) {
    //   final apiResponse = json.decode(response.bodyString.toString());
    //   return LoginModel.fromMap(apiResponse as Map<String, dynamic>);
    // } else {
    //   customSnackbar(
    //     msgTitle: "Failure to register!",
    //     msgContent: "${response.body}",
    //     duration: const Duration(seconds: 5),
    //     bgColor: AppColors.redAccent400Color,
    //   );
    //   throw "${response.statusCode}";
    // }
    // } catch (e) {
    //   print('Error creating user: $e');
    // return Future.error(e.toString());
    // }

    return dataResponse.body
        as Response<LoginModel>; //LoginModel.fromJson(dataResponse.toString());
  }
}
