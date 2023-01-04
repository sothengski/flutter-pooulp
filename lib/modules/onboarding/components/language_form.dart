import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../modules.dart';

class LanguageForm extends GetView<OnboardingController> {
  const LanguageForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.s8),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            ///===== Top of Mother Tongue Language Selection Component =====//
            Form(
              // key: controller.editMontherTongueLangaugeFormKey,
              child: Wrap(
                children: [
                  ContainerDialogWidget(
                    inputTitle: 'motherTongue'.tr,
                    // validatorFunction: (_) => Validator().notEmptyValidator(
                    //   controller.selectedMotherTongueLanguage.value.label ?? '',
                    // ),
                    dialogType:
                        DialogType.bottomSheetDialog, // controller: controller,
                    dialogWidget: Container(
                      height: getHeight,
                      decoration: const ShapeDecoration(
                        color: ColorsManager.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                              AppSize.s16,
                            ),
                            topRight: Radius.circular(
                              AppSize.s16,
                            ),
                          ),
                        ),
                      ),
                      child: Obx(
                        () => controller.languageListForSelection.isNotEmpty
                            ? FieldListSelector(
                                inputHintText: 'search'.tr,
                                dataListforSelected:
                                    controller.languageListForSelection,
                                selectedItem:
                                    controller.languageListForSelection[1],
                                onTap: (field) {
                                  // controller
                                  //         .selectedMotherTongueLanguage.value =
                                  //     controller.selectedLanguageOnClick(
                                  //   selectedItem: field,
                                  // );
                                  Navigator.pop(
                                    context,
                                    true,
                                  );
                                },
                              )
                            : const LoadingWidget(),
                      ),
                    ),
                    containerWidget:
                        //  Obx(
                        //   () =>
                        // controller.selectedMotherTongueLanguage.value.id ==
                        //         null
                        //     ?
                        RowContentInputWidget(
                      centerWidget: CustomTextWidget(
                        text: 'languageHint'.tr,
                        color: ColorsManager.grey400,
                        fontWeight: FontWeight.w400,
                        fontSize: AppSize.s16,
                      ),
                      suffixWidget: const Icon(
                        IconsManager.arrowDropDown,
                        color: ColorsManager.grey600,
                      ),
                    ),
                    // : const RowContentInputWidget(
                    //     centerWidget: CustomTextWidget(
                    //       text:
                    //           'controller.selectedMotherTongueLanguage.value.label',
                    //       color: ColorsManager.black,
                    //       fontSize: AppSize.s16,
                    //     ),
                    //     suffixWidget: Icon(
                    //       IconsManager.arrowDropDown,
                    //       color: ColorsManager.grey600,
                    //     ),
                    //   ),
                    // ),
                  ),
                  //===== Bottom of Mother Tongue Language Selection Component =====//

                  ///===== Top of Add Language Button Component =====//
                  // Obx(
                  //   () =>
                  CustomMaterialButton(
                    topPadding: AppSize.s20,
                    bottomPadding: AppSize.s20,
                    text: 'add'.tr,
                    childWidget:
                        // controller.isSubmitBtnProcessing.value == true
                        //     ?
                        const SizedBox(
                      height: 40,
                      child: LoadingWidget(
                        isTreeBounceLoading: true,
                        color: ColorsManager.white,
                      ),
                    )
                    // : null
                    ,
                    fontSize: AppSize.s20,
                    buttonWidth: getWidth,
                    onPressed: () {
                      unFocusKeyBoard(context);
                      // if (!controller.isSubmitBtnProcessing.value == true) {
                      //   controller.saveButtonOnClick(
                      //     formKey:
                      //         controller.editMontherTongueLangaugeFormKey,
                      //     languageTagId: controller
                      //         .selectedMotherTongueLanguage.value.id,
                      //     languageProficiencyLevel: 4,
                      //   );
                      // }
                    },
                  ),
                  // ),
                  //===== Bottom of Add Language Button Component =====//
                ],
              ),
            ),
            const Divider(
              height: 0.5,
              thickness: 0.5,
              color: ColorsManager.primaryBlue,
            ),
          ],
        ),
      ),
    );
  }
}
