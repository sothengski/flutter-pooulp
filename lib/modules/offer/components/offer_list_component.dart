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
              bottomActionWidgetList: (jobOfferType == 'Pending')
                  ? [
                      Expanded(
                        child: OutlineIconButtonWidget(
                          buttonTitle: 'Information',
                          iconColor: ColorsManager.grey600,
                          iconColorOnClick: ColorsManager.primaryBlue,
                          buttonState: offerList![index].informationState,
                          onPressed: () {
                            offerList![index].informationState =
                                offerController!.jobOfferOnClickBoolSwitching(
                              boolValue: offerList![index].informationState,
                            );
                          },
                        ),
                      ),
                    ]
                  : (jobOfferType == 'Matched')
                      ? [
                          Expanded(
                            child: OutlineIconButtonWidget(
                              buttonTitle: 'Call',
                              iconData: Icons.phone_outlined,
                              iconDataOnClick: Icons.phone,
                              iconColor: ColorsManager.grey600,
                              buttonState: offerList![index].applyState,
                              onPressed: () {
                                offerList![index].applyState = offerController!
                                    .jobOfferOnClickBoolSwitching(
                                  boolValue: offerList![index].applyState,
                                );
                              },
                            ),
                          ),
                          Expanded(
                            child: OutlineIconButtonWidget(
                              buttonTitle: 'Information',
                              iconColor: ColorsManager.grey600,
                              iconColorOnClick: ColorsManager.primaryBlue,
                              buttonState: offerList![index].informationState,
                              onPressed: () {
                                offerList![index].informationState =
                                    offerController!
                                        .jobOfferOnClickBoolSwitching(
                                  boolValue: offerList![index].informationState,
                                );
                              },
                            ),
                          ),
                          Expanded(
                            child: OutlineIconButtonWidget(
                              buttonTitle: 'Email',
                              iconData: Icons.email_outlined,
                              iconDataOnClick: Icons.email,
                              iconColor: ColorsManager.grey600,
                              iconColorOnClick: ColorsManager.amber,
                              buttonState: offerList![index].savedState,
                              onPressed: () {
                                offerList![index].savedState = offerController!
                                    .jobOfferOnClickBoolSwitching(
                                  boolValue: offerList![index].savedState,
                                );
                              },
                            ),
                          ),
                        ]
                      : (jobOfferType == 'Saved')
                          ? [
                              Expanded(
                                child: OutlineIconButtonWidget(
                                  buttonTitle: 'Apply',
                                  iconData: Icons.thumb_up_outlined,
                                  iconDataOnClick: Icons.thumb_up,
                                  iconColor: ColorsManager.grey600,
                                  iconColorOnClick: ColorsManager.green,
                                  buttonState: offerList![index].applyState,
                                  onPressed: () {
                                    offerList![index].applyState =
                                        offerController!
                                            .jobOfferOnClickBoolSwitching(
                                      boolValue: offerList![index].applyState,
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                child: OutlineIconButtonWidget(
                                  buttonTitle: 'Information',
                                  iconColor: ColorsManager.grey600,
                                  iconColorOnClick: ColorsManager.primaryBlue,
                                  buttonState:
                                      offerList![index].informationState,
                                  onPressed: () {
                                    offerList![index].informationState =
                                        offerController!
                                            .jobOfferOnClickBoolSwitching(
                                      boolValue:
                                          offerList![index].informationState,
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                child: OutlineIconButtonWidget(
                                  buttonTitle: 'Unsaved',
                                  iconData: Icons.bookmark_remove_outlined,
                                  iconDataOnClick: Icons.bookmark_remove,
                                  iconColor: ColorsManager.grey600,
                                  iconColorOnClick:
                                      ColorsManager.lightBlueAccent,
                                  buttonState: offerList![index].savedState,
                                  onPressed: () {
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
                                child: OutlineIconButtonWidget(
                                  buttonTitle: 'Information',
                                  iconColor: ColorsManager.grey600,
                                  iconColorOnClick: ColorsManager.primaryBlue,
                                  buttonState:
                                      offerList![index].informationState,
                                  onPressed: () {
                                    offerList![index].informationState =
                                        offerController!
                                            .jobOfferOnClickBoolSwitching(
                                      boolValue:
                                          offerList![index].informationState,
                                    );
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
