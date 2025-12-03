import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';

class MessageCard extends StatelessWidget {
  final MessagingModel? message;
  final VoidCallback? onTap;
  final bool? isHideProfilePic;

  const MessageCard({
    super.key,
    this.message,
    this.onTap,
    this.isHideProfilePic = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: AppSize.s2),
      child: message!.isOwner == 0
          //isCurrentUser == false
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: AppSize.s4),
                  child: isHideProfilePic == true
                      ? CustomBoxWidget.chatAvatarDefault(child: Container())
                      : CustomBoxWidget(
                          size: 35,
                          isCircle: true,
                          topPadding: 2.0,
                          bottomPadding: 2.0,
                          leftPadding: 2.0,
                          rightPadding: 2.0,
                          child: CachedNetworkImgWidget(
                            imgUrl: message!.pictureUrl, //userProfilePic,
                            iconSize: 30,
                            logoAsText: message!.shortName, //shortName,
                            borderRadius: AppSize.s48,
                          ),
                        ),
                ),
                const SizedBox(width: AppSize.s10),
                Container(
                  alignment: Alignment.centerLeft,
                  constraints: BoxConstraints(
                    maxWidth: getWidth * 0.70,
                    minWidth: getWidth * 0.35,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: onTap,
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
                          decoration: const BoxDecoration(
                            color: ColorsManager.grey200,
                            // borderRadius: BorderRadius.circular(8),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                              // bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                          ),
                          child: CustomTextWidget(
                            text: "${message!.message}",
                            color: ColorsManager.black,
                            maxLine: 1000,
                          ),
                        ),
                      ),
                      if (message!.enableDateTime == false)
                        Container()
                      else
                        CustomTextWidget(
                          text: dateFormatToHourMn(
                            date: message!.createdAt!.toLocal(),
                          ),
                          fontSize: AppSize.s10,
                          color: ColorsManager.grey600,
                        ),
                    ],
                  ),
                ),
                // const SizedBox(width: AppSize.s72),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // const SizedBox(width: AppSize.s72),
                Flexible(
                  child: Container(
                    alignment: Alignment.centerRight,
                    constraints: BoxConstraints(
                      maxWidth: getWidth * 0.75,
                      minWidth: getWidth * 0.35,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: onTap,
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
                            decoration: const BoxDecoration(
                              color: ColorsManager.primary,
                              // borderRadius: BorderRadius.circular(8),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                                // bottomRight: Radius.circular(8),
                              ),
                            ),
                            child: CustomTextWidget(
                              text: "${message!.message}",
                              color: ColorsManager.white,
                              maxLine: 1000,
                            ),
                          ),
                        ),
                        if (message!.enableDateTime == false)
                          Container()
                        else
                          CustomTextWidget(
                            text: dateFormatToHourMn(
                              date: message!.createdAt!.toLocal(),
                            ),
                            fontSize: AppSize.s10,
                            color: ColorsManager.grey600,
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: AppSize.s10),
              ],
            ),
    );
  }
}
