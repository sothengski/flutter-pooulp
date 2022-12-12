import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import '../../routes/app_routes.dart';
import '../modules.dart';

// ignore: must_be_immutable
class RoomListPage extends GetView<MessagingController> {
  String? roomUUID = (Get.parameters['id']) ?? '';

  RoomListPage({Key? key, this.roomUUID = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // controller.selectedRoom.value = MessagingModel(uuid: roomUUID);
    print('roomUUID: $roomUUID');
    return Scaffold(
      appBar: CustomAppBar(
        title: 'messaging'.tr,
        elevation: 0.0,
      ),
      body: controller.obx(
        (state) => RefreshIndicator(
          color: ColorsManager.primary,
          onRefresh: () => controller.onRefreshForRoomChat(),
          child: controller.roomListRepsonse.isEmpty
              ? Center(
                  child: CustomTextWidget(
                    text: 'noMessagesMsg'.tr,
                  ),
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: ListView.builder(
                        controller: controller.roomScrollController,
                        physics: const AlwaysScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(
                          bottom: kFloatingActionButtonMargin + 10,
                        ),
                        itemCount: controller.roomListRepsonse.length,
                        // scrollDirection: Axis.vertical,
                        itemBuilder: (_, index) {
                          return GestureDetector(
                            onTap: () => {
                              controller.roomOnClick(
                                roomValue: controller.roomListRepsonse[index],
                              ),
                              Get.toNamed(Routes.roomDetailsRoute),
                            },
                            child: RoomCard(
                              imgUrl: controller.roomListRepsonse[index]
                                  .participants!.first.pictureUrl,
                              shortName: controller.roomListRepsonse[index]
                                  .participants!.first.shortName,
                              participantName: controller
                                  .roomListRepsonse[index]
                                  .participants!
                                  .first
                                  .fullName,
                              lastestMessage:
                                  controller.roomListRepsonse[index].name ?? '',
                              date: controller
                                  .roomListRepsonse[index].lastestMessageDate,
                              unseenMessage: controller
                                  .roomListRepsonse[index].unseenMessages,
                              unseenbadge: controller
                                  .roomListRepsonse[index].newConversation,
                            ),
                          );
                        },
                      ),
                    ),
                    Obx(
                      () => controller.isLoadingIndicator.value == true
                          ? Container(
                              color: Colors.transparent,
                              height: 30,
                              child: const LoadingWidget(
                                isTreeBounceLoading: true,
                              ),
                            )
                          : Container(),
                    ),
                  ],
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
            headerText: 'sthWentWrong'.tr,
            bodyText: 'connectionFailedMsg'.tr,
            buttonText: 'tryAgain'.tr,
            onPressedFunctionCall: controller.onRefreshForRoomChat,
          ),
        ),
      ),
    );
  }
}
