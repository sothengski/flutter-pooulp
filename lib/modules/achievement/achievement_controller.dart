import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import '../../data/data.dart';
import '../modules.dart';

class AchievementController extends GetxController {
  final profileController = Get.find<ProfileController>();
  final studentProvider = Get.put(StudentProvider());

  String? title;
  int achievementId = 0;

  final editAchievementFormKey = GlobalKey<FormState>();

  TextEditingController achievementNameTextCtrl = TextEditingController();
  TextEditingController descriptionTextCtrl = TextEditingController();

  Rx<String> selectedCompletionDateString = ''.obs;

  Rx<bool> isSubmitBtnProcessing = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    title = (Get.arguments as List)[0].toString();
    if (title == Keys.editOperation) {
      final AchievementModel achievementDataArg =
          (Get.arguments as List)[1] as AchievementModel;
      achievementId = achievementDataArg.id!;
      achievementNameTextCtrl.text = achievementDataArg.name!;
      descriptionTextCtrl.text = achievementDataArg.description!;
      selectedCompletionDateString.value =
          achievementDataArg.dateCompletion == null
              ? ''
              : achievementDataArg.dateCompletion.toString();
    }
  }

  void saveButtonOnClick() {
    if (editAchievementFormKey.currentState!.validate()) {
      isSubmitBtnProcessing.value = switchingBooleanValue(
        boolValue: isSubmitBtnProcessing.value,
      );
      final AchievementModel achievementDataToBeAddOrEdit = AchievementModel(
        name: achievementNameTextCtrl.text.trim(),
        dateCompletion: selectedCompletionDateString.value == ''
            ? null
            : DateTime.tryParse(
                selectedCompletionDateString.value,
              ),
        description: descriptionTextCtrl.text.trim(),
      );
      makeRequestToAchievementAPI(
        achievementId: achievementId,
        achievementData: achievementDataToBeAddOrEdit,
        operation: title,
      );
    }
  }

  Future<void> makeRequestToAchievementAPI({
    int? achievementId,
    AchievementModel? achievementData,
    required String? operation,
  }) async {
    final JsonResponse responseData;
    if (operation == Keys.addOperation) {
      // debugPrint('=====addOperation=====');
      responseData = await studentProvider.postStudentAchievement(
        achievementData: achievementData,
      );
    } else if (operation == Keys.editOperation) {
      // debugPrint('=====editOperation=====');
      responseData = await studentProvider.putStudentAchievement(
        achievementId: achievementId,
        achievementData: achievementData,
      );
    } else {
      // debugPrint('=====deleteOperation=====');
      responseData = await studentProvider.deleteStudentAchievement(
        achievementId: achievementId,
      );
    }
    if (responseData.success!) {
      // debugPrint('=====success=====');
      profileController.getStudentInfoResponseProvider();
      isSubmitBtnProcessing.value = switchingBooleanValue(
        boolValue: isSubmitBtnProcessing.value,
      );
      Get.back();
      customSnackbar(
        msgTitle: 'core.success'.tr,
        msgContent: operation == Keys.addOperation
            ? 'profile.achievementAddSuccessMsg'.tr
            : operation == Keys.editOperation
                ? 'profile.achievementEditSuccessMsg'.tr
                : 'profile.achievementDeleteSuccessMsg'.tr,
        //    'Successfully $operation${operation == Keys.deleteOperation ? 'd' : 'ed'} Achievement Information',
        bgColor: ColorsManager.green,
        duration: DurationConstant.d1500,
      );
    }
  }
}
