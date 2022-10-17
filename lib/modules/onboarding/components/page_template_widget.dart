import 'package:flutter/material.dart';

import '../../../core/core.dart';

class PageTemplateWidget extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final Widget? bodyPageWidget;

  const PageTemplateWidget({
    this.title = '',
    this.subTitle = '',
    this.bodyPageWidget,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: subTitle == null
              ? Container()
              : Center(
                  child: CustomTextWidget(
                    text: '$subTitle',
                    fontSize: AppSize.s16,
                    fontWeight: FontWeight.w600,
                    color: ColorsManager.white,
                    textAlign: TextAlign.center,
                    marginLeft: AppSize.s8,
                    marginRight: AppSize.s8,
                    // maxLine: controller.isUpdate.value == true ? 3 : 3,
                  ),
                ),
        ),
        Expanded(
          flex: 10,
          child: Center(
            child: CustomTextWidget(
              text: '$title',
              fontSize: AppSize.s24,
              fontWeight: FontWeight.w800,
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
