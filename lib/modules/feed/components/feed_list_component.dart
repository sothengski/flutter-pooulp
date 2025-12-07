import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../modules.dart';

class FeedListComponent extends StatelessWidget {
  // const FeedListComponent({Key? key}) : super(key: key);
  final feedController = Get.find<FeedController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // shrinkWrap: true,
      padding: const EdgeInsets.only(bottom: kFloatingActionButtonMargin + 10),
      itemCount: feedController.feedFilterList.length,
      physics: const BouncingScrollPhysics(),
      // scrollDirection: Axis.vertical,
      itemBuilder: (_, index) {
        return Obx(
          () => OfferCard(
            jobOfferItem: feedController.feedFilterList[index],
            bottomActionWidgetList: <Widget>[
              Expanded(
                key: const ValueKey(OfferStrings.applyAction),
                child: OutlineIconButtonWidget(
                  buttonTitle: 'Apply',
                  iconData: Icons.thumb_up_alt_outlined,
                  iconDataOnClick: Icons.thumb_up,
                  iconColorOnClick: ColorsManager.green,
                  buttonState: feedController.feedFilterList[index].applyState,
                  oneTimePress: feedController.feedFilterList[index].applyState,
                  onPressed: () {
                    feedController.onClickActionButtonJobOfferFeed(
                      actionType: OfferStrings.applyAction,
                      jobOfferId: feedController.feedFilterList[index].id,
                    );
                    feedController.feedFilterList[index].applyState =
                        feedController.jobOfferOnClickBoolSwitching(
                          boolValue:
                              feedController.feedFilterList[index].applyState,
                        );
                  },
                ),
              ),
              Expanded(
                key: const ValueKey(OfferStrings.saveAction),
                child: OutlineIconButtonWidget(
                  buttonTitle: 'Save',
                  iconData: Icons.turned_in_not_outlined,
                  iconDataOnClick: Icons.turned_in,
                  iconColorOnClick: ColorsManager.blue,
                  buttonState: feedController.feedFilterList[index].savedState,
                  oneTimePress: feedController.feedFilterList[index].savedState,
                  onPressed: () {
                    feedController.onClickActionButtonJobOfferFeed(
                      actionType: OfferStrings.saveAction,
                      jobOfferId: feedController.feedFilterList[index].id,
                    );
                    feedController.feedFilterList[index].savedState =
                        feedController.jobOfferOnClickBoolSwitching(
                          boolValue:
                              feedController.feedFilterList[index].savedState,
                        );
                  },
                ),
              ),
              Expanded(
                key: const ValueKey(OfferStrings.hideAction),
                child: OutlineIconButtonWidget(
                  buttonTitle: 'Hide',
                  iconData: Icons.visibility_off_outlined,
                  iconDataOnClick: Icons.visibility_outlined,
                  iconColorOnClick: ColorsManager.red,
                  buttonState:
                      feedController.feedFilterList[index].rejectedState,
                  oneTimePress:
                      feedController.feedFilterList[index].rejectedState,
                  onPressed: () {
                    feedController.onClickActionButtonJobOfferFeed(
                      actionType: OfferStrings.hideAction,
                      jobOfferId: feedController.feedFilterList[index].id,
                    );
                    feedController.feedFilterList[index].rejectedState =
                        feedController.jobOfferOnClickBoolSwitching(
                          boolValue: feedController
                              .feedFilterList[index]
                              .rejectedState,
                        );
                  },
                ),
              ),
            ],
            // feedController: controller,
          ),
        );
      },
    );
  }
}
