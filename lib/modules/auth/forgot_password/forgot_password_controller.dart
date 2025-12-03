import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';

class ForgotPasswordController extends GetxController {
  final authProvider = Get.find<AuthProvider>();

  final forgotPasswordFormKey = GlobalKey<FormState>();

  TextEditingController emailCtrl = TextEditingController();

  RxBool isSubmitBtnProcessing = false.obs;

  RxBool isForgotPwdForm = true.obs;

  @override
  void dispose() {
    super.dispose();
    // Clean up the controller when the Widget is disposed
    emailCtrl.dispose();
  }

  void clearData() {
    emailCtrl.clear();
  }

  bool switchBoolValue() {
    return isForgotPwdForm.value = true;
  }

  Future<void> sendEmailButtonOnClick() async {
    if (forgotPasswordFormKey.currentState!.validate()) {
      isSubmitBtnProcessing.value = switchingBooleanValue(
        boolValue: isSubmitBtnProcessing.value,
      );
      authProvider
          .postForgotPassword(
        email: emailCtrl.text,
      )
          .then(
        (value) {
          // isSubmitBtnProcessing.value = switchingBooleanValue(
          //   boolValue: isSubmitBtnProcessing.value,
          // );
          if (value.success == true) {
            isForgotPwdForm.value = false;
            customSnackbar(
              msgTitle: 'emailSent'.tr, //'auth.emailSent'.tr,
              msgContent: 'emailHasBeenSentToYourEmailAddress'.tr,
              // 'auth.sentToEmail'.trParams({'email': emailCtrl.text}),
              bgColor: ColorsManager.green,
            );
          } else {
            customSnackbar(
              msgTitle: value.status.toString(),
              msgContent: value.message.toString(),
              bgColor: ColorsManager.red,
            );
          }
          isSubmitBtnProcessing.value = switchingBooleanValue(
            boolValue: isSubmitBtnProcessing.value,
          );
        },
      );
    }
  }
}
