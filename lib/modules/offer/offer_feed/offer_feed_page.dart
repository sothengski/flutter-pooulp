import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../offer.dart';

class OfferFeedPage extends GetView<OfferFeedController> {
  const OfferFeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorsManager.white,
      body: Column(
        children: [
          Expanded(
            flex: 18,
            child: Card(
              elevation: 5.0,
              margin: EdgeInsets.zero,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Container(
                alignment: Alignment.centerLeft,
                decoration: const BoxDecoration(
                  // color: ColorsManager.primary,
                  color: ColorsManager.primaryBlue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 45,
                      child: Obx(
                        () => controller.profileController.userInfoRepsonse
                                    .value.profile ==
                                null
                            ? const SizedBox(
                                width: 100,
                                child: LoadingWidget(
                                  isTreeBounceLoading: true,
                                  color: ColorsManager.white,
                                ),
                              )
                            : CustomTextWidget(
                                text: 'offer.hello'.trParams({
                                  'name':
                                      '${controller.profileController.userInfoRepsonse.value.profile!.firstName}',
                                }),
                                fontSize: 24,
                                fontWeight: FontWeightManager.semiBold,
                                color: ColorsManager.white,
                                marginTop: AppSize.s12,
                                marginLeft: AppSize.s16,
                                // marginBottom: AppSize.s16,
                              ),
                      ),
                    ),
                    // const SizedBox(height: 4.0),
                    Expanded(
                      flex: 45,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 85,
                            // width: getWidth * 0.80,
                            child: CustomContainerWidget(
                              isBoxShadow: false,
                              // topMargin: AppSize.s6,
                              leftMargin: AppSize.s16,
                              containerBackground: ColorsManager.grey100,
                              childPadding: AppSize.s12,
                              titleInSide: false,
                              child: Obx(
                                () => CustomTextWidget(
                                  text: controller.keywordToBeSearch.value != ''
                                      ? controller.keywordToBeSearch.value
                                      : 'offer.searchByTitle'.tr,
                                ),
                              ),
                              onTap: () {
                                showSearch(
                                  context: context,
                                  delegate: OfferSearchPage(),
                                );
                              },
                            ),
                          ),
                          Expanded(
                            flex: 15,
                            child: IconButton(
                              alignment: Alignment.topCenter,
                              icon: const Icon(Icons.filter_list),
                              color: ColorsManager.white,
                              onPressed: () {
                                // controller.updateKeyword();
                                customGeneralDialog(
                                  context: context,
                                  barrierDismissible: true,
                                  widget: OfferFeedFilterSearch(
                                    title: 'offer.filterTitle'.tr,
                                  ),
                                  // Get.dialog(
                                  //   OfferFeedFilterSearch(
                                  //     title: 'offer.filterTitle'.tr,
                                  //   ),
                                  //   // barrierDismissible: false,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 82,
            child: RefreshIndicator(
              color: ColorsManager.primary,
              onRefresh: () => controller.onRefresh(),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Expanded(
                  //   flex: 9,
                  //   child: Obx(
                  //     () => controller.listJobOfferTypes.isNotEmpty
                  //         ? OfferFeedTypesListComponent()
                  //         : const ItemListShimmerLoadingWidget(
                  //             isBodyList: false,
                  //           ),
                  //   ),
                  // ),
                  const SizedBox(height: AppSize.s4),
                  Expanded(
                    flex: 90,
                    child: controller.obx(
                      (state) => Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Obx(
                            () => controller.feedListRepsonse.isNotEmpty
                                ? OfferFeedListComponent()
                                : Center(
                                    child: StateHandlerWidget(
                                      imgPath: AssetsManager.emptyDataIcon,
                                      headerText: 'offer.noFeedMsg'.tr,
                                      bodyText: 'offer.contentMsg'.tr,
                                      buttonText: 'core.tryAgain'.tr,
                                      onPressedFunctionCall:
                                          controller.onRefresh,
                                    ),
                                  ),
                          ),
                          Obx(
                            () => SizedBox(
                              height: 30,
                              child: controller.isLoadingIndicator.value == true
                                  ? const LoadingWidget(
                                      isTreeBounceLoading: true,
                                    )
                                  : Container(),
                            ),
                          ),
                        ],
                      ),
                      onLoading: const Center(
                        child: ItemListShimmerLoadingWidget(
                          isTopRowList: false,
                        ),
                      ),
                      onError: (error) => Center(
                        child: StateHandlerWidget(
                          imgPath: AssetsManager.emptyDataIcon,
                          headerText: 'core.sthWentWrong'.tr,
                          bodyText: 'core.connectionFailedMsg'.tr,
                          buttonText: 'core.tryAgain'.tr,
                          onPressedFunctionCall: controller.onRefresh,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
