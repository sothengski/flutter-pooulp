import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import '../../routes/app_routes.dart';
import '../modules.dart';

class RoomListPage extends GetView<MessagingController> {
  const RoomListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'home.messaging'.tr,
        elevation: 0.0,
      ),
      body: controller.obx(
        (state) => RefreshIndicator(
          color: ColorsManager.primary,
          onRefresh: () => controller.onRefresh(),
          child: controller.roomListRepsonse.isEmpty
              ? const Center(
                  child: CustomTextWidget(
                    text: 'You have no messages yet',
                  ),
                )
              : ListView.builder(
                  // shrinkWrap: true,
                  padding: const EdgeInsets.only(
                    bottom: kFloatingActionButtonMargin + 10,
                  ),
                  itemCount: controller.roomListRepsonse.length,
                  // physics: const BouncingScrollPhysics(),
                  // scrollDirection: Axis.vertical,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () => {
                        // print('click'),
                        controller.roomOnClick(
                          roomValue: controller.roomListRepsonse[index],
                        ),

                        Get.toNamed(Routes.roomDetailsRoute),
                      },
                      child: RoomCard(
                        imgUrl: controller.roomListRepsonse[index].participants!
                            .first.pictureUrl,
                        shortName: controller.roomListRepsonse[index]
                            .participants!.first.shortName,
                        participantName: controller.roomListRepsonse[index]
                            .participants!.first.fullName,
                        lastestMessage:
                            controller.roomListRepsonse[index].latestMessage !=
                                    null
                                ? controller.roomListRepsonse[index]
                                    .latestMessage!.message
                                : '',
                        date: controller
                            .roomListRepsonse[index].lastestMessageDate,
                        unseenMessage:
                            controller.roomListRepsonse[index].unseenMessages,
                      ),
                    );
                  },
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
            onPressedFunctionCall: controller.onRefresh,
          ),
        ),
      ),
    );
  }
}
