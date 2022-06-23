import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';

class ProfileExpComponent extends StatelessWidget {
  final String? title;
  final String? addOrEditExpRoute;
  final String? expTypeKey;
  final List<ExperienceModel>? expList;

  const ProfileExpComponent({
    Key? key,
    this.title,
    this.addOrEditExpRoute,
    this.expTypeKey,
    this.expList,
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
            addOrEditExpRoute!,
            arguments: [Keys.addOperation, expTypeKey],
          ),
        },
      ),
      child: Column(
        children: expList!
            .map(
              (e) => e.type == expTypeKey
                  ? CustomListTileWidget(
                      text1: e.name,
                      text1Color: ColorsManager.grey850,
                      text1FontWeight: FontWeightManager.medium,
                      text1FontSize: AppSize.s16,
                      text2: e.company,
                      text2Color: ColorsManager.grey800,
                      text3:
                          '${e.attendedFromTo} ${'at'.tr} ${e.companyCityAndCountry}',
                      // bottomPadding: 8.0,
                      leftWidget: const CustomBoxWidget(
                        size: 40,
                        child: Icon(
                          Icons.work,
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
                            addOrEditExpRoute!,
                            arguments: [Keys.editOperation, expTypeKey, e],
                          ),
                        },
                      ),
                    )
                  : Container(),
            )
            .toList(),
      ),
    );
  }
}
