import 'package:get/get.dart';

import '../../core/core.dart';
import '../data.dart';

abstract class IUserInfoProvider {
  Future<UserModel> getUserInfo();
  Future<StudentProfileModel> getStudentProfileInfo();
}

class UserInfoProvider extends BaseProvider implements IUserInfoProvider {
  @override
  Future<UserModel> getUserInfo() async {
    try {
      final Response dataResponse = await get(
        APIEndPoints.userInfo,
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
        APIEndPoints.studentInfo,
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
}
