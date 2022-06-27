import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import '../../data/data.dart';
import '../modules.dart';

class OfferPage extends GetView<OfferController> {
  const OfferPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'myOffers'.tr,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: Obx(
              () => OfferStateListComponent(
                jobOfferStateList: controller.jobOfferStateFilterList,
                offerController: controller,
              ),
            ),
          ),
          Expanded(
            flex: 91,
            child: Obx(
              () => controller.isJobOfferStateList(
                inputValue: OfferStrings.pendingState,
              )
                  ? OfferListStateComponent(
                      controller: controller,
                      offerList: controller.pendingOfferListRepsonse,
                      jobOfferType: OfferStrings.pendingState,
                      noDataHeader: 'noResult'.tr,
                    )
                  : controller.isJobOfferStateList(
                      inputValue: OfferStrings.matchedState,
                    )
                      ? OfferListStateComponent(
                          controller: controller,
                          offerList: controller.matchedOfferListRepsonse,
                          jobOfferType: OfferStrings.matchedState,
                          noDataHeader: 'noResult'.tr,
                        )
                      : controller.isJobOfferStateList(
                          inputValue: OfferStrings.savedState,
                        )
                          ? OfferListStateComponent(
                              controller: controller,
                              offerList: controller.savedOfferListFilter,
                              jobOfferType: OfferStrings.savedState,
                              noDataHeader: 'noResult'.tr,
                            )
                          : OfferListStateComponent(
                              controller: controller,
                              offerList: controller.rejectedOfferListRepsonse,
                              jobOfferType: OfferStrings.rejectedState,
                              noDataHeader: 'noResult'.tr,
                            ),
            ),
          )
        ],
      ),
    );
  }
}

class OfferListStateComponent extends StatelessWidget {
  final OfferController controller;
  final List<JobOfferModel>? offerList;
  final String? jobOfferType;
  final String? noDataHeader;
  final String? noDataBody;
  final String? errorHeader;
  final String? errorBody;

  const OfferListStateComponent({
    Key? key,
    required this.controller,
    this.offerList,
    this.jobOfferType,
    this.noDataHeader = 'No feed results found.',
    this.noDataBody = '',
    this.errorHeader,
    this.errorBody,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: ColorsManager.primary,
      onRefresh: () => controller.onRefresh(),
      child: controller.obx(
        (state) => Obx(
          () => offerList!.isNotEmpty
              ? OfferListComponent(
                  offerList: offerList,
                  offerController: controller,
                  jobOfferType: jobOfferType,
                )
              : Center(
                  child: StateHandlerWidget(
                    imgPath: AssetsManager.emptyDataIcon,
                    headerText: noDataHeader,
                    bodyText: noDataBody, //?? 'offer.contentMsg'.tr,
                    buttonText: 'tryAgain'.tr,
                    onPressedFunctionCall: controller.onRefresh,
                  ),
                ),
        ),
        onLoading: const Center(
          child: ItemListShimmerLoadingWidget(
            isTopRowList: false,
          ),
        ),
        onError: (error) => Center(
          child: StateHandlerWidget(
            imgPath: AssetsManager.emptyDataIcon,
            headerText: errorHeader ?? 'sthWentWrong'.tr,
            bodyText: errorBody ?? 'connectionFailedMsg'.tr,
            buttonText: 'tryAgain'.tr,
            onPressedFunctionCall: controller.onRefresh,
          ),
        ),
      ),
    );
  }
}
