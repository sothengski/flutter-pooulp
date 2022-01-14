import 'package:flutter/material.dart';

import '../../../core/core.dart';

class ProfileHeader extends StatelessWidget {
  final String? profileImg;
  final String? coverImg;
  final String? userName;
  final String? userRole;
  final double? numberStarRate;
  final double? headerHigh;

  const ProfileHeader({
    this.profileImg = AssetsManager.appLogoSymbol,
    this.coverImg = AssetsManager.coverImg,
    this.userName = 'John Appleseed',
    this.userRole = 'Student',
    this.numberStarRate = 4.75,
    this.headerHigh = 150,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: AppSize.s24),
          width: double.infinity,
          height: headerHigh,
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage(
          //       coverImg!,
          //     ),
          //     scale: 2,
          //     repeat: ImageRepeat.repeat,
          //   ),
          // ),
          child: Image(
            image: AssetImage(
              coverImg!,
            ),
            fit: BoxFit.cover,
          ),
        ),
        Row(
          children: [
            Container(
              width: 100,
              height: 100,
              margin: const EdgeInsets.only(
                left: AppSize.s16,
                top: AppSize.s72,
              ),
              decoration: BoxDecoration(
                color: ColorsManager.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: ColorsManager.white,
                  width: 3,
                ),
                // image: const DecorationImage(
                //   fit: BoxFit.cover,
                //   image: AssetImage(ImageAssets.appLogoSymbol),
                // ),
              ),
              child: Material(
                borderRadius: BorderRadius.circular(50.0),
                elevation: 5,
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundColor: ColorsManager.white,
                  // foregroundColor: ColorsManager.white,
                  child: Image(
                    image: AssetImage(
                      profileImg!,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              width: 250,
              height: 75,
              margin: const EdgeInsets.only(
                left: AppSize.s8,
                top: AppSize.s72,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextWidget(
                    text: userName,
                    color: ColorsManager.white,
                    fontSize: AppSize.s24,
                    fontWeight: FontWeight.bold,
                    marginTop: AppSize.s4,
                    marginBottom: AppSize.s10,
                  ),
                  Row(
                    children: [
                      CustomTextWidget(
                        text: userRole,
                        fontSize: AppSize.s24,
                        fontWeight: FontWeight.bold,
                        marginRight: AppSize.s20,
                      ),
                      const Icon(
                        Icons.star,
                        color: ColorsManager.grey600,
                      ),
                      CustomTextWidget(
                        text: '$numberStarRate/5',
                        fontSize: AppSize.s18,
                        fontWeight: FontWeight.normal,
                        marginLeft: AppSize.s4,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
