// ignore_for_file: avoid_dynamic_calls

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pooulp_flutter/data/data.dart';
import 'package:pooulp_flutter/modules/modules.dart';

import '../../core/core.dart';

class ExperienceController extends GetxController {
  final profileController = Get.find<ProfileController>();

  final studentProvider = Get.put(StudentProvider());
  final tagProvider = Get.find<TagProvider>();
  String? title;
  RxString expType = ''.obs;
  int expId = 0;

  final editExperienceFormKey = GlobalKey<FormState>();

  TextEditingController companyNameTextCtrl = TextEditingController();
  TextEditingController titleTextCtrl = TextEditingController();
  TextEditingController descriptionTextCtrl = TextEditingController();

  TextEditingController cityTextCtrl = TextEditingController();
  TextEditingController countryTextCtrl = TextEditingController();

  RxBool isCheckStillWorking = false.obs;

  Rx<String> selectedStartedDateString = ''.obs;

  RxString selectedEndDateString = ''.obs;

  List<dynamic>? tagList = [];

  Rx<bool> isSubmitBtnProcessing = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    title = Get.arguments[0].toString();
    expType.value = Get.arguments[1].toString();
    debugPrint('expType.value:: ${expType.value}');
    if (title == Keys.editOperation) {
      final ExperienceModel expDataArg = Get.arguments[2] as ExperienceModel;
      expId = expDataArg.id!;
      companyNameTextCtrl.text = expDataArg.company!;
      titleTextCtrl.text = expDataArg.name!;
      if (expDataArg.completed == 1) {
        isCheckStillWorking.value = true;
      } else {
        isCheckStillWorking.value = false;
      }
      selectedStartedDateString.value =
          expDataArg.dateStart == null ? '' : expDataArg.dateStart.toString();
      selectedEndDateString.value =
          expDataArg.dateEnd == null ? '' : expDataArg.dateEnd.toString();
      descriptionTextCtrl.text = expDataArg.description!;
      cityTextCtrl.text = expDataArg.addressCity!;
      countryTextCtrl.text = expDataArg.addressCountry!;
      tagList!.add(expDataArg.tags);
    }
  }

  String selectedDateOnClickString({DateTime? selectedItem}) {
    return selectedItem!.toString();
  }

  void saveButtonOnClick() {
    if (editExperienceFormKey.currentState!.validate()) {
      isSubmitBtnProcessing.value = switchingBooleanValue(
        boolValue: isSubmitBtnProcessing.value,
      );
      final ExperienceModel expToBeAddOrEdit = ExperienceModel(
        tags: [
          // FieldModel(id: 247),
        ],
        type: expType.value,
        company: companyNameTextCtrl.text.trim(),
        name: titleTextCtrl.text.trim(),
        completed: isCheckStillWorking.value == true ? 1 : 0,
        dateStart: selectedStartedDateString.value == ''
            ? null
            : DateTime.tryParse(
                selectedStartedDateString.value,
              ),
        dateEnd: selectedEndDateString.value == ''
            ? null
            : DateTime.tryParse(
                selectedEndDateString.value,
              ),
        addressCity: cityTextCtrl.text.trim(),
        addressCountry: countryTextCtrl.text.trim(),
        description: descriptionTextCtrl.text.trim(),
      );
      debugPrint('expToBeAddOrEdit:: ${expToBeAddOrEdit.toJson()}');

      makeRequestToExperienceAPI(
        expId: expId,
        expData: expToBeAddOrEdit,
        operation: title,
      );
    }
  }

  Future<void> makeRequestToExperienceAPI({
    int? expId,
    ExperienceModel? expData,
    required String? operation,
  }) async {
    final JsonResponse responseData;
    if (operation == Keys.addOperation) {
      debugPrint('=====addOperation=====');
      responseData =
          await studentProvider.postStudentExperience(experienceData: expData);
    } else if (operation == Keys.editOperation) {
      debugPrint('=====editOperation=====');
      responseData = await studentProvider.putStudentExperience(
        expId: expId,
        experienceData: expData,
      );
    } else {
      debugPrint('=====deleteOperation=====');
      responseData = await studentProvider.deleteStudentExperience(
        expId: expId,
      );
    }
    if (responseData.success!) {
      debugPrint('=====success=====');
      profileController.getStudentInfoResponseProvider();
      isSubmitBtnProcessing.value = switchingBooleanValue(
        boolValue: isSubmitBtnProcessing.value,
      );
      Get.back();
      customSnackbar(
        msgTitle: 'Success',
        msgContent:
            'Successfully $operation${operation == Keys.deleteOperation ? 'd' : 'ed'} Experience Information',
        bgColor: ColorsManager.green,
      );
      // }
    }
  }
}
