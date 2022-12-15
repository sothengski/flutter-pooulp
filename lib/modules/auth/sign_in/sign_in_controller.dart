import 'package:flutter/material.dart';
import 'package:flutter_keychain/flutter_keychain.dart';
import 'package:get/get.dart';
import 'package:linkedin_login/linkedin_login.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';
import '../../../routes/routes.dart';
import '../../modules.dart';

class SignInController extends GetxController with StateMixin<LoginModel> {
  final authProvider = Get.find<AuthProvider>();
  final languageController = Get.put(LanguageController());

  final signInFormKey = GlobalKey<FormState>();
  // final formFieldKey = GlobalKey<FormFieldState>();

  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  RxBool showPassword = false.obs;

  RxBool isSubmitBtnProcessing = false.obs;

  late LoginModel loginRepsonseData;

  String? socialMediaEmail;
  String? socialMediaUserId;
  String? socialMediaFirstName;
  String? socialMediaLastName;
  String? socialMediaToken;

  RxString firstStart = ''.obs;

  FirebaseDynamicLinkService firebase = FirebaseDynamicLinkService();

  // @override
  // void onInit() {
  //   final String lang = StorageServices().readData('language') as String;
  //   print('lang: $lang');
  //   super.onInit();
  // }

  @override
  Future<void> onReady() async {
    await deepLink();
    await initPlatformState();
    super.onReady();
  }

  Future<void> deepLink() async {
    await Future.delayed(
      DurationConstant.d2000,
      () async => {await firebase.handleDeepLinks()},
    );
  }

  @override
  void dispose() {
    super.dispose();
    // Clean up the controller when the Widget is disposed
    emailCtrl.dispose();
    passwordCtrl.dispose();
  }

  Future googleSignInMethod() async {
    final userInfo = await GoogleSignInApi.login();
    final userToken = await GoogleSignInApi.getUserToken();

    debugPrint("googleSignInMethod");
    if (userInfo!.id.isNotEmpty) {
      socialMediaEmail = userInfo.email;
      socialMediaUserId = userInfo.id;
      final splittedDisplayName = userInfo.displayName!.split(' ');
      socialMediaFirstName = splittedDisplayName[0];
      socialMediaLastName = splittedDisplayName[1]; //userInfo.displayName;
      socialMediaToken = userToken!.accessToken;

      debugPrint("email:: ${userInfo.email}");
      debugPrint("serverAuthCode:: ${userInfo.serverAuthCode}");
      debugPrint("displayName:: ${userInfo.displayName}");
      debugPrint("FirstName:: $socialMediaFirstName");
      debugPrint("LastName:: $socialMediaLastName");
      debugPrint("id:: ${userInfo.id}");
      debugPrint("AccessToken:: ${userToken.accessToken}");
      debugPrint("IdToken:: ${userToken.idToken}");
    }
  }

