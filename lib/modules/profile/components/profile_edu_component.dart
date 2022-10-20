import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';

class ProfileEduComponent extends StatelessWidget {
  final String? title;
  final String? addOrEditEduRoute;
  final List<EducationModel>? eduList;

  const ProfileEduComponent({
    Key? key,
    this.title,
    this.addOrEditEduRoute,
    this.eduList,
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
            addOrEditEduRoute!,
            arguments: [Keys.addOperation],
          ),
        },
      ),
      child: Column(
        children: eduList!
            .map(
              (e) => Column(
                children: [
                  CustomListTileWidget(
                    text1: e.school!.name,
                    text1Color: ColorsManager.grey850,
                    text1FontWeight: FontWeightManager.medium,
                    text1FontSize: AppSize.s16,
                    // text2: '${e.degree}, ${e.name}',
                    text2: e.degreeTag != null ? '${e.degreeTag!.label}' : '',
                    text2Color: ColorsManager.grey800,
                    text3:
                        '${e.attendedFromTo} ${'at'.tr} ${e.schoolCityAndCountry}',
                    leftWidget: const CustomBoxWidget(
                      size: 40,
                      child: Icon(
                        Icons.school_rounded,
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
                          addOrEditEduRoute!,
                          arguments: [Keys.editOperation, e],
                        ),
                      },
                    ),
                    child: Container(
                      alignment: AlignmentDirectional.centerStart,
                      child: Wrap(
                        children: [
                          // Text('a')
                          for (var i = 0; i < e.fields!.length; i++)
                            RemovableTextCardWidget(
                              text: '${e.fields![i].label}',
                            )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
