import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import '../offer/offer.dart';
import 'feed.dart';

class FeedPage extends GetView<FeedController> {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorsManager.white,
      body: Column(
        children: [
          Expanded(
            flex: 17,
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
                decoration: const BoxDecoration(
                  // color: ColorsManager.primary,
                  color: ColorsManager.primary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                ),
                // padding: const EdgeInsets.symmetric(
                //   vertical: AppSize.s8,
                //   horizontal: AppSize.s8,
                // ),
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 50,
                      child: Obx(
                        () => controller.profileController.userInfoRepsonse
                                    .value.profile ==
                                null
                            ? Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: AppSize.s8,
                                  vertical: AppSize.s10,
                                ),
                                child: ShimmerWidget.rectangular(
                                  width: 120,
                                  height: 1,
                                  shapeBorder: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(AppSize.s8),
                                  ),
                                ),
                              )
                            : CustomTextWidget(
                                text:
                                    'Hello ${controller.profileController.userInfoRepsonse.value.profile!.firstName}',
                                fontSize: 24,
                                fontWeight: FontWeightManager.semiBold,
                                color: ColorsManager.white,
                                marginTop: AppSize.s16,
                                marginLeft: AppSize.s16,
                                marginBottom: AppSize.s16,
                              ),
                      ),
                    ),
                    Expanded(
                      flex: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 85,
                            // width: getWidth * 0.80,
                            child: CustomContainerWidget(
                              leftMargin: AppSize.s16,
                              containerBackground: ColorsManager.grey100,
                              childPadding: AppSize.s12,
                              titleInSide: false,
                              child: const CustomTextWidget(
                                text: 'Search the job title',
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
                                customSnackbar(
                                  msgTitle: 'This Page is under construction!',
                                  msgContent:
                                      'This Page is only view.\n Data will not save.',
                                );
                                // showSearch(
                                //   context: context,
                                //   delegate: OfferSearchPage(),
                                // );
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
            flex: 83,
            child: RefreshIndicator(
              color: ColorsManager.primary,
              onRefresh: () => controller.onRefresh(),
              child: controller.obx(
                (state) => Obx(
                  () => controller.feedFilterList.isNotEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 9,
                              child: OfferTypesListComponent(),
                            ),
                            Expanded(
                              flex: 90,
                              child: FeedListComponent(),
                            ),
                          ],
                        )
                      : Center(
                          child: StateHandlerWidget(
                            imgPath: AssetsManager.emptyDataIcon,
                            headerText: 'No feed results found.',
                            bodyText:
                                "Make sure you complete your profile information.",
                            buttonText: 'Try again',
                            onPressedFunctionCall: controller.onRefresh,
                          ),
                        ),
                ),
                onLoading: const Center(
                  child: ItemListShimmerLoadingWidget(),
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
          ),
        ],
      ),
    );
  }
}