  Future linkedInSignInMethod({
    String? redirectUrl = APIKeys.linkedInRedirectUrl,
    String? clientId = APIKeys.linkedInClientId,
    String? clientSecret = APIKeys.linkedInClientSecret,
  }) async {
    Get.dialog(
      LinkedInUserWidget(
        appBar: AppBar(
          title: const Text('widget.title'),
        ),

        // redirectUrl: redirectUrl ?? APIKeys.linkedInRedirectUrl,
        // clientId: clientId ?? APIKeys.linkedInClientId,
        // clientSecret: clientSecret ?? APIKeys.linkedInClientSecret,
        redirectUrl: redirectUrl,
        clientId: clientId,
        clientSecret: clientSecret,
        onGetUserProfile: (linkedInUser) async {
          if (linkedInUser.user.userId != null) {
            debugPrint(
              'Access token ${linkedInUser.user.token.accessToken}',
            );
            debugPrint('User id: ${linkedInUser.user.userId}');
            debugPrint(
              'User email: ${linkedInUser.user.email!.elements![0].handleDeep!.emailAddress}',
            );
            debugPrint(
              'User firstName: ${linkedInUser.user.localizedFirstName}',
            );
            debugPrint('User lastName: ${linkedInUser.user.localizedLastName}');
            socialMediaEmail =
                linkedInUser.user.email!.elements![0].handleDeep!.emailAddress;
            socialMediaUserId = linkedInUser.user.userId;
            socialMediaFirstName = linkedInUser.user.localizedFirstName;
            socialMediaLastName = linkedInUser.user.localizedLastName;
            socialMediaToken = linkedInUser.user.token.accessToken;
            Get.back();
          }
          // user = UserObject(
          //   firstName: linkedInUser.user.firstName?.localized?.label,
          //   lastName: linkedInUser.user.lastName?.localized?.label,
          //   email:
          //       linkedInUser.user.email?.elements[0].handleDeep?.emailAddress,
          //   profileImageUrl: linkedInUser.user.profilePicture
          //       ?.displayImageContent?.elements[0].identifiers[0].identifier,
          // );

          /// This api call retrives profile picture
          // final Response response = await dio.get(
          //   "https://api.linkedin.com/v2/me?projection=(profilePicture(displayImage~:playableStreams))",
          //   options: Options(
          //     responseType: ResponseType.json,
          //     sendTimeout: 60000,
          //     receiveTimeout: 60000,
          //     headers: {
          //       HttpHeaders.authorizationHeader:
          //           "Bearer ${linkedInUser.token.accessToken}"
          //     },
          //   ),
          // );
          // final profilePic = response.data["profilePicture"]["displayImage~"]
          //     ["elements"][0]["identifiers"][0]["identifier"];

          // final Map<String, dynamic> postJson = {
          //   "user_id": linkedInUser.userId,
          //   "email": linkedInUser.email.elements[0].handleDeep.emailAddress,
          //   "pic_url": profilePic,
          //   "name":
          //       '${linkedInUser.firstName.localized.label} ${linkedInUser.lastName.localized.label}',
          //   "token": linkedInUser.token.accessToken,
          //   "expires_in": linkedInUser.token.expiresIn
          // };
          // setState(() {
          //   result = postJson;
          // });
          // Navigator.of(context).pop();
        },
        // catchError: (LinkedInErrorObject error) {
        //   print(
        //     'Error description: ${error.description} Error code: ${error.statusCode.toString()}',
        //   );
        // },
      ),
    );
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      final firstStartFromKey = await FlutterKeychain.get(key: "firstStart");
      print("try: initPlatformState");
      if (firstStartFromKey == null) {
        await FlutterKeychain.put(
          key: "firstStart",
          value: DateTime.now().toIso8601String(),
        );
      }

      // If the widget was removed from the tree while the asynchronous platform
      // message was in flight, we want to discard the reply rather than calling
      // setState to update our non-existent appearance.
      // if (!mounted) return;

      // setState(() {
      if (firstStartFromKey!.isNotEmpty) {
        firstStart.value = "Was never started before. Restart and see .";
        // print('if ${firstStart.value}');
      } else {
        firstStart.value = firstStartFromKey;
        // print('else ${firstStart.value}');
      }
      // });
    } on Exception catch (ae) {
      print("Exception: $ae");
    }
  }

  bool showPasswordBoolSwitching({bool? boolValue}) =>
      showPassword.value = !boolValue!;

  bool swithcingBoolValueLoginBtn({bool? boolValue}) {
    return isSubmitBtnProcessing.value = boolValue!;
  }

  void clearData() {
    emailCtrl.clear();
    passwordCtrl.clear();
    isSubmitBtnProcessing.value = false;
  }

  Future<void> loginButtonOnClick() async {
    if (signInFormKey.currentState!.validate()) {
      swithcingBoolValueLoginBtn(boolValue: true);
      final loginData = ProfileModel(
        email: emailCtrl.text.trim(),
        password: passwordCtrl.text.trim(),
      );
      authProvider
          .logInAPI(
        loginData: loginData,
      )
          .then(
        (value) async {
          swithcingBoolValueLoginBtn(boolValue: false);
          final bool loginStatus = await AuthServices().saveUserToken(
            bodyData: value,
          );
          if (loginStatus == true) {
            Get.offAllNamed(Routes.homeRoute);
          } else {
            customSnackbar(
              msgTitle: "Can't save user Data",
              msgContent: "Can't save user Data",
              bgColor: ColorsManager.red,
            );
          }
          clearData();
          change(
            value,
            status: RxStatus.success(),
          );
        },
        onError: (error) {
          swithcingBoolValueLoginBtn(boolValue: false);
          customSnackbar(
            msgTitle: 'sthWentWrong'.tr,
            msgContent: "$error",
            bgColor: ColorsManager.red,
          );
          change(
            null,
            status: RxStatus.error(error.toString()),
          );
        },
      );
    }
  }
}
