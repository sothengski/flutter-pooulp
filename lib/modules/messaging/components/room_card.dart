import 'package:flutter/material.dart';

import '../../../core/core.dart';

class RoomCard extends StatelessWidget {
  final String? imgUrl;
  final String? participantName;
  final String? lastestMessage;
  final int? unseenMessage;
  final int? unseenbadge;
  final String? shortName;

  final String? date;
  const RoomCard({
    Key? key,
    this.imgUrl = '',
    this.participantName,
    this.lastestMessage,
    this.date,
    this.unseenMessage = 0,
    this.unseenbadge = 0,
    this.shortName = '',
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
            child: CustomBoxWidget.chatAvatarDefault(
              size: 60,
              backgroundColor: ColorsManager.grey100,
              child: CachedNetworkImgWidget(
                imgUrl: imgUrl,
                iconSize: 30,
                logoAsText: shortName,
                borderRadius: 100,
                isCircle: true,
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
                          maxLine: 1,
                        ),
                      ),
                      //===== Unseen Message Component =====//

                      ///===== UnseenMessage Component =====//
                      if (unseenbadge != 0 || unseenMessage != 0)
                        CustomBoxWidget(
                          borderRadius: AppSize.s12,
                          topPadding: AppSize.s1,
                          bottomPadding: AppSize.s1,
                          leftPadding: AppSize.s1,
                          rightPadding: AppSize.s1,
                          backgroundColor: ColorsManager.primary,
                          child: unseenbadge != 0
                              ? const IconTheme(
                                  data: IconThemeData(
                                    size: AppSize.s6,
                                    color: ColorsManager.red,
                                  ),
                                  child: Icon(Icons.circle),
                                )
                              : CustomTextWidget(
                                  text: unseenMessage.toString(),
                                  fontSize: AppSize.s12,
                                  color: ColorsManager.white,
                                  textAlign: TextAlign.center,
                                  marginLeft: AppSize.s4,
                                  marginRight: AppSize.s4,
                                ),
                        )
                      else
                        Container(),
                      //===== UnseenMessage Component =====//
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
