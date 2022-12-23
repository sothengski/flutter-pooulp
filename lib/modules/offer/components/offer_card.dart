import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';
import '../../../routes/routes.dart';

class OfferCard extends StatelessWidget {
  final JobOfferModel? jobOfferItem;
  // final Widget? bottomActionWidget;
  final List<Widget>? bottomActionWidgetList;
  final bool? isCustomActBtn;
  final String? jobOfferState;

  const OfferCard({
    Key? key,
    this.jobOfferItem,
    // this.bottomActionWidget,
    this.bottomActionWidgetList = const [],
    this.isCustomActBtn = false,
    this.jobOfferState = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSize.s12,
        vertical: AppSize.s6,
      ),
      child: MaterialButton(
        padding: EdgeInsets.zero,
        elevation: AppSize.s2,
        color: ColorsManager.white,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
        onPressed: () {
          Get.toNamed(
            "${Routes.offerdetailRoute}?id=${jobOfferItem!.uuid}",
            arguments: [
              // jobOfferItem
              jobOfferItem!.uuid,
              bottomActionWidgetList,
              isCustomActBtn,
              jobOfferState == OfferStrings.matchedState
            ],
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ///===== Work Place Types Component =====//
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
                  text: '${jobOfferItem!.workPlaceType}',
                  color: ColorsManager.white,
                  fontWeight: FontWeightManager.regular,
                  fontSize: AppSize.s12,
                  // marginBottom: 50.0,
                ),
              ),
            ),
            //===== Work Place Types Component =====//
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ///===== Enterprise Logo Component =====//
                Flexible(
                  flex: 15,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      // top: AppSize.s20,
                      left: AppSize.s5,
                    ),
                    child: CustomBoxWidget(
                      size: 40,
                      isCircle: true,
                      topPadding: 2.0,
                      bottomPadding: 2.0,
                      leftPadding: 2.0,
                      rightPadding: 2.0,
                      child: CachedNetworkImgWidget(
                        imgUrl: '${jobOfferItem!.enterprise!.logoUrl}',
                        borderRadius: 20,
                        defaultImg: AssetsManager.logoEnterpriseDefault,
                      ),
                    ),
                  ),
                ),
                //===== Enterprise Logo Component =====//
                Flexible(
                  flex: 65,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: AppSize.s4,
                      bottom: AppSize.s12,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///===== Job Offer Title Component =====//
                        CustomTextWidget(
                          text: '${jobOfferItem!.title}',
                          fontWeight: FontWeightManager.semiBold,
                          maxLine: 3,
                          // marginTop: 20.0,
                          marginBottom: AppSize.s16,
                        ),
                        //===== Job Offer Title Component =====//

                        ///===== Location Icon & Enterprise Name Component =====//
                        Padding(
                          padding: const EdgeInsets.only(
                            left: AppSize.s4,
                            bottom: AppSize.s10,
                          ),
                          child: Expanded(
                            child: CustomTextWidget(
                              text: '${jobOfferItem!.description}...',
                              fontSize: AppSize.s12,
                              color: ColorsManager.grey800,
                              maxLine: 2,
                              marginLeft: AppSize.s4,
                              // marginBottom: 10.0,
                            ),
                          ),
                        ),
                        //===== Location Icon & Enterprise Name Component =====//

                        ///===== Location Icon & Enterprise Name Component =====//
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
                                      '${jobOfferItem!.companyNameAndJobOfferOffice}',
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
                        //===== Location Icon & Enterprise Name Component =====//

                        ///===== Start Date Card Component =====//
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
                                      "${jobOfferItem!.dateJobStartFormat} - ${jobOfferItem!.dateJobEndFormat}", //${'startFrom'.tr}:
                                  // text: 'offer.startFrom'.trParams({
                                  //   'date':
                                  //       '${jobOfferItem!.dateJobStartFormat}'
                                  // }),
                                  fontSize: AppSize.s12,
                                  fontWeight: FontWeightManager.regular,
                                  maxLine: 3,
                                ),
                              ],
                            ),
                          ),
                        ),
                        //===== Start Date Card Component =====//
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 20,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: AppSize.s10,
                      bottom: AppSize.s5,
                      right: AppSize.s4,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ///===== List of Job Offer Type Component =====//
                        for (var i = 0; i < jobOfferItem!.types!.length; i++)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              // horizontal: AppSize.s2,
                              vertical: AppSize.s2,
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(AppSize.s5),
                              ),
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: ColorsManager.grey200,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: AppSize.s2,
                                  vertical: AppSize.s4,
                                ),
                                child: CustomTextWidget(
                                  textAlign: TextAlign.center,
                                  text: '${jobOfferItem!.types![i].label}',
                                  fontWeight: FontWeightManager.regular,
                                  fontSize: AppSize.s10,
                                  // marginBottom: AppSize.s10,
                                ),
                              ),
                            ),
                          ),
                        //===== List of Job Offer Type Component =====//

                        ///===== Number Of WorkingHour or Internship Period List Component =====//
                        if (jobOfferItem!.numberOfWorking! != '' &&
                            jobOfferItem!.internshipPeriods!.isEmpty)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              // horizontal: AppSize.s2,
                              vertical: AppSize.s2,
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(AppSize.s5),
                              ),
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: ColorsManager.grey200,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: AppSize.s2,
                                  vertical: AppSize.s4,
                                ),
                                child: CustomTextWidget(
                                  textAlign: TextAlign.center,
                                  text: '${jobOfferItem!.numberOfWorking}',
                                  fontWeight: FontWeightManager.regular,
                                  fontSize: AppSize.s10,
                                  // marginBottom: AppSize.s10,
                                ),
                              ),
                            ),
                          )
                        else if (jobOfferItem!.internshipPeriods != [])
                          for (var i = 0;
                              i < jobOfferItem!.internshipPeriods!.length;
                              i++)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                // horizontal: AppSize.s2,
                                vertical: AppSize.s2,
                              ),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(AppSize.s5),
                                ),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: ColorsManager.grey200,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: AppSize.s2,
                                    vertical: AppSize.s4,
                                  ),
                                  child: CustomTextWidget(
                                    textAlign: TextAlign.center,
                                    text:
                                        '${jobOfferItem!.internshipPeriods![i].label}',
                                    fontWeight: FontWeightManager.regular,
                                    fontSize: AppSize.s10,
                                    // marginBottom: AppSize.s10,
                                  ),
                                ),
                              ),
                            ),
                        //===== Number Of WorkingHour or Internship Period List Component =====//
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              height: AppSize.s1,
              thickness: AppSize.s1,
            ),
            // bottomActionWidget ?? Container(),
            ///===== Job Offer Action Buttons Component =====//
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: bottomActionWidgetList!,
            )
            //===== Job Offer Action Buttons Component =====//
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Expanded(
            //       child: OutlineIconButtonWidget(
            //         buttonTitle: 'Apply',
            //         iconData: Icons.thumb_up_alt_outlined,
            //         iconDataOnClick: Icons.thumb_up,
            //         iconColorOnClick: ColorsManager.green,
            //         buttonState: leftButtonState,
            //         onPressed: () => leftButtonFunctionCall!(),
            //       ),
            //     ),
            //     Expanded(
            //       child: OutlineIconButtonWidget(
            //         buttonTitle: 'Save',
            //         iconData: Icons.turned_in_not_outlined,
            //         iconDataOnClick: Icons.turned_in,
            //         iconColorOnClick: ColorsManager.blue,
            //         buttonState: middleButtonState,
            //         // buttonState: feedController.savedButtonStateList[index!],
            //         onPressed: () => middleButtonFunctionCall!(),
            //         // onPressed: () {
            //         //   feedController.savedButtonStateList[index!] =
            //         //       feedController.jobOfferOnClickBoolSwitching(
            //         //     boolValue:
            //         //         feedController.savedButtonStateList[index!],
            //         //   );
            //         // },
            //       ),
            //     ),
            //     Expanded(
            //       child: OutlineIconButtonWidget(
            //         buttonTitle: 'Hide',
            //         iconData: Icons.visibility_off_outlined,
            //         iconDataOnClick: Icons.visibility_outlined,
            //         iconColorOnClick: ColorsManager.red,
            //         buttonState: rightButtonState,
            //         onPressed: () => rightButtonFunctionCall!(),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
