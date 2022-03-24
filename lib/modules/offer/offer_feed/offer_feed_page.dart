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
                  color: ColorsManager.primary,
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
                                text:
                                    'Hello ${controller.profileController.userInfoRepsonse.value.profile!.firstName}',
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
                                      : OfferStrings
                                          .searchByTitle, //'Search the title',
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
                              icon: const Icon(Icons.filter_list),
                              color: ColorsManager.white,
                              onPressed: () {
                                controller.updateKeyword();
                                Get.dialog(
                                  const OfferFeedFilterSearch(
                                    title: 'Advanced Search',
                                  ),
                                  // barrierDismissible: false,
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
                  Expanded(
                    flex: 9,
                    child: Obx(
                      () => controller.listJobOfferTypes.isNotEmpty
                          ? OfferFeedTypesListComponent()
                          : const ItemListShimmerLoadingWidget(
                              isBodyList: false,
                            ),
                    ),
                  ),
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
                                      headerText: 'No feed results found.',
                                      bodyText:
                                          "Make sure you complete your profile information.",
                                      buttonText: 'Try again',
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
                          headerText: 'Sorry! Something went wrong',
                          bodyText:
                              "Make sure that Wi-Fi or mobile data is turned on and try again..",
                          buttonText: 'Try again',
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
