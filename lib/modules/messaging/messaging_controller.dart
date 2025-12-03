import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/data.dart';
import '../home/home.dart';

class MessagingController extends GetxController
    with StateMixin<RxList<MessagingModel>> {
  final messagingProvider = Get.find<MessagingProvider>();

  final homeController = Get.put(HomeController());

  final ScrollController roomScrollController = ScrollController();
  Rx<MessagingPaginationModel> roomsAsPageRepsonse =
      MessagingPaginationModel().obs;
  RxList<MessagingModel> roomListRepsonse = <MessagingModel>[].obs;

  Rx<MessagingModel> selectedRoom = MessagingModel().obs;

  final ScrollController messagingScrollController = ScrollController();
  Rx<MessagingPaginationModel> messagesAsPageRepsonse =
      MessagingPaginationModel().obs;
  RxList<MessagingModel> roomMessagingDetailsRepsonse = <MessagingModel>[].obs;
  RxBool isMessageLoading = true.obs;
  RxBool enableSendingBtn = false.obs;
  TextEditingController sendingTextCtrl = TextEditingController(text: '');
  RxBool isLoadingIndicator = false.obs;

  Rx<ConversationModel> conversationStatusRepsonse = ConversationModel().obs;

  @override
  void onInit() {
    getRoomListDataState(refresh: true);
    addRoomToChatRooms();
    addMessagesToChat();

    /// TODO: remove this function after offline testing
    // getConversationStatusResponseProvider();
    super.onInit();
  }

  Future<void> getRoomListDataState({bool? refresh}) async {
    change(null, status: RxStatus.loading());
    getRoomListResponseProvider(refresh: refresh).then(
      (resp) {
        change(resp, status: RxStatus.success());
      },
      onError: (err) {
        change(null, status: RxStatus.error('Error'));
      },
    );
  }

  Future<RxList<MessagingModel>> getRoomListResponseProvider({
    bool? refresh = false,
  }) async {
    if (refresh == true) {
      roomListRepsonse.clear();
      // roomListRepsonse.value = await messagingProvider.getMessagingRoomList(
      //   pageNumber: refresh == true ? 1 : 1 + 1,
      // );
    }
    roomsAsPageRepsonse.value = await messagingProvider.getMessagingRoomAsPage(
      pageNumber: refresh == true
          ? 1
          : roomsAsPageRepsonse.value.meta!.currentPage! + 1,
    );
    roomListRepsonse.addAll(roomsAsPageRepsonse.value.data!);
    isLoadingIndicator.value = false;
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
    messagesAsPageRepsonse.value = await messagingProvider
        .getMessagesAsPageByRoomID(
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

  Future<Rx<ConversationModel>> getConversationStatusResponseProvider({
    bool? refresh = false,
  }) async {
    conversationStatusRepsonse.value = await messagingProvider
        .getConversationStatus();

    /// For Messaging Bags
    if (conversationStatusRepsonse.value.nbrNewConversation! > 0 ||
        conversationStatusRepsonse.value.nbrNewMsg! > 0) {
      homeController.isMessagingBag.value = true;
    } else {
      homeController.isMessagingBag.value = false;
    }
    homeController.messagingBagLabel.value = conversationStatusRepsonse
        .value
        .nbrNewMsg!
        .toString();
    // For Messaging Bags
    return conversationStatusRepsonse;
  }

  Future<void> onRefreshForRoomChat() async {
    // monitor network fetch
    await getRoomListDataState(refresh: true);
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
  }

  Future<void> addRoomToChatRooms() async {
    roomScrollController.addListener(() {
      if (roomScrollController.position.maxScrollExtent ==
              roomScrollController.position.pixels &&
          isLoadingIndicator.value == false &&
          roomsAsPageRepsonse.value.meta!.currentPage! <
              roomsAsPageRepsonse.value.meta!.lastPage!) {
        isLoadingIndicator.value = true;
        getRoomListResponseProvider();
      }
    });
  }

  Future<void> addMessagesToChat() async {
    messagingScrollController.addListener(() {
      if (messagingScrollController.position.maxScrollExtent ==
              messagingScrollController.position.pixels &&
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
    getRoomDetailsResponseProvider(roomId: roomValue.uuid, refresh: true);
    if (roomValue.unseenMessages! > 0) {
      makeRequestToPOSTSeenAllMessagesAPI(roomId: roomValue.uuid);
    }
    if (roomValue.newConversation! > 0) {
      makeRequestToPOSTSeenConversationAPI(roomId: roomValue.uuid);
    }
  }

  void onChangedTextCtrl(String? q) {
    if (sendingTextCtrl.text.trim().isNotEmpty) {
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
      await getRoomListResponseProvider(refresh: true);
      await getConversationStatusResponseProvider(refresh: true);
      update();
    }
  }

  Future<void> makeRequestToPOSTSeenConversationAPI({
    required String? roomId,
  }) async {
    final tempResp = await messagingProvider.postSeenConversationByRoomID(
      roomId: roomId,
    );
    if (tempResp.success!) {
      await getRoomListResponseProvider(refresh: true);
      await getConversationStatusResponseProvider(refresh: true);
      update();
    }
  }

  Future<void> makeRequestToPOSTMessagesAPI({
    required String? roomId,
    required String? message,
  }) async {
    final tempResp = await messagingProvider.postMessageByRoomID(
      roomId: roomId,
      message: message!.trim(),
    );
    if (tempResp.success!) {
      sendingTextCtrl.text = '';
      onChangedTextCtrl('');
      await getRoomListResponseProvider(refresh: true);
      if (tempResp.data != null) {
        final tempData = MessagingModel.fromJson(
          tempResp.data as Map<String, dynamic>,
        );
        roomMessagingDetailsRepsonse.insert(0, tempData);
        update();
      }
    }
  }
}
