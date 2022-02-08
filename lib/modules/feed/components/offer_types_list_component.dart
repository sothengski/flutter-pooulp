import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../modules.dart';

class OfferTypesListComponent extends StatelessWidget {
  final controller = Get.find<FeedController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(top: AppSize.s5),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSize.s8,
        vertical: AppSize.s8,
      ),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: controller.listFilterTypes.length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSize.s4,
              // vertical: AppSize.s8,
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
                text: '${controller.listFilterTypes[index].label}',
                // fontSize: AppSize.s14,
                fontWeight: FontWeightManager.light,
                color: containerColorState(
                  object1: '${controller.listFilterTypes[index].label}',
                  object2: controller.typeSelected!.label,
                ),
              ),
              backgroundColor: containerColorState(
                object1: '${controller.listFilterTypes[index].label}',
                object2: controller.typeSelected!.label,
                isText: false,
              ),
              onSelected: (_) {
                controller.selectType(
                  type: controller.listFilterTypes[index],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
