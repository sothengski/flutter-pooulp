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
      body: Center(
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
                : const Center(
                    child: CustomTextWidget(
                      text: 'No feed results found.',
                    ),
                    //  StateHandlerWidget(
                    //   imgPath: emptyDataIcon,
                    //   headerText: "No customer results found.",
                    //   bodyText: "You don't have customers yet!",
                    //   buttonText: "Try again",
                    //   onPressedFunctionCall: controller.onRefresh,
                    // ),
                  ),
          ),
          onLoading: const Center(
            child: CustomTextWidget(
              text: 'Loading...',
            ),
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
