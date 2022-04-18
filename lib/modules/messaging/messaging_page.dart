import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import '../modules.dart';

class MessagingPage extends GetView<MessagingController> {
  const MessagingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (state) => Center(
          child: CustomTextWidget(
            text: 'length:: ${controller.roomListRepsonse.length}',
          ),
        ),
        onLoading: const Center(
          child: LoadingWidget(
            isTreeBounceLoading: true,
          ),
        ),
        onError: (error) => Center(
          child: StateHandlerWidget(
            imgPath: AssetsManager.emptyDataIcon,
            headerText: 'core.sthWentWrong'.tr,
            bodyText: 'core.connectionFailedMsg'.tr,
            buttonText: 'core.tryAgain'.tr,
            // onPressedFunctionCall: controller.onRefresh,
          ),
        ),
      ),
    );
  }
}
