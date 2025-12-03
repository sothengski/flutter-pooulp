import 'package:flutter/material.dart';

import '../../../core/core.dart';

class PageTemplateWidget extends StatelessWidget {
  final String? title;
  final double? titleFontSize;
  final String? subTitle;
  final double? subTitleFontSize;
  final String? subTitle2;
  final double? subTitleFontSize2;
  final Widget? bodyPageWidget;

  const PageTemplateWidget({
    this.title = '',
    this.titleFontSize = AppSize.s24,
    this.subTitle = '',
    this.subTitleFontSize = AppSize.s18,
    this.subTitle2 = '',
    this.subTitleFontSize2 = AppSize.s14,
    this.bodyPageWidget,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title == '')
          Container()
        else
          Expanded(
            flex: 8,
            child: Center(
              child: CustomTextWidget(
                text: '$title',
                fontSize: titleFontSize,
                fontWeight: FontWeight.w700,
                color: ColorsManager.white,
                textAlign: TextAlign.center,
                marginLeft: AppSize.s8,
                marginRight: AppSize.s8,
                maxLine: 3,
              ),
            ),
          ),
        if (subTitle == '')
          Container()
        else
          Expanded(
            flex: 6,
            child: Align(
              alignment: Alignment.topCenter,
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
        if (subTitle2 == '')
          Container()
        else
          Expanded(
            flex: 4,
            child: Center(
              child: CustomTextWidget(
                text: '$subTitle2',
                fontStyle: FontStyle.italic,
                fontSize: subTitleFontSize2,
                fontWeight: FontWeight.w400,
                color: ColorsManager.white,
                textAlign: TextAlign.center,
                marginLeft: AppSize.s8,
                marginRight: AppSize.s8,
                maxLine: 2,
              ),
            ),
          ),
        Expanded(
          flex: 85,
          child: Container(
            padding: const EdgeInsets.only(
              top: AppSize.s16,
            ),
            child: bodyPageWidget,
          ),
        ),
      ],
    );
  }
}
