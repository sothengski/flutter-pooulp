import 'package:flutter/material.dart';

import '../core.dart';

class OutlineContainerWidget extends StatelessWidget {
  final double? horizontalPadding;
  final double? verticalPadding;
  final String? title;
  final double? fontSizeTitle;
  final Color? titleColor;
  final FontWeight? fontWeightTitle;
  final Widget? childWidget;
  final bool? isDivider;
  final double? heightDivider;
  final double? thicknessDivider;

  const OutlineContainerWidget({
    this.horizontalPadding = AppSize.s16,
    this.verticalPadding = AppSize.s4,
    this.title,
    this.fontSizeTitle = 14,
    this.titleColor = ColorsManager.grey,
    this.fontWeightTitle = FontWeightManager.regular,
    this.childWidget,
    this.isDivider = true,
    this.heightDivider = AppSize.s8,
    this.thicknessDivider = AppSize.s0_5,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding!,
        vertical: verticalPadding!,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title == null)
            Container()
          else
            CustomTextWidget(
              text: title,
              fontSize: fontSizeTitle,
              fontWeight: fontWeightTitle,
              color: titleColor,
              marginBottom: AppSize.s8,
            ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: AppSize.s8,
            ),
            child: childWidget,
          ),
          if (isDivider == true)
            Divider(
              height: heightDivider,
              thickness: thicknessDivider,
            )
          else
            Container(),
        ],
      ),
    );
  }
}
