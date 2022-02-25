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
                        buttonTitle: 'Cancel',
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
                            buttonTitle: 'Call',
                            iconData: Icons.phone_outlined,
                            iconDataOnClick: Icons.phone,
                            // iconColor: ColorsManager.grey600,
                            buttonState: offerList![index].applyState,
                            onPressed: () {
                              offerController!.onClickActionButtonJobOffer(
                                actionType: OfferStrings.callAction,
                                jobOfferId: offerList![index].id,
                              );
                              offerList![index].applyState =
                                  offerController!.jobOfferOnClickBoolSwitching(
                                boolValue: offerList![index].applyState,
                              );
                            },
                          ),
                        ),
                        Expanded(
                          key: const ValueKey(OfferStrings.informationAction),
                          child: OutlineIconButtonWidget(
                            buttonTitle: 'Information',
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
                            buttonTitle: 'Email',
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
                              offerList![index].savedState =
                                  offerController!.jobOfferOnClickBoolSwitching(
                                boolValue: offerList![index].savedState,
                              );
                            },
                          ),
                        ),
                      ]
                    : (jobOfferType == OfferStrings.savedState)
                        ? [
                            Expanded(
                              key: const ValueKey(OfferStrings.applyAction),
                              child: OutlineIconButtonWidget(
                                buttonTitle: 'Apply',
                                iconData: Icons.thumb_up_outlined,
                                iconDataOnClick: Icons.thumb_up,
                                // iconColor: ColorsManager.grey600,
                                iconColorOnClick: ColorsManager.green,
                                buttonState: offerList![index].applyState,
                                oneTimePress: offerList![index].applyState,
                                onPressed: () {
                                  offerController!.onClickActionButtonJobOffer(
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
                              key: const ValueKey(
                                OfferStrings.informationAction,
                              ),
                              child: OutlineIconButtonWidget(
                                buttonTitle: 'Information',
                                // iconColor: ColorsManager.grey600,
                                iconColorOnClick: ColorsManager.primaryBlue,
                                buttonState: offerList![index].informationState,
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
                              key: const ValueKey(OfferStrings.unSaveAction),
                              child: OutlineIconButtonWidget(
                                buttonTitle: 'Unsave',
                                iconData: Icons.bookmark_remove_outlined,
                                iconDataOnClick: Icons.bookmark_remove,
                                // iconColor: ColorsManager.grey600,
                                iconColorOnClick: ColorsManager.lightBlueAccent,
                                buttonState: offerList![index].savedState,
                                oneTimePress: offerList![index].savedState,
                                onPressed: () {
                                  offerController!.onClickActionButtonJobOffer(
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
                              key: const ValueKey(
                                OfferStrings.informationAction,
                              ),
                              child: OutlineIconButtonWidget(
                                buttonTitle: 'Information',
                                // iconColor: ColorsManager.grey600,
                                iconColorOnClick: ColorsManager.primaryBlue,
                                buttonState: offerList![index].informationState,
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
