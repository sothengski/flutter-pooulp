import 'package:flutter/material.dart';

import '../../../core/core.dart';

class ContactInformationComponent extends StatelessWidget {
  final String? headerTitle;
  final String? email;
  final String? phone;
  final String? videoPreentationLink;

  const ContactInformationComponent({
    this.headerTitle = '',
    this.email = '',
    this.phone = '',
    this.videoPreentationLink = '',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainerWidget(
      leftMargin: AppSize.s12,
      rightMargin: AppSize.s12,
      topMargin: AppSize.s12,
      bottomMargin: AppSize.s12,
      leftTitle: headerTitle!.toUpperCase(),
      titleFontSize: AppSize.s16,
      rightWidget: const Icon(
        Icons.edit,
        color: ColorsManager.grey800,
        size: AppSize.s24,
      ),
      child: Column(
        children: [
          CustomListTileWidget(
            text1: 'Email',
            text2: email,
            isLauching: true,
            text2Color: ColorsManager.blue,
            leftWidget: const CustomBoxWidget(
              insideObj: Icon(
                Icons.email,
                color: ColorsManager.grey,
                size: AppSize.s24,
              ),
              backgroundColor: ColorsManager.white,
            ),
          ),
          CustomListTileWidget(
            text1: 'Phone',
            text2: phone,
            isLauching: true,
            text2Color: ColorsManager.blue,
            leftWidget: const CustomBoxWidget(
              insideObj: Icon(
                Icons.phone,
                color: ColorsManager.grey,
                size: AppSize.s24,
              ),
              backgroundColor: ColorsManager.white,
            ),
          ),
          CustomListTileWidget(
            text1: 'Video presentation link',
            text2: videoPreentationLink,
            isLauching: true,
            text2Color: ColorsManager.blue,
            bottomPadding: 8.0,
            isDivider: false,
            leftWidget: const CustomBoxWidget(
              insideObj: Icon(
                Icons.video_library,
                color: ColorsManager.grey,
                size: AppSize.s24,
              ),
              backgroundColor: ColorsManager.white,
            ),
          ),
        ],
      ),
    );
  }
}
