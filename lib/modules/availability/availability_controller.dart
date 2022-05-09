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

  final defaultSlot = SlotModel(startTime: 28800, endTime: 64800);

  RxList<WeeklyModel> weeklyAvailability = <WeeklyModel>[
    WeeklyModel(
      day: 1,
      // dayLabel: 'Monday',
      slots: [
        SlotModel(startTime: 28800, endTime: 64800),
        // 28800 == 08:00 // 64800 == 18:00
      ],
    ),
    WeeklyModel(
      day: 2,
      // dayLabel: 'Tuesday',
      slots: [
        SlotModel(startTime: 28800, endTime: 64800),
        // 28800 == 08:00 // 64800 == 18:00
      ],
    ),
    WeeklyModel(
      day: 3,
      // dayLabel: 'Wednesday',
      slots: [SlotModel(startTime: 28800, endTime: 64800)],
    ),
    WeeklyModel(
      day: 4,
      // dayLabel: 'Thursday',
      slots: [SlotModel(startTime: 28800, endTime: 64800)],
    ),
    WeeklyModel(
      day: 5,
      // dayLabel: 'Friday',
      slots: [SlotModel(startTime: 28800, endTime: 64800)],
    ),
    WeeklyModel(
      day: 6,
      // dayLabel: 'Saturday',
      slots: [SlotModel(startTime: 28800, endTime: 64800)],
    ),
    WeeklyModel(
      day: 7,
      // dayLabel: 'Sunday',
      slots: [SlotModel(startTime: 28800, endTime: 64800)],
    ),
  ].obs;

  Rx<String> selectedFromDateString = ''.obs;

  RxString selectedToDateString = ''.obs;

  RxBool isCustomAvailability = true.obs;

  RxBool isSubmitBtnProcessing = false.obs;

  RxBool isUpdateTrigger = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    title = (Get.arguments as List)[0].toString();
    if (title == Keys.editOperation) {
      final PeriodModel availabilityIdDataArg =
          (Get.arguments as List)[1] as PeriodModel;
      availabilityId = availabilityIdDataArg.id!;

      selectedFromDateString.value = availabilityIdDataArg.from == null
          ? ''
          : availabilityIdDataArg.from.toString();
      selectedToDateString.value = availabilityIdDataArg.to == null
          ? ''
          : availabilityIdDataArg.to.toString();

      if (availabilityIdDataArg.isCustom == 1) {
        isCustomAvailability.value = true;
      } else {
        isCustomAvailability.value = false;
      }

      final List<WeeklyModel> tempWeeklyAvailability = [];
      for (final element in availabilityIdDataArg.weekly!) {
        tempWeeklyAvailability.add(
          element.slots!.isEmpty
              ? WeeklyModel(
                  day: element.day,
                  dayLabel: element.dayLabel,
                  slots: [defaultSlot],
                  isOpen: false,
                )
              : element,
        );
      }
      weeklyAvailability.value = [];
      weeklyAvailability.addAll(tempWeeklyAvailability);
    }
  }

  void getUpdate() {
    isUpdateTrigger.value = !isUpdateTrigger.value;
    update();
  }

  void modifySlotInWeekDay({
    required bool? isRemove, // False == Add // True == Remove
    required int? dayIndex,
    required int? removeIndex,
    required SlotModel slotToBeAdd,
  }) {
    // [Remove]
    if (isRemove!) {
      // print('[Remove]');
      weeklyAvailability
              .firstWhere((element) => element.day == dayIndex)
              .slots!
              .removeAt(removeIndex!)
          // .printInfo(info: 'dayIndex:: $dayIndex')
          ;
    }
    // [Add]
    else {
      // print('[Add]');
      weeklyAvailability
          .firstWhere((element) => element.day == dayIndex)
          .slots!
          .add(slotToBeAdd);
    }
    getUpdate();
  }

  void saveButtonOnClick() {
    if (editAvailabilityFormKey.currentState!.validate()) {
      isSubmitBtnProcessing.value = switchingBooleanValue(
        boolValue: isSubmitBtnProcessing.value,
      );
      final List<WeeklyModel> tempWeeklyAvailability = [];
      if (isCustomAvailability.value == true) {
        for (final element in weeklyAvailability) {
          tempWeeklyAvailability.add(
            element.isOpen == true
                ? element
                : WeeklyModel(
                    day: element.day,
                    dayLabel: element.dayLabel,
                    slots: [],
                    isOpen: false,
                  ),
          );
        }
      }
      final PeriodModel periodToBeAddOrUpdate = PeriodModel(
        from: selectedFromDateString.value == ''
            ? null
            : DateTime.tryParse(
                selectedFromDateString.value,
              ),
        to: selectedToDateString.value == ''
            ? null
            : DateTime.tryParse(
                selectedToDateString.value,
              ),
        isCustom: isCustomAvailability.value == true ? 1 : 0,
        weekly: tempWeeklyAvailability,
      );
      makeRequestToAvailabilitiesAPI(
        operation: title,
        availabilityId: availabilityId,
        periodData: periodToBeAddOrUpdate,
      );
    }
  }

  Future<void> makeRequestToAvailabilitiesAPI({
    required String? operation,
    int? availabilityId,
    PeriodModel? periodData,
  }) async {
    final JsonResponse responseData;
    if (operation == Keys.addOperation) {
      // debugPrint('=====addOperation=====');
      responseData = await studentProvider.postStudentAvailability(
        availabilityData: periodData,
      );
    } else if (operation == Keys.editOperation) {
      // debugPrint('=====editOperation=====');
      responseData = await studentProvider.putStudentAvailability(
        availabilityId: availabilityId,
        availabilityData: periodData,
      );
    } else {
      // debugPrint('=====deleteOperation=====');
      responseData = await studentProvider.deleteStudentAvailability(
        availabilityId: availabilityId,
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
            ? 'profile.availabilityAddSuccessMsg'.tr
            : operation == Keys.editOperation
                ? 'profile.availabilityEditSuccessMsg'.tr
                : 'profile.availabilityDeleteSuccessMsg'.tr,
        //    'Successfully $operation${operation == Keys.deleteOperation ? 'd' : 'ed'} Availability Information',
        bgColor: ColorsManager.green,
        duration: DurationConstant.d1500,
      );
    }
  }
}
