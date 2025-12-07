import 'dart:async';

import '../../data.dart';

/// Fake NotificationMessagesProvider that mimics the real NotificationMessagesProvider interface
/// without requiring a backend connection.
///
/// Best practices:
/// 1. Match the exact method signatures from the real provider
/// 2. Use Future.delayed to simulate network latency
/// 3. Return properly structured mock data using model classes
/// 4. Handle error cases appropriately
/// 5. Make it easy to switch between real and fake providers
class FakeNotificationMessagesProvider
    implements INotificationMessagesProvider {
  // Simulated network delay (adjust as needed)
  static const Duration _networkDelay = Duration(milliseconds: 500);

  /// Fake getNotificationMessages API that returns mock notification messages
  /// Matches: NotificationMessagesProvider.getNotificationMessages()
  @override
  Future<List<NotificationMessageModel>> getNotificationMessages() async {
    // Simulate network delay
    await Future.delayed(_networkDelay);

    // Return mock notification messages
    return [
      NotificationMessageModel.fromJson({
        'id': 1,
        'title': 'New Job Offer Available',
        'body':
            'A new job offer matching your profile has been posted. Check it out!',
        'type': 1,
        'status': 0,
        'status_name': 'unread',
        'target': 1,
        'start_date': DateTime.now()
            .subtract(const Duration(days: 1))
            .toIso8601String(),
        'end_date': DateTime.now()
            .add(const Duration(days: 30))
            .toIso8601String(),
      }),
      NotificationMessageModel.fromJson({
        'id': 2,
        'title': 'Application Status Update',
        'body':
            'Your application for "Software Engineer Intern" has been reviewed.',
        'type': 2,
        'status': 0,
        'status_name': 'unread',
        'target': 1,
        'start_date': DateTime.now()
            .subtract(const Duration(hours: 5))
            .toIso8601String(),
        'end_date': DateTime.now()
            .add(const Duration(days: 7))
            .toIso8601String(),
      }),
      NotificationMessageModel.fromJson({
        'id': 3,
        'title': 'New Message Received',
        'body': 'You have received a new message from Barbara Appleseed.',
        'type': 3,
        'status': 1,
        'status_name': 'read',
        'target': 1,
        'start_date': DateTime.now()
            .subtract(const Duration(hours: 12))
            .toIso8601String(),
        'end_date': DateTime.now()
            .add(const Duration(days: 14))
            .toIso8601String(),
      }),
      NotificationMessageModel.fromJson({
        'id': 4,
        'title': 'Profile Completion Reminder',
        'body':
            'Complete your profile to increase your chances of getting matched with job offers.',
        'type': 4,
        'status': 0,
        'status_name': 'unread',
        'target': 1,
        'start_date': DateTime.now()
            .subtract(const Duration(days: 2))
            .toIso8601String(),
        'end_date': DateTime.now()
            .add(const Duration(days: 60))
            .toIso8601String(),
      }),
      NotificationMessageModel.fromJson({
        'id': 5,
        'title': 'Interview Scheduled',
        'body':
            'Your interview for "Digital Designer" position has been scheduled for tomorrow at 10:00 AM.',
        'type': 2,
        'status': 1,
        'status_name': 'read',
        'target': 1,
        'start_date': DateTime.now()
            .subtract(const Duration(days: 3))
            .toIso8601String(),
        'end_date': DateTime.now()
            .add(const Duration(days: 1))
            .toIso8601String(),
      }),
    ];
  }

  /// Fake postSeenNotificationMessage API that simulates marking a notification as seen
  /// Matches: NotificationMessagesProvider.postSeenNotificationMessage()
  @override
  Future<JsonResponse> postSeenNotificationMessage({
    int? notificationMsgID,
  }) async {
    // Simulate network delay
    await Future.delayed(_networkDelay);

    // Validate notification ID (optional)
    if (notificationMsgID == null) {
      return const JsonResponse(
        status: 400,
        message: 'Notification message ID is required',
        data: {'error': 'Notification message ID is required'},
      );
    }

    // Simulate successful seen status update
    return const JsonResponse(
      success: true,
      status: 200,
      message: 'Notification marked as seen',
      data: {'message': 'Notification marked as seen successfully'},
    );
  }
}
