import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';

class ProfileAchievementComponent extends StatelessWidget {
  final String? title;
  final String? addOrEditAchievementRoute;
  final List<AchievementModel>? achievementList;

  const ProfileAchievementComponent({
    Key? key,
    this.title,
    this.addOrEditAchievementRoute,
    this.achievementList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainerWidget.profileComponent(
      leftTitle: title!.toUpperCase(),
      rightWidget: CustomIconButtonWidget(
        iconData: Icons.add,
        padding: 0.0,
        isConstraints: true,
        onClick: () => {
          Get.toNamed(
            addOrEditAchievementRoute!,
            arguments: [Keys.addOperation],
          ),
        },
      ),
      child: Column(
        children: achievementList!
            .map(
              (e) => CustomListTileWidget(
                text1: e.name,
                text1Color: ColorsManager.grey850,
                text1FontWeight: FontWeightManager.medium,
                text1FontSize: AppSize.s16,
                text2: 'profile.issuedDate'
                    .trParams({'date': '${e.dateCompletionFormat}'}),
                text2Color: ColorsManager.grey800,
                text3: e.description,
                // bottomPadding: 8.0,
                leftWidget: const CustomBoxWidget(
                  size: 40,
                  child: Icon(
                    Icons.card_membership,
                    color: ColorsManager.primary75,
                    size: AppSize.s20,
                  ),
                ),
                rightWidget: CustomIconButtonWidget(
                  iconData: Icons.edit_outlined,
                  padding: 0.0,
                  iconSize: 20.0,
                  isConstraints: true,
                  onClick: () => {
                    Get.toNamed(
                      addOrEditAchievementRoute!,
                      arguments: [Keys.editOperation, e],
                    ),
                  },
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
