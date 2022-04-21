import 'dart:convert';

import '../data.dart';

abstract class IMessagingProvider {
  ///===== Top of Messaging Section =====//
  Future<List<MessagingModel>> getMessagingRoomList({
    required int? pageNumber,
  });
  Future<List<MessagingModel>> getMessagesListByRoomID({
    required String? roomId,
    required int? pageNumber,
  });
  Future<MessagingPaginationModel> getMessagesAsPageByRoomID({
    required String? roomId,
    required int? pageNumber,
  });
  Future<JsonResponse> postMessageByRoomID({
    required String? roomId,
    required String? message,
  });
  Future<JsonResponse> postSeenAllMessagesByRoomID({
    required String? roomId,
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
  Future<List<MessagingModel>> getMessagesListByRoomID({
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

  @override
  Future<MessagingPaginationModel> getMessagesAsPageByRoomID({
    required String? roomId,
    required int? pageNumber,
  }) async {
    try {
      final dataResponse = await get(
        API.getMessagesByRoomID(roomId: roomId, pageNumber: pageNumber),
      );
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final apiResponse = json.decode(dataResponse.bodyString.toString());
        return MessagingPaginationModel.fromJson(
          apiResponse as Map<String, dynamic>,
        );
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  /// POST Method for sending the message data by Room ID
  @override
  Future<JsonResponse> postMessageByRoomID({
    required String? roomId,
    required String? message,
  }) async {
    try {
      final dataResponse = await post(
        API.postMessageByRoomID(roomId: roomId),
        {'subject': "", 'message': message!},
      );
      //   debugPrint(
      //     '''
      //     API: ${API.postMessageByRoomID(roomId: roomId)}
      //     {'subject': '', 'message': $message!}
      //     response::${dataResponse.bodyString}
      //     ''',
      //   );
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final JsonResponse response = JsonResponse(
          success: dataResponse.status.isOk,
          status: dataResponse.statusCode,
          message: dataResponse.statusText,
          data: dataResponse.body,
        );
        return response;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  /// POST Method for seen all the messages data by Room ID
  @override
  Future<JsonResponse> postSeenAllMessagesByRoomID({
    required String? roomId,
  }) async {
    try {
      final dataResponse = await post(
        "${API.postMessageByRoomID(roomId: roomId)}/seen",
        {},
      );
      // debugPrint(
      //   'API: ${API.postMessageByRoomID(roomId: roomId)}/seen}\nresponse::$dataResponse',
      // );
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        final JsonResponse response = JsonResponse(
          success: dataResponse.status.isOk,
          status: dataResponse.statusCode,
          message: dataResponse.statusText,
          data: dataResponse.body,
        );
        return response;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
