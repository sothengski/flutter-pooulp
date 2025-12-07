import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import '../../data/data.dart';
import '../modules.dart';

class LanguageUsageController extends GetxController {
  final profileController = Get.find<ProfileController>();
  // final studentProvider = Get.put(StudentProvider());
  // final tagProvider = Get.find<TagProvider>();
  final studentProvider = Get.put(
    FakeStudentProvider(),
  ); // TODO: Change to StudentProvider() when backend is ready
  final tagProvider =
      Get.find<
        FakeTagProvider
      >(); // TODO: Change to TagProvider() when backend is ready

  String? title;
  int langaugeId = 0;

  final editLangaugeFormKey = GlobalKey<FormState>();

  final editMontherTongueLangaugeFormKey = GlobalKey<FormState>();

  Rx<FieldModel> selectedLanguage = FieldModel().obs;

  Rx<FieldModel> selectedMotherTongueLanguage = FieldModel().obs;

  FieldModel beginnerLevel = FieldModel(
    id: 1,
    label: LevelStrings.beginner,
    level: 1,
  );
  // Rx<FieldModel> selectedProficiency = FieldModel(label: '').obs;
  Rx<FieldModel> selectedSpokenProficiency = FieldModel(
    id: 1,
    label: LevelStrings.beginner,
    level: 1,
  ).obs;
  Rx<FieldModel> selectedWrittenProficiency = FieldModel(
    id: 1,
    label: LevelStrings.beginner,
    level: 1,
  ).obs;

  RxList<FieldModel> selectedlanguageTypes = <FieldModel>[].obs;

  Rx<bool> isSubmitBtnProcessing = false.obs;

  RxList<FieldModel> allLanguageListFromAPI = <FieldModel>[].obs;

  RxList<FieldModel> languageListForSelection = <FieldModel>[].obs;

  RxList<FieldModel> proficiencyList = <FieldModel>[
    // FieldModel(id: 0, label: LanguageLevelStrings.levelUndefined, level: 0),
    FieldModel(id: 1, label: LevelStrings.beginner, level: 1),
    FieldModel(id: 2, label: LevelStrings.intermediate, level: 2),
    FieldModel(id: 3, label: LevelStrings.professional, level: 3),
    // FieldModel(id: 4, label: LevelStrings.motherTongue, level: 4),
  ].obs;

  // RxList<FieldModel> languageTypeList = <FieldModel>[
  //   FieldModel(id: 1, label: 'spoken'.tr),
  //   FieldModel(id: 2, label: 'written'.tr),
  // ].obs;

  // List<TextEditingController> vdoUrlListTextCtrl = [];

  RxBool isUpdating = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    // initVdoUrlItemListTextCtrl();
    title = (Get.arguments as List)[0].toString();
    await getLanguagesListResponseProvider();
    languageListFilter();
  }

  // void initVdoUrlItemListTextCtrl() {
  //   // vdoUrlListTextCtrl.clear();
  //   for (final item
  //       in profileController.studentInfoRepsonse.value.spokenLanguages!) {
  //     // vdoUrlListTextCtrl.add(TextEditingController(text: item.videoUrl));
  //     // inputDeliveryQtyValueList.add({
  //     //   'itemCode': item.itemId,
  //     //   'itemName': item.description,
  //     //   'itemUnit': item.shortText,
  //     //   'unitPrice': item.unitPrice,
  //     //   'itemCat': 11,
  //     //   'qty': 0,
  //     // });
  //   }
  // }

  Future<List<FieldModel>> getLanguagesListResponseProvider({
    bool? refresh = false,
  }) async {
    allLanguageListFromAPI.addAll(
      /// TODO: remove this function after offline testing
      // await tagProvider.getLanguages(),
      await FakeTagProvider().getLanguages(),
    );
    languageListForSelection.addAll(allLanguageListFromAPI);
    return allLanguageListFromAPI;
  }

  void languageListFilter() {
    languageListForSelection.clear();
    languageListForSelection.addAll(allLanguageListFromAPI);
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
    selectedMotherTongueLanguage.value = FieldModel();
    selectedLanguage.value = FieldModel();
    // selectedProficiency.value = FieldModel(label: '');
    selectedSpokenProficiency.value = beginnerLevel;
    selectedWrittenProficiency.value = beginnerLevel;
    selectedlanguageTypes.value = [];
  }

  FieldModel selectedLanguageOnClick({FieldModel? selectedItem}) {
    return selectedItem!;
  }

  Future<void> saveButtonOnClick({
    required GlobalKey<FormState>? formKey,
    required int? languageTagId,
    required int? languageProficiencyLevel,
    int? spoken = 1,
    int? written = 1,
    String? languageVideoUrl = '',
  }) async {
    if (formKey!.currentState!.validate()) {
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
        tagId: languageTagId, //selectedLanguage.value.id,
        level: languageProficiencyLevel, //selectedProficiency.value.level,
        videoUrl: languageVideoUrl, //'',
        languageSpokenLv: spoken,
        languageWrittenLv: written,
      );
      await makeRequestToSpokenLanguageAPI(
        spokenLanguageId: languageTagId, //selectedLanguage.value.id,
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
      // initVdoUrlItemListTextCtrl();
      languageListFilter();
      // Get.back();
      customSnackbar(
        msgTitle: 'success'.tr,
        msgContent: operation == Keys.addOperation
            ? 'successfullyAdded'
                  .tr //'profile.langAddSuccessMsg'.tr
            : operation == Keys.editOperation
            ? 'successfullyUpdated'
                  .tr //'profile.langEditSuccessMsg'.tr
            : 'successfullyDeleted'.tr, //'profile.langDeleteSuccessMsg'.tr,
        //    'Successfully $operation${operation == Keys.deleteOperation ? 'd' : 'ed'} Language Information',
        bgColor: ColorsManager.green,
        duration: DurationConstant.d1500,
      );
    }
  }
}
