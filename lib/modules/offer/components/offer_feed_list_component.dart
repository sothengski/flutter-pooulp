import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../modules.dart';

class OfferFeedListComponent extends StatelessWidget {
  // const FeedListComponent({Key? key}) : super(key: key);
  final feedController = Get.find<OfferFeedController>();

  @override
  Widget build(BuildContext context) {
    return
        // GetBuilder(
        //   init: feedController,
        //   builder: (value) =>
        ListView.builder(
      controller: feedController.scrollController,
      // shrinkWrap: true,
      padding: const EdgeInsets.only(
        bottom: kFloatingActionButtonMargin + 10,
      ),
      itemCount: feedController.feedListRepsonse.length,
      physics: const BouncingScrollPhysics(),
      // scrollDirection: Axis.vertical,
      itemBuilder: (_, index) {
        return Obx(
          () => OfferCard(
            jobOfferItem: feedController.feedListRepsonse[index],
            bottomActionWidgetList: feedController
                    .feedListRepsonse[index].dateOfferEnd!
                    .isBefore(now)
                ? []
                : <Widget>[
                    Expanded(
                      flex: 32,
                      key: const ValueKey(OfferStrings.applyAction),
                      child: OutlineIconButtonWidget(
                        buttonTitle: 'apply'.tr,
                        iconData: Icons.thumb_up_alt_outlined,
                        iconDataOnClick: Icons.thumb_up,
                        iconColorOnClick: ColorsManager.green,
                        buttonState:
                            feedController.feedListRepsonse[index].applyState,
                        oneTimePress:
                            feedController.feedListRepsonse[index].applyState,
                        onPressed: () {
                          feedController.onClickActionButtonJobOfferFeed(
                            actionType: OfferStrings.applyAction,
                            jobOfferId:
                                feedController.feedListRepsonse[index].id,
                          );
                          feedController.feedListRepsonse[index].applyState =
                              feedController.jobOfferOnClickBoolSwitching(
                            boolValue: feedController
                                .feedListRepsonse[index].applyState,
                          );
                        },
                      ),
                    ),
                    Expanded(
                      flex: 33,
                      key: const ValueKey(OfferStrings.saveAction),
                      child: OutlineIconButtonWidget(
                        buttonTitle: 'save'.tr,
                        iconData: Icons.turned_in_not_outlined,
                        iconDataOnClick: Icons.turned_in,
                        iconColorOnClick: ColorsManager.blue,
                        buttonState:
                            feedController.feedListRepsonse[index].savedState,
                        oneTimePress:
                            feedController.feedListRepsonse[index].savedState,
                        onPressed: () {
                          feedController.onClickActionButtonJobOfferFeed(
                            actionType: OfferStrings.saveAction,
                            jobOfferId:
                                feedController.feedListRepsonse[index].id,
                          );
                          feedController.feedListRepsonse[index].savedState =
                              feedController.jobOfferOnClickBoolSwitching(
                            boolValue: feedController
                                .feedListRepsonse[index].savedState,
                          );
                        },
                      ),
                    ),
                    Expanded(
                      flex: 35,
                      key: const ValueKey(OfferStrings.hideAction),
                      child: OutlineIconButtonWidget(
                        buttonTitle: 'notInterested'.tr,
                        iconData: Icons.visibility_off_outlined,
                        iconDataOnClick: Icons.visibility_outlined,
                        iconColorOnClick: ColorsManager.red,
                        buttonState: feedController
                            .feedListRepsonse[index].rejectedState,
                        oneTimePress: feedController
                            .feedListRepsonse[index].rejectedState,
                        onPressed: () async {
                          Get.dialog(
                            ConfirmationDialogWidget(
                              dialogBody: 'notInterestedAlert'.tr,
                              onPressed: () async {
                                feedController.onClickActionButtonJobOfferFeed(
                                  actionType: OfferStrings.hideAction,
                                  jobOfferId:
                                      feedController.feedListRepsonse[index].id,
                                );
                                feedController
                                        .feedListRepsonse[index].rejectedState =
                                    feedController.jobOfferOnClickBoolSwitching(
                                  boolValue: feedController
                                      .feedListRepsonse[index].rejectedState,
                                );
                                Get.back();
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
            // feedController: controller,
          ),
        );
      },
      // ),
    );
  }
}
