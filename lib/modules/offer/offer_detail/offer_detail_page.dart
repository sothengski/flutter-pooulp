import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';
import '../offer.dart';

// ignore: must_be_immutable
class OfferDetailPage extends GetView<OfferDetailController> {
  // final JobOfferModel jobOfferDetail = (Get.arguments) == null
  //     ? JobOfferModel(uuid: '')
  //     : (Get.arguments as List)[0] as JobOfferModel;
  late String? jobOfferUUID =
      (Get.arguments) == null ? '' : (Get.arguments as List)[0] as String;
  List<Widget>? actionButtons = [];
  //     (Get.arguments as List)[1] as List<Widget>;
  bool? isCustomActBtn;
  //=  (Get.arguments as List)[2] as bool?;
  OfferDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print('build jobOffer Detail: $jobOfferUUID');
    // print('build jobOffer Detail: ${Get.arguments}');

    controller.jobOfferUUID.value = jobOfferUUID;
    // print(
    //   'page: controller.jobOfferUUID UUID ${controller.jobOfferUUID.value}',
    // );
    // controller.jobOfferDetail!.value = jobOfferDetail;
    actionButtons = (Get.arguments) != null
        ? (Get.arguments as List)[1] as List<Widget>
        : [];
    isCustomActBtn =
        (Get.arguments) != null ? (Get.arguments as List)[2] as bool? : false;
    const player = YoutubePlayerIFrame();
    // if (controller.jobOfferDetail!.value.uuid!.isNotEmpty) {
    //   controller.youtubeVideoId =
    //       controller.jobOfferDetail!.value.enterprise!.youtubeLink == null
    //           ? ''
    //           : controller.jobOfferDetail!.value.enterprise!.youtubeLink!
    //               .split('=')
    //               .last;
    //   controller.makeRequestToPOSTJobOfferViewCountAPI(
    //     jobOfferUUID: controller.jobOfferDetail!.value.uuid,
    //   );
    // }

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
                urlPreview:
                    '${API.webDomain}/joboffers/${controller.jobOfferDetail!.value.uuid}',
                // urlPreview: controller.firebaseDynamicLinkService
                //     .createDynamicLink()
                //     .toString(),
              ),
            },
          )
        ],
      ),
      body: Obx(
        () => controller.jobOfferDetail!.value.uuid == ''
            ? const LoadingWidget()
            : Column(
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
                                text:
                                    '${controller.jobOfferDetail!.value.title}',
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
                                  text1:
                                      '${controller.jobOfferDetail!.value.enterprise!.name}',
                                  text1Color: ColorsManager.primary,
                                  text1FontSize: AppSize.s16,
                                  text2:
                                      '${controller.jobOfferDetail!.value.companyLocation}(${controller.jobOfferDetail!.value.workPlaceType})',
                                  leftWidget: CustomBoxWidget(
                                    size: 50,
                                    isCircle: true,
                                    topPadding: AppSize.s2,
                                    bottomPadding: AppSize.s2,
                                    leftPadding: AppSize.s2,
                                    rightPadding: AppSize.s2,
                                    child: CachedNetworkImgWidget(
                                      imgUrl:
                                          '${controller.jobOfferDetail!.value.enterprise!.logoUrl}',
                                      borderRadius: 100,
                                      isCircle: true,
                                      defaultImg:
                                          AssetsManager.logoEnterpriseDefault,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          CustomTextWidget(
                            text:
                                "${'posted'.tr}: ${controller.jobOfferDetail!.value.dateOfferStartFormat}",
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
                                "${'expiryDate'.tr}: ${controller.jobOfferDetail!.value.dateOfferEndFormat}",
                            fontSize: AppSize.s12,
                            fontWeight: FontWeight.w500,
                            color: ColorsManager.red,
                            marginLeft: AppSize.s20,
                            marginTop: AppSize.s4,
                            marginBottom: AppSize.s10,
                          ),
                          DecoratedBox(
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
                                  'jobInformation'.tr,
                                  'companyInformation'.tr
                                ]
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

                                  // if (controller.jobOfferDetail!.value.jobOfferStateModel!.stateId != 4)
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
                                  //             text: controller.jobOfferDetail!.value
                                  //                 .jobOfferStateModel!.reasonTagId
                                  //                 .toString(),
                                  //             fontWeight: FontWeightManager.bold,
                                  //             color: ColorsManager.red900,
                                  //             marginTop: AppSize.s4,
                                  //             marginBottom: AppSize.s4,
                                  //           ),
                                  //         ),
                                  //         if (controller.jobOfferDetail!.value
                                  //                 .jobOfferStateModel!.reason ==
                                  //             '')
                                  //           Container()
                                  //         else
                                  //           CustomTextWidget(
                                  //             textAlign: TextAlign.left,
                                  //             text:
                                  //                 '${controller.jobOfferDetail!.value.jobOfferStateModel!.reason}',
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomBoxWidget(
                                          child: CustomTextWidget(
                                            textAlign: TextAlign.center,
                                            text: controller
                                                        .jobOfferDetail!
                                                        .value
                                                        .dateJobStartFormat !=
                                                    ''
                                                ? "${'startFrom'.tr}: ${controller.jobOfferDetail!.value.dateJobStartFormat}"
                                                : '',
                                            // ? 'offer.startFrom'.trParams(
                                            //     {
                                            //       'date':
                                            //           '${controller.jobOfferDetail!.value.dateJobStartFormat}'
                                            //     },
                                            //   )
                                            // // 'Starting Date: ${controller.jobOfferDetail!.value.dateJobStartFormat}'
                                            // : 'offer.na'.tr,
                                            fontWeight:
                                                FontWeightManager.regular,
                                            fontSize: AppSize.s12,
                                            // marginBottom: AppSize.s10,
                                          ),
                                        ),
                                        const SizedBox(width: AppSize.s12),
                                        if (controller.jobOfferDetail!.value
                                                .dateJobEndFormat !=
                                            '')
                                          CustomBoxWidget(
                                            child: CustomTextWidget(
                                              textAlign: TextAlign.center,
                                              text:
                                                  "${'endDate'.tr}: ${controller.jobOfferDetail!.value.dateJobEndFormat}",
                                              // text: 'offer.endDate'.trParams(
                                              //   {
                                              //     'date':
                                              //         '${controller.jobOfferDetail!.value.dateJobEndFormat}'
                                              //   },
                                              // ),
                                              fontWeight:
                                                  FontWeightManager.regular,
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
                                  if (controller.jobOfferDetail!.value
                                          .numberOfWorking! !=
                                      '')
                                    OutlineContainerWidget(
                                      title: 'numberOfWorkingHour'.tr,
                                      titleColor: ColorsManager.primaryBlue,
                                      childWidget: CustomBoxWidget(
                                        child: CustomTextWidget(
                                          textAlign: TextAlign.center,
                                          text:
                                              '${controller.jobOfferDetail!.value.numberOfWorking}',
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
                                  if (controller.jobOfferDetail!.value
                                          .remunerationMaxMin! !=
                                      '')
                                    OutlineContainerWidget(
                                      title: 'remuneration'.tr,
                                      titleColor: ColorsManager.primaryBlue,
                                      childWidget: CustomBoxWidget(
                                        child: CustomTextWidget(
                                          textAlign: TextAlign.center,
                                          text:
                                              '${controller.jobOfferDetail!.value.remunerationMaxMin}',
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
                                  if (controller.jobOfferDetail!.value
                                          .drivingLicence! ==
                                      1)
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
                                  if (controller.jobOfferDetail!.value
                                      .availabilities!.isNotEmpty)
                                    OutlineContainerWidget(
                                      title: 'workAvailability'.tr,
                                      titleColor: ColorsManager.primaryBlue,
                                      childWidget: controller.jobOfferDetail!
                                                  .value.availabilities !=
                                              []
                                          ? Wrap(
                                              children: [
                                                for (var i = 0;
                                                    i <
                                                        controller
                                                            .jobOfferDetail!
                                                            .value
                                                            .availabilities!
                                                            .length;
                                                    i++)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      right: AppSize.s8,
                                                      bottom: AppSize.s4,
                                                    ),
                                                    child: CustomBoxWidget(
                                                      child: CustomTextWidget(
                                                        textAlign:
                                                            TextAlign.center,
                                                        text:
                                                            '${controller.jobOfferDetail!.value.availabilities![i].label}',
                                                        fontWeight:
                                                            FontWeightManager
                                                                .regular,
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
                                  if (controller
                                      .jobOfferDetail!.value.types!.isNotEmpty)
                                    OutlineContainerWidget(
                                      title: 'types'.tr,
                                      titleColor: ColorsManager.primaryBlue,
                                      childWidget: controller.jobOfferDetail!
                                                  .value.types !=
                                              []
                                          ? Wrap(
                                              children: [
                                                for (var i = 0;
                                                    i <
                                                        controller
                                                            .jobOfferDetail!
                                                            .value
                                                            .types!
                                                            .length;
                                                    i++)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      right: AppSize.s8,
                                                      bottom: AppSize.s4,
                                                    ),
                                                    child: CustomBoxWidget(
                                                      child: CustomTextWidget(
                                                        textAlign:
                                                            TextAlign.center,
                                                        text:
                                                            '${controller.jobOfferDetail!.value.types![i].label}',
                                                        fontWeight:
                                                            FontWeightManager
                                                                .regular,
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

                                  ///===== Internship Period Component =====//
                                  if (controller.jobOfferDetail!.value
                                      .internshipPeriods!.isNotEmpty)
                                    OutlineContainerWidget(
                                      title: 'internshipPeriod'.tr,
                                      titleColor: ColorsManager.primaryBlue,
                                      childWidget: controller.jobOfferDetail!
                                                  .value.internshipPeriods !=
                                              []
                                          ? Wrap(
                                              children: [
                                                for (var i = 0;
                                                    i <
                                                        controller
                                                            .jobOfferDetail!
                                                            .value
                                                            .internshipPeriods!
                                                            .length;
                                                    i++)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      right: AppSize.s8,
                                                      bottom: AppSize.s4,
                                                    ),
                                                    child: CustomBoxWidget(
                                                      child: CustomTextWidget(
                                                        textAlign:
                                                            TextAlign.center,
                                                        text:
                                                            '${controller.jobOfferDetail!.value.internshipPeriods![i].label}',
                                                        fontWeight:
                                                            FontWeightManager
                                                                .regular,
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
                                  //===== Internship Periods Component =====//

                                  ///===== Internship Types Component =====//
                                  if (controller.jobOfferDetail!.value
                                      .internshipTypes!.isNotEmpty)
                                    OutlineContainerWidget(
                                      title: 'internshipType'.tr,
                                      titleColor: ColorsManager.primaryBlue,
                                      childWidget: controller.jobOfferDetail!
                                                  .value.internshipTypes !=
                                              []
                                          ? Wrap(
                                              children: [
                                                for (var i = 0;
                                                    i <
                                                        controller
                                                            .jobOfferDetail!
                                                            .value
                                                            .internshipTypes!
                                                            .length;
                                                    i++)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      right: AppSize.s8,
                                                      bottom: AppSize.s4,
                                                    ),
                                                    child: CustomBoxWidget(
                                                      child: CustomTextWidget(
                                                        textAlign:
                                                            TextAlign.center,
                                                        text:
                                                            '${controller.jobOfferDetail!.value.internshipTypes![i].label}',
                                                        fontWeight:
                                                            FontWeightManager
                                                                .regular,
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
                                  //===== Internship Types Component =====//

                                  ///===== Fields Component =====//
                                  if (controller
                                      .jobOfferDetail!.value.fields!.isNotEmpty)
                                    OutlineContainerWidget(
                                      title: 'fields'.tr,
                                      titleColor: ColorsManager.primaryBlue,
                                      childWidget: controller.jobOfferDetail!
                                                  .value.fields !=
                                              []
                                          ? Wrap(
                                              children: [
                                                for (var i = 0;
                                                    i <
                                                        controller
                                                            .jobOfferDetail!
                                                            .value
                                                            .fields!
                                                            .length;
                                                    i++)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      right: AppSize.s8,
                                                      bottom: AppSize.s4,
                                                    ),
                                                    child: CustomBoxWidget(
                                                      child: CustomTextWidget(
                                                        textAlign:
                                                            TextAlign.center,
                                                        text:
                                                            '${controller.jobOfferDetail!.value.fields![i].label}',
                                                        fontWeight:
                                                            FontWeightManager
                                                                .regular,
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
                                  if (controller
                                      .jobOfferDetail!.value.skills!.isNotEmpty)
                                    OutlineContainerWidget(
                                      title: 'skills'.tr,
                                      titleColor: ColorsManager.primaryBlue,
                                      childWidget: controller.jobOfferDetail!
                                                  .value.skills !=
                                              []
                                          ? Wrap(
                                              children: [
                                                for (var i = 0;
                                                    i <
                                                        controller
                                                            .jobOfferDetail!
                                                            .value
                                                            .skills!
                                                            .length;
                                                    i++)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      right: AppSize.s8,
                                                      bottom: AppSize.s4,
                                                    ),
                                                    child: CustomBoxWidget(
                                                      child: CustomTextWidget(
                                                        textAlign:
                                                            TextAlign.center,
                                                        text:
                                                            '${controller.jobOfferDetail!.value.skills![i].label}',
                                                        fontWeight:
                                                            FontWeightManager
                                                                .regular,
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
                                  if (controller.jobOfferDetail!.value
                                      .spokenLanguages!.isNotEmpty)
                                    OutlineContainerWidget(
                                      title: 'spokenLanguages'.tr,
                                      titleColor: ColorsManager.primaryBlue,
                                      childWidget: controller.jobOfferDetail!
                                                  .value.spokenLanguages !=
                                              []
                                          ? Wrap(
                                              children: [
                                                for (var i = 0;
                                                    i <
                                                        controller
                                                            .jobOfferDetail!
                                                            .value
                                                            .spokenLanguages!
                                                            .length;
                                                    i++)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      right: AppSize.s8,
                                                      bottom: AppSize.s4,
                                                    ),
                                                    child: CustomBoxWidget(
                                                      child: CustomTextWidget(
                                                        textAlign:
                                                            TextAlign.center,
                                                        text:
                                                            '${controller.jobOfferDetail!.value.spokenLanguages![i].label}',
                                                        fontWeight:
                                                            FontWeightManager
                                                                .regular,
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
                                  if (controller.jobOfferDetail!.value
                                      .jobOfferFullOfficeAddress!.isNotEmpty)
                                    OutlineContainerWidget(
                                      title: 'jobOfferAddress'.tr,
                                      titleColor: ColorsManager.primaryBlue,
                                      childWidget: CustomTextWidget(
                                        text:
                                            '${controller.jobOfferDetail!.value.addressStreet}',
                                        // '${controller.jobOfferDetail!.value.jobOfferFullOfficeAddress}',
                                        fontWeight: FontWeightManager.regular,
                                        maxLine: 3,
                                      ),
                                    ),
                                  //===== Office Address Component =====//

                                  ///===== Job Description Component =====//
                                  if (controller.jobOfferDetail!.value
                                      .description!.isNotEmpty)
                                    OutlineContainerWidget(
                                      title: 'jobDescription'.tr,
                                      titleColor: ColorsManager.primaryBlue,
                                      childWidget: CustomTextWidget(
                                        text:
                                            '${controller.jobOfferDetail!.value.description}',
                                        fontWeight: FontWeightManager.regular,
                                        maxLine: 200,
                                      ),
                                    ),
                                  //===== Job Description Component =====//

                                  ///===== Additional Information Component =====//
                                  if (controller.jobOfferDetail!.value
                                      .additionalInfo!.isNotEmpty)
                                    OutlineContainerWidget(
                                      title: 'additional_information'.tr,
                                      titleColor: ColorsManager.primaryBlue,
                                      childWidget: CustomTextWidget(
                                        text:
                                            '${controller.jobOfferDetail!.value.additionalInfo}',
                                        fontWeight: FontWeightManager.regular,
                                        maxLine: 200,
                                      ),
                                    ),
                                  //===== Additional Information Component =====//

                                  ///===== Youtube Link Component =====//
                                  if (controller.jobOfferDetail!.value
                                      .youtubeLink!.isNotEmpty)
                                    OutlineContainerWidget(
                                      title: 'youtubeLink'.tr,
                                      titleColor: ColorsManager.primaryBlue,
                                      childWidget: GestureDetector(
                                        onTap: () async {
                                          urlLauncherUtils(
                                            thingToLaunch: controller
                                                .jobOfferDetail!
                                                .value
                                                .youtubeLink,
                                            inApp: true,
                                          );
                                        },
                                        child: CustomTextWidget(
                                          text:
                                              '${controller.jobOfferDetail!.value.youtubeLink}',
                                          color: ColorsManager.blue,
                                          fontWeight: FontWeightManager.regular,
                                          maxLine: 200,
                                          textDecoration:
                                              TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  //===== Youtube Link Component =====//

                                  ///===== Languages Component =====//
                                  // if (controller.jobOfferDetail!.value.spokenLanguages!.isNotEmpty)
                                  //   OutlineContainerWidget(
                                  //     title: 'languages'.tr,
                                  //     titleColor: ColorsManager.primaryBlue,
                                  //     childWidget: controller.jobOfferDetail!.value.spokenLanguages != []
                                  //         ? Wrap(
                                  //             direction: Axis.vertical,
                                  //             children: [
                                  //               for (var i = 0;
                                  //                   i <
                                  //                       controller.jobOfferDetail!.value
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
                                  //                         '${controller.jobOfferDetail!.value.spokenLanguages![i].displayLabelAndLevel}',
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
                                  // if (controller.jobOfferDetail!.value.skills!.isNotEmpty)
                                  //   OutlineContainerWidget(
                                  //     title: 'skills'.tr,
                                  //     titleColor: ColorsManager.primaryBlue,
                                  //     childWidget: controller.jobOfferDetail!.value.skills != []
                                  //         ? Wrap(
                                  //             direction: Axis.vertical,
                                  //             children: [
                                  //               for (var i = 0;
                                  //                   i < controller.jobOfferDetail!.value.skills!.length;
                                  //                   i++)
                                  //                 Padding(
                                  //                   padding: const EdgeInsets.only(
                                  //                     right: AppSize.s4,
                                  //                     bottom: AppSize.s4,
                                  //                   ),
                                  //                   child: CustomTextWidget(
                                  //                     textAlign: TextAlign.center,
                                  //                     text:
                                  //                         '${controller.jobOfferDetail!.value.skills![i].displayLabelAndLevel}',
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
                                  //           '${controller.jobOfferDetail!.value.enterprise!.enterpriseID}',
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
                                  //       thingToLaunch: controller.jobOfferDetail!.value.enterprise!
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
                                  //         text: controller.jobOfferDetail!.value.enterprise!.managers![0]
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
                                  //       thingToLaunch: controller.jobOfferDetail!.value.enterprise!
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
                                  //         text: controller.jobOfferDetail!.value.enterprise!.managers![0]
                                  //             .managerEmailContact,
                                  //         fontWeight: FontWeightManager.regular,
                                  //         fontSize: AppSize.s12,
                                  //         // marginBottom: AppSize.s10,
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  //===== Contact Email Component =====//

                                  ///===== EnterpriseCategory Component =====//
                                  if (controller.jobOfferDetail!.value
                                          .enterprise!.legalStatusLabel !=
                                      null)
                                    OutlineContainerWidget(
                                      title: 'enterpriseType'.tr,
                                      titleColor: ColorsManager.primaryBlue,
                                      // isDivider: false,
                                      childWidget: CustomTextWidget(
                                        text: controller.jobOfferDetail!.value
                                            .enterprise!.legalStatusLabel,
                                        fontWeight: FontWeightManager.regular,
                                        maxLine: 200,
                                      ),
                                    ),
                                  //===== EnterpriseCategory Component =====//

                                  ///===== established In Component =====//
                                  if (controller.jobOfferDetail!.value
                                          .enterprise!.enterpriseType !=
                                      null)
                                    OutlineContainerWidget(
                                      title: 'enterpriseCategory'.tr,
                                      titleColor: ColorsManager.primaryBlue,
                                      // isDivider: false,
                                      childWidget: CustomTextWidget(
                                        text: controller.jobOfferDetail!.value
                                            .enterprise!.enterpriseType!.label,
                                        fontWeight: FontWeightManager.regular,
                                        maxLine: 200,
                                      ),
                                    ),
                                  //===== established In Component =====//

                                  ///===== established In Component =====//
                                  if (controller.jobOfferDetail!.value
                                          .enterprise!.establishedIn !=
                                      null)
                                    OutlineContainerWidget(
                                      title: 'establishedIn'.tr,
                                      titleColor: ColorsManager.primaryBlue,
                                      // isDivider: false,
                                      childWidget: CustomTextWidget(
                                        text: dateFormatYYYY(
                                          date: controller.jobOfferDetail!.value
                                              .enterprise!.establishedIn,
                                        ),
                                        fontWeight: FontWeightManager.regular,
                                        maxLine: 200,
                                      ),
                                    ),
                                  //===== established In Component =====//

                                  ///===== Enterprise HQ Office Address Component =====//
                                  OutlineContainerWidget(
                                    title: 'officeAddress'.tr,
                                    titleColor: ColorsManager.primaryBlue,
                                    childWidget: CustomTextWidget(
                                      text:
                                          '${controller.jobOfferDetail!.value.enterprise!.companyAddress}',
                                      // '${controller.jobOfferDetail!.value.enterprise!.companyAddress}${controller.jobOfferDetail!.value.companyLocation}',
                                      fontWeight: FontWeightManager.regular,
                                      maxLine: 3,
                                    ),
                                  ),
                                  //===== Enterprise HQ Office Address Component =====//

                                  ///===== Fields Component =====//
                                  if (controller.jobOfferDetail!.value
                                      .enterprise!.fields!.isNotEmpty)
                                    OutlineContainerWidget(
                                      title: 'fields'.tr,
                                      titleColor: ColorsManager.primaryBlue,
                                      childWidget: controller.jobOfferDetail!
                                                  .value.enterprise!.fields !=
                                              []
                                          ? Wrap(
                                              children: [
                                                for (var i = 0;
                                                    i <
                                                        controller
                                                            .jobOfferDetail!
                                                            .value
                                                            .enterprise!
                                                            .fields!
                                                            .length;
                                                    i++)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      right: AppSize.s4,
                                                      bottom: AppSize.s4,
                                                    ),
                                                    child: CustomBoxWidget(
                                                      child: CustomTextWidget(
                                                        textAlign:
                                                            TextAlign.center,
                                                        text:
                                                            '${controller.jobOfferDetail!.value.enterprise!.fields![i].label}',
                                                        fontWeight:
                                                            FontWeightManager
                                                                .regular,
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

                                  ///===== Facebook Link Component =====//
                                  if (controller.jobOfferDetail!.value
                                          .enterprise!.facebookLink! !=
                                      '')
                                    OutlineContainerWidget(
                                      title: 'facebookPage'.tr,
                                      titleColor: ColorsManager.primaryBlue,
                                      // isDivider: false,
                                      childWidget: CustomTextWidget(
                                        text:
                                            '${controller.jobOfferDetail!.value.enterprise!.facebookLink}',
                                        fontWeight: FontWeightManager.regular,
                                        maxLine: 200,
                                      ),
                                    ),
                                  //===== Facebook Link Component =====//

                                  ///===== LinkedIn Link Component =====//
                                  if (controller.jobOfferDetail!.value
                                          .enterprise!.linkedinLink! !=
                                      '')
                                    OutlineContainerWidget(
                                      title: 'linkedinPage'.tr,
                                      titleColor: ColorsManager.primaryBlue,
                                      // isDivider: false,
                                      childWidget: CustomTextWidget(
                                        text:
                                            '${controller.jobOfferDetail!.value.enterprise!.linkedinLink}',
                                        fontWeight: FontWeightManager.regular,
                                        maxLine: 200,
                                      ),
                                    ),
                                  //===== LinkedIn Link Component =====//

                                  ///===== Instagram Link Component =====//
                                  if (controller.jobOfferDetail!.value
                                          .enterprise!.instagramLink! !=
                                      '')
                                    OutlineContainerWidget(
                                      title: 'instagramPage'.tr,
                                      titleColor: ColorsManager.primaryBlue,
                                      // isDivider: false,
                                      childWidget: CustomTextWidget(
                                        text:
                                            '${controller.jobOfferDetail!.value.enterprise!.instagramLink}',
                                        fontWeight: FontWeightManager.regular,
                                        maxLine: 200,
                                      ),
                                    ),
                                  //===== Instagram Link Component =====//

                                  ///===== Description Component =====//
                                  OutlineContainerWidget(
                                    title: 'description'.tr,
                                    titleColor: ColorsManager.primaryBlue,
                                    // isDivider: false,
                                    childWidget: CustomTextWidget(
                                      text:
                                          '${controller.jobOfferDetail!.value.enterprise!.description}',
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
                                          //   text: '${controller.jobOfferDetail!.value.enterprise!.youtubeLink}',
                                          //   fontWeight: FontWeightManager.regular,
                                          //   maxLine: 200,
                                          // ),
                                          SizedBox(
                                        height: 350,
                                        child: YoutubePlayerControllerProvider(
                                          // Passing controller to widgets below.
                                          controller:
                                              controller.youtubeController,
                                          child: LayoutBuilder(
                                            builder: (context, constraints) {
                                              //  if (kIsWeb && constraints.maxWidth > 800) {
                                              return ListView(
                                                children: [
                                                  Stack(
                                                    children: [
                                                      player,
                                                      Positioned.fill(
                                                        child:
                                                            YoutubeValueBuilder(
                                                          controller: controller
                                                              .youtubeController,
                                                          builder:
                                                              (context, value) {
                                                            return AnimatedCrossFade(
                                                              firstChild:
                                                                  const SizedBox
                                                                      .shrink(),
                                                              secondChild:
                                                                  Material(
                                                                child:
                                                                    DecoratedBox(
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
                                                                              ThumbnailQuality.medium,
                                                                        ),
                                                                      ),
                                                                      fit: BoxFit
                                                                          .fitWidth,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      const Center(
                                                                    child:
                                                                        CircularProgressIndicator(),
                                                                  ),
                                                                ),
                                                              ),
                                                              crossFadeState: value
                                                                      .isReady
                                                                  ? CrossFadeState
                                                                      .showFirst
                                                                  : CrossFadeState
                                                                      .showSecond,
                                                              duration:
                                                                  const Duration(
                                                                milliseconds:
                                                                    300,
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
                      child: isCustomActBtn == true
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  // flex: 32,
                                  key: const ValueKey(OfferStrings.applyAction),
                                  child: OutlineIconButtonWidget(
                                    buttonTitle: 'apply'.tr,
                                    iconData: Icons.thumb_up_outlined,
                                    iconDataOnClick: Icons.thumb_up,
                                    // iconColor: ColorsManager.grey600,
                                    iconColorOnClick: ColorsManager.green,
                                    // buttonState: false,//offerList![index].applyState,
                                    oneTimePress: controller
                                        .jobOfferDetail!
                                        .value
                                        .applyState, //offerList![index].applyState,
                                    onPressed: () {
                                      // controller.offerController
                                      //     .onClickActionButtonJobOffer(
                                      //   actionType: OfferStrings.applyAction,
                                      //   jobOfferId: controller.jobOfferDetail!.value.id,
                                      // );
                                      // offerController!
                                      //     .onClickActionButtonJobOffer(
                                      //   actionType: OfferStrings.applyAction,
                                      //   jobOfferId: offerList![index].id,
                                      // );
                                      // offerList![index].applyState =
                                      //     offerController!
                                      //         .jobOfferOnClickBoolSwitching(
                                      //   boolValue: offerList![index].applyState,
                                      // );
                                    },
                                  ),
                                ),
                                Expanded(
                                  // flex: 40,
                                  key: const ValueKey(
                                    OfferStrings.unSaveAction,
                                  ),
                                  child: OutlineIconButtonWidget(
                                    buttonTitle: 'unsave'.tr,
                                    iconData: Icons.bookmark_remove_outlined,
                                    iconDataOnClick: Icons.bookmark_remove,
                                    // iconColor: ColorsManager.grey600,
                                    iconColorOnClick:
                                        ColorsManager.lightBlueAccent,
                                    // buttonState: offerList![index].savedState,
                                    oneTimePress: controller
                                        .jobOfferDetail!.value.savedState,
                                    //oneTimePress: offerList![index].savedState,
                                    onPressed: () async {
                                      Get.dialog(
                                        ConfirmationDialogWidget(
                                          dialogBody: 'unSaveAlert'.tr,
                                          onPressed: () async {
                                            // await controller.offerController
                                            //     .onClickActionButtonJobOffer(
                                            //   actionType: OfferStrings.unSaveAction,
                                            //   jobOfferId: controller.jobOfferDetail!.value.id,
                                            // );
                                            Get.back();
                                            Get.back();
                                          },
                                        ),
                                      );

                                      // offerController!
                                      //     .onClickActionButtonJobOffer(
                                      //   actionType: OfferStrings.unSaveAction,
                                      //   jobOfferId: offerList![index].id,
                                      // );
                                      // offerList![index].savedState =
                                      //     offerController!
                                      //         .jobOfferOnClickBoolSwitching(
                                      //   boolValue: offerList![index].savedState,
                                      // );
                                    },
                                  ),
                                ),
                              ],
                            )
                          : Row(
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
