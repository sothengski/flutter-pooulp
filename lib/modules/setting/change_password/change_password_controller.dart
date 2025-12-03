import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';

class ChangePasswordController extends GetxController {
  final authProvider = Get.find<AuthProvider>();

  final passwordFormKey = GlobalKey<FormState>();

  final validator = Validator();

  TextEditingController currentPasswordCtrl = TextEditingController();
  TextEditingController newPasswordCtrl = TextEditingController();
  TextEditingController newPasswordConfirmationCtrl = TextEditingController();

  Rx<bool> showCurrentPassword = false.obs;
  Rx<bool> showNewPassword = false.obs;
  Rx<bool> showNewPasswordConfirmation = false.obs;

  Rx<bool> isSubmitBtnProcessing = false.obs;

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
                  msgTitle: 'success'.tr,
                  msgContent: 'passwordUpdated'.tr,
                  bgColor: ColorsManager.green,
                ),
                cleanUpFormData(),
              }
            else
              {
                customSnackbar(
                  msgTitle: 'failed'.tr,
                  msgContent: 'recheckPassword'.tr,
                  bgColor: ColorsManager.red,
                ),
              },
          },
        );
  }
}
