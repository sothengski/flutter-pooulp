import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pooulp_flutter/routes/routes.dart';

import '../../core/core.dart';
import '../modules.dart';

class MessagingPage extends GetView<MessagingController> {
  const MessagingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: controller.selectedRoom.value.participants!.first.fullName!,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(
                "${Routes.offerdetailRoute}?id=${controller.selectedRoom.value.jobOfferMatching!.jobOfferId}",
                // arguments: [
                //   // jobOfferItem
                //   controller.selectedRoom.value.uuid,
                //   // jobOfferItem!.uuid,
                //   null,
                //   false,
                // ],
              );
            },
            icon: const Icon(Icons.more_vert_rounded),
          )
          // PopupMenuButton<MenuItem>(
          //   // icon: const Icon(Icons.more_vert),
          //   itemBuilder: (_) => [
          //     PopupMenuItem(
          //       child: CustomTextWidget(text: 'jobOffer'.tr),
          //       onTap: () async
          //           // => print(
          //           //   'job offer id: ${controller.selectedRoom.value.jobOfferMatching!.jobOfferId}',
          //           // ),

          //           {
          //         Get.toNamed(
          //           Routes.offerdetailRoute,
          //           arguments: [
          //             // jobOfferItem
          //             controller.selectedRoom.value.uuid,
          //             // jobOfferItem!.uuid,
          //             const [],
          //             false,
          //           ],
          //         );
          //       },
          //     )
          //   ],
          // ),
        ],
      ),
      body: WillPopScope(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Obx(
              () => controller.isMessageLoading.value == true
                  ? const Center(
                      child: LoadingWidget(
                        isTreeBounceLoading: true,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(bottom: AppSize.s8),
                      child: Column(
                        children: <Widget>[
                          // List of messages
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
                          Expanded(
                            child: (controller
                                    .roomMessagingDetailsRepsonse.isNotEmpty)
                                ? ListView.builder(
                                    controller:
                                        controller.messagingScrollController,
                                    reverse: true,
                                    itemCount: controller
                                        .roomMessagingDetailsRepsonse.length,
                                    padding: const EdgeInsets.all(10),
                                    itemBuilder: (context, index) {
                                      final chat = controller
                                          .roomMessagingDetailsRepsonse[index];
                                      return Column(
                                        children: [
                                          if (index + 1 <
                                                  controller
                                                      .roomMessagingDetailsRepsonse
                                                      .length &&
                                              chat.createdAt!
                                                  .toLocal()
                                                  .isSameDate(
                                                    other: controller
                                                        .roomMessagingDetailsRepsonse[
                                                            index + 1]
                                                        .createdAt!
                                                        .toLocal(),
                                                  ))
                                            Container()
                                          else
                                            Container(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                6,
                                                6,
                                                6,
                                                6,
                                              ),
                                              decoration: BoxDecoration(
                                                color: ColorsManager.grey100,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: CustomTextWidget(
                                                text: dateFormatSlashDDMMYYYY(
                                                  date:
                                                      chat.createdAt!.toLocal(),
                                                ),
                                              ),
                                            ),
                                          const SizedBox(height: AppSize.s4),
                                          GetBuilder<MessagingController>(
                                            initState: (_) {},
                                            builder: (_) {
                                              return MessageCard(
                                                message: chat,
                                                onTap: () =>
                                                    chat.enableDateTime =
                                                        controller
                                                            .switchingBoolValue(
                                                  boolValue:
                                                      chat.enableDateTime,
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  )
                                : Center(
                                    child: CustomTextWidget(
                                      text: 'noMessages'.tr,
                                    ),
                                  ),
                          ),
                          // Input content
                          Container(
                            margin: const EdgeInsets.only(
                              top: AppSize.s6,
                              bottom: AppSize.s6,
                              left: AppSize.s16,
                              right: AppSize.s6,
                            ),
                            width: double.infinity,
                            height: 50,
                            decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: ColorsManager.grey100,
                                  width: 0.5,
                                ),
                              ),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: <Widget>[
                                // Edit text
                                Flexible(
                                  child: TextField(
                                    controller: controller.sendingTextCtrl,
                                    // focusNode: ref.read(messageController).messageFieldNode,
                                    // onTap: ref.read(emojiVisiblityController.notifier).onFieldTap,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.fromLTRB(8, 8, 8, 8),
                                      isCollapsed: true,
                                      isDense: true,
                                      hintText: 'messagingHint'.tr,
                                      border: InputBorder.none,
                                    ),
                                    maxLines: null,
                                    onChanged: controller.onChangedTextCtrl,
                                  ),
                                ),

                                // Button send message
                                Material(
                                  color: Colors.white,
                                  child: Obx(
                                    () => Container(
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 2,
                                      ),
                                      child:
                                          controller.enableSendingBtn.value ==
                                                  false
                                              ? const IconButton(
                                                  icon: Icon(Icons.send),
                                                  onPressed: null,
                                                  color: ColorsManager.grey,
                                                )
                                              : IconButton(
                                                  icon: const Icon(Icons.send),
                                                  onPressed: () => {
                                                    controller
                                                        .makeRequestToPOSTMessagesAPI(
                                                      roomId: controller
                                                          .selectedRoom
                                                          .value
                                                          .uuid,
                                                      message: controller
                                                          .sendingTextCtrl.text,
                                                    ),
                                                  },
                                                  color: ColorsManager.primary,
                                                ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
            );
          },
        ),
        onWillPop: () {
          Get.back();
          return Future.value(false);
        },
      ),
    );
  }
}
