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
    this.userName = '...',
    this.userRole = '',
    this.numberStarRate = 0.0,
    this.headerHigh = 100,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          // padding: const EdgeInsets.only(bottom: AppSize.s4),
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
            // Container(
            //   width: 75,
            //   height: 75,
            //   margin: const EdgeInsets.only(
            //     left: AppSize.s16,
            //     top: AppSize.s60,
            //   ),
            //   decoration: BoxDecoration(
            //     color: ColorsManager.white,
            //     shape: BoxShape.circle,
            //     border: Border.all(
            //       color: ColorsManager.white,
            //       width: 3,
            //     ),
            //     // image: const DecorationImage(
            //     //   fit: BoxFit.cover,
            //     //   image: AssetImage(ImageAssets.appLogoSymbol),
            //     // ),
            //   ),
            //   child: Material(
            //     borderRadius: BorderRadius.circular(50.0),
            //     elevation: 5,
            //     child: CircleAvatar(
            //       radius: 50.0,
            //       backgroundColor: ColorsManager.white,
            //       // foregroundColor: ColorsManager.white,
            //       child: Image(
            //         image: AssetImage(
            //           profileImg!,
            //         ),
            //         fit: BoxFit.cover,
            //       ),
            //     ),
            //   ),
            // ),
            Container(
              width: 75,
              height: 75,
              margin: const EdgeInsets.only(
                left: AppSize.s16,
                top: AppSize.s60,
              ),
              decoration: BoxDecoration(
                color: ColorsManager.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: ColorsManager.white,
                  width: 3,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: ColorsManager.grey300,
                    blurRadius: 1.0,
                    offset: Offset(1.0, 1.0),
                    spreadRadius: 1.0,
                  )
                ],
                // image: const DecorationImage(
                //   fit: BoxFit.cover,
                //   image: AssetImage(ImageAssets.appLogoSymbol),
                // ),
              ),
              child: const CustomBoxWidget(
                size: 75,
                backgroundColor: ColorsManager.white,
                isCircle: true,
              ),
            ),
            Expanded(
              child: Container(
                width: 250,
                height: 75,
                margin: const EdgeInsets.only(
                  left: AppSize.s8,
                  top: AppSize.s48,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomTextWidget(
                      text: userName,
                      color: ColorsManager.white,
                      fontSize: AppSize.s24,
                      fontWeight: FontWeight.bold,
                      marginTop: AppSize.s4,
                      marginBottom: AppSize.s8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomTextWidget(
                            text: userRole,
                            fontSize: AppSize.s18,
                            fontWeight: FontWeight.bold,
                            marginRight: AppSize.s20,
                          ),
                        ),
                        // const Icon(
                        //   Icons.star,
                        //   color: ColorsManager.deepOrangeAccent,
                        // ),
                        // CustomTextWidget(
                        //   text: '$numberStarRate/5',
                        //   fontSize: AppSize.s18,
                        //   fontWeight: FontWeight.w600,
                        //   marginLeft: AppSize.s4,
                        //   marginRight: AppSize.s16,
                        // ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
