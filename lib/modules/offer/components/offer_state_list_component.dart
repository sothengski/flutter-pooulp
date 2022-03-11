import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';
import '../../modules.dart';

class OfferStateListComponent extends StatelessWidget {
  // final controller = Get.find<OfferController>();
  final List<FieldModel>? jobOfferStateList;
  final OfferController? offerController;

  const OfferStateListComponent({
    Key? key,
    this.jobOfferStateList,
    this.offerController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: jobOfferStateList!.length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          final FieldModel item = jobOfferStateList![index];
          return item.label == OfferStrings.rejectedState && item.total == 0
              ? Container()
              : Obx(
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
                        horizontal: AppSize.s8,
                        // vertical: AppSize.s0,
                      ),
                      label: Row(
                        children: [
                          CustomTextWidget(
                            text: '${item.label}',
                            // fontSize: AppSize.s14,
                            fontWeight: FontWeightManager.medium,
                            color: containerColorState(
                              object1: '${item.label}',
                              object2: offerController!
                                  .jobOfferStateSelected.value.label,
                              unEqualStateColor: ColorsManager.primaryBlue,
                            ),
                            marginRight: AppSize.s4,
                          ),
                          CustomBoxWidget(
                            borderRadius: AppSize.s16,
                            topPadding: AppSize.s2,
                            bottomPadding: AppSize.s2,
                            leftPadding: AppSize.s0,
                            rightPadding: AppSize.s0,
                            backgroundColor: containerColorState(
                              object1: '${item.label}',
                              object2: offerController!
                                  .jobOfferStateSelected.value.label,
                              equalStateColor: ColorsManager.primary,
                              unEqualStateColor: ColorsManager.white,
                              isTextColor: false,
                            ),
                            insideObj: CustomTextWidget(
                              text: '${item.total}',
                              fontSize: AppSize.s12,
                              color: containerColorState(
                                object1: '${item.label}',
                                object2: offerController!
                                    .jobOfferStateSelected.value.label,
                                equalStateColor: ColorsManager.primaryBlue,
                                unEqualStateColor: ColorsManager.white,
                              ),
                              textAlign: TextAlign.center,
                              marginLeft: AppSize.s6,
                              marginRight: AppSize.s6,
                            ),
                          ),
                        ],
                      ),
                      backgroundColor: containerColorState(
                        object1: '${item.label}',
                        object2:
                            offerController!.jobOfferStateSelected.value.label,
                        isTextColor: false,
                      ),
                      onSelected: (_) {
                        offerController!.selectjobOfferState(
                          state: item,
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
