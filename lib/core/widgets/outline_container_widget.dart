import 'package:flutter/material.dart';

import '../core.dart';

class OutlineContainerWidget extends StatelessWidget {
  final double? horizontalPadding;
  final double? verticalPadding;
  final String? title;
  final Color? titleColor;
  final Widget? childWidget;
  final bool? isDivider;

  const OutlineContainerWidget({
    this.horizontalPadding = AppSize.s16,
    this.verticalPadding = AppSize.s4,
    this.title,
    this.titleColor = ColorsManager.grey,
    this.childWidget,
    this.isDivider = true,
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
            const Divider(
              height: AppSize.s8,
              thickness: AppSize.s0_5,
            )
          else
            Container(),
        ],
      ),
    );
  }
}
