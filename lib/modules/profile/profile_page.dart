import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import '../../routes/routes.dart';
import 'profile.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.grey100,
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: CustomAppBar(
        // title: 'Profile Page',
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            color: ColorsManager.white,
            tooltip: 'Settings',
            onPressed: () => {Get.toNamed(Routes.settingsRoute)},
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: AppSize.s32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ///===== Profile Header Widget =====//
              const ProfileHeader(
                userName: 'Sotheng',
                userRole: 'Student ',
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
                  leftTitle: 'Personal Information'.toUpperCase(),
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
                        text2: 'john.appleseed@example.com',
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
                        text2: '(+33) 06 78 8945 18',
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

              ///===== Education Widget =====//
              Padding(
                padding: const EdgeInsets.only(
                  left: AppSize.s12,
                  right: AppSize.s12,
                  // top: AppSize.s4,
                  bottom: AppSize.s12,
                ),
                child: CustomContainerWidget(
                  leftTitle: 'Education'.toUpperCase(),
                  titleFontSize: AppSize.s16,
                  // isRightWidget: true,
                  rightWidget: const Icon(
                    Icons.add,
                    color: ColorsManager.grey800,
                    size: AppSize.s24,
                  ),
                  child: Column(
                    children: const [
                      CustomListTileWidget(
                        text1: 'Central Lille',
                        text1Color: ColorsManager.grey850,
                        text1FontWeight: FontWeightManager.medium,
                        text1FontSize: AppSize.s16,
                        text2: 'Master of Science - Computer Science',
                        text2Color: ColorsManager.grey800,
                        text3:
                            'Dec 2020 - July 2022 at Villeneuve d’Ascq - France',
                        leftWidget: CustomBoxWidget(),
                        rightWidget: Icon(
                          Icons.edit,
                          color: ColorsManager.grey800,
                          size: AppSize.s20,
                        ),
                      ),
                      CustomListTileWidget(
                        text1: 'Paragon International University',
                        text1Color: ColorsManager.grey850,
                        text1FontWeight: FontWeightManager.medium,
                        text1FontSize: AppSize.s16,
                        text2:
                            'Bachelor of Science - Management of Information Systems',
                        text2Color: ColorsManager.grey800,
                        text3: 'Oct 2015 - July 2020 at Phnom Penh - Cambodia',
                        bottomPadding: 8.0,
                        isDivider: false,
                        leftWidget: CustomBoxWidget(),
                        rightWidget: Icon(
                          Icons.edit,
                          color: ColorsManager.grey800,
                          size: AppSize.s20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //===== Education Widget =====//

              ///===== Professional Widget =====//
              Padding(
                padding: const EdgeInsets.only(
                  left: AppSize.s12,
                  right: AppSize.s12,
                  // top: AppSize.s4,
                  bottom: AppSize.s12,
                ),
                child: CustomContainerWidget(
                  leftTitle: 'Professional Experiences'.toUpperCase(),
                  titleFontSize: AppSize.s16,
                  // isRightWidget: true,
                  rightWidget: const Icon(
                    Icons.add,
                    color: ColorsManager.grey800,
                    size: AppSize.s24,
                  ),
                  child: Column(
                    children: const [
                      CustomListTileWidget(
                        text1: 'Automation internship',
                        text1Color: ColorsManager.grey850,
                        text1FontWeight: FontWeightManager.medium,
                        text1FontSize: AppSize.s16,
                        text2: 'Orange France',
                        text2Color: ColorsManager.grey800,
                        text3:
                            "Dec 2020 - July 2022 at Villeneuve d'Ascq - France",
                        bottomPadding: 8.0,
                        isDivider: false,
                        leftWidget: CustomBoxWidget(
                          insideObj: Icon(
                            Icons.work,
                            color: ColorsManager.primary75,
                            size: AppSize.s20,
                          ),
                        ),
                        rightWidget: Icon(
                          Icons.edit,
                          color: ColorsManager.grey800,
                          size: AppSize.s20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //===== Professional Widget =====//

              ///===== Personal Widget =====//
              Padding(
                padding: const EdgeInsets.only(
                  left: AppSize.s12,
                  right: AppSize.s12,
                  // top: AppSize.s4,
                  bottom: AppSize.s12,
                ),
                child: CustomContainerWidget(
                  leftTitle: 'Personal Experiences'.toUpperCase(),
                  titleFontSize: AppSize.s16,
                  // isRightWidget: true,
                  rightWidget: const Icon(
                    Icons.add,
                    color: ColorsManager.grey800,
                    size: AppSize.s24,
                  ),
                  child: Column(),
                ),
              ),
              //===== Personal Widget =====//

              ///===== Skills Widget =====//
              Padding(
                padding: const EdgeInsets.only(
                  left: AppSize.s12,
                  right: AppSize.s12,
                  // top: AppSize.s4,
                  bottom: AppSize.s12,
                ),
                child: CustomContainerWidget(
                  leftTitle: 'Skills'.toUpperCase(),
                  titleFontSize: AppSize.s16,
                  // isRightWidget: true,
                  rightWidget: const Icon(
                    Icons.edit,
                    color: ColorsManager.grey800,
                    size: AppSize.s24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomList(
                        title: 'Soft Skill',
                        subtitleList: controller.skillList,
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(
                          24.0,
                          0.0,
                          8.0,
                          8.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            CustomTextWidget(
                              text: 'Hard Skill',
                              marginBottom: 5.0,
                              fontWeight: FontWeight.w600,
                            ),
                            CustomTextWidget(
                              text: '• Power Point - Novice',
                              marginBottom: 5.0,
                            ),
                            CustomTextWidget(
                              text: '• HTML - Competent',
                              marginBottom: 5.0,
                            ),
                            CustomTextWidget(
                              text: '• ExpressJS - Proficient',
                              marginBottom: 5.0,
                            ),
                            CustomTextWidget(
                              text: '• Presentation - Expert',
                              marginBottom: 5.0,
                            ),
                            CustomTextWidget(
                              text: '• E-trade - Expert',
                              marginBottom: 5.0,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              //===== Skills Widget =====//

              ///===== Languages Widget =====//
              Padding(
                padding: const EdgeInsets.only(
                  left: AppSize.s12,
                  right: AppSize.s12,
                  // top: AppSize.s4,
                  bottom: AppSize.s12,
                ),
                child: CustomContainerWidget(
                  leftTitle: 'Languages'.toUpperCase(),
                  titleFontSize: AppSize.s16,
                  // isRightWidget: true,
                  rightWidget: const Icon(
                    Icons.edit,
                    color: ColorsManager.grey800,
                    size: AppSize.s24,
                  ),
                  child: CustomList(
                    subtitleList: controller.languagesList,
                  ),
                ),
              ),
              //===== Languages Widget =====//

              ///===== Achievement Widget =====//
              Padding(
                padding: const EdgeInsets.only(
                  left: AppSize.s12,
                  right: AppSize.s12,
                  // top: AppSize.s4,
                  bottom: AppSize.s12,
                ),
                child: CustomContainerWidget(
                  leftTitle: 'Achievement'.toUpperCase(),
                  titleFontSize: AppSize.s16,
                  // isRightWidget: true,
                  rightWidget: const Icon(
                    Icons.add,
                    color: ColorsManager.grey800,
                    size: AppSize.s24,
                  ),
                  child: Column(
                    children: const [
                      CustomListTileWidget(
                        text1: 'TOEIC',
                        text1Color: ColorsManager.grey850,
                        text1FontWeight: FontWeightManager.medium,
                        text1FontSize: AppSize.s16,
                        text2: 'Dec 2020 - July 2022',
                        text2Color: ColorsManager.grey800,
                        text3: 'I scored 970 points out of 990 on the TOEIC.',
                        bottomPadding: 8.0,
                        isDivider: false,
                        leftWidget: CustomBoxWidget(
                          insideObj: Icon(
                            Icons.assignment,
                            color: ColorsManager.primary75,
                            size: AppSize.s20,
                          ),
                        ),
                        rightWidget: Icon(
                          Icons.edit,
                          color: ColorsManager.grey800,
                          size: AppSize.s20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //===== Achievement Widget =====//

              ///===== Certificates Widget =====//
              Padding(
                padding: const EdgeInsets.only(
                  left: AppSize.s12,
                  right: AppSize.s12,
                  // top: AppSize.s4,
                  bottom: AppSize.s12,
                ),
                child: CustomContainerWidget(
                  leftTitle: 'Certificates'.toUpperCase(),
                  titleFontSize: AppSize.s16,
                  // isRightWidget: true,
                  rightWidget: const Icon(
                    Icons.add,
                    color: ColorsManager.grey800,
                    size: AppSize.s24,
                  ),
                  child: Column(),
                ),
              ),
              //===== Certificates Widget =====//

              MaterialButton(
                onPressed: () {
                  controller.homeController.signOut();
                },
                child: const CustomTextWidget(
                  text: 'Sign Out',
                  fontSize: 24.0,
                  marginTop: 20.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
