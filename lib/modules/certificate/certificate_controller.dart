import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import '../../data/data.dart';
import '../modules.dart';

class CertificateController extends GetxController {
  final profileController = Get.find<ProfileController>();
  final studentProvider = Get.put(StudentProvider());

  String? title;
  int certificateId = 0;

  final editCertificateFormKey = GlobalKey<FormState>();

  TextEditingController certificateTitleTextCtrl = TextEditingController();
  TextEditingController descriptionTextCtrl = TextEditingController();

  Rx<String> selectedReceivedDateString = ''.obs;
  Rx<String> selectedExpireDateString = ''.obs;

  Rx<bool> isSubmitBtnProcessing = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    title = (Get.arguments as List)[0].toString();
    if (title == Keys.editOperation) {
      final CertificateModel certificateDataArg =
          (Get.arguments as List)[1] as CertificateModel;
      certificateId = certificateDataArg.id!;
      certificateTitleTextCtrl.text = certificateDataArg.title!;
      descriptionTextCtrl.text = certificateDataArg.description!;
      selectedReceivedDateString.value = certificateDataArg.receivedDate == null
          ? ''
          : certificateDataArg.receivedDate.toString();
      selectedExpireDateString.value = certificateDataArg.expirationDate == null
          ? ''
          : certificateDataArg.expirationDate.toString();
    }
  }

  void saveButtonOnClick() {
    if (editCertificateFormKey.currentState!.validate()) {
      isSubmitBtnProcessing.value = switchingBooleanValue(
        boolValue: isSubmitBtnProcessing.value,
      );
      final CertificateModel certificateDataToBeAddOrEdit = CertificateModel(
        title: certificateTitleTextCtrl.text.trim(),
        receivedDate: selectedReceivedDateString.value == ''
            ? null
            : DateTime.tryParse(
                selectedReceivedDateString.value,
              ),
        expirationDate: selectedExpireDateString.value == ''
            ? null
            : DateTime.tryParse(
                selectedExpireDateString.value,
              ),
        description: descriptionTextCtrl.text.trim(),
      );
      makeRequestToCertificateAPI(
        certificateId: certificateId,
        certificateData: certificateDataToBeAddOrEdit,
        operation: title,
      );
    }
  }

  Future<void> makeRequestToCertificateAPI({
    int? certificateId,
    CertificateModel? certificateData,
    required String? operation,
  }) async {
    final JsonResponse responseData;
    if (operation == Keys.addOperation) {
      // debugPrint('=====addOperation=====');
      responseData = await studentProvider.postStudentCertificate(
        certificateData: certificateData,
      );
    } else if (operation == Keys.editOperation) {
      // debugPrint('=====editOperation=====');
      responseData = await studentProvider.putStudentCertificate(
        certificateId: certificateId,
        certificateData: certificateData,
      );
    } else {
      // debugPrint('=====deleteOperation=====');
      responseData = await studentProvider.deleteStudentCertificate(
        certificateId: certificateId,
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
            ? 'profile.certificateAddSuccessMsg'.tr
            : operation == Keys.editOperation
                ? 'profile.certificateEditSuccessMsg'.tr
                : 'profile.certificateDeleteSuccessMsg'.tr,
        //    'Successfully $operation${operation == Keys.deleteOperation ? 'd' : 'ed'} Certificate Information',
        bgColor: ColorsManager.green,
        duration: DurationConstant.d1500,
      );
    }
  }
}
