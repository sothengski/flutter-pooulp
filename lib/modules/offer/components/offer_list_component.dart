import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';
import '../../modules.dart';

class OfferListComponent extends StatelessWidget {
  // final controller = Get.find<OfferController>();
  final String? jobOfferType;
  final List<JobOfferModel>? offerList;
  final OfferController? offerController;

  const OfferListComponent({
    Key? key,
    this.jobOfferType,
    this.offerList,
    this.offerController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // shrinkWrap: true,
      padding: const EdgeInsets.only(
        bottom: kFloatingActionButtonMargin + 10,
      ),
      itemCount: offerList!.length,
      // physics: const BouncingScrollPhysics(),
      // scrollDirection: Axis.vertical,
      itemBuilder: (_, index) {
        return Obx(
          () => OfferCard(
            jobOfferItem: offerList![index],
            bottomActionWidgetList: (jobOfferType == OfferStrings.pendingState)
                ? [
                    Expanded(
                      key: const ValueKey(OfferStrings.cancelAction),
                      child: OutlineIconButtonWidget(
                        buttonTitle: 'cancel'.tr,
                        iconDataOnClick: Icons.cancel,
                        iconData: Icons.cancel_outlined,
                        // iconColor: ColorsManager.grey600,
                        iconColorOnClick: ColorsManager.red,
                        buttonState: offerList![index].informationState,
                        oneTimePress: offerList![index].informationState,
                        onPressed: () {
                          offerController!.onClickActionButtonJobOffer(
                            actionType: OfferStrings.cancelAction,
                            jobOfferId: offerList![index].id,
                          );
                          offerList![index].informationState =
                              offerController!.jobOfferOnClickBoolSwitching(
                            boolValue: offerList![index].informationState,
                          );
                        },
                      ),
                    ),
                  ]
                : (jobOfferType == OfferStrings.matchedState)
                    ? [
                        Expanded(
                          key: const ValueKey(OfferStrings.callAction),
                          child: OutlineIconButtonWidget(
                            buttonTitle: 'call'.tr,
                            iconData: Icons.phone_outlined,
                            iconDataOnClick: Icons.phone,
                            // iconColor: ColorsManager.grey600,
                            buttonState: offerList![index].applyState,
                            onPressed: () {
                              // offerController!.onClickActionButtonJobOffer(
                              //   actionType: OfferStrings.callAction,
                              //   jobOfferId: offerList![index].id,
                              // );
                              offerList![index].applyState =
                                  offerController!.jobOfferOnClickBoolSwitching(
                                boolValue: offerList![index].applyState,
                              );
                              urlLauncherUtils(
                                thingToLaunch: offerList![index]
                                    .enterprise!
                                    .managers![0]
                                    .managerPhoneContact,
                                laucherType: LauncherType.phone,
                              );
                            },
                          ),
                        ),
                        Expanded(
                          key: const ValueKey(OfferStrings.informationAction),
                          child: OutlineIconButtonWidget(
                            buttonTitle: 'information'.tr,
                            // iconColor: ColorsManager.grey600,
                            iconColorOnClick: ColorsManager.primaryBlue,
                            buttonState: offerList![index].informationState,
                            // onPressed: () {
                            //   offerController!.onClickActionButtonJobOffer(
                            //     actionType: OfferStrings.information,
                            //     jobOfferId: offerList![index].id,
                            //   );
                            //   offerList![index].informationState =
                            //       offerController!
                            //           .jobOfferOnClickBoolSwitching(
                            //     boolValue: offerList![index].informationState,
                            //   );
                            // },
                          ),
                        ),
                        Expanded(
                          key: const ValueKey(OfferStrings.emailAction),
                          child: OutlineIconButtonWidget(
                            buttonTitle: 'email'.tr,
                            iconData: Icons.email_outlined,
                            iconDataOnClick: Icons.email,
                            // iconColor: ColorsManager.grey600,
                            iconColorOnClick: ColorsManager.amber,
                            buttonState: offerList![index].savedState,
                            onPressed: () {
                              // offerController!.onClickActionButtonJobOffer(
                              //   actionType: OfferStrings.email,
                              //   jobOfferId: offerList![index].id,
                              // );
                              urlLauncherUtils(
                                thingToLaunch: offerList![index]
                                    .enterprise!
                                    .managers![0]
                                    .managerEmailContact,
                                laucherType: LauncherType.email,
                              );
                              offerList![index].savedState =
                                  offerController!.jobOfferOnClickBoolSwitching(
                                boolValue: offerList![index].savedState,
                              );
                            },
                          ),
                        ),
                      ]
                    : (jobOfferType == OfferStrings.savedState)
                        ? offerList![index].dateOfferEnd!.isBefore(now)
                            ? [
                                Expanded(
                                  flex: 40,
                                  key: const ValueKey(
                                    OfferStrings.informationAction,
                                  ),
                                  child: OutlineIconButtonWidget(
                                    buttonTitle: 'information'.tr,
                                    // iconColor: ColorsManager.grey600,
                                    iconColorOnClick: ColorsManager.primaryBlue,
                                    buttonState:
                                        offerList![index].informationState,
                                    // onPressed: () {
                                    //   offerController!
                                    //       .onClickActionButtonJobOffer(
                                    //     actionType: OfferStrings.information,
                                    //     jobOfferId: offerList![index].id,
                                    //   );
                                    //   offerList![index].informationState =
                                    //       offerController!
                                    //           .jobOfferOnClickBoolSwitching(
                                    //     boolValue:
                                    //         offerList![index].informationState,
                                    //   );
                                    // },
                                  ),
                                ),
                                Expanded(
                                  // flex: 40,
                                  key:
                                      const ValueKey(OfferStrings.unSaveAction),
                                  child: OutlineIconButtonWidget(
                                    buttonTitle: 'unsave'.tr,
                                    iconData: Icons.bookmark_remove_outlined,
                                    iconDataOnClick: Icons.bookmark_remove,
                                    // iconColor: ColorsManager.grey600,
                                    iconColorOnClick:
                                        ColorsManager.lightBlueAccent,
                                    buttonState: offerList![index].savedState,
                                    oneTimePress: offerList![index].savedState,
                                    onPressed: () {
                                      offerController!
                                          .onClickActionButtonJobOffer(
                                        actionType: OfferStrings.unSaveAction,
                                        jobOfferId: offerList![index].id,
                                      );
                                      offerList![index].savedState =
                                          offerController!
                                              .jobOfferOnClickBoolSwitching(
                                        boolValue: offerList![index].savedState,
                                      );
                                    },
                                  ),
                                ),
                              ]
                            : [
                                Expanded(
                                  flex: 32,
                                  key: const ValueKey(OfferStrings.applyAction),
                                  child: OutlineIconButtonWidget(
                                    buttonTitle: 'apply'.tr,
                                    iconData: Icons.thumb_up_outlined,
                                    iconDataOnClick: Icons.thumb_up,
                                    // iconColor: ColorsManager.grey600,
                                    iconColorOnClick: ColorsManager.green,
                                    buttonState: offerList![index].applyState,
                                    oneTimePress: offerList![index].applyState,
                                    onPressed: () {
                                      offerController!
                                          .onClickActionButtonJobOffer(
                                        actionType: OfferStrings.applyAction,
                                        jobOfferId: offerList![index].id,
                                      );
                                      offerList![index].applyState =
                                          offerController!
                                              .jobOfferOnClickBoolSwitching(
                                        boolValue: offerList![index].applyState,
                                      );
                                    },
                                  ),
                                ),
                                Expanded(
                                  flex: 33,
                                  key: const ValueKey(
                                    OfferStrings.informationAction,
                                  ),
                                  child: OutlineIconButtonWidget(
                                    buttonTitle: 'information'.tr,
                                    // iconColor: ColorsManager.grey600,
                                    iconColorOnClick: ColorsManager.primaryBlue,
                                    buttonState:
                                        offerList![index].informationState,
                                    // onPressed: () {
                                    //   offerController!
                                    //       .onClickActionButtonJobOffer(
                                    //     actionType: OfferStrings.information,
                                    //     jobOfferId: offerList![index].id,
                                    //   );
                                    //   offerList![index].informationState =
                                    //       offerController!
                                    //           .jobOfferOnClickBoolSwitching(
                                    //     boolValue:
                                    //         offerList![index].informationState,
                                    //   );
                                    // },
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
                                    buttonState: offerList![index].savedState,
                                    oneTimePress: offerList![index].savedState,
                                    onPressed: () {
                                      offerController!
                                          .onClickActionButtonJobOffer(
                                        actionType: OfferStrings.unSaveAction,
                                        jobOfferId: offerList![index].id,
                                      );
                                      offerList![index].savedState =
                                          offerController!
                                              .jobOfferOnClickBoolSwitching(
                                        boolValue: offerList![index].savedState,
                                      );
                                    },
                                  ),
                                ),
                              ]
                        :
                        //  (jobOfferType == OfferStrings.rejectedState)
                        [
                            Expanded(
                              key: const ValueKey(
                                OfferStrings.informationAction,
                              ),
                              child: OutlineIconButtonWidget(
                                buttonTitle: 'reason'.tr,
                                // iconColor: ColorsManager.grey600,
                                iconColorOnClick: ColorsManager.primaryBlue,
                                buttonState: offerList![index].informationState,
                                onPressed: () => Get.dialog(
                                  MaterialDialogWidget(
                                    title: 'reason'.tr,
                                    titleHorizontalMargin: AppSize.s12,
                                    dialogMargin: AppSize.s28,
                                    rightWidget: CustomIconButtonWidget(
                                      iconData: Icons.close,
                                      padding: 0.0,
                                      isConstraints: true,
                                      onClick: () => {
                                        Get.back(),
                                      },
                                    ),
                                    contentWidget: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ///===== Rufusal Reason Component =====//
                                        if (offerList![index]
                                                .jobOfferStateModel!
                                                .stateId !=
                                            4)
                                          Container()
                                        else
                                          CustomBoxWidget(
                                            leftMargin: AppSize.s8,
                                            rightMargin: AppSize.s8,
                                            bottomMargin: AppSize.s8,
                                            backgroundColor: ColorsManager
                                                .white, // Colors.red[100],
                                            child: Column(
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: CustomTextWidget(
                                                    textAlign: TextAlign.left,
                                                    text: offerList![index]
                                                        .jobOfferStateModel!
                                                        .reasonTagId
                                                        .toString(),
                                                    fontWeight:
                                                        FontWeightManager.bold,
                                                    color: ColorsManager.red900,
                                                    marginTop: AppSize.s4,
                                                    marginBottom: AppSize.s4,
                                                  ),
                                                ),
                                                if (offerList![index]
                                                        .jobOfferStateModel!
                                                        .reason ==
                                                    '')
                                                  Container()
                                                else
                                                  CustomTextWidget(
                                                    textAlign: TextAlign.left,
                                                    text:
                                                        '${offerList![index].jobOfferStateModel!.reason}',
                                                    fontWeight:
                                                        FontWeightManager
                                                            .regular,
                                                    fontSize: AppSize.s12,
                                                    color: ColorsManager.red900,
                                                    // marginBottom: AppSize.s10,
                                                    maxLine: 50,
                                                  ),
                                              ],
                                            ),
                                          ),
                                        //===== Rufusal Reason Component =====//
                                      ],
                                    ),
                                  ),
                                ),
                                // onPressed: () {
                                // offerController!
                                //     .onClickActionButtonJobOffer(
                                //   actionType: OfferStrings.information,
                                //   jobOfferId: offerList![index].id,
                                // );
                                // offerList![index].informationState =
                                //     offerController!
                                //         .jobOfferOnClickBoolSwitching(
                                //   boolValue:
                                //       offerList![index].informationState,
                                // );
                                // },
                              ),
                            ),
                          ],
          ),
        );
      },
    );
  }
}
