import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';

class ChangePasswordController extends GetxController {
  final authProvider = Get.find<AuthProvider>();

  final passwordFormKey = GlobalKey<FormState>();

  TextEditingController currentPasswordCtrl = TextEditingController();
  TextEditingController newPasswordCtrl = TextEditingController();
  TextEditingController newPasswordConfirmationCtrl = TextEditingController();

  Rx<bool> showCurrentPassword = false.obs;
  Rx<bool> showNewPassword = false.obs;
  Rx<bool> showNewPasswordConfirmation = false.obs;

  Rx<bool> isSubmitBtnProcessing = false.obs;

  String? matchingPasswords() {
    if (stringsComparation(
      object1: newPasswordCtrl.text,
      object2: newPasswordConfirmationCtrl.text,
    )) {
      return Validator()
          .passwordValidatorWithMin6Chars(newPasswordConfirmationCtrl.text);
    } else {
      return 'validator.passwordsDontMatch'.tr;
    }
  }

  void cleanUpFormData() {
    currentPasswordCtrl.text = '';
    newPasswordCtrl.text = '';
    newPasswordConfirmationCtrl.text = '';
  }

  Future<void> summitAndValidateData() async {
    if (passwordFormKey.currentState!.validate()) {
      isSubmitBtnProcessing.value = switchingBooleanValue(
        boolValue: isSubmitBtnProcessing.value,
      );
      // debugPrint(
      //   '''
      //   :::::Change Password Data Validate:::::
      //   ====##====
      //     "currentPasswordCtrl": ${currentPasswordCtrl.text},
      //     "newPasswordCtrl": ${newPasswordCtrl.text},
      //     "newPasswordConfirmationCtrl": ${newPasswordConfirmationCtrl.text},
      //   ====##====
      //   ''',
      // );
      await Future.delayed(DurationConstant.d1000);
      // cleanUpFormData();
      makeRequestToUserProfileAPI(
        currentPasswordData: currentPasswordCtrl.text,
        newPasswordData: newPasswordCtrl.text,
        newPasswordConfirmationData: newPasswordConfirmationCtrl.text,
      );
      isSubmitBtnProcessing.value = switchingBooleanValue(
        boolValue: isSubmitBtnProcessing.value,
      );
    }
  }

  void makeRequestToUserProfileAPI({
    required String? currentPasswordData,
    required String? newPasswordData,
    required String? newPasswordConfirmationData,
  }) {
    authProvider
        .putChangePassword(
          currentPassword: currentPasswordData,
          newPassword: newPasswordData,
          newPasswordConfirmation: newPasswordConfirmationData,
        )
        .then(
          (value) => {
            if (value.status == 200)
              {
                customSnackbar(
                  msgTitle: 'Success',
                  msgContent: 'Your Password Successfully Updated.',
                  bgColor: ColorsManager.green,
                ),
                cleanUpFormData(),
              }
            else
              {
                customSnackbar(
                  msgTitle: 'Failed',
                  msgContent: 'Please check your current password again.',
                  bgColor: ColorsManager.red,
                ),
              }
          },
        );
  }
}
