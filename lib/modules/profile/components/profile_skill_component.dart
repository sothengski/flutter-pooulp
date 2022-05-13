import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';

class ProfileSkillComponent extends StatelessWidget {
  final String? title;
  final String? addOrEditSkillRoute;
  final List<SkillModel>? skillList;

  const ProfileSkillComponent({
    Key? key,
    this.title,
    this.addOrEditSkillRoute,
    this.skillList,
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
          Get.toNamed(addOrEditSkillRoute!, arguments: [Keys.addOperation]),
        },
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 50,
            child: Container(
              padding: const EdgeInsets.fromLTRB(24.0, 0.0, 8.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text: 'profile.hardSkills'.tr,
                    marginBottom: 5.0,
                    fontWeight: FontWeight.w600,
                    color: ColorsManager.grey850,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: skillList!
                        .map(
                          (e) => e.type == Type.hardSkill
                              ? CustomTextWidget(
                                  text:
                                      '${e.displayLabelAndCategory} \n   ${e.displayLevel}',
                                  color: ColorsManager.grey800,
                                  marginBottom: 8.0,
                                  maxLine: 3,
                                )
                              : Container(),
                        )
                        .toList(),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 50,
            child: Container(
              padding: const EdgeInsets.fromLTRB(24.0, 0.0, 8.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text: 'profile.softSkills'.tr,
                    color: ColorsManager.grey850,
                    marginBottom: 5.0,
                    fontWeight: FontWeight.w600,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: skillList!
                        .map(
                          (e) => e.type == Type.softSkill
                              ? CustomTextWidget(
                                  text: '• ${e.label}',
                                  color: ColorsManager.grey800,
                                  marginBottom: 8.0,
                                  maxLine: 3,
                                )
                              : Container(),
                        )
                        .toList(),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
