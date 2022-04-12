import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import '../../data/data.dart';
import '../../modules/modules.dart';

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

  // List<dynamic>? tagList = [];
  Rx<int> experienceTypeInt = 0.obs;

  Rx<FieldModel> selectedExperienceType = FieldModel(label: '').obs;

  RxList<FieldModel> experienceTypeList = <FieldModel>[].obs;

  Rx<bool> isSubmitBtnProcessing = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    title = (Get.arguments as List)[0].toString();
    expType.value = (Get.arguments as List)[1].toString();
    if (title == Keys.editOperation) {
      final ExperienceModel expDataArg =
          (Get.arguments as List)[2] as ExperienceModel;
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
      if (expType.value == AppStrings.personalKey) {
        experienceTypeInt.value = expDataArg.tags!.first! as int;
      }
    }
    if (expType.value == AppStrings.personalKey) {
      await getExperienceTypeListResponseProvider();
      if (title == Keys.editOperation) {
        selectedExperienceType.value = experienceTypeList.firstWhere(
          (element) => element.id == experienceTypeInt.value,
        );
      }
    }
  }

  Future<List<FieldModel>> getExperienceTypeListResponseProvider({
    bool? refresh = false,
  }) async {
    experienceTypeList.addAll(await tagProvider.getExperienceTypes());
    return experienceTypeList;
  }

  FieldModel selectedExperienceTypeOnClick({FieldModel? selectedItem}) {
    return selectedItem!;
  }

  void saveButtonOnClick() {
    if (editExperienceFormKey.currentState!.validate()) {
      isSubmitBtnProcessing.value = switchingBooleanValue(
        boolValue: isSubmitBtnProcessing.value,
      );
      final ExperienceModel expToBeAddOrEdit = ExperienceModel(
        tags: [selectedExperienceType.value],
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
      // debugPrint('=====addOperation=====');
      responseData = await studentProvider.postStudentExperience(
        experienceData: expData,
      );
    } else if (operation == Keys.editOperation) {
      // debugPrint('=====editOperation=====');
      responseData = await studentProvider.putStudentExperience(
        expId: expId,
        experienceData: expData,
      );
    } else {
      // debugPrint('=====deleteOperation=====');
      responseData = await studentProvider.deleteStudentExperience(
        expId: expId,
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
            ? 'profile.expAddSuccessMsg'.tr
            : operation == Keys.editOperation
                ? 'profile.expEditSuccessMsg'.tr
                : 'profile.expDeleteSuccessMsg'.tr,
        // 'Successfully $operation${operation == Keys.deleteOperation ? 'd' : 'ed'} Experience Information',
        bgColor: ColorsManager.green,
        duration: DurationConstant.d1500,
      );
      // }
    }
  }
}
