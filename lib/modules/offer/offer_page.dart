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
        title: 'My Offers',
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
                      noDataHeader: 'No Pending results found.',
                    )
                  : controller.isJobOfferStateList(
                      inputValue: OfferStrings.matchedState,
                    )
                      ? OfferListStateComponent(
                          controller: controller,
                          offerList: controller.matchedOfferListRepsonse,
                          jobOfferType: OfferStrings.matchedState,
                          noDataHeader: 'No Matched results found.',
                        )
                      : controller.isJobOfferStateList(
                          inputValue: OfferStrings.savedState,
                        )
                          ? OfferListStateComponent(
                              controller: controller,
                              offerList: controller.savedOfferListFilter,
                              jobOfferType: OfferStrings.savedState,
                              noDataHeader: 'No Saved results found.',
                            )
                          : OfferListStateComponent(
                              controller: controller,
                              offerList: controller.rejectedOfferListRepsonse,
                              jobOfferType: OfferStrings.rejectedState,
                              noDataHeader: 'No Rejected results found.',
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
    this.noDataBody = 'Make sure you complete your profile information.',
    this.errorHeader = 'Sorry! Something went wrong',
    this.errorBody =
        'Make sure that Wi-Fi or mobile data is turned on and try again..',
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
                    bodyText: noDataBody,
                    buttonText: 'Try again',
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
            headerText: errorHeader,
            bodyText: errorBody,
            buttonText: 'Try again',
            onPressedFunctionCall: controller.onRefresh,
          ),
        ),
      ),
    );
  }
}
