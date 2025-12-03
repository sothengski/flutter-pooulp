import 'package:flutter/material.dart';

import '../../../core/core.dart';

class ProfileCompletionComponent extends StatelessWidget {
  final String? title;

  final double? completionPercentage;

  const ProfileCompletionComponent({
    super.key,
    this.title,
    this.completionPercentage,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainerWidget.profileComponent(
      topMargin: AppSize.s12,
      // bottomMargin: AppSize.s12,
      leftTitle: title!.toUpperCase(),
      rightWidget: CustomTextWidget(
        text: '${completionPercentage!.toStringAsFixed(0)} %',
        fontWeight: FontWeightManager.medium,
      ),
      child: CustomBoxWidget(
        leftMargin: AppSize.s8,
        rightMargin: AppSize.s8,
        bottomMargin: AppSize.s12,
        backgroundColor: ColorsManager.grey200,
        topPadding: AppSize.s0,
        leftPadding: AppSize.s0,
        rightPadding: completionPercentage!.toInt() == 100
            ? 0
            : (getWidth - AppSize.s48) -
                  ((getWidth - AppSize.s48) *
                      completionPercentage!.toInt() /
                      100),
        bottomPadding: AppSize.s0,
        child: const CustomBoxWidget(backgroundColor: ColorsManager.primary75),
      ),
    );
  }
}
