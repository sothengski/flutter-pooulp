import 'package:flutter/material.dart';

import '../../../core/core.dart';

class PageTemplateWidget extends StatelessWidget {
  final String? title;
  final double? titleFontSize;
  final String? subTitle;
  final double? subTitleFontSize;
  final Widget? bodyPageWidget;

  const PageTemplateWidget({
    this.title = '',
    this.titleFontSize = AppSize.s24,
    this.subTitle = '',
    this.subTitleFontSize = AppSize.s20,
    this.bodyPageWidget,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // if (title == '')
        //   Container()
        // else
        Expanded(
          flex: 5,
          child: Center(
            child: CustomTextWidget(
              text: '$title',
              fontSize: titleFontSize,
              fontWeight: FontWeight.w700,
              color: ColorsManager.white,
              textAlign: TextAlign.center,
              marginLeft: AppSize.s8,
              marginRight: AppSize.s8,
              // maxLine: controller.isUpdate.value == true ? 3 : 3,
            ),
          ),
        ),
        // if (subTitle == '')
        //   Container()
        // else
        Expanded(
          flex: 10,
          child: Center(
            child: CustomTextWidget(
              text: '$subTitle',
              fontSize: subTitleFontSize,
              fontWeight: FontWeight.w700,
              color: ColorsManager.white,
              textAlign: TextAlign.center,
              marginLeft: AppSize.s8,
              marginRight: AppSize.s8,
              maxLine: 3,
            ),
          ),
        ),
        Expanded(
          flex: 90,
          child: Container(
            padding: const EdgeInsets.only(
              top: AppSize.s16,
            ),
            child: bodyPageWidget,
          ),
        )
      ],
    );
  }
}
