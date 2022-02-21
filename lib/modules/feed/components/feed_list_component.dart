import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../modules.dart';

class FeedListComponent extends StatelessWidget {
  // const FeedListComponent({Key? key}) : super(key: key);
  final controller = Get.find<FeedController>();

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        // shrinkWrap: true,
        padding: const EdgeInsets.only(
          bottom: kFloatingActionButtonMargin + 10,
        ),
        itemCount: controller.feedFilterList.length,
        // physics: const BouncingScrollPhysics(),
        // scrollDirection: Axis.vertical,
        itemBuilder: (_, index) {
          return Obx(
            () => OfferCard(
              jobOfferItem: controller.feedFilterList[index],
              // index: index,
              // leftButtonState: controller.applyButtonStateList[index],
              // leftButtonFunctionCall: () {
              //   controller.applyButtonStateList[index] =
              //       controller.jobOfferOnClickBoolSwitching(
              //     boolValue: controller.applyButtonStateList[index],
              //   );
              // },
              // middleButtonState: controller.savedButtonStateList[index],
              // middleButtonFunctionCall: () {
              //   controller.savedButtonStateList[index] =
              //       controller.jobOfferOnClickBoolSwitching(
              //     boolValue: controller.savedButtonStateList[index],
              //   );
              // },
              // rightButtonState: controller.hideButtonStateList[index],
              // rightButtonFunctionCall: () {
              //   controller.hideButtonStateList[index] =
              //       controller.jobOfferOnClickBoolSwitching(
              //     boolValue: controller.hideButtonStateList[index],
              //   );
              // },
              bottomActionWidgetList: <Widget>[
                Expanded(
                  child: OutlineIconButtonWidget(
                    buttonTitle: 'Apply',
                    iconData: Icons.thumb_up_alt_outlined,
                    iconDataOnClick: Icons.thumb_up,
                    iconColorOnClick: ColorsManager.green,
                    buttonState: controller.applyButtonStateList[index],
                    onPressed: () {
                      controller.applyButtonStateList[index] =
                          controller.jobOfferOnClickBoolSwitching(
                        boolValue: controller.applyButtonStateList[index],
                      );
                    },
                  ),
                ),
                Expanded(
                  child: OutlineIconButtonWidget(
                    buttonTitle: 'Save',
                    iconData: Icons.turned_in_not_outlined,
                    iconDataOnClick: Icons.turned_in,
                    iconColorOnClick: ColorsManager.blue,
                    buttonState: controller.savedButtonStateList[index],
                    // buttonState: feedController.savedButtonStateList[index!],
                    onPressed: () {
                      controller.savedButtonStateList[index] =
                          controller.jobOfferOnClickBoolSwitching(
                        boolValue: controller.savedButtonStateList[index],
                      );
                    },
                    // },
                  ),
                ),
                Expanded(
                  child: OutlineIconButtonWidget(
                    buttonTitle: 'Hide',
                    iconData: Icons.visibility_off_outlined,
                    iconDataOnClick: Icons.visibility_outlined,
                    iconColorOnClick: ColorsManager.red,
                    buttonState: controller.hideButtonStateList[index],
                    onPressed: () {
                      controller.hideButtonStateList[index] =
                          controller.jobOfferOnClickBoolSwitching(
                        boolValue: controller.hideButtonStateList[index],
                      );
                    },
                  ),
                ),
              ],
              // feedController: controller,
            ),
          );
        },
      ),
    );
  }
}
