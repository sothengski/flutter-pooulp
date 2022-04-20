import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/data.dart';

class MessagingController extends GetxController
    with StateMixin<RxList<MessagingModel>> {
  final messagingProvider = Get.find<MessagingProvider>();

  RxList<MessagingModel> roomListRepsonse = <MessagingModel>[].obs;
  int pageNumForRoomList = 1;

  Rx<MessagingModel> selectedRoom = MessagingModel().obs;

  final ScrollController listScrollController = ScrollController();
  RxList<MessagingModel> roomMessagingDetailsRepsonse = <MessagingModel>[].obs;
  int pageNumForMessages = 1;
  RxBool isMessageLoading = true.obs;
  RxBool enableSendingBtn = false.obs;
  TextEditingController sendingTextCtrl = TextEditingController(text: '');

  @override
  void onInit() {
    getRoomListDataState(refresh: true);
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
    isMessageLoading.value = true;
    roomMessagingDetailsRepsonse.clear();
    roomMessagingDetailsRepsonse.value =
        await messagingProvider.getMessagesByRoomID(
      roomId: roomId,
      pageNumber: 1,
    );
    isMessageLoading.value = false;
    return roomMessagingDetailsRepsonse;
  }

  Future<void> onRefresh() async {
    // monitor network fetch
    await getRoomListDataState(refresh: true);
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
  }

  void roomOnClick({MessagingModel? roomValue}) {
    selectedRoom.value = MessagingModel();
    selectedRoom.value = roomValue!;
    getRoomDetailsResponseProvider(
      roomId: roomValue.uuid,
    );
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

  void onSendMessage({
    String? message,
  }) {
    // print('click on send:: $message');
  }
}
