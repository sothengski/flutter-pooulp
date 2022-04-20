import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';

class MessageCard extends StatelessWidget {
  // final String? userId;
  // final bool? isCurrentUser;
  // final String? userProfilePic;
  // final String? shortName;
  // final String? messageContent;
  // final String? date;
  final MessagingModel? message;
  final bool? isShowDateTime;

  const MessageCard({
    Key? key,
    // this.userId,
    // this.isCurrentUser = false,
    // this.userProfilePic = '',
    // this.shortName,
    // this.messageContent,
    // this.date,
    this.message,
    this.isShowDateTime = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: AppSize.s10),
      child: message!.isOwner == 0
          //isCurrentUser == false
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: AppSize.s4),
                  child: CustomBoxWidget(
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
                // Transform(
                //   alignment: Alignment.center,
                //   transform: Matrix4.rotationY(pi),
                //   child: CustomPaint(
                //     painter: CustomShape(Colors.green[300]!),
                //   ),
                // ),
                const SizedBox(width: AppSize.s10),
                Container(
                  alignment:
                      // !chat.isSent ?
                      Alignment.centerLeft,
                  //   :Alignment.centerRight,
                  constraints: BoxConstraints(
                    maxWidth: getWidth * 0.70,
                    minWidth: getWidth * 0.35,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
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
                        //  Text.rich(
                        //   TextSpan(
                        //     children: [
                        //       TextSpan(text: message!.message),
                        //       const WidgetSpan(child: SizedBox(width: 10)),
                        //       //PlaceHolder
                        //       TextSpan(
                        //         text: dateFormatToHourMn(
                        //           date: message!.createdAt!.toLocal(),
                        //         ),
                        //         style: const TextStyle(
                        //           color: ColorsManager.grey600,
                        //           fontSize: 12,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ),
                      if (isShowDateTime == false)
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
                    alignment:
                        // !chat.isSent ? Alignment.centerLeft :
                        Alignment.centerRight,
                    constraints: BoxConstraints(
                      maxWidth: getWidth * 0.75,
                      minWidth: getWidth * 0.35,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
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
                          //     Text.rich(
                          //   TextSpan(
                          //     children: [
                          //       TextSpan(
                          //         text:
                          //             "${message!.message}${message!.message!.length > 30 ? '\n' : '  '}",
                          //       ),
                          //       // const WidgetSpan(child: SizedBox(width: 10)),
                          //       //PlaceHolder
                          //       TextSpan(
                          //         text: dateFormatToHourMn(
                          //           date: message!.createdAt!.toLocal(),
                          //         ),
                          //         style: const TextStyle(
                          //           color: ColorsManager.grey100,
                          //           fontSize: 12,
                          //         ),
                          //       ),
                          //       // WidgetSpan(
                          //       //   child: Opacity(
                          //       //     opacity: 1,
                          //       //     child: Row(
                          //       //       mainAxisSize: MainAxisSize.min,
                          //       //       children: [
                          //       //         CustomTextWidget(
                          //       //           text: dateFormatToHourMn(
                          //       //             date: message!.createdAt!.toLocal(),
                          //       //           ),
                          //       //           color: ColorsManager.grey600,
                          //       //         ),
                          //       //         const SizedBox(width: 5),
                          //       //       ],
                          //       //     ),
                          //       //   ),
                          //       // ),
                          //     ],
                          //   ),
                          //   // textAlign: TextAlign.end,
                          // ),
                        ),
                        CustomTextWidget(
                          text: dateFormatToHourMn(
                            date: message!.createdAt!.toLocal(),
                          ),
                          fontSize: AppSize.s10,
                          color: ColorsManager.grey600,
                        ),
                      ],
                    ),
                    // CustomTextWidget(
                    //   text: chat!.message, // messageContent,
                    //   color: ColorsManager.white,
                    //   maxLine: 1000,
                    // ),
                  ),
                ),
                const SizedBox(width: AppSize.s10),
                // Expanded(
                //   flex: 10,
                //   child: Padding(
                //     padding: const EdgeInsets.only(bottom: AppSize.s10),
                //     child: CustomBoxWidget(
                //       size: 35,
                //       isCircle: true,
                //       topPadding: 2.0,
                //       bottomPadding: 2.0,
                //       leftPadding: 2.0,
                //       rightPadding: 2.0,
                //       child: CachedNetworkImgWidget(
                //         imgUrl: chat!.pictureUrl, // userProfilePic,
                //         iconSize: 30,
                //         logoAsText: chat!.shortName, // shortName,
                //         borderRadius: AppSize.s48,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
    );
  }
}

// class CustomShape extends CustomPainter {
//   final Color bgColor;

//   CustomShape(this.bgColor);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()..color = bgColor;

//     final path = Path();
//     path.lineTo(-5, 0);
//     path.lineTo(0, 10);
//     path.lineTo(5, 0);
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }
