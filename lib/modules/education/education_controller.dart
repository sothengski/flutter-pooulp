// ignore_for_file: avoid_dynamic_calls

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pooulp_flutter/modules/modules.dart';

import '../../core/core.dart';
import '../../data/data.dart';

class EducationController extends GetxController {
  final profileController = Get.put(ProfileController());
  final studentProvider = Get.find<StudentProvider>();
  final tagProvider = Get.find<TagProvider>();

  String? title;

  final editProfileFormKey = GlobalKey<FormState>();

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
    title = Get.arguments[0].toString();

    await getSchoolListResponseProvider();

    if (title == Keys.editOperation) {
      final EducationModel eduDataArg = Get.arguments[1] as EducationModel;
      debugPrint('arg:: $eduDataArg');
      // selectedSchool =
    }
    // selectedStartedDateString.value = '';
    isCheckGraduated.value = false;
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

  DateTime selectedDateOnClick({DateTime? selectedItem}) {
    return selectedItem!;
  }

  String selectedDateOnClickString({DateTime? selectedItem}) {
    return selectedItem!.toString();
  }

  bool isCheckGraduatedSwitching({bool? value}) =>
      isCheckGraduated.value = !value!;

  bool saveBtnBoolSwitching({bool? value}) =>
      isSubmitBtnProcessing.value = value!;

  void saveButtonOnClick() {
    if (editProfileFormKey.currentState!.validate()) {
      saveBtnBoolSwitching(value: !isSubmitBtnProcessing.value);
      // debugPrint(
      //   'selectedSchool:: ${selectedSchool.value.id}-${selectedSchool.value.name}',
      // );

      // debugPrint('fieldOfStudyTextCtrl:: ${fieldOfStudyTextCtrl.text}');
      // debugPrint('degreeTextCtrl:: ${degreeTextCtrl.text}');

      // // debugPrint('selectedStartedDate:: ${selectedStartedDate.value}');
      // debugPrint(
      //   'selectedStartedDateString:: ${dateFormatDashYYYYMMDD(
      //     date: DateTime.tryParse(
      //       selectedStartedDateString.value,
      //     ),
      //   )}',
      // );

      // // debugPrint('selectedEndDate:: ${selectedEndDate.value}');
      // debugPrint(
      //   'selectedEndDateString:: ${dateFormatDashYYYYMMDD(
      //     date: DateTime.tryParse(
      //       selectedEndDateString.value,
      //     ),
      //   )}',
      // );

      // debugPrint('isCheckGraduated:: ${isCheckGraduated.value}');
      // debugPrint('descriptionTextCtrl:: ${descriptionTextCtrl.text}');
      final EducationModel educationToBeAddOrEdit = EducationModel(
        schoolId: selectedSchool.value.id,
        name: fieldOfStudyTextCtrl.text.trim(),
        degree: degreeTextCtrl.text.trim(),
        dateStart: DateTime.tryParse(
          selectedStartedDateString.value,
        ),
        dateEnd: DateTime.tryParse(
          selectedEndDateString.value,
        ),
        completed: isCheckGraduated.value,
        description: descriptionTextCtrl.text.trim(),
        fields: [],
      );
      if (title == Keys.addOperation) {
        studentProvider
            .postStudentEducation(educationData: educationToBeAddOrEdit)
            .then(
          (value) async {
            profileController.studentInfoRepsonse.value.educations!.add(value);
          },
        ).whenComplete(() {
          Get.back();
        });
        // .catchError(
        //   (onError) {
        //     print("catchError called when there is an error catches error");
        //   },)
      } else if (title == Keys.editOperation) {
      } else {}
    }
  }
}
