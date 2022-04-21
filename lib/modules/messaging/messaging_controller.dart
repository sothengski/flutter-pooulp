import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/data.dart';

class MessagingController extends GetxController
    with StateMixin<RxList<MessagingModel>> {
  final messagingProvider = Get.find<MessagingProvider>();

  RxList<MessagingModel> roomListRepsonse = <MessagingModel>[].obs;
  int pageNumForRoomList = 1;

  Rx<MessagingModel> selectedRoom = MessagingModel().obs;

  final ScrollController scrollController = ScrollController();
  Rx<MessagingPaginationModel> messagesAsPageRepsonse =
      MessagingPaginationModel().obs;
  RxList<MessagingModel> roomMessagingDetailsRepsonse = <MessagingModel>[].obs;
  int pageNumForMessages = 1;
  RxBool isMessageLoading = true.obs;
  RxBool enableSendingBtn = false.obs;
  TextEditingController sendingTextCtrl = TextEditingController(text: '');
  RxBool isLoadingIndicator = false.obs;

  @override
  void onInit() {
    getRoomListDataState(refresh: true);
    addMessagesToChat();
    super.onInit();
  }

  Future<void> getRoomListDataState({bool? refresh}) async {
    change(null, status: RxStatus.loading());
    getRoomListResponseProvider(refresh: refresh).then(
      (resp) {
        change(resp, status: RxStatus.success());
      },
      onError: (err) {
        change(
          null,
          status: RxStatus.error('Error'),
        );
      },
    );
  }

  Future<RxList<MessagingModel>> getRoomListResponseProvider({
    bool? refresh = false,
  }) async {
    // roomListRepsonse.clear();
    // final List<MessagingModel> roomTempListResponse = [];
    // final MessagingPaginationModel roomListPaginationRepsonse =
    //     MessagingPaginationModel();
    roomListRepsonse.value =
        await messagingProvider.getMessagingRoomList(pageNumber: 1);

    return roomListRepsonse;
  }

  // Future<void> getRoomDetailsDataState({
  //   required String? roomId,
  //   bool? refresh,
  // }) async {
  //   change(null, status: RxStatus.loading());
  //   getRoomDetailsResponseProvider(roomId: roomId, refresh: refresh).then(
  //     (resp) {
  //       change(resp, status: RxStatus.success());
  //     },
  //     onError: (err) {
  //       change(
  //         null,
  //         status: RxStatus.error('Error'),
  //       );
  //     },
  //   );
  // }

  Future<RxList<MessagingModel>> getRoomDetailsResponseProvider({
    required String? roomId,
    bool? refresh = false,
  }) async {
    if (refresh == true) {
      isMessageLoading.value = true;
      roomMessagingDetailsRepsonse.clear();
      // roomMessagingDetailsRepsonse.value =
      //     await messagingProvider.getMessagesListByRoomID(
      //   roomId: roomId,
      //   pageNumber: 1,
      // );
    }
    messagesAsPageRepsonse.value =
        await messagingProvider.getMessagesAsPageByRoomID(
      roomId: roomId,
      pageNumber: refresh == true
          ? 1
          : messagesAsPageRepsonse.value.meta!.currentPage! + 1,
    );
    isMessageLoading.value = false;
    isLoadingIndicator.value = false;
    roomMessagingDetailsRepsonse.addAll(messagesAsPageRepsonse.value.data!);
    return roomMessagingDetailsRepsonse;
  }

  Future<void> onRefreshForRoomChat() async {
    // monitor network fetch
    await getRoomListDataState(refresh: true);
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
  }

  Future<void> addMessagesToChat() async {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
              scrollController.position.pixels &&
          isLoadingIndicator.value == false &&
          messagesAsPageRepsonse.value.meta!.currentPage! <
              messagesAsPageRepsonse.value.meta!.lastPage!) {
        isLoadingIndicator.value = true;
        getRoomDetailsResponseProvider(roomId: selectedRoom.value.uuid);
      }
    });
  }

  void roomOnClick({MessagingModel? roomValue}) {
    sendingTextCtrl.text = '';
    selectedRoom.value = MessagingModel();
    selectedRoom.value = roomValue!;
    getRoomDetailsResponseProvider(
      roomId: roomValue.uuid,
      refresh: true,
    );
    if (roomValue.unseenMessages! > 0) {
      makeRequestToPOSTSeenAllMessagesAPI(
        roomId: roomValue.uuid,
      );
    }
  }

  void onChangedTextCtrl(String? q) {
    if (sendingTextCtrl.text != '') {
      if (enableSendingBtn.value == false) {
        enableSendingBtn.value = true;
      } else {}
    } else {
      if (enableSendingBtn.value == true) {
        enableSendingBtn.value = false;
      } else {}
    }
  }

  bool switchingBoolValue({bool? boolValue}) {
    update();
    return !boolValue!;
  }

  Future<void> makeRequestToPOSTSeenAllMessagesAPI({
    required String? roomId,
  }) async {
    final tempResp = await messagingProvider.postSeenAllMessagesByRoomID(
      roomId: roomId,
    );
    if (tempResp.success!) {
      await getRoomListResponseProvider();
      update();
    }
  }

  Future<void> makeRequestToPOSTMessagesAPI({
    required String? roomId,
    required String? message,
  }) async {
    final tempResp = await messagingProvider.postMessageByRoomID(
      roomId: roomId,
      message: message,
    );
    if (tempResp.success!) {
      sendingTextCtrl.text = '';
      onChangedTextCtrl('');
      await getRoomListResponseProvider();
      if (tempResp.data != null) {
        final tempData =
            MessagingModel.fromJson(tempResp.data as Map<String, dynamic>);
        roomMessagingDetailsRepsonse.insert(0, tempData);
        update();
      }
    }
  }
}
