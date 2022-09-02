// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';

import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../data.dart';

class AuthProvider extends BaseProvider {
  Future<LoginModel> logInAPI({
    required ProfileModel? loginData,
  }) async {
    try {
      final Response dataResponse = await post(
        API.paths[Endpoint.signIn],
        loginData!.toRawJson(),
      );
      if (dataResponse.hasError) {
        throw responseBodyHandler(resp: dataResponse);
      } else {
        final data = json.decode(dataResponse.bodyString.toString());
        return LoginModel.fromJson(data as Map<String, dynamic>);
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<String> logOutAPI() async {
    try {
      final Response dataResponse = await post(
        API.paths[Endpoint.signOut],
        {},
      );
      if (dataResponse.hasError) {
        throw responseBodyHandler(resp: dataResponse);
      } else {
        // customSnackbar(
        //   msgTitle: 'Log Out Successfully!',
        //   msgContent: '${dataResponse.bodyString}',
        // );
        return dataResponse.bodyString.toString();
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<LoginModel> registerNewUserAPI({
    required ProfileModel? registrationData,
  }) async {
    try {
      final Response dataResponse = await post(
        API.paths[Endpoint.registerNewUser],
        registrationData!.toRawJson(),
      );
      if (dataResponse.hasError) {
        throw responseBodyHandler(resp: dataResponse);
        // return Future.error(dataResponse.body.toString());
        // throw Exception('Error: ${dataResponse.statusText}');
      } else {
        final data = json.decode(dataResponse.bodyString.toString());
        return LoginModel.fromJson(data as Map<String, dynamic>);
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Object responseBodyHandler({Response? resp}) {
  //   return '''${resp!.body['invitation_token'][0] != null ? "\n- ${resp.body['invitation_token']?[0]}" : ""}'''
  //           '''${resp.body['email'] != null ? "\n- ${resp.body!['email']?[0]}" : ""}'''
  //           '''${resp.body!['password'] != null ? "\n- ${resp.body!['password']?[0]}" : ""}'''
  //           '''${resp.body['message'] != null ? "\n- ${resp.body!['message']} ${resp.statusCode == 429 ? '' : ': Please Check your email and Password.'}" : ""}'''
  //       // "${reps.body['code'] != null ? "\n- ${reps.body!['code']}" : ""}"
  //       ;
  // }

  Object responseBodyHandler({Response? resp}) {
    return resp!.body['message'] != null
            ? "\n- ${resp.body!['message']} ${resp.statusCode == 429 ? '' : ': Please Check your email and Password.'}"
            : ""
        // ''' "${resp.body['code'] != null ? "\n- ${resp.body!['code']}" : ""}"'''
        ;
  }

  ///===== Top of Change Password Section =====//
  ///
  ///PUT Method for Change Password
  Future<JsonResponse> putChangePassword({
    required String? currentPassword,
    required String? newPassword,
    required String? newPasswordConfirmation,
  }) async {
    try {
      final dataResponse = await put(
        API.paths[Endpoint.putChangePassword].toString(),
        {
          "password": currentPassword,
          "newPassword": newPassword,
          "newPassword_confirmation": newPasswordConfirmation,
        },
      );
      // debugPrint(
      //   '''
      //   ${API.paths[Endpoint.putChangePassword].toString()},
      //   {
      //     "password": $currentPassword,
      //     "newPassword": $newPassword,
      //     "newPassword_confirmation": $newPasswordConfirmation,
      //   },
      //   ''',
      // );
      final JsonResponse response = JsonResponse(
        success: dataResponse.status.isOk,
        status: dataResponse.statusCode,
        message: dataResponse.statusText,
        data: dataResponse.body,
      );
      // if (dataResponse.hasError) {
      //   // throw "(resp: ${dataResponse.bodyString})";
      //   return response;
      // } else {
      return response;
      // }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  ///===== Top of Forgot Password Section =====//
  ///
  ///POST Method for Forgot Password
  Future<JsonResponse> postForgotPassword({
    required String? email,
  }) async {
    try {
      final dataResponse = await post(
        API.paths[Endpoint.postForgotPassword].toString(),
        {
          "email": email,
        },
      );
      // debugPrint(
      //   '''
      //   ${API.paths[Endpoint.postForgotPassword].toString()},
      //   {"email": $email,},
      //   ''',
      // );
      final JsonResponse response = JsonResponse(
        success: dataResponse.status.isOk,
        status: dataResponse.statusCode,
        message: dataResponse.statusText,
        data: dataResponse.body,
      );
      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  ///===== Top of Delete User Account Section =====//
  ///
  ///DELETE Method for Auth Delete User Account Information
  Future<JsonResponse> deleteUserAccount() async {
    try {
      final dataResponse = await delete(
        API.paths[Endpoint.userInfo].toString(),
      );
      final JsonResponse response = JsonResponse(
        success: dataResponse.status.isOk,
        status: dataResponse.statusCode,
        message: dataResponse.statusText,
        data: dataResponse.body,
      );
      // if (dataResponse.hasError) {
      //   // throw "(resp: ${dataResponse.bodyString})";
      //   return response;
      // } else {
      return response;
      // }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  ///===== Top of Verify Email Section =====//
  ///
  ///POST Method for Verify Email
  Future<JsonResponse> verifyEmail({
    required String? email,
  }) async {
    try {
      final dataResponse = await post(
        API.paths[Endpoint.postVerifyEmail].toString(),
        {
          "email": email,
        },
      );
      final JsonResponse response = JsonResponse(
        success: dataResponse.status.isOk,
        status: dataResponse.statusCode,
        message: dataResponse.statusText,
        data: dataResponse.body,
      );
      debugPrint('response: $response');
      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<LoginModel> refreshTokenAPI() async {
    try {
      // log('refreshTokenAPI:: ${API.host}${API.paths[Endpoint.postRefreshToken].toString()}');
      final Response dataResponse = await post(
        '${API.host}${API.paths[Endpoint.postRefreshToken]}',
        {},
        headers: {
          'Authorization': 'Bearer ${getUserToken()}',
        },
      );
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final data = json.decode(dataResponse.bodyString.toString());
        final LoginModel loginData =
            LoginModel.fromJson(data as Map<String, dynamic>);
        await AuthServices().saveUserToken(
          bodyData: loginData,
        );
        return loginData; //LoginModel.fromJson(data as Map<String, dynamic>);
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}


// RESPONSE CODES#
// 200: Success
// 202: Accepted
// 400: Bad request (missing or invalid params)
// 401: Unauthorized (invalid API key)
// 402: Payment required (organization disabled or usage exceeded)
// 403: Forbidden (insufficient permissions)
// 404: Not found
// 409: Conflict
// 429: Too many requests (rate limit exceeded, no state change, or selective throttling)
// 451: Unavailable for legal reasons (country blacklisted)
// 500: Internal server error
// 503: Service temporarily unavailable
