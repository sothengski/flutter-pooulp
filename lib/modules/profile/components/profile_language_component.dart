import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';

class ProfileLanguageComponent extends StatelessWidget {
  final String? title;
  final String? addOrEditLangRoute;
  final List<FieldModel>? spokenLanguageList;

  const ProfileLanguageComponent({
    Key? key,
    this.title,
    this.addOrEditLangRoute,
    this.spokenLanguageList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainerWidget.profileComponent(
      leftTitle: title!.toUpperCase(),
      rightWidget: CustomIconButtonWidget(
        iconData: Icons.edit_outlined,
        padding: 0.0,
        isConstraints: true,
        onClick: () => {
          Get.toNamed(addOrEditLangRoute!, arguments: [Keys.addOperation]),
        },
      ),
      child: spokenLanguageList! == []
          ? Container()
          : Container(
              padding: const EdgeInsets.fromLTRB(24.0, 0.0, 8.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: spokenLanguageList!
                    .map(
                      (e) => e.level == 4
                          ? CustomTextWidget(
                              text: '''${e.displayLabelAndLevel}''',
                              color: ColorsManager.grey800,
                              marginBottom: AppSize.s8,
                            )
                          : Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "${e.label}\n",
                                      style: const TextStyle(
                                        color: ColorsManager.grey800,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          "${e.displaySpokenAndWrittenLabelAndLevel}",
                                      style: const TextStyle(
                                        color: ColorsManager.grey800,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                      // CustomTextWidget(
                      //   text:
                      //       '''${e.label}\n${e.displaySpokenAndWrittenLabelAndLevel}''',
                      //   color: ColorsManager.grey800,
                      //   marginBottom: AppSize.s8,
                      // ),
                    )
                    .toList(),
              ),
            ),
    );
  }
}
