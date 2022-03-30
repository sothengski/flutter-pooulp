// ignore_for_file: avoid_dynamic_calls

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import '../../data/data.dart';
import '../modules.dart';

class LanguageUsageController extends GetxController {
  final profileController = Get.find<ProfileController>();
  final studentProvider = Get.put(StudentProvider());
  final tagProvider = Get.find<TagProvider>();

  String? title;
  int langaugeId = 0;

  final editLangaugeFormKey = GlobalKey<FormState>();

  Rx<FieldModel> selectedLanguage = FieldModel().obs;

  Rx<FieldModel> selectedProficiency = FieldModel(label: '').obs;

  Rx<bool> isSubmitBtnProcessing = false.obs;

  RxList<FieldModel> allLanguageListFromAPI = <FieldModel>[].obs;

  RxList<FieldModel> languageListForSelection = <FieldModel>[].obs;

  RxList<FieldModel> proficiencyList = <FieldModel>[
    // FieldModel(id: 0, label: LanguageLevelStrings.levelUndefined, level: 0),
    FieldModel(id: 1, label: LevelStrings.beginner, level: 1),
    FieldModel(id: 2, label: LevelStrings.intermediate, level: 2),
    FieldModel(id: 3, label: LevelStrings.professional, level: 3),
    FieldModel(id: 4, label: LevelStrings.motherTongue, level: 4),
  ].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    title = Get.arguments[0].toString();
    await getLanguagesListResponseProvider();
    languageListFilter();
  }

  Future<List<FieldModel>> getLanguagesListResponseProvider({
    bool? refresh = false,
  }) async {
    allLanguageListFromAPI.addAll(await tagProvider.getLanguages());
    languageListForSelection.addAll(allLanguageListFromAPI);
    return allLanguageListFromAPI;
  }

  void languageListFilter() {
    for (final item
        in profileController.studentInfoRepsonse.value.spokenLanguages!) {
      languageListForSelection.removeWhere(
        (element) => item.tagId == element.id,
      );
    }
    // print(
    //   '''
    //   languageListForSelection Length :: ${languageListForSelection.length}
    //   languageListForSelection :: $languageListForSelection''',
    // );
  }

  void clearDataFromForm() {
    selectedLanguage.value = FieldModel();
    selectedProficiency.value = FieldModel(label: '');
  }

  FieldModel selectedLanguageOnClick({FieldModel? selectedItem}) {
    return selectedItem!;
  }

  Future<void> saveButtonOnClick() async {
    if (editLangaugeFormKey.currentState!.validate()) {
      isSubmitBtnProcessing.value = switchingBooleanValue(
        boolValue: isSubmitBtnProcessing.value,
      );
      // debugPrint(
      //   'selectedLanguage:: $selectedLanguage',
      // );
      // debugPrint(
      //   'selectedProficiency:: $selectedProficiency',
      // );
      final FieldModel fieldDataToBeAddOrEdit = FieldModel(
        tagId: selectedLanguage.value.id,
        level: selectedProficiency.value.level,
        videoUrl: '',
      );
      await makeRequestToSpokenLanguageAPI(
        spokenLanguageId: selectedLanguage.value.id,
        spokenLanguageData: fieldDataToBeAddOrEdit,
        operation: title,
      );
      isSubmitBtnProcessing.value = switchingBooleanValue(
        boolValue: isSubmitBtnProcessing.value,
      );
    }
  }

  Future<void> makeRequestToSpokenLanguageAPI({
    required int? spokenLanguageId,
    FieldModel? spokenLanguageData,
    required String? operation,
  }) async {
    final JsonResponse responseData;
    if (operation == Keys.addOperation) {
      // debugPrint('=====addOperation=====');
      responseData = await studentProvider.postStudentSpokenLanguage(
        languageId: spokenLanguageId,
        languageData: spokenLanguageData,
      );
    } else if (operation == Keys.editOperation) {
      // debugPrint('=====editOperation=====');
      responseData = await studentProvider.putStudentSpokenLanguage(
        spokenLanguageId: spokenLanguageId,
        spokenLanguageData: spokenLanguageData,
      );
    } else {
      // debugPrint('=====deleteOperation=====');
      responseData = await studentProvider.deleteStudentSpokenLanguage(
        spokenLanguageId: spokenLanguageId,
      );
    }
    if (responseData.success!) {
      // debugPrint('=====success=====');
      clearDataFromForm();
      await profileController.getStudentInfoResponseProvider();
      languageListFilter();
      // Get.back();
      customSnackbar(
        msgTitle: 'Success',
        msgContent:
            'Successfully $operation${operation == Keys.deleteOperation ? 'd' : 'ed'} Language Information',
        bgColor: ColorsManager.green,
        duration: DurationConstant.d1500,
      );
    }
  }
}
