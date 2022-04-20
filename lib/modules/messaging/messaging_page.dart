import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                          Expanded(
                            child: (controller
                                    .roomMessagingDetailsRepsonse.isNotEmpty)
                                ? ListView.builder(
                                    controller: controller.listScrollController,
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
                                                // borderRadius: BorderRadius.only(
                                                //   topLeft: Radius.circular(8),
                                                //   topRight: Radius.circular(8),
                                                //   // bottomLeft: Radius.circular(8),
                                                //   bottomRight: Radius.circular(8),
                                                // ),
                                              ),
                                              child: CustomTextWidget(
                                                text: dateFormatSlashDDMMYYYY(
                                                  date:
                                                      chat.createdAt!.toLocal(),
                                                ),
                                              ),
                                            ),
                                          const SizedBox(height: AppSize.s4),
                                          MessageCard(
                                            message: chat,
                                            // userId: chat.userUuid,
                                            // isCurrentUser: chat.isOwner == 1,
                                            // userProfilePic: chat.pictureUrl,
                                            // shortName: chat.shortName,
                                            // messageContent: chat.message,
                                            // date: slashDateTimeFormat(
                                            //   date: chat.createdAt!.toLocal(),
                                            // ),
                                          ),
                                        ],
                                      );
                                    },
                                  )
                                : const Center(
                                    child: Text("No messages here yet..."),
                                  ),
                          ),
                          // Sticker
                          // isShowSticker ? buildSticker() : SizedBox.shrink(),

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
                                // Button send image
                                // Material(
                                //   color: Colors.white,
                                //   child: Container(
                                //     margin: const EdgeInsets.symmetric(horizontal: 1),
                                //     child: const IconButton(
                                //       icon: Icon(Icons.image),
                                //       onPressed: null,
                                //       color: ColorsManager.primary,
                                //     ),
                                //   ),
                                // ),
                                // Material(
                                //   color: Colors.white,
                                //   child: Container(
                                //     margin: const EdgeInsets.symmetric(horizontal: 1),
                                //     child: IconButton(
                                //       icon: const Icon(Icons.face),
                                //       onPressed: getSticker,
                                //       color: ColorsManager.primaryColor,
                                //     ),
                                //   ),
                                // ),

                                // Edit text
                                Flexible(
                                  child: TextField(
                                    controller: controller.sendingTextCtrl,
                                    // focusNode: ref.read(messageController).messageFieldNode,
                                    // onTap: ref.read(emojiVisiblityController.notifier).onFieldTap,
                                    decoration: const InputDecoration(
                                      contentPadding:
                                          EdgeInsets.fromLTRB(8, 8, 8, 8),
                                      isCollapsed: true,
                                      isDense: true,
                                      hintText: 'Type your message...',
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
                                                    controller.onSendMessage(
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
