import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';
import '../../../routes/routes.dart';

class SignInController extends GetxController with StateMixin<LoginModel> {
  final authProvider = Get.find<AuthProvider>();

  final signInFormKey = GlobalKey<FormState>();
  final formFieldKey = GlobalKey<FormFieldState>();

  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  RxBool showPassword = false.obs;

  RxBool isSubmitBtnProcessing = false.obs;

  late LoginModel loginRepsonseData;

  @override
  void dispose() {
    super.dispose();
    // Clean up the controller when the Widget is disposed
    emailCtrl.dispose();
    passwordCtrl.dispose();
  }

  bool showPasswordBoolSwitching({bool? boolValue}) =>
      showPassword.value = !boolValue!;

  bool swithcingBoolValueLoginBtn({bool? value}) {
    return isSubmitBtnProcessing.value = value!;
  }

  void clearData() {
    emailCtrl.clear();
    passwordCtrl.clear();
    isSubmitBtnProcessing.value = false;
  }

  dynamic loginButtonOnClick() async {
    if (signInFormKey.currentState!.validate()) {
      swithcingBoolValueLoginBtn(value: true);
      final loginData = UserModel(
        email: emailCtrl.text.trim(),
        password: passwordCtrl.text.trim(),
      );
      authProvider
          .loginAPI(
        loginData: loginData,
      )
          .then(
        (value) {
          swithcingBoolValueLoginBtn(value: false);
          Get.dialog(
            const CustomAlertDialog(
              title: "SUCCESS!",
              content: "You're now a member of Pooulp.",
              routePath: Routes.homeRoute,
              type: AlertDialogType.success,
              buttonLabel: "Continue",
            ),
            barrierDismissible: true,
          );
          // clearData();
          change(
            value,
            status: RxStatus.success(),
          );
        },
        onError: (error) {
          swithcingBoolValueLoginBtn(value: false);
          customSnackbar(
            msgTitle: "Something went wrong!",
            msgContent: "$error",
            bgColor: AppColors.redColor,
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
