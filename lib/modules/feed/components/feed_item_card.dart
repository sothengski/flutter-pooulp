import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';

class FeedItemCard extends StatelessWidget {
  final FeedModel? feedItem;
  const FeedItemCard({
    Key? key,
    this.feedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSize.s12,
        vertical: AppSize.s5,
      ),
      child: MaterialButton(
        padding: EdgeInsets.zero,
        elevation: AppSize.s4,
        color: ColorsManager.white,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
        onPressed: () {
          // Get.toNamed(
          //   Routes.routeOutletDetail,
          //   arguments: outlet,
          // );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(AppSize.s8),
                bottomLeft: Radius.circular(AppSize.s8),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: ColorsManager.primary,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSize.s20,
                  vertical: AppSize.s5,
                ),
                child: CustomTextWidget(
                  textAlign: TextAlign.center,
                  text: '${feedItem!.jobOffer!.workPlaceType}',
                  color: ColorsManager.white,
                  fontWeight: FontWeightManager.regular,
                  fontSize: AppSize.s12,
                  // marginBottom: 50.0,
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Flexible(
                  flex: 15,
                  child: Padding(
                    padding: EdgeInsets.only(
                      // top: AppSize.s20,
                      left: AppSize.s5,
                    ),
                    child: CustomBoxWidget(
                      insideObj: Icon(
                        Icons.business,
                        color: ColorsManager.primary75,
                        size: AppSize.s28,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 65,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: AppSize.s4,
                      bottom: AppSize.s10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          text: '${feedItem!.jobOffer!.title}',
                          fontWeight: FontWeightManager.semiBold,
                          maxLine: 3,
                          // marginTop: 20.0,
                          marginBottom: AppSize.s16,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: AppSize.s4,
                            bottom: AppSize.s10,
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.place_outlined,
                                color: ColorsManager.primaryBlue,
                                size: AppSize.s16,
                              ),
                              Expanded(
                                child: CustomTextWidget(
                                  text:
                                      '${feedItem!.jobOffer!.companyNameAndLocation}',
                                  fontSize: AppSize.s12,
                                  fontWeight: FontWeightManager.medium,
                                  color: ColorsManager.primary,
                                  maxLine: 3,
                                  marginLeft: AppSize.s4,
                                  // marginBottom: 10.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(AppSize.s4),
                          ),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: ColorsManager.grey200,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSize.s4,
                              vertical: AppSize.s4,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.today_outlined,
                                  color: ColorsManager.primaryBlue,
                                  size: AppSize.s16,
                                ),
                                CustomTextWidget(
                                  marginLeft: AppSize.s4,
                                  text:
                                      'Starting Date: ${feedItem!.jobOffer!.dateJobStartFormat}',
                                  fontSize: AppSize.s12,
                                  fontWeight: FontWeightManager.regular,
                                  maxLine: 3,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 20,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: AppSize.s16,
                      bottom: AppSize.s10,
                      right: AppSize.s4,
                    ),
                    child: Column(
                      children: [
                        for (var i = 0;
                            i < feedItem!.jobOffer!.types!.length;
                            i++)
                          ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(AppSize.s8),
                            ),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: ColorsManager.grey200,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppSize.s8,
                                vertical: AppSize.s4,
                              ),
                              child: CustomTextWidget(
                                textAlign: TextAlign.center,
                                text: '${feedItem!.jobOffer!.types![i].label}',
                                fontWeight: FontWeightManager.regular,
                                fontSize: AppSize.s10,
                                // marginBottom: 50.0,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              height: AppSize.s10,
              thickness: AppSize.s1,
            ),
            Padding(
              padding: const EdgeInsets.all(AppSize.s8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.thumb_up_alt_outlined,
                        color: ColorsManager.primaryBlue,
                        size: AppSize.s20,
                      ),
                      // Icon(
                      //   Icons.thumb_up_alt,
                      //   color: ColorsManager.primaryBlue,
                      //   size: AppSize.s20,
                      // ),
                      CustomTextWidget(
                        text: 'Apply',
                        marginLeft: AppSize.s4,
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.turned_in_not_outlined,
                        color: ColorsManager.primaryBlue,
                        size: AppSize.s20,
                      ),
                      // Icon(
                      //   Icons.thumb_up_alt,
                      //   color: ColorsManager.primaryBlue,
                      //   size: AppSize.s16,
                      // ),
                      CustomTextWidget(
                        text: 'Save',
                        marginLeft: AppSize.s4,
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.visibility_off_outlined,
                        // color: ColorsManager.red,
                        color: ColorsManager.primaryBlue,
                        size: AppSize.s16,
                      ),
                      // Icon(
                      //   Icons.visibility_off_outlined,
                      //   color: ColorsManager.primaryBlue,
                      //   size: AppSize.s16,
                      // ),
                      CustomTextWidget(
                        text: 'Hide',
                        marginLeft: AppSize.s4,
                        // color: ColorsManager.red,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
