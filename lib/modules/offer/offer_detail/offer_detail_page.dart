import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';
import '../offer.dart';

class OfferDetailPage extends GetView<OfferDetailController> {
  final JobOfferModel jobOfferDetail =
      (Get.arguments as List)[0] as JobOfferModel;
  final List<Widget>? actionButtons =
      (Get.arguments as List)[1] as List<Widget>;

  // const OfferDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const player = YoutubePlayerIFrame();
    controller.youtubeVideoId = jobOfferDetail.enterprise!.youtubeLink == null
        ? ''
        : jobOfferDetail.enterprise!.youtubeLink!.split('=').last;

    return Scaffold(
      // backgroundColor: ColorsManager.primary,
      appBar: CustomAppBar(
        title: 'offerDetails'.tr,
        elevation: 0.0,
        actions: [
          CustomIconButtonWidget(
            iconData: IconsManager.share,
            iconColor: ColorsManager.white,
            tooltip: AppStrings.removeText,
            onClick: () async => {
              await shareUtils(
                context: context,
                text: 'POOULP Job Offer',
                urlPreview: '${API.webDomain}/joboffers/${jobOfferDetail.uuid}',
              ),
            },
          )
        ],
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
                              '${jobOfferDetail.companyLocation}(${jobOfferDetail.workPlaceType})',
                          leftWidget: CustomBoxWidget(
                            size: 50,
                            isCircle: true,
                            topPadding: AppSize.s2,
                            bottomPadding: AppSize.s2,
                            leftPadding: AppSize.s2,
                            rightPadding: AppSize.s2,
                            child: CachedNetworkImgWidget(
                              imgUrl: '${jobOfferDetail.enterprise!.logoUrl}',
                              borderRadius: 100,
                              isCircle: true,
                              defaultImg: AssetsManager.logoEnterpriseDefault,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  CustomTextWidget(
                    text:
                        "${'posted'.tr}: ${jobOfferDetail.dateOfferStartFormat}",
                    // text: 'offer.posted'.trParams(
                    //   {'date': '${jobOfferDetail.dateOfferStartFormat}'},
                    // ),
                    // textAlign: TextAlign.center,
                    fontSize: AppSize.s12,
                    fontWeight: FontWeight.w500,
                    color: ColorsManager.red,
                    marginLeft: AppSize.s20,
                    marginTop: AppSize.s10,
                    // marginBottom: AppSize.s10,
                  ),
                  CustomTextWidget(
                    text:
                        "${'expiryDate'.tr}: ${jobOfferDetail.dateOfferEndFormat}",
                    fontSize: AppSize.s12,
                    fontWeight: FontWeight.w500,
                    color: ColorsManager.red,
                    marginLeft: AppSize.s20,
                    marginTop: AppSize.s4,
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
                        tabs: ['jobInformation'.tr, 'companyInformation'.tr]
                            .map(
                              (e) => Tab(
                                child: CustomTextWidget(
                                  text: e,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w500,
                                  color: null,
                                  maxLine: 2,
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

                          ///===== Rufusal Reason Component =====//

                          // if (jobOfferDetail.jobOfferStateModel!.stateId != 4)
                          //   Container()
                          // else
                          //   CustomBoxWidget(
                          //     leftMargin: AppSize.s8,
                          //     rightMargin: AppSize.s8,
                          //     backgroundColor: Colors.red[100],
                          //     child: Column(
                          //       children: [
                          //         Align(
                          //           alignment: Alignment.centerLeft,
                          //           child: CustomTextWidget(
                          //             textAlign: TextAlign.left,
                          //             text: jobOfferDetail
                          //                 .jobOfferStateModel!.reasonTagId
                          //                 .toString(),
                          //             fontWeight: FontWeightManager.bold,
                          //             color: ColorsManager.red900,
                          //             marginTop: AppSize.s4,
                          //             marginBottom: AppSize.s4,
                          //           ),
                          //         ),
                          //         if (jobOfferDetail
                          //                 .jobOfferStateModel!.reason ==
                          //             '')
                          //           Container()
                          //         else
                          //           CustomTextWidget(
                          //             textAlign: TextAlign.left,
                          //             text:
                          //                 '${jobOfferDetail.jobOfferStateModel!.reason}',
                          //             fontWeight: FontWeightManager.regular,
                          //             fontSize: AppSize.s12,
                          //             color: ColorsManager.red900,
                          //             // marginBottom: AppSize.s10,
                          //             maxLine: 50,
                          //           ),
                          //       ],
                          //     ),
                          //   ),
                          //===== Rufusal Reason Component =====//

                          ///===== Working Period Component =====//
                          OutlineContainerWidget(
                            title: 'workingPeriod'.tr,
                            titleColor: ColorsManager.primaryBlue,
                            childWidget: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomBoxWidget(
                                  child: CustomTextWidget(
                                    textAlign: TextAlign.center,
                                    text: jobOfferDetail.dateJobStartFormat !=
                                            ''
                                        ? "${'startFrom'.tr}: ${jobOfferDetail.dateJobStartFormat}"
                                        : '',
                                    // ? 'offer.startFrom'.trParams(
                                    //     {
                                    //       'date':
                                    //           '${jobOfferDetail.dateJobStartFormat}'
                                    //     },
                                    //   )
                                    // // 'Starting Date: ${jobOfferDetail.dateJobStartFormat}'
                                    // : 'offer.na'.tr,
                                    fontWeight: FontWeightManager.regular,
                                    fontSize: AppSize.s12,
                                    // marginBottom: AppSize.s10,
                                  ),
                                ),
                                const SizedBox(width: AppSize.s12),
                                if (jobOfferDetail.dateJobEndFormat != '')
                                  CustomBoxWidget(
                                    child: CustomTextWidget(
                                      textAlign: TextAlign.center,
                                      text:
                                          "${'endDate'.tr}: ${jobOfferDetail.dateJobEndFormat}",
                                      // text: 'offer.endDate'.trParams(
                                      //   {
                                      //     'date':
                                      //         '${jobOfferDetail.dateJobEndFormat}'
                                      //   },
                                      // ),
                                      fontWeight: FontWeightManager.regular,
                                      fontSize: AppSize.s12,
                                      // marginBottom: AppSize.s10,
                                    ),
                                  )
                                else
                                  Container(),
                              ],
                            ),
                          ),
                          //===== Working Period Component =====//

                          ///===== Working Duration Component =====//
                          if (jobOfferDetail.numberOfWorking! != '')
                            OutlineContainerWidget(
                              title: 'numberOfWorkingHour'.tr,
                              titleColor: ColorsManager.primaryBlue,
                              childWidget: CustomBoxWidget(
                                child: CustomTextWidget(
                                  textAlign: TextAlign.center,
                                  text: '${jobOfferDetail.numberOfWorking}',
                                  fontWeight: FontWeightManager.regular,
                                  fontSize: AppSize.s12,
                                  // marginBottom: AppSize.s10,
                                ),
                              ),
                            )
                          else
                            Container(),
                          //===== Working Duration Component =====//

                          ///===== Remuneration Component =====//
                          if (jobOfferDetail.remunerationMaxMin! != '')
                            OutlineContainerWidget(
                              title: 'remuneration'.tr,
                              titleColor: ColorsManager.primaryBlue,
                              childWidget: CustomBoxWidget(
                                child: CustomTextWidget(
                                  textAlign: TextAlign.center,
                                  text: '${jobOfferDetail.remunerationMaxMin}',
                                  fontWeight: FontWeightManager.regular,
                                  fontSize: AppSize.s12,
                                  // marginBottom: AppSize.s10,
                                ),
                              ),
                            )
                          else
                            Container(),
                          //===== Remuneration Component =====//

                          ///===== Remuneration Component =====//
                          if (jobOfferDetail.drivingLicence! == 1)
                            OutlineContainerWidget(
                              title: 'required'.tr,
                              titleColor: ColorsManager.primaryBlue,
                              childWidget: CustomBoxWidget(
                                child: CustomTextWidget(
                                  textAlign: TextAlign.center,
                                  text: 'drivingLicense'.tr,
                                  fontWeight: FontWeightManager.regular,
                                  fontSize: AppSize.s12,
                                  // marginBottom: AppSize.s10,
                                ),
                              ),
                            )
                          else
                            Container(),
                          //===== Remuneration Component =====//

                          ///===== Work Availabilities Component =====//
                          if (jobOfferDetail.availabilities!.isNotEmpty)
                            OutlineContainerWidget(
                              title: 'workAvailability'.tr,
                              titleColor: ColorsManager.primaryBlue,
                              childWidget: jobOfferDetail.availabilities != []
                                  ? Wrap(
                                      children: [
                                        for (var i = 0;
                                            i <
                                                jobOfferDetail
                                                    .availabilities!.length;
                                            i++)
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              right: AppSize.s8,
                                              bottom: AppSize.s4,
                                            ),
                                            child: CustomBoxWidget(
                                              child: CustomTextWidget(
                                                textAlign: TextAlign.center,
                                                text:
                                                    '${jobOfferDetail.availabilities![i].label}',
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
                          //===== Work Availabilities Component =====//

                          ///===== Types Component =====//
                          if (jobOfferDetail.types!.isNotEmpty)
                            OutlineContainerWidget(
                              title: 'types'.tr,
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
                                              child: CustomTextWidget(
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
                              title: 'fields'.tr,
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
                                              child: CustomTextWidget(
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

                          ///===== Skills Component =====//
                          if (jobOfferDetail.skills!.isNotEmpty)
                            OutlineContainerWidget(
                              title: 'skills'.tr,
                              titleColor: ColorsManager.primaryBlue,
                              childWidget: jobOfferDetail.skills != []
                                  ? Wrap(
                                      children: [
                                        for (var i = 0;
                                            i < jobOfferDetail.skills!.length;
                                            i++)
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              right: AppSize.s8,
                                              bottom: AppSize.s4,
                                            ),
                                            child: CustomBoxWidget(
                                              child: CustomTextWidget(
                                                textAlign: TextAlign.center,
                                                text:
                                                    '${jobOfferDetail.skills![i].label}',
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
                          //===== Skills Component =====//

                          ///===== Spoken Languages Component =====//
                          if (jobOfferDetail.spokenLanguages!.isNotEmpty)
                            OutlineContainerWidget(
                              title: 'spokenLanguages'.tr,
                              titleColor: ColorsManager.primaryBlue,
                              childWidget: jobOfferDetail.spokenLanguages != []
                                  ? Wrap(
                                      children: [
                                        for (var i = 0;
                                            i <
                                                jobOfferDetail
                                                    .spokenLanguages!.length;
                                            i++)
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              right: AppSize.s8,
                                              bottom: AppSize.s4,
                                            ),
                                            child: CustomBoxWidget(
                                              child: CustomTextWidget(
                                                textAlign: TextAlign.center,
                                                text:
                                                    '${jobOfferDetail.spokenLanguages![i].label}',
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
                          //===== Spoken Languages Component =====//

                          ///===== Office Address Component =====//
                          if (jobOfferDetail
                              .jobOfferFullOfficeAddress!.isNotEmpty)
                            OutlineContainerWidget(
                              title: 'jobOfferAddress'.tr,
                              titleColor: ColorsManager.primaryBlue,
                              childWidget: CustomTextWidget(
                                text: '${jobOfferDetail.addressStreet}',
                                // '${jobOfferDetail.jobOfferFullOfficeAddress}',
                                fontWeight: FontWeightManager.regular,
                                maxLine: 3,
                              ),
                            ),
                          //===== Office Address Component =====//

                          ///===== Job Description Component =====//
                          if (jobOfferDetail.description!.isNotEmpty)
                            OutlineContainerWidget(
                              title: 'jobDescription'.tr,
                              titleColor: ColorsManager.primaryBlue,
                              childWidget: CustomTextWidget(
                                text: '${jobOfferDetail.description}',
                                fontWeight: FontWeightManager.regular,
                                maxLine: 200,
                              ),
                            ),
                          //===== Job Description Component =====//

                          ///===== Additional Information Component =====//
                          if (jobOfferDetail.additionalInfo!.isNotEmpty)
                            OutlineContainerWidget(
                              title: 'additional_information'.tr,
                              titleColor: ColorsManager.primaryBlue,
                              childWidget: CustomTextWidget(
                                text: '${jobOfferDetail.additionalInfo}',
                                fontWeight: FontWeightManager.regular,
                                maxLine: 200,
                              ),
                            ),
                          //===== Additional Information Component =====//

                          ///===== Languages Component =====//
                          // if (jobOfferDetail.spokenLanguages!.isNotEmpty)
                          //   OutlineContainerWidget(
                          //     title: 'languages'.tr,
                          //     titleColor: ColorsManager.primaryBlue,
                          //     childWidget: jobOfferDetail.spokenLanguages != []
                          //         ? Wrap(
                          //             direction: Axis.vertical,
                          //             children: [
                          //               for (var i = 0;
                          //                   i <
                          //                       jobOfferDetail
                          //                           .spokenLanguages!.length;
                          //                   i++)
                          //                 Padding(
                          //                   padding: const EdgeInsets.only(
                          //                     right: AppSize.s4,
                          //                     bottom: AppSize.s4,
                          //                   ),
                          //                   child: CustomTextWidget(
                          //                     textAlign: TextAlign.center,
                          //                     text:
                          //                         '${jobOfferDetail.spokenLanguages![i].displayLabelAndLevel}',
                          //                     fontWeight:
                          //                         FontWeightManager.regular,
                          //                     // fontSize: AppSize.s12,
                          //                   ),
                          //                 ),
                          //             ],
                          //           )
                          //         : Container(),
                          //   )
                          // else
                          //   Container(),
                          //===== Languages Component =====//

                          ///===== Skills Component =====//
                          // if (jobOfferDetail.skills!.isNotEmpty)
                          //   OutlineContainerWidget(
                          //     title: 'skills'.tr,
                          //     titleColor: ColorsManager.primaryBlue,
                          //     childWidget: jobOfferDetail.skills != []
                          //         ? Wrap(
                          //             direction: Axis.vertical,
                          //             children: [
                          //               for (var i = 0;
                          //                   i < jobOfferDetail.skills!.length;
                          //                   i++)
                          //                 Padding(
                          //                   padding: const EdgeInsets.only(
                          //                     right: AppSize.s4,
                          //                     bottom: AppSize.s4,
                          //                   ),
                          //                   child: CustomTextWidget(
                          //                     textAlign: TextAlign.center,
                          //                     text:
                          //                         '${jobOfferDetail.skills![i].displayLabelAndLevel}',
                          //                     fontWeight:
                          //                         FontWeightManager.regular,
                          //                     // fontSize: AppSize.s12,
                          //                   ),
                          //                 ),
                          //             ],
                          //           )
                          //         : Container(),
                          //   )
                          // else
                          //   Container(),
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
                          // OutlineContainerWidget(
                          //   title: 'offer.enterpriseID'.tr,
                          //   titleColor: ColorsManager.primaryBlue,
                          //   childWidget: CustomBoxWidget(
                          //     child: CustomTextWidget(
                          //       textAlign: TextAlign.center,
                          //       text:
                          //           '${jobOfferDetail.enterprise!.enterpriseID}',
                          //       fontWeight: FontWeightManager.regular,
                          //       fontSize: AppSize.s12,
                          //       // marginBottom: AppSize.s10,
                          //     ),
                          //   ),
                          // ),
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

                          ///===== Enterprise HQ Office Address Component =====//
                          OutlineContainerWidget(
                            title: 'officeAddress'.tr,
                            titleColor: ColorsManager.primaryBlue,
                            childWidget: CustomTextWidget(
                              text:
                                  '${jobOfferDetail.enterprise!.companyAddress}',
                              // '${jobOfferDetail.enterprise!.companyAddress}${jobOfferDetail.companyLocation}',
                              fontWeight: FontWeightManager.regular,
                              maxLine: 3,
                            ),
                          ),
                          //===== Enterprise HQ Office Address Component =====//

                          ///===== Fields Component =====//
                          if (jobOfferDetail.enterprise!.fields!.isNotEmpty)
                            OutlineContainerWidget(
                              title: 'fields'.tr,
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
                                              child: CustomTextWidget(
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
                            title: 'description'.tr,
                            titleColor: ColorsManager.primaryBlue,
                            // isDivider: false,
                            childWidget: CustomTextWidget(
                              text: '${jobOfferDetail.enterprise!.description}',
                              fontWeight: FontWeightManager.regular,
                              maxLine: 200,
                            ),
                          ),
                          //===== Description Component =====//

                          ///===== Youtube Link Component =====//
                          if (controller.youtubeVideoId != '')
                            OutlineContainerWidget(
                              horizontalPadding: AppSize.s4,
                              title: 'companyVdoInto'.tr,
                              titleColor: ColorsManager.primaryBlue,
                              titleMarginLeft: AppSize.s12,
                              isDivider: false,
                              childWidget:
                                  // CustomTextWidget(
                                  //   text: '${jobOfferDetail.enterprise!.youtubeLink}',
                                  //   fontWeight: FontWeightManager.regular,
                                  //   maxLine: 200,
                                  // ),
                                  SizedBox(
                                height: 350,
                                child: YoutubePlayerControllerProvider(
                                  // Passing controller to widgets below.
                                  controller: controller.youtubeController,
                                  child: LayoutBuilder(
                                    builder: (context, constraints) {
                                      //  if (kIsWeb && constraints.maxWidth > 800) {
                                      return ListView(
                                        children: [
                                          Stack(
                                            children: [
                                              player,
                                              Positioned.fill(
                                                child: YoutubeValueBuilder(
                                                  controller: controller
                                                      .youtubeController,
                                                  builder: (context, value) {
                                                    return AnimatedCrossFade(
                                                      firstChild: const SizedBox
                                                          .shrink(),
                                                      secondChild: Material(
                                                        child: DecoratedBox(
                                                          decoration:
                                                              BoxDecoration(
                                                            image:
                                                                DecorationImage(
                                                              image:
                                                                  NetworkImage(
                                                                YoutubePlayerController
                                                                    .getThumbnail(
                                                                  videoId: controller
                                                                      .youtubeController
                                                                      .params
                                                                      .playlist
                                                                      .last,
                                                                  quality:
                                                                      ThumbnailQuality
                                                                          .medium,
                                                                ),
                                                              ),
                                                              fit: BoxFit
                                                                  .fitWidth,
                                                            ),
                                                          ),
                                                          child: const Center(
                                                            child:
                                                                CircularProgressIndicator(),
                                                          ),
                                                        ),
                                                      ),
                                                      crossFadeState:
                                                          value.isReady
                                                              ? CrossFadeState
                                                                  .showFirst
                                                              : CrossFadeState
                                                                  .showSecond,
                                                      duration: const Duration(
                                                        milliseconds: 300,
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          // const Controls(),
                                        ],
                                      );
                                      // }
                                    },
                                  ),
                                ),
                              ),
                            )
                          else
                            Container(),
                          // SizedBox(
                          //   height: 350,
                          //   child: YoutubePlayerControllerProvider(
                          //     // Passing controller to widgets below.
                          //     controller: controller.youtubeController,
                          //     child: LayoutBuilder(
                          //       builder: (context, constraints) {
                          //         //  if (kIsWeb && constraints.maxWidth > 800) {
                          //         return
                          //             // Column(
                          //             //   children: const [
                          //             //     Expanded(child: player),
                          //             //     SizedBox(
                          //             //       width: 100,
                          //             //       child: SingleChildScrollView(
                          //             //         child: Controls(),
                          //             //       ),
                          //             //     ),
                          //             //   ],
                          //             // );
                          //             ListView(
                          //           children: [
                          //             Stack(
                          //               children: [
                          //                 player,
                          //                 Positioned.fill(
                          //                   child: YoutubeValueBuilder(
                          //                     controller:
                          //                         controller.youtubeController,
                          //                     builder: (context, value) {
                          //                       return AnimatedCrossFade(
                          //                         firstChild:
                          //                             const SizedBox.shrink(),
                          //                         secondChild: Material(
                          //                           child: DecoratedBox(
                          //                             decoration: BoxDecoration(
                          //                               image: DecorationImage(
                          //                                 image: NetworkImage(
                          //                                   YoutubePlayerController
                          //                                       .getThumbnail(
                          //                                     videoId: controller
                          //                                         .youtubeController
                          //                                         .params
                          //                                         .playlist
                          //                                         .last,
                          //                                     quality:
                          //                                         ThumbnailQuality
                          //                                             .medium,
                          //                                   ),
                          //                                 ),
                          //                                 fit: BoxFit.fitWidth,
                          //                               ),
                          //                             ),
                          //                             child: const Center(
                          //                               child:
                          //                                   CircularProgressIndicator(),
                          //                             ),
                          //                           ),
                          //                         ),
                          //                         crossFadeState: value.isReady
                          //                             ? CrossFadeState.showFirst
                          //                             : CrossFadeState
                          //                                 .showSecond,
                          //                         duration: const Duration(
                          //                           milliseconds: 300,
                          //                         ),
                          //                       );
                          //                     },
                          //                   ),
                          //                 ),
                          //               ],
                          //             ),
                          //             // const Controls(),
                          //           ],
                          //         );
                          //         // }
                          //       },
                          //     ),
                          //     // Scaffold(
                          //     //   body: LayoutBuilder(
                          //     //     builder: (context, constraints) {
                          //     //       if (kIsWeb && constraints.maxWidth > 800) {
                          //     //         return
                          //     //         Row(
                          //     //           crossAxisAlignment:
                          //     //               CrossAxisAlignment.start,
                          //     //           children: const [
                          //     //             Expanded(child: player),
                          //     //             SizedBox(
                          //     //               width: 500,
                          //     //               child: SingleChildScrollView(
                          //     //                   // child: Controls(),
                          //     //                   ),
                          //     //             ),
                          //     //           ],
                          //     //         );
                          //     //       }
                          //     //       return ListView(
                          //     //         children: [
                          //     //           Stack(
                          //     //             children: [
                          //     //               player,
                          //     //               Positioned.fill(
                          //     //                 child: YoutubeValueBuilder(
                          //     //                   controller:
                          //     //                       controller.youtubeController,
                          //     //                   builder: (context, value) {
                          //     //                     return AnimatedCrossFade(
                          //     //                       firstChild:
                          //     //                           const SizedBox.shrink(),
                          //     //                       secondChild: Material(
                          //     //                         child: DecoratedBox(
                          //     //                           decoration: BoxDecoration(
                          //     //                             image: DecorationImage(
                          //     //                               image: NetworkImage(
                          //     //                                 YoutubePlayerController
                          //     //                                     .getThumbnail(
                          //     //                                   videoId: controller
                          //     //                                       .youtubeController
                          //     //                                       .params
                          //     //                                       .playlist
                          //     //                                       .first,
                          //     //                                   quality:
                          //     //                                       ThumbnailQuality
                          //     //                                           .medium,
                          //     //                                 ),
                          //     //                               ),
                          //     //                               fit: BoxFit.fitWidth,
                          //     //                             ),
                          //     //                           ),
                          //     //                           child: const Center(
                          //     //                             child:
                          //     //                                 CircularProgressIndicator(),
                          //     //                           ),
                          //     //                         ),
                          //     //                       ),
                          //     //                       crossFadeState: value.isReady
                          //     //                           ? CrossFadeState.showFirst
                          //     //                           : CrossFadeState
                          //     //                               .showSecond,
                          //     //                       duration: const Duration(
                          //     //                         milliseconds: 300,
                          //     //                       ),
                          //     //                     );
                          //     //                   },
                          //     //                 ),
                          //     //               ),
                          //     //             ],
                          //     //           ),
                          //     //           // const Controls(),
                          //     //         ],
                          //     //       );
                          //     //     },
                          //     //   ),
                          //     // ),
                          //   ),
                          // )
                          //===== Youtube Link Component =====//
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

///
class Controls extends StatelessWidget {
  ///
  const Controls();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _space,
          const Text(
            'data',
          ),
          // MetaDataSection(),
          _space,
          // SourceInputSection(),
          _space,
          // PlayPauseButtonBar(),
          _space,
          // VolumeSlider(),
          _space,
          // PlayerStateSection(),
        ],
      ),
    );
  }

  Widget get _space => const SizedBox(height: 10);
}
