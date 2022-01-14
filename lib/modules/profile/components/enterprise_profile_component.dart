import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../modules.dart';

class EnterpriseProfileComponent extends StatelessWidget {
  const EnterpriseProfileComponent({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ///===== Profile Header Widget =====//
        const ProfileHeader(
          userName: 'Orange France',
          userRole: 'Enterprise ',
          numberStarRate: 4.9,
        ),
        //===== Profile Header Widget =====//

        ///===== Personal Information Widget =====//
        Padding(
          padding: const EdgeInsets.only(
            left: AppSize.s12,
            right: AppSize.s12,
            top: AppSize.s12,
            bottom: AppSize.s12,
          ),
          child: CustomContainerWidget(
            leftTitle: 'Enterprise Information'.toUpperCase(),
            titleFontSize: AppSize.s16,
            rightWidget: const Icon(
              Icons.edit,
              color: ColorsManager.grey800,
              size: AppSize.s24,
            ),
            child: Column(
              children: const [
                CustomListTileWidget(
                  text1: 'Email',
                  text2: 'Josep.stalin@OrangeFrance.com',
                  isLauching: true,
                  text2Color: ColorsManager.blue,
                  leftWidget: CustomBoxWidget(
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
                  text2: '(+33) 12 23 34 45',
                  isLauching: true,
                  text2Color: ColorsManager.blue,
                  leftWidget: CustomBoxWidget(
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
                  text2: 'https://www.youtube.com/watch?v=a79iLjV-HKw',
                  isLauching: true,
                  text2Color: ColorsManager.blue,
                  bottomPadding: 8.0,
                  isDivider: false,
                  leftWidget: CustomBoxWidget(
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
          ),
        ),
        //===== Personal Information Widget =====//
      ],
    );
  }
}
