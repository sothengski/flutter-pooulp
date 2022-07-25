import '../data.dart';

abstract class INotificationMessagesProvider {
  Future<List<NotificationMessageModel>> getNotificationMessages();
}

class NotificationMessagesProvider extends BaseProvider
    implements INotificationMessagesProvider {
  @override
  Future<List<NotificationMessageModel>> getNotificationMessages() async {
    try {
      final dataResponse = await get(
        API.paths[Endpoint.getNotificationMessages].toString(),
      );
      if (dataResponse.hasError) {
        throw "(resp: ${dataResponse.bodyString})";
      } else {
        // final apiResponse = json.decode(dataResponse.bodyString.toString());
        final JsonResponse apiResponse = JsonResponse(
          success: dataResponse.status.isOk,
          status: dataResponse.statusCode,
          message: dataResponse.statusText,
          data: dataResponse.body,
        );
        return ((apiResponse.data as Map<String, dynamic>)['data'] as List)
            .map(
              (e) =>
                  NotificationMessageModel.fromJson(e as Map<String, dynamic>),
            )
            .toList();
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
