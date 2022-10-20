import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import '../../data/data.dart';
import '../../modules/modules.dart';

class EducationController extends GetxController {
  // final profileController = Get.put(ProfileController());
  final profileController = Get.find<ProfileController>();

  final studentProvider = Get.put(StudentProvider());
  final tagProvider = Get.find<TagProvider>();

  String? title;

  final editEducationFormKey = GlobalKey<FormState>();

  int eduId = 0;

  // TextEditingController fieldOfStudyTextCtrl = TextEditingController();
  // TextEditingController degreeTextCtrl = TextEditingController();
  TextEditingController currentStudyYrTextCtrl = TextEditingController();
  TextEditingController descriptionTextCtrl = TextEditingController();
  RxList<FieldModel> fieldListForSelect = <FieldModel>[].obs;

  Rx<SchoolModel> selectedSchool = SchoolModel().obs;
  RxList<FieldModel> fieldListSelected = <FieldModel>[].obs;
  Rx<FieldModel> schoolDegreeSelected = FieldModel().obs;

  // Rx<DateTime> selectedStartedDate = DateTime.now().obs;
  Rx<String> selectedStartedDateString = ''.obs;

  // Rx<DateTime> selectedEndDate = DateTime.now().obs;
  RxString selectedEndDateString = ''.obs;

  RxBool isCurrentStudy = false.obs;

  Rx<bool> isSubmitBtnProcessing = false.obs;

  RxList<SchoolModel> schoolList = <SchoolModel>[].obs;
  RxList<FieldModel> schoolDegreeList = <FieldModel>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    title = (Get.arguments as List)[0].toString();
    await getSchoolDegreeListResponseProvider();

    if (title == Keys.editOperation) {
      final EducationModel eduDataArg =
          (Get.arguments as List)[1] as EducationModel;
      eduId = eduDataArg.id!;
      selectedSchool.value = eduDataArg.school!;
      // fieldOfStudyTextCtrl.text = eduDataArg.name!;
      // degreeTextCtrl.text = eduDataArg.degree!;
      // schoolDegreeSelected.value = FieldModel(id: eduDataArg.degreeId);
      // if (eduDataArg.degreeId != null) {
      //   matchDegreeFieldBydegreeId(degreeID: eduDataArg.degreeId);
      // }
      if (eduDataArg.degreeTag != null) {
        schoolDegreeSelected.value = eduDataArg.degreeTag!;
      }
      selectedStartedDateString.value =
          eduDataArg.dateStart == null ? '' : eduDataArg.dateStart.toString();
      selectedEndDateString.value =
          eduDataArg.dateEnd == null ? '' : eduDataArg.dateEnd.toString();
      isCurrentStudy.value = eduDataArg.completed!;
      currentStudyYrTextCtrl.text = eduDataArg.studyingYear != null
          ? eduDataArg.studyingYear.toString()
          : '';
      descriptionTextCtrl.text = eduDataArg.description!;
      fieldListSelected.value = eduDataArg.fields!;
      // debugPrint('eduDataArg:: $eduDataArg');
    }

    await getSchoolListResponseProvider();
    await getFieldsListResponseProvider();
  }

  Future<List<SchoolModel>> getSchoolListResponseProvider({
    bool? refresh = false,
  }) async {
    schoolList.addAll(await tagProvider.getSchools());
    return schoolList;
  }

  Future<List<FieldModel>> getFieldsListResponseProvider({
    bool? refresh = false,
  }) async {
    fieldListForSelect.addAll(await tagProvider.getAllFields());
    // debugPrint(
    //   'fieldListForSelect:: ${fieldListForSelect.map((element) => '${element.label}\n')}',
    // );
    return fieldListForSelect;
  }

  Future<List<FieldModel>> getSchoolDegreeListResponseProvider({
    bool? refresh = false,
  }) async {
    schoolDegreeList.addAll(await tagProvider.getSchoolDegreeTags());
    // debugPrint(
    //   'fieldListForSelect:: ${fieldListForSelect.map((element) => '${element.label}\n')}',
    // );
    return schoolDegreeList;
  }

  // void matchDegreeFieldBydegreeId({int? degreeID}) {
  //   final FieldModel degreeTemp =
  //       schoolDegreeList.where((e) => e.id == degreeID).first;
  //   schoolDegreeSelected.value = degreeTemp;
  // }

  SchoolModel selectedSchoolOnClick({SchoolModel? selectedItem}) {
    return selectedItem!;
  }

  // DateTime selectedDateOnClick({DateTime? selectedItem}) {
  //   return selectedItem!;
  // }

  // String selectedDateOnClickString({DateTime? selectedItem}) {
  //   return selectedItem!.toString();
  // }

  void saveButtonOnClick() {
    if (editEducationFormKey.currentState!.validate()) {
      isSubmitBtnProcessing.value =
          switchingBooleanValue(boolValue: isSubmitBtnProcessing.value);
      final EducationModel educationToBeAddOrEdit = EducationModel(
        schoolId: selectedSchool.value.id,
        // name: fieldOfStudyTextCtrl.text.trim(),
        // degree: degreeTextCtrl.text.trim(),
        degreeId: schoolDegreeSelected.value.id,
        studyingYear: int.tryParse(currentStudyYrTextCtrl.text),
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
        completed: isCurrentStudy.value,
        description: descriptionTextCtrl.text.trim(),
        fields: [...fieldListSelected],
      );
      // debugPrint(
      //   'educationToBeAddOrEdit:: $educationToBeAddOrEdit',
      // );
      makeRequestToEducationAPI(
        eduId: eduId,
        eduData: educationToBeAddOrEdit,
        operation: title,
      );
    }
  }

  Future<void> makeRequestToEducationAPI({
    int? eduId,
    EducationModel? eduData,
    required String? operation,
  }) async {
    final JsonResponse responseData;
    if (operation == Keys.addOperation) {
      // debugPrint('=====addOperation=====');
      responseData =
          await studentProvider.postStudentEducation(educationData: eduData);
    } else if (operation == Keys.editOperation) {
      // debugPrint('=====editOperation=====');
      responseData = await studentProvider.putStudentEducation(
        eduId: eduId,
        educationData: eduData,
      );
    } else {
      // debugPrint('=====deleteOperation=====');
      responseData = await studentProvider.deleteStudentEducation(
        eduId: eduId,
      );
    }
    if (responseData.success!) {
      // debugPrint('=====success=====');
      profileController.getStudentInfoResponseProvider();
      Get.back();
      customSnackbar(
        msgTitle: 'success'.tr,
        msgContent: operation == Keys.addOperation
            ? 'successfullyAdded'.tr //'profile.eduAddSuccessMsg'.tr
            : operation == Keys.editOperation
                ? 'successfullyUpdated'.tr //'profile.eduEditSuccessMsg'.tr
                : 'successfullyDeleted'.tr, //'profile.eduDeleteSuccessMsg'.tr,
        // 'Successfully $operation${operation == Keys.deleteOperation ? 'd' : 'ed'} Education Information',
        bgColor: ColorsManager.green,
        duration: DurationConstant.d1500,
      );
    }
    isSubmitBtnProcessing.value =
        switchingBooleanValue(boolValue: isSubmitBtnProcessing.value);
  }
}
