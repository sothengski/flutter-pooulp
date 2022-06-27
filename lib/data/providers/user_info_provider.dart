import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../data.dart';

abstract class IUserInfoProvider {
  Future<UserModel> getUserInfo();
  Future<StudentProfileModel> getStudentProfileInfo();
  // Future<UserModel> uploadImage({File? file});
  Future<ProfileModel> uploadImage({String? filepath});
  Future<ProfileModel> putUpdateUserProfileInfo({ProfileModel? data});
  Future<StudentProfileModel> putUpdateStudentProfileInfo({
    StudentProfileModel? data,
  });
}

class UserInfoProvider extends BaseProvider implements IUserInfoProvider {
  @override
  Future<UserModel> getUserInfo() async {
    try {
      final Response dataResponse = await get(
        API.paths[Endpoint.userInfo].toString(),
      );
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        return UserModel.fromJson(
          dataResponse.body as Map<String, dynamic>,
        );
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<StudentProfileModel> getStudentProfileInfo() async {
    try {
      final Response dataResponse = await get(
        API.paths[Endpoint.studentInfo].toString(),
      );
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        return StudentProfileModel.fromJson(
          dataResponse.body as Map<String, dynamic>,
        );
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<ProfileModel> uploadImage({String? filepath, String? fileName}) async {
    const String addimageUrl = "${API.host}/users/me/profile/picture";
    final String userToken = AuthServices().getStringToken().toString();
    final Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
      "Authorization": "Bearer $userToken"
    };
    final request = http.MultipartRequest('POST', Uri.parse(addimageUrl))
      // ..fields.addAll(body)
      ..headers.addAll(headers)
      ..files.add(
        await http.MultipartFile.fromPath(
          'picture',
          filepath!,
          filename: fileName,
        ),
      );
    final response = await request.send();
    if (response.statusCode == 200 || response.statusCode == 201) {
      final respStr = await response.stream.bytesToString();
      final resp = json.decode(respStr);
      // debugPrint("respStr::$respStr ");
      // debugPrint("resp::$resp ");
      return ProfileModel.fromJson(
        resp as Map<String, dynamic>,
      );
      // return true;
    } else {
      return Future.error(response.toString());
      // return false;
    }
  }

  @override
  Future<ProfileModel> putUpdateUserProfileInfo({ProfileModel? data}) async {
    try {
      final Response dataResponse = await put(
        API.paths[Endpoint.putUpdateProfileInfo].toString(),
        data!.toRawJson(),
      );
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        return ProfileModel.fromJson(
          dataResponse.body as Map<String, dynamic>,
        );
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<StudentProfileModel> putUpdateStudentProfileInfo({
    StudentProfileModel? data,
  }) async {
    try {
      final Response dataResponse = await put(
        API.paths[Endpoint.putUpdateStudentProfileInfo].toString(),
        data!.toRawJson(),
      );
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        return StudentProfileModel.fromJson(
          dataResponse.body as Map<String, dynamic>,
        );
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // @override
  // Future<UserModel> uploadImage({File? file, String? fileName}) async {
  //   try {
  //     // final List<int> image = file!.readAsBytesSync();
  //     final form = FormData(
  //       {
  //         'picture': MultipartFile(
  //           file!.readAsBytesSync(),
  //           // await file!.readAsBytes(),
  //           filename: '$fileName.jpg',
  //         ),
  //       },
  //     );
  //     debugPrint("fileName:: $fileName");
  //     debugPrint("filePath:: ${file.path}");

  //     final dataResponse = await post(
  //       // API.postProfilePicture.toString(),
  //       "${API.host}/users/me/profile/picture",
  //       form,
  //       contentType: "multipart/form-data",
  //     );
  //     // debugPrint("postProfilePicture:: ${API.host}/users/me/profile/picture");
  //     debugPrint("dataResponse:::::: ${dataResponse.status.code}");
  //     if (dataResponse.hasError) {
  //       // debugPrint(dataResponse.body.toString());
  //       return Future.error(dataResponse.body.toString());
  //       // statusText:"SocketException: Failed host lookup: 'api.dev-lamp-01.srv.pooulp.euhttp' (OS Error: No address associated with hostname, errno =…"

  //     } else {
  //       return UserModel.fromJson(
  //         dataResponse.body as Map<String, dynamic>,
  //       );
  //     }
  //   } catch (e) {
  //     return Future.error(e.toString());
  //   }
  // }
}
