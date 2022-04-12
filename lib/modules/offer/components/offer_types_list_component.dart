import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../offer_feed/offer_feed_controller.dart';

class OfferFeedTypesListComponent extends StatelessWidget {
  final controller = Get.find<OfferFeedController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(
        top: AppSize.s5,
        // left: AppSize.s8,
        // right: AppSize.s8,
        // bottom: AppSize.s5,
      ),
      // padding: const EdgeInsets.symmetric(
      //   horizontal: AppSize.s8,
      //   // vertical: AppSize.s8,
      // ),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: controller.listJobOfferTypes.length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Obx(
            () => Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSize.s4,
                // vertical: AppSize.s4,
              ),
              child: FilterChip(
                // padding: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppSize.s16),
                  ),
                  side: BorderSide(
                    width: 0.3,
                    color: ColorsManager.primary50,
                  ),
                ),
                labelPadding: const EdgeInsets.symmetric(
                  horizontal: AppSize.s16,
                  // vertical: AppSize.s0,
                ),
                label: CustomTextWidget(
                  text: controller.listJobOfferTypes[index].label == 'All'
                      ? 'offer.all'.tr
                      : '${controller.listJobOfferTypes[index].label}',
                  // fontSize: AppSize.s14,
                  fontWeight: FontWeightManager.light,
                  color: containerColorState(
                    object1: '${controller.listJobOfferTypes[index].label}',
                    object2: controller.typeSelected.value.label,
                    unEqualStateColor: ColorsManager.primaryBlue,
                  ),
                ),
                backgroundColor: containerColorState(
                  object1: '${controller.listJobOfferTypes[index].label}',
                  object2: controller.typeSelected.value.label,
                  isTextColor: false,
                ),
                onSelected: (_) {
                  controller.selectType(
                    type: controller.listJobOfferTypes[index],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
