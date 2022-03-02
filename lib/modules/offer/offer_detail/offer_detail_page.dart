import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';
import '../offer.dart';

class OfferDetailPage extends GetView<OfferDetailController> {
  // ignore: avoid_dynamic_calls
  final JobOfferModel jobOfferDetail = Get.arguments[0] as JobOfferModel;
  // ignore: avoid_dynamic_calls
  final List<Widget>? actionButtons = Get.arguments[1] as List<Widget>;

  // const OfferDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorsManager.primary,
      appBar: CustomAppBar(
        title: 'Offer Details',
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 90,
            child: Container(
              margin: const EdgeInsets.only(
                left: AppSize.s4,
                right: AppSize.s4,
                // bottom: AppSize.s40,
              ),
              padding: const EdgeInsets.only(
                // left: AppSize.s16,
                // right: AppSize.s16,
                bottom: AppSize.s4,
              ),
              decoration: const BoxDecoration(
                color: ColorsManager.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
              ),
              child: ListView(
                controller: controller.scrollController,
                children: [
                  Column(
                    children: [
                      CustomTextWidget(
                        marginTop: AppSize.s16,
                        marginBottom: AppSize.s16,
                        marginRight: AppSize.s10,
                        marginLeft: AppSize.s10,
                        text: '${jobOfferDetail.title}',
                        fontSize: AppSize.s20,
                        fontWeight: FontWeightManager.bold,
                        textAlign: TextAlign.center,
                        color: ColorsManager.primary,
                        maxLine: 4,
                      ),
                      const Divider(
                        height: AppSize.s5,
                        thickness: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: AppSize.s12,
                          right: AppSize.s12,
                        ),
                        child: CustomListTileWidget(
                          isDivider: false,
                          leftFlex: 15,
                          // leftRightPadding: AppSize.s12,
                          text1: '${jobOfferDetail.enterprise!.name}',
                          text1Color: ColorsManager.primary,
                          text1FontSize: AppSize.s16,
                          text2:
                              '${jobOfferDetail.companyLocation} (${jobOfferDetail.workPlaceType})',
                          leftWidget: CustomBoxWidget(
                            size: 50,
                            insideObj: CachedNetworkImgWidget(
                              imgUrl: '${jobOfferDetail.enterprise!.logoUrl}',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  CustomTextWidget(
                    text: 'Posted: ${jobOfferDetail.dateOfferStartFormat}',
                    // textAlign: TextAlign.center,
                    fontSize: AppSize.s12,
                    fontWeight: FontWeight.w500,
                    color: ColorsManager.red,
                    marginLeft: AppSize.s20,
                    marginTop: AppSize.s10,
                    marginBottom: AppSize.s10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      // color: ColorsManager.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: TabBar(
                        // isScrollable: true,
                        controller: controller.tabController,
                        // give the indicator a decoration (color and border radius)
                        labelColor: ColorsManager.primary,
                        indicator: const UnderlineTabIndicator(
                          borderSide: BorderSide(
                            color: ColorsManager.primary,
                            width: 2.0,
                          ),
                        ),
                        unselectedLabelColor: ColorsManager.grey,
                        tabs: [
                          'Job Summary',
                          'Company',
                        ]
                            .map(
                              (e) => Tab(
                                child: CustomTextWidget(
                                  text: e,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w500,
                                  color: null,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                  Obx(
                    () => [
                      ///===== First Tab Component =====//
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: AppSize.s10,
                          ),

                          ///===== Working Period Component =====//
                          OutlineContainerWidget(
                            title: 'Working Period',
                            titleColor: ColorsManager.primaryBlue,
                            childWidget: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomBoxWidget(
                                  insideObj: CustomTextWidget(
                                    textAlign: TextAlign.center,
                                    text: jobOfferDetail.dateJobStartFormat !=
                                            ''
                                        ? 'Starting Date: ${jobOfferDetail.dateJobStartFormat}'
                                        : 'N/A',
                                    fontWeight: FontWeightManager.regular,
                                    fontSize: AppSize.s12,
                                    // marginBottom: AppSize.s10,
                                  ),
                                ),
                                if (jobOfferDetail.dateJobEndFormat == null)
                                  Container(
                                    margin: const EdgeInsetsDirectional.only(
                                      top: AppSize.s4,
                                    ),
                                    child: CustomBoxWidget(
                                      insideObj: CustomTextWidget(
                                        textAlign: TextAlign.center,
                                        text:
                                            'End Date: ${jobOfferDetail.dateJobEndFormat}',
                                        fontWeight: FontWeightManager.regular,
                                        fontSize: AppSize.s12,
                                        // marginBottom: AppSize.s10,
                                      ),
                                    ),
                                  )
                                else
                                  Container(),
                              ],
                            ),
                          ),
                          //===== Working Period Component =====//

                          ///===== Working Duration Component =====//
                          if (jobOfferDetail.types!.isNotEmpty)
                            OutlineContainerWidget(
                              title: 'Working Duration',
                              titleColor: ColorsManager.primaryBlue,
                              childWidget: CustomBoxWidget(
                                insideObj: CustomTextWidget(
                                  textAlign: TextAlign.center,
                                  text: '${jobOfferDetail.numberOfWorkPerWeek}',
                                  fontWeight: FontWeightManager.regular,
                                  fontSize: AppSize.s12,
                                  // marginBottom: AppSize.s10,
                                ),
                              ),
                            )
                          else
                            Container(),
                          //===== Working Duration Component =====//

                          ///===== Types Component =====//
                          if (jobOfferDetail.types!.isNotEmpty)
                            OutlineContainerWidget(
                              title: 'Types',
                              titleColor: ColorsManager.primaryBlue,
                              childWidget: jobOfferDetail.types != []
                                  ? Wrap(
                                      children: [
                                        for (var i = 0;
                                            i < jobOfferDetail.types!.length;
                                            i++)
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              right: AppSize.s8,
                                              bottom: AppSize.s4,
                                            ),
                                            child: CustomBoxWidget(
                                              insideObj: CustomTextWidget(
                                                textAlign: TextAlign.center,
                                                text:
                                                    '${jobOfferDetail.types![i].label}',
                                                fontWeight:
                                                    FontWeightManager.regular,
                                                fontSize: AppSize.s12,
                                              ),
                                            ),
                                          ),
                                      ],
                                    )
                                  : Container(),
                            )
                          else
                            Container(),
                          //===== Types Component =====//

                          ///===== Fields Component =====//
                          if (jobOfferDetail.fields!.isNotEmpty)
                            OutlineContainerWidget(
                              title: 'Fields',
                              titleColor: ColorsManager.primaryBlue,
                              childWidget: jobOfferDetail.fields != []
                                  ? Wrap(
                                      children: [
                                        for (var i = 0;
                                            i < jobOfferDetail.fields!.length;
                                            i++)
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              right: AppSize.s8,
                                              bottom: AppSize.s4,
                                            ),
                                            child: CustomBoxWidget(
                                              insideObj: CustomTextWidget(
                                                textAlign: TextAlign.center,
                                                text:
                                                    '${jobOfferDetail.fields![i].label}',
                                                fontWeight:
                                                    FontWeightManager.regular,
                                                fontSize: AppSize.s12,
                                              ),
                                            ),
                                          ),
                                      ],
                                    )
                                  : Container(),
                            )
                          else
                            Container(),
                          //===== Fields Component =====//

                          ///===== Office Address Component =====//
                          OutlineContainerWidget(
                            title: 'Office Address',
                            titleColor: ColorsManager.primaryBlue,
                            childWidget: CustomTextWidget(
                              text: '${jobOfferDetail.addressStreet}',
                              fontWeight: FontWeightManager.regular,
                              maxLine: 3,
                            ),
                          ),
                          //===== Office Address Component =====//

                          ///===== Job Description Component =====//
                          OutlineContainerWidget(
                            title: 'Job Description',
                            titleColor: ColorsManager.primaryBlue,
                            childWidget: CustomTextWidget(
                              text: '${jobOfferDetail.description}',
                              fontWeight: FontWeightManager.regular,
                              maxLine: 200,
                            ),
                          ),
                          //===== Job Description Component =====//

                          ///===== Languages Component =====//
                          if (jobOfferDetail.spokenLanguages!.isNotEmpty)
                            OutlineContainerWidget(
                              title: 'Languages',
                              titleColor: ColorsManager.primaryBlue,
                              childWidget: jobOfferDetail.spokenLanguages != []
                                  ? Wrap(
                                      direction: Axis.vertical,
                                      children: [
                                        for (var i = 0;
                                            i <
                                                jobOfferDetail
                                                    .spokenLanguages!.length;
                                            i++)
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              right: AppSize.s4,
                                              bottom: AppSize.s4,
                                            ),
                                            child: CustomTextWidget(
                                              textAlign: TextAlign.center,
                                              text:
                                                  '${jobOfferDetail.spokenLanguages![i].displayLabelAndLevel}',
                                              fontWeight:
                                                  FontWeightManager.regular,
                                              // fontSize: AppSize.s12,
                                            ),
                                          ),
                                      ],
                                    )
                                  : Container(),
                            )
                          else
                            Container(),
                          //===== Languages Component =====//

                          ///===== Skills Component =====//
                          if (jobOfferDetail.skills!.isNotEmpty)
                            OutlineContainerWidget(
                              title: 'Skills',
                              titleColor: ColorsManager.primaryBlue,
                              childWidget: jobOfferDetail.skills != []
                                  ? Wrap(
                                      direction: Axis.vertical,
                                      children: [
                                        for (var i = 0;
                                            i < jobOfferDetail.skills!.length;
                                            i++)
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              right: AppSize.s4,
                                              bottom: AppSize.s4,
                                            ),
                                            child: CustomTextWidget(
                                              textAlign: TextAlign.center,
                                              text:
                                                  '${jobOfferDetail.skills![i].displayLabelAndLevel}',
                                              fontWeight:
                                                  FontWeightManager.regular,
                                              // fontSize: AppSize.s12,
                                            ),
                                          ),
                                      ],
                                    )
                                  : Container(),
                            )
                          else
                            Container(),
                          //===== Skills Component =====//
                        ],
                      ),

                      //===== First Tab Component =====//

                      ///===== Second Tab Component =====//
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: AppSize.s10,
                          ),

                          ///===== Enterprise ID Component =====//
                          OutlineContainerWidget(
                            title: 'Enterprise ID',
                            titleColor: ColorsManager.primaryBlue,
                            childWidget: CustomBoxWidget(
                              insideObj: CustomTextWidget(
                                textAlign: TextAlign.center,
                                text:
                                    '${jobOfferDetail.enterprise!.enterpriseID}',
                                fontWeight: FontWeightManager.regular,
                                fontSize: AppSize.s12,
                                // marginBottom: AppSize.s10,
                              ),
                            ),
                          ),
                          //===== Enterprise ID Component =====//

                          ///===== Contact Phone Component =====//
                          // GestureDetector(
                          //   onTap: () async {
                          //     urlLauncherUtils(
                          //       thingToLaunch: jobOfferDetail.enterprise!
                          //           .managers![0].managerPhoneContact,
                          //       laucherType: LauncherType.phone,
                          //     );
                          //   },
                          //   child: OutlineContainerWidget(
                          //     title: 'Contact Phone',
                          //     titleColor: ColorsManager.primaryBlue,
                          //     childWidget: CustomBoxWidget(
                          //       insideObj: CustomTextWidget(
                          //         textAlign: TextAlign.center,
                          //         text: jobOfferDetail.enterprise!.managers![0]
                          //             .managerPhoneContact,
                          //         fontWeight: FontWeightManager.regular,
                          //         fontSize: AppSize.s12,
                          //         // marginBottom: AppSize.s10,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          //===== Contact Phone Component =====//

                          ///===== Contact Email Component =====//
                          // GestureDetector(
                          //   onTap: () async {
                          //     urlLauncherUtils(
                          //       thingToLaunch: jobOfferDetail.enterprise!
                          //           .managers![0].managerEmailContact,
                          //       laucherType: LauncherType.email,
                          //     );
                          //   },
                          //   child: OutlineContainerWidget(
                          //     title: 'Contact Email',
                          //     titleColor: ColorsManager.primaryBlue,
                          //     childWidget: CustomBoxWidget(
                          //       insideObj: CustomTextWidget(
                          //         textAlign: TextAlign.center,
                          //         text: jobOfferDetail.enterprise!.managers![0]
                          //             .managerEmailContact,
                          //         fontWeight: FontWeightManager.regular,
                          //         fontSize: AppSize.s12,
                          //         // marginBottom: AppSize.s10,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          //===== Contact Email Component =====//

                          ///===== Office Address Component =====//
                          OutlineContainerWidget(
                            title: 'Office Address',
                            titleColor: ColorsManager.primaryBlue,
                            childWidget: CustomTextWidget(
                              text:
                                  '${jobOfferDetail.enterprise!.addressStreet}',
                              fontWeight: FontWeightManager.regular,
                            ),
                          ),
                          //===== Office Address Component =====//

                          ///===== Fields Component =====//
                          if (jobOfferDetail.enterprise!.fields!.isNotEmpty)
                            OutlineContainerWidget(
                              title: 'Fields',
                              titleColor: ColorsManager.primaryBlue,
                              childWidget: jobOfferDetail.enterprise!.fields !=
                                      []
                                  ? Wrap(
                                      children: [
                                        for (var i = 0;
                                            i <
                                                jobOfferDetail
                                                    .enterprise!.fields!.length;
                                            i++)
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              right: AppSize.s4,
                                              bottom: AppSize.s4,
                                            ),
                                            child: CustomBoxWidget(
                                              insideObj: CustomTextWidget(
                                                textAlign: TextAlign.center,
                                                text:
                                                    '${jobOfferDetail.enterprise!.fields![i].label}',
                                                fontWeight:
                                                    FontWeightManager.regular,
                                                fontSize: AppSize.s12,
                                              ),
                                            ),
                                          ),
                                      ],
                                    )
                                  : Container(),
                            )
                          else
                            Container(),
                          //===== Fields Component =====//

                          ///===== Description Component =====//
                          OutlineContainerWidget(
                            title: 'Description',
                            titleColor: ColorsManager.primaryBlue,
                            isDivider: false,
                            childWidget: CustomTextWidget(
                              text: '${jobOfferDetail.enterprise!.description}',
                              fontWeight: FontWeightManager.regular,
                              maxLine: 200,
                            ),
                          ),
                          //===== Description Component =====//
                        ],
                      ),
                      //===== Second Tab Component =====//
                    ]
                        // ),
                        [controller.currentIndexRx.value],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.only(
                left: AppSize.s4,
                right: AppSize.s4,
                // bottom: AppSize.s20,
              ),
              // padding: const EdgeInsets.only(
              // left: AppSize.s16,
              // right: AppSize.s16,
              // bottom: AppSize.s16,
              // ),
              decoration: const BoxDecoration(
                color: ColorsManager.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
              ),
              // child: Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     Expanded(
              //       child: OutlineIconButtonWidget(
              //         buttonTitle: 'Apply',
              //         iconData: Icons.thumb_up_alt_outlined,
              //         iconDataOnClick: Icons.thumb_up,
              //         iconColorOnClick: ColorsManager.green,
              //         iconSize: AppSize.s24,
              //         // buttonState: false,
              //         onPressed: () {
              //           customSnackbar(
              //             msgTitle: 'This Button is under construction!',
              //             msgContent:
              //                 'This Page is only view.\n Data will not save.',
              //           );
              //           // feedController.applyButtonStateList[index!] =
              //           //     feedController.jobOfferOnClickBoolSwitching(
              //           //   boolValue:
              //           //       feedController.applyButtonStateList[index!],
              //           // );
              //         },
              //       ),
              //     ),
              //     Expanded(
              //       child: OutlineIconButtonWidget(
              //         buttonTitle: 'Save',
              //         iconData: Icons.turned_in_not_outlined,
              //         iconDataOnClick: Icons.turned_in,
              //         iconColorOnClick: ColorsManager.blue,
              //         iconSize: AppSize.s24,
              //         // buttonState: feedController.savedButtonStateList[index!],
              //         onPressed: () {
              //           customSnackbar(
              //             msgTitle: 'This Button is under construction!',
              //             msgContent:
              //                 'This Page is only view.\n Data will not save.',
              //           );
              //           // feedController.savedButtonStateList[index!] =
              //           //     feedController.jobOfferOnClickBoolSwitching(
              //           //   boolValue:
              //           //       feedController.savedButtonStateList[index!],
              //           // );
              //         },
              //       ),
              //     ),
              //     Expanded(
              //       child: OutlineIconButtonWidget(
              //         buttonTitle: 'Hide',
              //         iconData: Icons.visibility_off_outlined,
              //         iconDataOnClick: Icons.visibility_outlined,
              //         iconColorOnClick: ColorsManager.red,
              //         iconSize: AppSize.s24,
              //         // buttonState: feedController.hideButtonStateList[index!],
              //         onPressed: () {
              //           customSnackbar(
              //             msgTitle: 'This Button is under construction!',
              //             msgContent:
              //                 'This Page is only view.\n Data will not save.',
              //           );
              //           // feedController.hideButtonStateList[index!] =
              //           //     feedController.jobOfferOnClickBoolSwitching(
              //           //   boolValue: feedController.hideButtonStateList[index!],
              //           // );
              //         },
              //       ),
              //     ),
              //   ],
              // ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: actionButtons!
                    .where(
                      (element) =>
                          element.key! !=
                          const ValueKey(
                            OfferStrings.informationAction,
                          ),
                    )
                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
