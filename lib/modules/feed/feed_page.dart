import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import 'feed.dart';

class FeedPage extends GetView<FeedController> {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Feed Page',
      ),
      body: RefreshIndicator(
        onRefresh: () => controller.onRefresh(),
        child: controller.obx(
          (state) => Obx(
            () => controller.feedFilterList.isNotEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 7,
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
            child: Text(
              error.toString(),
            ),
          ),
        ),
      ),
    );
  }
}
