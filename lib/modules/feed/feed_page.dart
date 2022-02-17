import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
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
                  color: ColorsManager.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                ),
                padding: const EdgeInsets.all(AppSize.s16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => controller.profileController.userInfoRepsonse.value
                                  .profile ==
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
                              color: ColorsManager.primary,
                              marginLeft: AppSize.s8,
                              marginBottom: AppSize.s8,
                            ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: getWidth * 0.80,
                          child: const CustomTextInput(
                            // controller: controller.emailCtrl,
                            // inputTitle: 'Search',
                            hintText: 'Search the job title',
                            isFilled: true,
                            // suffixIcon: true,
                            // topPadding: AppSize.s12,
                            // validator: Validator().emailValidator,
                            // keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        const Icon(
                          Icons.filter_list,
                          color: ColorsManager.primary,
                        ),
                      ],
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
