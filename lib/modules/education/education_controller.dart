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

  TextEditingController fieldOfStudyTextCtrl = TextEditingController();
  TextEditingController degreeTextCtrl = TextEditingController();
  TextEditingController descriptionTextCtrl = TextEditingController();

  Rx<SchoolModel> selectedSchool = SchoolModel().obs;

  // Rx<DateTime> selectedStartedDate = DateTime.now().obs;
  Rx<String> selectedStartedDateString = ''.obs;

  // Rx<DateTime> selectedEndDate = DateTime.now().obs;
  RxString selectedEndDateString = ''.obs;

  RxBool isCheckGraduated = false.obs;

  Rx<bool> isSubmitBtnProcessing = false.obs;

  RxList<SchoolModel> schoolList = <SchoolModel>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    title = (Get.arguments as List)[0].toString();
    if (title == Keys.editOperation) {
      final EducationModel eduDataArg =
          (Get.arguments as List)[1] as EducationModel;
      eduId = eduDataArg.id!;
      selectedSchool.value = eduDataArg.school!;
      fieldOfStudyTextCtrl.text = eduDataArg.name!;
      degreeTextCtrl.text = eduDataArg.degree!;
      selectedStartedDateString.value =
          eduDataArg.dateStart == null ? '' : eduDataArg.dateStart.toString();
      selectedEndDateString.value =
          eduDataArg.dateEnd == null ? '' : eduDataArg.dateEnd.toString();
      isCheckGraduated.value = eduDataArg.completed!;
      descriptionTextCtrl.text = eduDataArg.description!;
      // debugPrint('eduDataArg:: $eduDataArg');
    }

    await getSchoolListResponseProvider();
  }

  Future<List<SchoolModel>> getSchoolListResponseProvider({
    bool? refresh = false,
  }) async {
    schoolList.addAll(await tagProvider.getSchools());
    return schoolList;
  }

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
        name: fieldOfStudyTextCtrl.text.trim(),
        degree: degreeTextCtrl.text.trim(),
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
        completed: isCheckGraduated.value,
        description: descriptionTextCtrl.text.trim(),
        fields: [],
      );
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
      isSubmitBtnProcessing.value =
          switchingBooleanValue(boolValue: isSubmitBtnProcessing.value);
      Get.back();
      customSnackbar(
        msgTitle: 'core.success'.tr,
        msgContent: operation == Keys.addOperation
            ? 'profile.eduAddSuccessMsg'.tr
            : operation == Keys.editOperation
                ? 'profile.eduEditSuccessMsg'.tr
                : 'profile.eduDeleteSuccessMsg'.tr,
        // 'Successfully $operation${operation == Keys.deleteOperation ? 'd' : 'ed'} Education Information',
        bgColor: ColorsManager.green,
        duration: DurationConstant.d1500,
      );
    }
  }
}
