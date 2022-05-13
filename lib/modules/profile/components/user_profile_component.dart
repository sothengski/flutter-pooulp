import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../modules.dart';

class UserProfileComponent extends StatelessWidget {
  const UserProfileComponent({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ///===== Profile Header Component =====//
        ProfileHeaderComponent(
          userName: controller.userProfileInfo.value.fullName,
          // userRole: controller.userInfoRepsonse.value.profile!.accountType,
        ),
        //===== Profile Header Component =====//

        ///===== Personal Information Component =====//
        // ContactInformationComponent(
        //   headerTitle: 'Personal Information',
        //   email: controller.userInfoRepsonse.value.email,
        //   phone: controller.userProfileInfo.value.fullPhone1Format,
        //   videoPreentationLink: controller.userProfileInfo.value.description,
        // ),
        //===== Personal Information Component =====//

        ///===== Education Component =====//
        // EducationInformationComponent(
        //   headerTitle: 'education',
        //   educationList: controller.studentInfoRepsonse.value.educations,
        // ),
        //===== Education Component =====//

        ///===== Professional Component =====//
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
                  text3: "Dec 2020 - July 2022 at Villeneuve d'Ascq - France",
                  bottomPadding: 8.0,
                  isDivider: false,
                  leftWidget: CustomBoxWidget(
                    child: Icon(
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
        //===== Professional Component =====//

        ///===== Personal Component =====//
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
        //===== Personal Component =====//

        ///===== Skills Component =====//
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
                  subtitleList: controller.mockSkillList,
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

                      // CustomTextWidget(
                      //   text: '• Power Point - Novice',
                      //   marginBottom: 5.0,
                      // ),
                      // CustomTextWidget(
                      //   text: '• HTML - Competent',
                      //   marginBottom: 5.0,
                      // ),
                      // CustomTextWidget(
                      //   text: '• ExpressJS - Proficient',
                      //   marginBottom: 5.0,
                      // ),
                      // CustomTextWidget(
                      //   text: '• Presentation - Expert',
                      //   marginBottom: 5.0,
                      // ),
                      // CustomTextWidget(
                      //   text: '• E-trade - Expert',
                      //   marginBottom: 5.0,
                      // ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        //===== Skills Component =====//

        ///===== Languages Component =====//
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
              subtitleList: controller.mockLanguageList,
            ),
          ),
        ),
        //===== Languages Component =====//

        ///===== Achievement Component =====//
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
                    child: Icon(
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
        //===== Achievement Component =====//

        ///===== Certificates Component =====//
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
            // child: Column(),
          ),
        ),
        //===== Certificates Component =====//
      ],
    );
  }
}

// class EducationInformationComponent extends StatelessWidget {
//   final String? headerTitle;
//   final String? schoolName;
//   final String? degreeTitle;
//   final String? dateAttendAndSchoolLocation;
//   final List<EducationModel>? educationList;

//   const EducationInformationComponent({
//     this.headerTitle = '',
//     this.schoolName = '',
//     this.degreeTitle,
//     this.dateAttendAndSchoolLocation,
//     this.educationList,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CustomContainerWidget(
//       leftMargin: AppSize.s12,
//       rightMargin: AppSize.s12,
//       // topMargin: AppSize.s12,
//       bottomMargin: AppSize.s12,
//       leftTitle: '$headerTitle'.toUpperCase(),
//       titleFontSize: AppSize.s16,
//       // isRightWidget: true,
//       rightWidget: const Icon(
//         Icons.add,
//         color: ColorsManager.grey800,
//         size: AppSize.s24,
//       ),
//       child: educationList == null
//           ? Container()
//           : Column(
//               children: educationList!
//                   .map(
//                     (e) => CustomListTileWidget(
//                       text1: e.school!.name,
//                       text1Color: ColorsManager.grey850,
//                       text1FontWeight: FontWeightManager.medium,
//                       text1FontSize: AppSize.s16,
//                       text2: e.degree,
//                       text2Color: ColorsManager.grey800,
//                       text3: '${e.attendedFromTo} at ${e.schoolCityAndCountry}',
//                       leftWidget: const CustomBoxWidget(),
//                       rightWidget: const Icon(
//                         Icons.edit,
//                         color: ColorsManager.grey800,
//                         size: AppSize.s20,
//                       ),
//                     ),
//                   )
//                   .toList(),
//               //     // CustomListTileWidget(
//               //     //   text1: 'Paragon International University',
//               //     //   text1Color: ColorsManager.grey850,
//               //     //   text1FontWeight: FontWeightManager.medium,
//               //     //   text1FontSize: AppSize.s16,
//               //     //   text2: 'Bachelor of Science - Management of Information Systems',
//               //     //   text2Color: ColorsManager.grey800,
//               //     //   text3: 'Oct 2015 - July 2020 at Phnom Penh - Cambodia',
//               //     //   bottomPadding: 8.0,
//               //     //   isDivider: false,
//               //     //   leftWidget: CustomBoxWidget(),
//               //     //   rightWidget: Icon(
//               //     //     Icons.edit,
//               //     //     color: ColorsManager.grey800,
//               //     //     size: AppSize.s20,
//               //     //   ),
//               //     // ),
//               //   ],
//             ),
//     );
//   }
// }
