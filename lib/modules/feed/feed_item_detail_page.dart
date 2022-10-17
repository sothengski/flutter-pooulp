import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import '../../data/data.dart';
import '../modules.dart';

class FeedItemDetailPage extends StatefulWidget {
  final JobOfferModel? feedItemDetail;
  const FeedItemDetailPage({
    this.feedItemDetail,
    Key? key,
  }) : super(key: key);

  @override
  State<FeedItemDetailPage> createState() => _FeedItemDetailPageState();
}

class _FeedItemDetailPageState extends State<FeedItemDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController? tabController;
  final ScrollController scrollController = ScrollController();
  final FeedController feedController = Get.find<FeedController>();
  @override
  void initState() {
    tabController = TabController(
      length: 2,
      vsync: this,
    );
    tabController!.addListener(handleTabSelection);

    super.initState();
  }

  void handleTabSelection() {
    if (tabController!.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primary,
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
                left: AppSize.s16,
                right: AppSize.s16,
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
                controller: scrollController,
                children: [
                  Column(
                    children: [
                      CustomTextWidget(
                        marginTop: AppSize.s16,
                        marginBottom: AppSize.s16,
                        marginRight: AppSize.s10,
                        marginLeft: AppSize.s10,
                        text: '${widget.feedItemDetail!.title}',
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
                      CustomListTileWidget(
                        isDivider: false,
                        leftFlex: 15,
                        leftRightPadding: AppSize.s12,
                        text1: '${widget.feedItemDetail!.enterprise!.name}',
                        text1Color: ColorsManager.primary,
                        text1FontSize: AppSize.s16,
                        text2:
                            '${widget.feedItemDetail!.companyLocation} (${widget.feedItemDetail!.workPlaceType})',
                        leftWidget: CustomBoxWidget(
                          size: 50,
                          child: CachedNetworkImgWidget(
                            imgUrl:
                                '${widget.feedItemDetail!.enterprise!.logoUrl}',
                          ),
                        ),
                      ),
                    ],
                  ),
                  CustomTextWidget(
                    text:
                        'Posted: ${widget.feedItemDetail!.dateOfferStartFormat}',
                    // textAlign: TextAlign.center,
                    fontSize: AppSize.s12,
                    fontWeight: FontWeight.w500,
                    color: ColorsManager.red,
                    marginLeft: AppSize.s20,
                    marginTop: AppSize.s10,
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
                        controller: tabController,
                        // give the indicator a decoration (color and border radius)
                        labelColor: ColorsManager.primary,
                        indicator: const UnderlineTabIndicator(
                          borderSide: BorderSide(
                            color: ColorsManager.primary,
                            width: 2.0,
                          ),
                        ),
                        unselectedLabelColor: ColorsManager.grey,
                        tabs: const [
                          // first tab [you can add an icon using the icon property]
                          Tab(
                            child: CustomTextWidget(
                              text: 'Job Information',
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w500,
                              color: null,
                            ),
                          ),
                          // second tab [you can add an icon using the icon property]
                          Tab(
                            child: CustomTextWidget(
                              text: 'Company Information',
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w500,
                              color: null,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  [
                    ///===== First Tab Component =====//
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //TODO::: will update the posted to time ago
                        // Center(
                        //   child: CustomTextWidget(
                        //     text:
                        //         'Posted: ${widget.feedItemDetail!.dateOfferStartFormat}',
                        //     textAlign: TextAlign.center,
                        //     fontWeight: FontWeight.w500,
                        //     color: ColorsManager.red,
                        //     marginTop: AppSize.s10,
                        //     marginBottom: AppSize.s10,
                        //   ),
                        // ),
                        const SizedBox(
                          height: AppSize.s10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ///===== Working Period Component =====//
                            Expanded(
                              flex: 55,
                              child: OutlineContainerWidget(
                                title: 'Working Period',
                                titleColor: ColorsManager.primaryBlue,
                                isDivider: false,
                                childWidget: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomBoxWidget(
                                      child: CustomTextWidget(
                                        textAlign: TextAlign.center,
                                        text: widget.feedItemDetail!
                                                    .dateJobStartFormat !=
                                                ''
                                            ? 'Starting Date: ${widget.feedItemDetail!.dateJobStartFormat}'
                                            : 'N/A',
                                        fontWeight: FontWeightManager.regular,
                                        fontSize: AppSize.s12,
                                        // marginBottom: AppSize.s10,
                                      ),
                                    ),
                                    if (widget
                                            .feedItemDetail!.dateJobEndFormat ==
                                        null)
                                      Container(
                                        margin:
                                            const EdgeInsetsDirectional.only(
                                          top: AppSize.s4,
                                        ),
                                        child: CustomBoxWidget(
                                          child: CustomTextWidget(
                                            textAlign: TextAlign.center,
                                            text:
                                                'End Date: ${widget.feedItemDetail!.dateJobEndFormat}',
                                            fontWeight:
                                                FontWeightManager.regular,
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
                            ),
                            //===== Working Period Component =====//

                            ///===== Working Duration Component =====//
                            Expanded(
                              flex: 45,
                              child: OutlineContainerWidget(
                                title: 'Working Duration',
                                titleColor: ColorsManager.primaryBlue,
                                isDivider: false,
                                childWidget: CustomBoxWidget(
                                  child: CustomTextWidget(
                                    textAlign: TextAlign.center,
                                    text:
                                        '${widget.feedItemDetail!.numberOfWorking}',
                                    fontWeight: FontWeightManager.regular,
                                    fontSize: AppSize.s12,
                                    // marginBottom: AppSize.s10,
                                  ),
                                ),
                              ),
                            ),
                            //===== Working Duration Component =====//
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSize.s16,
                            // vertical: AppSize.s4,
                          ),
                          child: Divider(
                            height: AppSize.s8,
                            thickness: AppSize.s0_5,
                          ),
                        ),

                        ///===== Types Component =====//
                        if (widget.feedItemDetail!.types!.isNotEmpty)
                          OutlineContainerWidget(
                            title: 'Types',
                            titleColor: ColorsManager.primaryBlue,
                            childWidget: widget.feedItemDetail!.types != []
                                ? Wrap(
                                    children: [
                                      for (var i = 0;
                                          i <
                                              widget.feedItemDetail!.types!
                                                  .length;
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
                                                  '${widget.feedItemDetail!.types![i].label}',
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
                        if (widget.feedItemDetail!.fields!.isNotEmpty)
                          OutlineContainerWidget(
                            title: 'Fields',
                            titleColor: ColorsManager.primaryBlue,
                            childWidget: widget.feedItemDetail!.fields != []
                                ? Wrap(
                                    children: [
                                      for (var i = 0;
                                          i <
                                              widget.feedItemDetail!.fields!
                                                  .length;
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
                                                  '${widget.feedItemDetail!.fields![i].label}',
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
                            text: '${widget.feedItemDetail!.addressStreet}',
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
                            text: '${widget.feedItemDetail!.description}',
                            fontWeight: FontWeightManager.regular,
                            maxLine: 200,
                          ),
                        ),
                        //===== Job Description Component =====//

                        ///===== Languages Component =====//
                        if (widget.feedItemDetail!.spokenLanguages!.isNotEmpty)
                          OutlineContainerWidget(
                            title: 'Languages',
                            titleColor: ColorsManager.primaryBlue,
                            childWidget:
                                widget.feedItemDetail!.spokenLanguages != []
                                    ? Wrap(
                                        direction: Axis.vertical,
                                        children: [
                                          for (var i = 0;
                                              i <
                                                  widget.feedItemDetail!
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
                                                    '${widget.feedItemDetail!.spokenLanguages![i].displayLabelAndLevel}',
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
                        if (widget.feedItemDetail!.skills!.isNotEmpty)
                          OutlineContainerWidget(
                            title: 'Skills',
                            titleColor: ColorsManager.primaryBlue,
                            childWidget: widget.feedItemDetail!.skills != []
                                ? Wrap(
                                    direction: Axis.vertical,
                                    children: [
                                      for (var i = 0;
                                          i <
                                              widget.feedItemDetail!.skills!
                                                  .length;
                                          i++)
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            right: AppSize.s4,
                                            bottom: AppSize.s4,
                                          ),
                                          child: CustomTextWidget(
                                            textAlign: TextAlign.center,
                                            text:
                                                '${widget.feedItemDetail!.skills![i].displayLabelAndLevel}',
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
                            child: CustomTextWidget(
                              textAlign: TextAlign.center,
                              text:
                                  '${widget.feedItemDetail!.enterprise!.enterpriseID}',
                              fontWeight: FontWeightManager.regular,
                              fontSize: AppSize.s12,
                              // marginBottom: AppSize.s10,
                            ),
                          ),
                        ),
                        //===== Enterprise ID Component =====//

                        ///===== Office Address Component =====//
                        OutlineContainerWidget(
                          title: 'Office Address',
                          titleColor: ColorsManager.primaryBlue,
                          childWidget: CustomTextWidget(
                            text:
                                '${widget.feedItemDetail!.enterprise!.addressStreet}',
                            fontWeight: FontWeightManager.regular,
                          ),
                        ),
                        //===== Office Address Component =====//

                        ///===== Fields Component =====//
                        if (widget
                            .feedItemDetail!.enterprise!.fields!.isNotEmpty)
                          OutlineContainerWidget(
                            title: 'Fields',
                            titleColor: ColorsManager.primaryBlue,
                            childWidget:
                                widget.feedItemDetail!.enterprise!.fields != []
                                    ? Wrap(
                                        children: [
                                          for (var i = 0;
                                              i <
                                                  widget
                                                      .feedItemDetail!
                                                      .enterprise!
                                                      .fields!
                                                      .length;
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
                                                      '${widget.feedItemDetail!.enterprise!.fields![i].label}',
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
                            text:
                                '${widget.feedItemDetail!.enterprise!.description}',
                            fontWeight: FontWeightManager.regular,
                            maxLine: 200,
                          ),
                        ),
                        //===== Description Component =====//
                      ],
                    ),
                    //===== Second Tab Component =====//
                  ][tabController!.index]
                ],
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Container(
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.only(
                left: AppSize.s16,
                right: AppSize.s16,
                bottom: AppSize.s40,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: OutlineIconButtonWidget(
                      buttonTitle: 'Apply',
                      iconData: Icons.thumb_up_alt_outlined,
                      iconDataOnClick: Icons.thumb_up,
                      iconColorOnClick: ColorsManager.green,
                      iconSize: AppSize.s24,
                      // buttonState: false,
                      onPressed: () {
                        customSnackbar(
                          msgTitle: 'This Button is under construction!',
                          msgContent:
                              'This Page is only view.\n Data will not save.',
                        );
                        // feedController.applyButtonStateList[index!] =
                        //     feedController.jobOfferOnClickBoolSwitching(
                        //   boolValue:
                        //       feedController.applyButtonStateList[index!],
                        // );
                      },
                    ),
                  ),
                  Expanded(
                    child: OutlineIconButtonWidget(
                      buttonTitle: 'Save',
                      iconData: Icons.turned_in_not_outlined,
                      iconDataOnClick: Icons.turned_in,
                      iconColorOnClick: ColorsManager.blue,
                      iconSize: AppSize.s24,
                      // buttonState: feedController.savedButtonStateList[index!],
                      onPressed: () {
                        customSnackbar(
                          msgTitle: 'This Button is under construction!',
                          msgContent:
                              'This Page is only view.\n Data will not save.',
                        );
                        // feedController.savedButtonStateList[index!] =
                        //     feedController.jobOfferOnClickBoolSwitching(
                        //   boolValue:
                        //       feedController.savedButtonStateList[index!],
                        // );
                      },
                    ),
                  ),
                  Expanded(
                    child: OutlineIconButtonWidget(
                      buttonTitle: 'Hide',
                      iconData: Icons.visibility_off_outlined,
                      iconDataOnClick: Icons.visibility_outlined,
                      iconColorOnClick: ColorsManager.red,
                      iconSize: AppSize.s24,
                      // buttonState: feedController.hideButtonStateList[index!],
                      onPressed: () {
                        customSnackbar(
                          msgTitle: 'This Button is under construction!',
                          msgContent:
                              'This Page is only view.\n Data will not save.',
                        );
                        // feedController.hideButtonStateList[index!] =
                        //     feedController.jobOfferOnClickBoolSwitching(
                        //   boolValue: feedController.hideButtonStateList[index!],
                        // );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
