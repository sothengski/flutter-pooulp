import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import '../../data/data.dart';
import '../modules.dart';

class SkillController extends GetxController {
  final profileController = Get.find<ProfileController>();
  final studentProvider = Get.put(StudentProvider());
  final tagProvider = Get.find<TagProvider>();

  String? title;

  final editSkillFormKey = GlobalKey<FormState>();

  Rx<FieldModel> selectedSkillCategory = FieldModel(label: '').obs;
  Rx<FieldModel> selectedSkill = FieldModel().obs;
  Rx<FieldModel> selectedProficiency = FieldModel(label: '').obs;

  Rx<bool> isSubmitBtnProcessing = false.obs;

  RxList<FieldModel> hardSkillListFromAPI = <FieldModel>[].obs;
  RxList<FieldModel> softSkillListFromAPI = <FieldModel>[].obs;

  RxList<FieldModel> hardSkillListForSelection = <FieldModel>[].obs;
  RxList<FieldModel> softSkillListForSelection = <FieldModel>[].obs;

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
    title = (Get.arguments as List)[0].toString();
    await getHardSkillListFromProvider();
    await getSoftSkillListFromProvider();
    skillListFilter();
  }

  Future<List<FieldModel>> getHardSkillListFromProvider({
    bool? refresh = false,
  }) async {
    hardSkillListFromAPI.addAll(
      /// TODO: remove this function after offline testing
      // await tagProvider.getOnlyHardSkills(),
      await FakeTagProvider().getOnlyHardSkills(),
    );
    hardSkillListForSelection.addAll(hardSkillListFromAPI);
    return hardSkillListFromAPI;
  }

  Future<List<FieldModel>> getSoftSkillListFromProvider({
    bool? refresh = false,
  }) async {
    softSkillListFromAPI.addAll(
      /// TODO: remove this function after offline testing
      // await tagProvider.getOnlySoftSkills(),
      await FakeTagProvider().getOnlySoftSkills(),
    );
    softSkillListForSelection.addAll(softSkillListFromAPI);
    return softSkillListFromAPI;
  }

  void skillListFilter() {
    for (final item in profileController.studentInfoRepsonse.value.skills!) {
      hardSkillListForSelection.removeWhere(
        (element) => item.tagId == element.id,
      );
      softSkillListForSelection.removeWhere(
        (element) => item.tagId == element.id,
      );
    }
  }

  void clearDataFromForm() {
    selectedSkillCategory.value = FieldModel(label: '');
    selectedSkill.value = FieldModel();
    selectedProficiency.value = FieldModel(label: '');
  }

  FieldModel selectedSkillOnClick({
    FieldModel? selectedItem,
    bool? resetDependencyValue = false,
  }) {
    if (resetDependencyValue!) {
      selectedSkill.value = FieldModel();
      selectedProficiency.value = FieldModel(label: '');
    }

    return selectedItem!;
  }

  Future<void> saveButtonOnClick() async {
    if (editSkillFormKey.currentState!.validate()) {
      isSubmitBtnProcessing.value = switchingBooleanValue(
        boolValue: isSubmitBtnProcessing.value,
      );
      final FieldModel fieldDataToBeAddOrEdit = FieldModel(
        tagId: selectedSkill.value.id,
        level: selectedProficiency.value.level,
      );
      await makeRequestToSkillAPI(
        skillId: selectedSkill.value.id,
        skillData: fieldDataToBeAddOrEdit,
        operation: title,
      );
      isSubmitBtnProcessing.value = switchingBooleanValue(
        boolValue: isSubmitBtnProcessing.value,
      );
    }
  }

  Future<void> makeRequestToSkillAPI({
    required int? skillId,
    FieldModel? skillData,
    required String? operation,
  }) async {
    final JsonResponse responseData;
    if (operation == Keys.addOperation) {
      // debugPrint('=====addOperation=====');
      responseData = await studentProvider.postStudentSkill(
        skillCategory:
            selectedSkillCategory.value.label == SkillCategoryStrings.hardSkill
            ? 'hardskills'
            : 'softskills',
        skillData: skillData,
      );
    } else if (operation == Keys.editOperation) {
      // debugPrint('=====editOperation=====');
      responseData = await studentProvider.putStudentSkill(
        skillId: skillId,
        skillData: skillData,
      );
    } else {
      // debugPrint('=====deleteOperation=====');
      responseData = await studentProvider.deleteStudentSkill(skillId: skillId);
    }
    if (responseData.success!) {
      // debugPrint('=====success=====');
      clearDataFromForm();
      await profileController.getStudentInfoResponseProvider();
      skillListFilter();
      // Get.back();
      customSnackbar(
        msgTitle: 'success'.tr,
        msgContent: operation == Keys.addOperation
            ? 'successfullyAdded'
                  .tr //'profile.skillAddSuccessMsg'.tr
            : operation == Keys.editOperation
            ? 'successfullyUpdated'
                  .tr //'profile.skillEditSuccessMsg'.tr
            : 'successfullyDeleted'.tr, //'profile.skillDeleteSuccessMsg'.tr,
        // 'Successfully $operation${operation == Keys.deleteOperation ? 'd' : 'ed'} Skill Information',
        bgColor: ColorsManager.green,
        duration: DurationConstant.d1500,
      );
    }
  }
}
