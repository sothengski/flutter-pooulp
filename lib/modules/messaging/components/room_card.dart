import 'package:flutter/material.dart';

import '../../../core/core.dart';

class RoomCard extends StatelessWidget {
  final String? imgUrl;
  final String? participantName;
  final String? lastestMessage;
  final int? unseenMessage;

  final String? date;
  const RoomCard({
    Key? key,
    this.imgUrl = '',
    this.participantName,
    this.lastestMessage,
    this.date,
    this.unseenMessage = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorsManager.white,
        border: Border(
          bottom: BorderSide(
            color: ColorsManager.grey200,
          ),
        ),
      ),
      padding: const EdgeInsets.all(AppSize.s10),
      child: Row(
        children: [
          Expanded(
            flex: 15,

            ///===== Image Component =====//
            child: CustomBoxWidget(
              size: 60,
              isCircle: true,
              topPadding: 2.0,
              bottomPadding: 2.0,
              leftPadding: 2.0,
              rightPadding: 2.0,
              child: CachedNetworkImgWidget(
                imgUrl: imgUrl,
                iconSize: 30,
                iconData: Icons.person_outline,
              ),
            ),
            //===== Image Component =====//
          ),
          Expanded(
            flex: 85,
            child: Container(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ///===== Participant Name Component =====//
                      Expanded(
                        child: CustomTextWidget(
                          text: participantName,
                          fontSize: AppSize.s16,
                          fontWeight: FontWeight.w400,
                          marginBottom: AppSize.s8,
                        ),
                      ),
                      //===== Participant Name Component =====//

                      ///===== Date Component =====//
                      CustomTextWidget(
                        text: date,
                        color: ColorsManager.grey,
                        marginBottom: AppSize.s8,
                      ),
                      //===== Date Component =====//
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ///===== Unseen Message Component =====//
                      Expanded(
                        child: CustomTextWidget(
                          text: lastestMessage.toString(),
                          color: ColorsManager.grey600,
                        ),
                      ),
                      //===== Unseen Message Component =====//

                      ///===== Date Component =====//
                      if (unseenMessage == 0)
                        Container()
                      else
                        CustomBoxWidget(
                          borderRadius: AppSize.s16,
                          topPadding: AppSize.s2,
                          bottomPadding: AppSize.s2,
                          leftPadding: AppSize.s0,
                          rightPadding: AppSize.s0,
                          backgroundColor: ColorsManager.primary,
                          child: CustomTextWidget(
                            text: unseenMessage.toString(),
                            fontSize: AppSize.s12,
                            color: ColorsManager.white,
                            textAlign: TextAlign.center,
                            marginLeft: AppSize.s6,
                            marginRight: AppSize.s6,
                          ),
                        ),
                      //===== Date Component =====//
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    // CustomListTileWidget(
    //   text1: participantName,
    //   text1Color: ColorsManager.grey850,
    //   text1FontWeight: FontWeightManager.medium,
    //   text1FontSize: AppSize.s16,
    //   text2: '${lastestMessage.toString()}...$date',
    //   text2Color: ColorsManager.grey800,
    //   // bottomPadding: 8.0,
    //   leftWidget: const CustomBoxWidget(
    //     size: 40,
    //     child: Icon(
    //       Icons.work,
    //       color: ColorsManager.primary75,
    //       size: AppSize.s20,
    //     ),
    //   ),
    //   rightWidget: CustomIconButtonWidget(
    //     iconData: Icons.edit_outlined,
    //     padding: 0.0,
    //     iconSize: 20.0,
    //     isConstraints: true,
    //     onClick: () => {
    //       // Get.toNamed(
    //       //   Routes.addOrEditExperienceRoute,
    //       //   arguments: [
    //       //     Keys.editOperation,
    //       //     AppStrings.personalKey,
    //       //     e,
    //       //   ],
    //       // ),
    //     },
    //   ),
    // );
  }
}
