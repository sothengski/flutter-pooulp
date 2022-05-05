import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import '../../data/data.dart';
import '../modules.dart';

class AvailabilityController extends GetxController {
  final profileController = Get.find<ProfileController>();
  final studentProvider = Get.put(StudentProvider());

  String? title;
  int availabilityId = 0;

  final editAvailabilityFormKey = GlobalKey<FormState>();

  RxList<WeeklyModel> weeklyAvailability = <WeeklyModel>[
    WeeklyModel(
      day: 1,
      dayLabel: 'Monday',
      slots: [
        SlotModel(startTime: 28800, endTime: 75600),
        SlotModel(startTime: 88800, endTime: 95600)
      ],
    ),
    WeeklyModel(
      day: 2,
      dayLabel: 'Tuesday',
      slots: [
        SlotModel(startTime: 28800, endTime: 75600),
      ],
    ),
    WeeklyModel(
      day: 3,
      dayLabel: 'Wednesday',
    ),
    WeeklyModel(
      day: 4,
      dayLabel: 'Thursday',
    ),
    WeeklyModel(
      day: 5,
      dayLabel: 'Friday',
    ),
    WeeklyModel(
      day: 6,
      dayLabel: 'Saturday',
    ),
    WeeklyModel(
      day: 7,
      dayLabel: 'Sunday',
    ),
  ].obs;

  RxList<bool> weeklyAvailabilitiesList =
      <bool>[true, true, true, true, true, true, true, true].obs;

  Rx<String> selectedFromDateString = ''.obs;

  RxString selectedToDateString = ''.obs;

  RxBool isCustomAvailability = false.obs;

  RxBool isSubmitBtnProcessing = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    title = (Get.arguments as List)[0].toString();
    if (title == Keys.editOperation) {
      // final AchievementModel achievementDataArg =
      //     (Get.arguments as List)[1] as AchievementModel;
      // availabilityId = availabilityIdDataArg.id!;

      // selectedCompletionDateString.value =
      //     achievementDataArg.dateCompletion == null
      //         ? ''
      //         : achievementDataArg.dateCompletion.toString();
    }
  }

  void getUpdate() {
    update();
  }

  void saveButtonOnClick() {
    if (editAvailabilityFormKey.currentState!.validate()) {
      isSubmitBtnProcessing.value = switchingBooleanValue(
        boolValue: isSubmitBtnProcessing.value,
      );
      debugPrint('save:: $weeklyAvailability');
      // makeRequestToAchievementAPI();
    }
  }

  Future<void> makeRequestToAchievementAPI({
    int? achievementId,
    AchievementModel? achievementData,
    required String? operation,
  }) async {
    isSubmitBtnProcessing.value = switchingBooleanValue(
      boolValue: isSubmitBtnProcessing.value,
    );
  }
}
