import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';
import '../../modules.dart';

class OfferListComponent extends StatelessWidget {
  // final controller = Get.find<OfferController>();

  final List<JobOfferModel>? offerList;

  const OfferListComponent({
    Key? key,
    this.offerList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        // shrinkWrap: true,
        padding: const EdgeInsets.only(
          bottom: kFloatingActionButtonMargin + 10,
        ),
        itemCount: offerList!.length,
        // physics: const BouncingScrollPhysics(),
        // scrollDirection: Axis.vertical,
        itemBuilder: (_, index) {
          return Obx(
            () => JobOfferCard(
              jobOfferItem: offerList![index],
              bottomActionWidgetList: [
                Expanded(
                  child: OutlineIconButtonWidget(
                    buttonTitle: 'Information',
                    iconColorOnClick: ColorsManager.grey,
                    buttonState: true,
                    onPressed: () {
                      // controller.applyButtonStateList[index] =
                      //     controller.jobOfferOnClickBoolSwitching(
                      //   boolValue: controller.applyButtonStateList[index],
                      // );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
