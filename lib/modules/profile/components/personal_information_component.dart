import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';

class PersonalInformationComponent extends StatelessWidget {
  final String? routeNameForEdit;
  final ProfileModel? profileModel;
  final UserModel? userModel;
  final StudentProfileModel? studentProfileModel;

  const PersonalInformationComponent({
    Key? key,
    required this.routeNameForEdit,
    this.profileModel,
    this.userModel,
    this.studentProfileModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainerWidget(
      leftMargin: AppSize.s16,
      rightMargin: AppSize.s16,
      topMargin: AppSize.s12,
      bottomMargin: AppSize.s12,
      leftTitle: 'profile.information'.tr.toUpperCase(),
      titleFontSize: AppSize.s16,
      rightWidget: CustomIconButtonWidget(
        iconData: Icons.edit_outlined,
        padding: 0.0,
        isConstraints: true,
        onClick: () => {
          Get.toNamed(routeNameForEdit!),
        },
      ),
      child: Column(
        children: [
          if (profileModel!.description == '')
            Container()
          else
            CustomTextWidget(
              text: '${profileModel!.description}',
              color: ColorsManager.grey850,
              maxLine: 3,
              marginTop: AppSize.s4,
              marginLeft: AppSize.s16,
              marginRight: AppSize.s16,
              marginBottom: AppSize.s4,
            ),
          CustomListTileWidget(
            text1: 'profile.email'.tr,
            text2: userModel!.email,
            // isLauching: true,
            text2Color: ColorsManager.blue,
            leftWidget: const CustomBoxWidget(
              child: Icon(
                Icons.email_outlined,
                color: ColorsManager.grey,
                size: AppSize.s24,
              ),
            ),
          ),
          CustomListTileWidget(
            text1: 'profile.phone'.tr,
            text2: profileModel!.fullPhone1Format,
            // isLauching: true,
            text2Color: ColorsManager.blue,
            leftWidget: const CustomBoxWidget(
              child: Icon(
                Icons.phone_outlined,
                color: ColorsManager.grey,
                size: AppSize.s24,
              ),
            ),
          ),
          CustomListTileWidget(
            text1: 'profile.address'.tr,
            text2: '${profileModel!.addressStreet} ',
            // isLauching: true,
            text2Color: ColorsManager.black,
            leftWidget: const CustomBoxWidget(
              child: Icon(
                Icons.pin_drop_outlined,
                color: ColorsManager.grey,
                size: AppSize.s24,
              ),
            ),
          ),
          // CustomListTileWidget(
          //   text1: 'profile.vdoLink'.tr,
          //   text2: studentProfileModel!.youtubeLink,
          //   // isLauching: true,
          //   text2Color: ColorsManager.blue,
          //   bottomPadding: 8.0,
          //   isDivider: false,
          //   leftWidget: const CustomBoxWidget(
          //     child: Icon(
          //       Icons.video_library_outlined,
          //       color: ColorsManager.grey,
          //       size: AppSize.s24,
          //     ),
          //   ),
          // ),
          // const Divider(
          //   height: 1,
          //   thickness: 0.5,
          //   color: ColorsManager.grey300,
          // ),
          InkWell(
            onTap: () => Get.dialog(
              MaterialDialogWidget(
                title: 'profile.information'.tr,
                titleHorizontalMargin: AppSize.s12,
                dialogMargin: AppSize.s28,
                rightWidget: CustomIconButtonWidget(
                  iconData: Icons.close,
                  padding: 0.0,
                  isConstraints: true,
                  onClick: () => {
                    Get.back(),
                  },
                ),
                contentWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (profileModel!.description == '')
                      Container()
                    else
                      CustomTextWidget(
                        text: '${profileModel!.description}',
                        color: ColorsManager.grey850,
                        maxLine: 50,
                        marginTop: AppSize.s4,
                        marginLeft: AppSize.s16,
                        marginRight: AppSize.s16,
                        marginBottom: AppSize.s4,
                      ),
                    CustomListTileWidget(
                      text1: 'profile.email'.tr,
                      text2: userModel!.email,
                      // isLauching: true,
                      text2Color: ColorsManager.blue,
                      leftWidget: const CustomBoxWidget(
                        child: Icon(
                          Icons.email_outlined,
                          color: ColorsManager.grey,
                          size: AppSize.s24,
                        ),
                      ),
                    ),
                    CustomListTileWidget(
                      text1: 'profile.gender'.tr,
                      text2: studentProfileModel!.gender ?? ' ',
                      // isLauching: true,
                      text2Color: ColorsManager.black,
                      leftWidget: const CustomBoxWidget(
                        child: Icon(
                          Icons.group_outlined,
                          color: ColorsManager.grey,
                          size: AppSize.s24,
                        ),
                      ),
                    ),
                    if (profileModel!.birthDate == null)
                      Container()
                    else
                      CustomListTileWidget(
                        text1: 'profile.birthday'.tr,
                        text2: dateFormatSlashDDMMYYYY(
                          date: profileModel!.birthDate,
                        ),
                        // isLauching: true,
                        text2Color: ColorsManager.black,
                        leftWidget: const CustomBoxWidget(
                          child: Icon(
                            Icons.date_range_outlined,
                            color: ColorsManager.grey,
                            size: AppSize.s24,
                          ),
                        ),
                      ),
                    CustomListTileWidget(
                      text1: 'profile.phone'.tr,
                      text2: profileModel!.fullPhone1Format,
                      // isLauching: true,
                      text2Color: ColorsManager.blue,
                      leftWidget: const CustomBoxWidget(
                        child: Icon(
                          Icons.phone_outlined,
                          color: ColorsManager.grey,
                          size: AppSize.s24,
                        ),
                      ),
                    ),
                    CustomListTileWidget(
                      text1: 'profile.address'.tr,
                      text2: '${profileModel!.addressStreet} ',
                      // isLauching: true,
                      text2Color: ColorsManager.black,
                      leftWidget: const CustomBoxWidget(
                        child: Icon(
                          Icons.pin_drop_outlined,
                          color: ColorsManager.grey,
                          size: AppSize.s24,
                        ),
                      ),
                    ),
                    CustomListTileWidget(
                      text1: 'profile.linkedInAcc'.tr,
                      text2: '${studentProfileModel!.linkedinLink} ',
                      // isLauching: true,
                      text2Color: ColorsManager.blue,
                      bottomPadding: 8.0,
                      leftWidget: const CustomBoxWidget(
                        child: Image(
                          image: AssetImage(AssetsManager.linkedInLogo1),
                        ),
                        // Icon(
                        //   Icons.video_library_outlined,
                        //   color: ColorsManager.grey,
                        //   size: AppSize.s24,
                        // ),
                      ),
                    ),
                    CustomListTileWidget(
                      text1: 'profile.vdoLink'.tr,
                      text2: studentProfileModel!.youtubeLink,
                      // isLauching: true,
                      text2Color: ColorsManager.blue,
                      bottomPadding: 8.0,
                      isDivider: false,
                      leftWidget: const CustomBoxWidget(
                        child: Icon(
                          Icons.video_library_outlined,
                          color: ColorsManager.grey,
                          size: AppSize.s24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                top: AppSize.s12,
                bottom: AppSize.s12,
              ),
              color: ColorsManager.grey100,
              child: Center(
                child: CustomTextWidget(
                  text: 'profile.seeAllInfo'.tr,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
