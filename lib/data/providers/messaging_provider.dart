import 'dart:convert';

import '../data.dart';

abstract class IMessagingProvider {
  ///===== Top of Messaging Section =====//
  Future<List<MessagingModel>> getMessagingRoomList({
    required int? pageNumber,
  });
  Future<List<MessagingModel>> getMessagesByRoomID({
    required String? roomId,
    required int? pageNumber,
  });
  //===== Bottom of Messaging Section =====//
}

class MessagingProvider extends BaseProvider implements IMessagingProvider {
  ///===== Top of Messaging Section =====//
  ///
  /// GET Method for getting the Messaging Room List data Information from Server
  @override
  Future<List<MessagingModel>> getMessagingRoomList({
    required int? pageNumber,
  }) async {
    try {
      final dataResponse = await get(
        API.getMessagingRoomList(pageNumber: pageNumber),
      );
      final List<MessagingModel> roomList = <MessagingModel>[];
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final apiResponse = json.decode(dataResponse.bodyString.toString());
        final MessagingPaginationModel roomListPagination =
            MessagingPaginationModel.fromJson(
          apiResponse as Map<String, dynamic>,
        );
        for (final e in roomListPagination.data!) {
          roomList.add(e);
        }
        return roomList;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  /// GET Method for getting the messages data list Information by Room ID
  @override
  Future<List<MessagingModel>> getMessagesByRoomID({
    required String? roomId,
    required int? pageNumber,
  }) async {
    try {
      final dataResponse = await get(
        API.getMessagesByRoomID(roomId: roomId, pageNumber: pageNumber),
      );
      final List<MessagingModel> messagesList = <MessagingModel>[];
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final apiResponse = json.decode(dataResponse.bodyString.toString());
        final MessagingPaginationModel offerPagination =
            MessagingPaginationModel.fromJson(
          apiResponse as Map<String, dynamic>,
        );
        for (final e in offerPagination.data!) {
          messagesList.add(e);
        }
        return messagesList;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
