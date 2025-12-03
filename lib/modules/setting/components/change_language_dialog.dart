import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';
import '../../modules.dart';

void changeLanguageDialog({
  List<MenuOptionsModel>? languageOptions,
}) {
  Get.dialog(
    MaterialDialogWidget(
      title: 'selectALanguage'.tr,
      titleHorizontalMargin: AppSize.s12,
      contentWidget: Center(
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: languageOptions!.length,
          separatorBuilder: (context, index) {
            return const Divider(
              color: ColorsManager.grey600,
            );
          },
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => {
                // controller.changeLanguage(
                //   languageKey:
                //       controller.languageController.languageOptions[index].key,
                // ),
                // Get.back(),

                LanguageController()
                    .updateLanguage(
                      LanguageController().languageOptions[index].key,
                    )
                    .then((value) => Get.back()),
              },
              child: RowContentInputWidget(
                centerWidget: CustomTextWidget(
                  // marginTop: AppSize.s4,
                  // marginBottom: AppSize.s4,
                  text: languageOptions[index].value,
                  fontWeight: FontWeightManager.medium,
                  fontSize: AppSize.s16,
                ),
                prefixWidgetFlex: 25,
                prefixWidget: Padding(
                  padding: const EdgeInsets.only(
                    right: AppSize.s8,
                  ),
                  child: CircleFlag(
                    languageOptions[index].flagPath!,
                    padding: AppSize.s16,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ),
  );
  // showDialog(
  //   context: context,
  //   builder: (builder) {
  //     return AlertDialog(
  //       title: Text('settings.chooseLanguage'.tr),
  //       content: SizedBox(
  //         width: double.maxFinite,
  //         child: ListView.separated(
  //           shrinkWrap: true,
  //           itemCount: LanguageController().languageOptions.length,
  //           itemBuilder: (context, index) {
  //             return InkWell(
  //               onTap: () {
  //                 LanguageController()
  //                     .updateLanguage(
  //                       LanguageController().languageOptions[index].key,
  //                     )
  //                     .then((value) => Get.back());
  //               },
  //               child: Padding(
  //                 padding: const EdgeInsets.all(4.0),
  //                 child: Row(
  //                   children: <Widget>[
  //                     if (LanguageController().languageOptions[index].key ==
  //                         LanguageController().currentLanguageStore.toString())
  //                       const Icon(
  //                         Icons.radio_button_checked,
  //                         color: ColorsManager.primary,
  //                       )
  //                     else
  //                       const Icon(
  //                         Icons.radio_button_unchecked,
  //                         color: ColorsManager.grey600,
  //                       ),
  //                     const SizedBox(
  //                       width: 15.0,
  //                     ),
  //                     CustomTextWidget(
  //                       text: LanguageController().languageOptions[index].value,
  //                       color:
  //                           LanguageController().languageOptions[index].key ==
  //                                   LanguageController()
  //                                       .currentLanguageStore
  //                                       .toString()
  //                               ? ColorsManager.primary
  //                               : ColorsManager.grey,
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             );
  //           },
  //           separatorBuilder: (context, index) {
  //             return const Divider(
  //               color: ColorsManager.grey600,
  //             );
  //           },
  //         ),
  //       ),
  //     );
  //   },
  // );
}
