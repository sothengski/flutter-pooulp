import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/data.dart';

class MessagingController extends GetxController
    with StateMixin<RxList<MessagingModel>> {
  final messagingProvider = Get.find<MessagingProvider>();

  RxList<MessagingModel> roomListRepsonse = <MessagingModel>[].obs;
  int pageNumForRoomList = 1;

  RxList<MessagingModel> roomMessagingDetailsRepsonse = <MessagingModel>[].obs;
  int pageNumForMessages = 1;

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
    debugPrint(
      'roomListRepsonse:: ${roomListRepsonse.length}',
    );
    return roomListRepsonse;
  }
}
