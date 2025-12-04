import '../../data.dart';

class FakeMessagingProvider implements IMessagingProvider {
  @override
  Future<List<MessagingModel>> getMessagingRoomList({
    required int? pageNumber,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Return mock messaging room list response
    final paginationModel = await getMessagingRoomAsPage(
      pageNumber: pageNumber,
    );
    return paginationModel.data ?? [];
  }

  @override
  Future<MessagingPaginationModel> getMessagingRoomAsPage({
    required int? pageNumber,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Return mock messaging room pagination response
    return MessagingPaginationModel.fromJson({
      'data': [
        {
          'uuid': '99a16dc2-b726-11ec-8e0e-fa163ec78948',
          'name': 'Apple John&&Barbara Appleseed',
          'created_at': '2022-04-08T10:28:15.000000Z',
          'latest_message': null,
          'unseen_messages': 0,
          'participants': [
            {
              'user_uuid': '9bf63494-9869-11ec-bee7-fa163ec78948',
              'first_name': 'Barbara',
              'last_name': 'Appleseed',
              'account_type': 'professional',
              'picture_url':
                  '/uploads/images/logo/1/8afb600e-fcc7-4a35-b9cc-7e4e6b62ec44',
            },
          ],
        },
        {
          'uuid': '9ee52846-99d5-11ec-acb4-fa163ec78948',
          'name': 'John Appleseed&&Barbara Appleseed',
          'created_at': '2022-03-02T03:05:31.000000Z',
          'latest_message': {
            'uuid': '8f845168-a8fa-11ec-8c1d-fa163ec78948',
            'user_uuid': '9bd87404-9869-11ec-a2ec-fa163ec78948',
            'message': 'Test',
            'is_seen': 1,
            'is_owner': 1,
            'first_name': 'Apple',
            'last_name': 'John',
            'picture_url':
                '/uploads/images/profile_picture/1/07a79fd0-85e8-490f-9517-83e49d88ce86',
            'created_at': '2022-03-21T09:37:44.000000Z',
            'updated_at': '2022-03-24T16:12:25.000000Z',
          },
          'unseen_messages': 0,
          'participants': [
            {
              'user_uuid': '9bf63494-9869-11ec-bee7-fa163ec78948',
              'first_name': 'Barbara',
              'last_name': 'Appleseed',
              'account_type': 'professional',
              'picture_url':
                  '/uploads/images/logo/1/8afb600e-fcc7-4a35-b9cc-7e4e6b62ec44',
            },
          ],
        },
        {
          'uuid': '8258c418-a0e6-11ec-ac4f-fa163ec78948',
          'name': 'John Appleseed&&Hillard Kshlerin',
          'created_at': '2022-03-11T02:54:03.000000Z',
          'latest_message': null,
          'unseen_messages': 0,
          'participants': [
            {
              'user_uuid': 'ad22ca7a-9869-11ec-abe9-fa163ec78948',
              'first_name': 'Hillard',
              'last_name': 'Kshlerin',
              'account_type': 'professional',
              'picture_url': '',
            },
          ],
        },
      ],
      'links': {
        'first': 'http://api.dev-lamp-01.srv.pooulp.eu/rooms?page=1',
        'last': 'http://api.dev-lamp-01.srv.pooulp.eu/rooms?page=1',
        'prev': null,
        'next': null,
      },
      'meta': {
        'current_page': 1,
        'from': 1,
        'last_page': 1,
        'links': [
          {'url': null, 'label': 'pagination.previous', 'active': false},
          {
            'url': 'http://api.dev-lamp-01.srv.pooulp.eu/rooms?page=1',
            'label': '1',
            'active': true,
          },
          {'url': null, 'label': 'pagination.next', 'active': false},
        ],
        'path': 'http://api.dev-lamp-01.srv.pooulp.eu/rooms',
        'per_page': 20,
        'to': 3,
        'total': 3,
      },
    });
  }

  @override
  Future<List<MessagingModel>> getMessagesListByRoomID({
    required String? roomId,
    required int? pageNumber,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Return mock messages list response
    final paginationModel = await getMessagesAsPageByRoomID(
      roomId: roomId,
      pageNumber: pageNumber,
    );
    return paginationModel.data ?? [];
  }

  @override
  Future<MessagingPaginationModel> getMessagesAsPageByRoomID({
    required String? roomId,
    required int? pageNumber,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Return mock messages pagination response
    return MessagingPaginationModel.fromJson({
      'data': [
        {
          'uuid': '8f845168-a8fa-11ec-8c1d-fa163ec78948',
          'user_uuid': '9bd87404-9869-11ec-a2ec-fa163ec78948',
          'message': 'Test',
          'is_seen': 1,
          'is_owner': 1,
          'first_name': 'Apple',
          'last_name': 'John',
          'picture_url':
              '/uploads/images/profile_picture/1/07a79fd0-85e8-490f-9517-83e49d88ce86',
          'created_at': '2022-03-21T09:37:44.000000Z',
          'updated_at': '2022-03-24T16:12:25.000000Z',
        },
        {
          'uuid': 'd3fecff4-a8f4-11ec-b155-fa163ec78948',
          'user_uuid': '9bf63494-9869-11ec-bee7-fa163ec78948',
          'message':
              "Hello John,\nWe were delighted by your presentation and your enthusiasm. We wish to work with you and would be glad to welcome you in our team.\nIf you're still interested to join us, please send me an email at barbara.appleseed@example.com with the dates of your internship and your internship agreement.\nHope to hear from you soon\nRegards",
          'is_seen': 1,
          'is_owner': 0,
          'first_name': 'Barbara',
          'last_name': 'Appleseed',
          'picture_url':
              '/uploads/images/logo/1/8afb600e-fcc7-4a35-b9cc-7e4e6b62ec44',
          'created_at': '2022-03-21T08:56:42.000000Z',
          'updated_at': '2022-03-21T08:57:07.000000Z',
        },
        {
          'uuid': '81eaf320-a4fb-11ec-84e5-fa163ec78948',
          'user_uuid': '9bf63494-9869-11ec-bee7-fa163ec78948',
          'message': 'Thank you. See you tomorrow',
          'is_seen': 1,
          'is_owner': 0,
          'first_name': 'Barbara',
          'last_name': 'Appleseed',
          'picture_url':
              '/uploads/images/logo/1/8afb600e-fcc7-4a35-b9cc-7e4e6b62ec44',
          'created_at': '2022-03-16T07:34:26.000000Z',
          'updated_at': '2022-03-21T08:56:27.000000Z',
        },
        {
          'uuid': 'd91fec94-a43e-11ec-bad1-fa163ec78948',
          'user_uuid': '9bd87404-9869-11ec-a2ec-fa163ec78948',
          'message': '+32 XXX XXX XXX',
          'is_seen': 1,
          'is_owner': 1,
          'first_name': 'Apple',
          'last_name': 'John',
          'picture_url':
              '/uploads/images/profile_picture/1/07a79fd0-85e8-490f-9517-83e49d88ce86',
          'created_at': '2022-03-15T09:03:57.000000Z',
          'updated_at': '2022-03-15T09:04:11.000000Z',
        },
        {
          'uuid': 'd7536684-a43e-11ec-aa97-fa163ec78948',
          'user_uuid': '9bd87404-9869-11ec-a2ec-fa163ec78948',
          'message': 'Sure. Here is my contact number if there is any change',
          'is_seen': 1,
          'is_owner': 1,
          'first_name': 'Apple',
          'last_name': 'John',
          'picture_url':
              '/uploads/images/profile_picture/1/07a79fd0-85e8-490f-9517-83e49d88ce86',
          'created_at': '2022-03-15T09:03:54.000000Z',
          'updated_at': '2022-03-15T09:04:11.000000Z',
        },
        {
          'uuid': 'bf4549ae-a42f-11ec-924b-fa163ec78948',
          'user_uuid': '9bf63494-9869-11ec-bee7-fa163ec78948',
          'message':
              "You're welcome. Your profile matchs our criterias for our internship as a Digital Designer. Would you be available for an interview tomorrow 10am at our main office?",
          'is_seen': 1,
          'is_owner': 0,
          'first_name': 'Barbara',
          'last_name': 'Appleseed',
          'picture_url':
              '/uploads/images/logo/1/8afb600e-fcc7-4a35-b9cc-7e4e6b62ec44',
          'created_at': '2022-03-15T07:15:52.000000Z',
          'updated_at': '2022-03-15T07:15:58.000000Z',
        },
        {
          'uuid': 'b755b788-a42f-11ec-8fed-fa163ec78948',
          'user_uuid': '9bd87404-9869-11ec-a2ec-fa163ec78948',
          'message': 'Thank you for accepting my application',
          'is_seen': 1,
          'is_owner': 1,
          'first_name': 'Apple',
          'last_name': 'John',
          'picture_url':
              '/uploads/images/profile_picture/1/07a79fd0-85e8-490f-9517-83e49d88ce86',
          'created_at': '2022-03-15T07:15:38.000000Z',
          'updated_at': '2022-03-15T07:15:43.000000Z',
        },
        {
          'uuid': 'e28aa1dc-a10c-11ec-b7a6-fa163ec78948',
          'user_uuid': '9bd87404-9869-11ec-a2ec-fa163ec78948',
          'message': 'Hello Barbara',
          'is_seen': 1,
          'is_owner': 1,
          'first_name': 'Apple',
          'last_name': 'John',
          'picture_url':
              '/uploads/images/profile_picture/1/07a79fd0-85e8-490f-9517-83e49d88ce86',
          'created_at': '2022-03-11T07:28:45.000000Z',
          'updated_at': '2022-03-15T06:59:17.000000Z',
        },
        {
          'uuid': '412d713c-9b91-11ec-8450-fa163ec78948',
          'user_uuid': '9bf63494-9869-11ec-bee7-fa163ec78948',
          'message': 'Hello John',
          'is_seen': 1,
          'is_owner': 0,
          'first_name': 'Barbara',
          'last_name': 'Appleseed',
          'picture_url':
              '/uploads/images/logo/1/8afb600e-fcc7-4a35-b9cc-7e4e6b62ec44',
          'created_at': '2022-03-04T08:01:10.000000Z',
          'updated_at': '2022-03-15T07:09:45.000000Z',
        },
      ],
      'links': {
        'first':
            'http://api.dev-lamp-01.srv.pooulp.eu/rooms/9ee52846-99d5-11ec-acb4-fa163ec78948/messages?page=1',
        'last':
            'http://api.dev-lamp-01.srv.pooulp.eu/rooms/9ee52846-99d5-11ec-acb4-fa163ec78948/messages?page=1',
        'prev': null,
        'next': null,
      },
      'meta': {
        'current_page': 1,
        'from': 1,
        'last_page': 1,
        'links': [
          {'url': null, 'label': 'pagination.previous', 'active': false},
          {
            'url':
                'http://api.dev-lamp-01.srv.pooulp.eu/rooms/9ee52846-99d5-11ec-acb4-fa163ec78948/messages?page=1',
            'label': '1',
            'active': true,
          },
          {'url': null, 'label': 'pagination.next', 'active': false},
        ],
        'path':
            'http://api.dev-lamp-01.srv.pooulp.eu/rooms/9ee52846-99d5-11ec-acb4-fa163ec78948/messages',
        'per_page': 30,
        'to': 9,
        'total': 9,
      },
    });
  }

  @override
  Future<JsonResponse> postMessageByRoomID({
    required String? roomId,
    required String? message,
  }) async {
    return const JsonResponse();
  }

  @override
  Future<JsonResponse> postSeenAllMessagesByRoomID({
    required String? roomId,
  }) async {
    return const JsonResponse();
  }

  @override
  Future<ConversationModel> getConversationStatus() async {
    return ConversationModel();
  }

  @override
  Future<JsonResponse> postSeenConversationByRoomID({required String? roomId}) {
    // TODO: implement postSeenConversationByRoomID
    throw UnimplementedError();
  }
}
