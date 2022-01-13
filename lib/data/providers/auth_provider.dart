import 'dart:convert';

import 'package:get/get.dart';

import '../../core/core.dart';
import '../data.dart';

class AuthProvider extends BaseProvider {
  Future<LoginModel> logInAPI({
    required ProfileModel? loginData,
  }) async {
    try {
      final Response dataResponse = await post(
        APIEndPoints.signInEndPoint,
        loginData!.userToJson(),
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
        APIEndPoints.signOutEndPoint,
        {},
      );
      if (dataResponse.hasError) {
        throw responseBodyHandler(resp: dataResponse);
      } else {
        customSnackbar(
          msgTitle: 'Log Out Successfully!',
          msgContent: '${dataResponse.bodyString}',
        );
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
        APIEndPoints.registerNewUserEndPoint,
        registrationData!.userToJson(),
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

  Object responseBodyHandler({Response? resp}) {
    return '''${resp!.body['invitation_token']?[0] != null ? "\n- ${resp.body['invitation_token']?[0]}" : ""}'''
            '''${resp.body['email'] != null ? "\n- ${resp.body!['email']?[0]}" : ""}'''
            '''${resp.body!['password'] != null ? "\n- ${resp.body!['password']?[0]}" : ""}'''
            '''${resp.body['message'] != null ? "\n- ${resp.body!['message']} ${resp.statusCode == 429 ? '' : ': Please Check your email and Password.'}" : ""}'''
        // "${reps.body['code'] != null ? "\n- ${reps.body!['code']}" : ""}"
        ;
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
