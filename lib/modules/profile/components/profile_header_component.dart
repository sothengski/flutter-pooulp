import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../routes/routes.dart';
import '../profile.dart';

class ProfileHeaderComponent extends StatelessWidget {
  final String? profileImg;
  final String? coverImg;
  final String? userName;
  final String? userRole;
  final double? numberStarRate;
  final double? headerHigh;
  final ProfileController? controller;

  const ProfileHeaderComponent({
    this.profileImg = AssetsManager.appLogoSymbol,
    this.coverImg = AssetsManager.coverImg,
    this.userName = '...',
    this.userRole = '',
    this.numberStarRate = 0.0,
    this.headerHigh = 110,
    this.controller,
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
        // Positioned(
        //   top: 5.0,
        //   right: 50.0,
        //   child: controller!.homeController.userToken!.accountType == 'student'
        //       ? CustomIconButtonWidget(
        //           iconData: Icons.contact_page_outlined,
        //           iconColor: ColorsManager.grey300,
        //           tooltip: 'Settings',
        //           onClick: () => Get.dialog(
        //             ConfirmationDialogWidget(
        //               dialogTitle: 'jobTitle'.tr,
        //               contentWidget:
        //                   // CustomTextWidget(text: 'CV body'.tr),
        //                   TextField(
        //                 controller: controller!.jobTitleTextCtrl,
        //                 // focusNode: ref.read(messageController).messageFieldNode,
        //                 // onTap: ref.read(emojiVisiblityController.notifier).onFieldTap,
        //                 decoration: InputDecoration(
        //                   contentPadding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        //                   isCollapsed: true,
        //                   isDense: true,
        //                   hintText: 'jobTitleHint'.tr,
        //                   border: InputBorder.none,
        //                 ),
        //                 maxLines: 2,
        //                 // onChanged: controller.onChangedTextCtrl,
        //               ),
        //               actionWidget: OutlinedButton.icon(
        //                 onPressed: () async => {await controller!.generateCV()},
        //                 icon: const Icon(
        //                   IconsManager.check,
        //                   color: Colors.white,
        //                 ),
        //                 label: CustomTextWidget(
        //                   marginRight: AppSize.s24,
        //                   text: 'generateCv'.tr,
        //                   color: Colors.red,
        //                 ),
        //               ),
        //               onPressed: null,
        //             ),
        //           ),
        //         )
        //       : controller!.enterpriseSwitching.value == true
        //           ? CustomIconButtonWidget(
        //               iconData: Icons.person,
        //               iconColor: ColorsManager.grey300,
        //               tooltip: 'User Profile',
        //               onClick: () => controller!.enterpriseSwitching.value =
        //                   controller!.updateSwitchingToggle(
        //                 switchingNewValue:
        //                     controller!.enterpriseSwitching.value,
        //               ),
        //             )
        //           : CustomIconButtonWidget(
        //               iconData: Icons.location_city,
        //               iconColor: ColorsManager.grey300,
        //               tooltip: 'Enterprise Profile',
        //               onClick: () => controller!.enterpriseSwitching.value =
        //                   controller!.updateSwitchingToggle(
        //                 switchingNewValue:
        //                     controller!.enterpriseSwitching.value,
        //               ),
        //             ),
        // ),
        Positioned(
          top: 5.0,
          right: 0.0,
          child: CustomIconButtonWidget(
            iconData: Icons.tune,
            iconColor: ColorsManager.grey300,
            tooltip: 'Settings',
            onClick: () => {Get.toNamed(Routes.settingsRoute)},
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
              decoration: const BoxDecoration(
                color: ColorsManager.white,
                shape: BoxShape.circle,
                // border: Border.all(
                //   color: ColorsManager.red,
                //   width: 2,
                // ),
                boxShadow: [
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
              child: CustomBoxWidget(
                size: 150,
                // backgroundColor: ColorsManager.grey100,
                isCircle: true,
                topPadding: 2.0,
                bottomPadding: 2.0,
                leftPadding: 2.0,
                rightPadding: 2.0,
                child: CachedNetworkImgWidget(
                  imgUrl: profileImg,
                  borderRadius: 75,
                  defaultImg: AssetsManager.logoStudentDefault,
                ),
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
                      text: '$userName',
                      maxLine: 2,
                      // color: ColorsManager.primaryBlue,
                      fontSize: AppSize.s20,
                      fontWeight: FontWeight.bold,
                      marginTop: AppSize.s20,
                      // marginBottom: AppSize.s4,
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
