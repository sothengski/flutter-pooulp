import 'dart:async';

import '../../data.dart';

/// Fake OnboardingProvider that mimics the real OnboardingProvider interface
/// without requiring a backend connection.
///
/// Best practices:
/// 1. Match the exact method signatures from the real provider
/// 2. Use Future.delayed to simulate network latency
/// 3. Return properly structured mock data using model classes
/// 4. Handle error cases appropriately
/// 5. Make it easy to switch between real and fake providers
class FakeOnboardingProvider implements IOnboardingProvider {
  // Simulated network delay (adjust as needed)
  static const Duration _networkDelay = Duration(milliseconds: 500);

  /// Fake getOnboardingDataList API that returns mock onboarding data
  /// Matches: OnboardingProvider.getOnboardingDataList()
  @override
  Future<OnboardingModel> getOnboardingDataList() async {
    // Simulate network delay
    await Future.delayed(_networkDelay);

    // Return mock onboarding data with pages
    return OnboardingModel.fromJson({
      'total_page': 12,
      'pages': [
        {
          'page': 0,
          'title': 'Welcome',
          'subtitle': "Welcome to Pooulp! Let's get started.",
          'is_skippable': false,
          'selection_items': [],
          'all_skills': [],
          'internship_items': [],
          'internship_period_items': [],
        },
        {
          'page': 1,
          'title': 'What are you looking for?',
          'subtitle': "Select the type of opportunities you're interested in.",
          'is_skippable': true,
          'selection_items': [
            {
              'id': 1,
              'type': 'joboffer',
              'label': 'Internship',
              'category_id': 23,
              'category': 'Job offer types',
            },
            {
              'id': 2,
              'type': 'joboffer',
              'label': 'Student Job',
              'category_id': 23,
              'category': 'Job offer types',
            },
            {
              'id': 3,
              'type': 'joboffer',
              'label': 'Full-time Job',
              'category_id': 23,
              'category': 'Job offer types',
            },
          ],
          'all_skills': [],
          'internship_items': [],
          'internship_period_items': [],
        },
        {
          'page': 2,
          'title': 'Internship Type',
          'subtitle': 'What type of internship are you looking for?',
          'is_skippable': true,
          'selection_items': [],
          'all_skills': [],
          'internship_items': [
            {
              'id': 1,
              'type': 'internship_type',
              'label': 'Paid Internship',
              'category_id': 24,
              'category': 'Internship Types',
            },
            {
              'id': 2,
              'type': 'internship_type',
              'label': 'Unpaid Internship',
              'category_id': 24,
              'category': 'Internship Types',
            },
          ],
          'internship_period_items': [],
        },
        {
          'page': 3,
          'title': 'Fields of Interest',
          'subtitle': "Select fields you're interested in.",
          'is_skippable': true,
          'selection_items': [
            {
              'id': 104,
              'type': 'field',
              'label': 'Finance',
              'category_id': 16,
              'category': 'Business',
            },
            {
              'id': 109,
              'type': 'field',
              'label': 'Communication',
              'category_id': 16,
              'category': 'Business',
            },
            {
              'id': 215,
              'type': 'field',
              'label': 'Art',
              'category_id': 17,
              'category': 'Arts',
            },
          ],
          'all_skills': [],
          'internship_items': [],
          'internship_period_items': [],
        },
        {
          'page': 4,
          'title': 'Location',
          'subtitle': 'Where would you like to work?',
          'is_skippable': true,
          'selection_items': [],
          'all_skills': [],
          'internship_items': [],
          'internship_period_items': [],
        },
        {
          'page': 5,
          'title': 'Student Job Interests',
          'subtitle': 'What interests you in student jobs?',
          'is_skippable': true,
          'selection_items': [],
          'all_skills': [],
          'internship_items': [],
          'internship_period_items': [],
        },
        {
          'page': 6,
          'title': 'Student Job Location',
          'subtitle': 'Where would you like to work?',
          'is_skippable': true,
          'selection_items': [],
          'all_skills': [],
          'internship_items': [],
          'internship_period_items': [],
        },
        {
          'page': 7,
          'title': 'Skills',
          'subtitle': 'What are you good at?',
          'is_skippable': true,
          'selection_items': [],
          'all_skills': [
            {
              'id': 163,
              'tag_id': 163,
              'label': 'Logical reasoning',
              'category_id': 2,
              'category': 'Soft skills',
              'type': 'soft skill',
              'level': null,
            },
            {
              'id': 100,
              'tag_id': 100,
              'label': 'Prototyping',
              'category_id': 12,
              'category': 'Technical',
              'type': 'hard skill',
              'level': 3,
            },
            {
              'id': 93,
              'tag_id': 93,
              'label': 'AutoCAD',
              'category_id': 9,
              'category': 'Design/Graphism',
              'type': 'hard skill',
              'level': 1,
            },
          ],
          'internship_items': [],
          'internship_period_items': [],
        },
        {
          'page': 8,
          'title': 'Education',
          'subtitle': 'Tell us about your education.',
          'is_skippable': true,
          'selection_items': [],
          'all_skills': [],
          'internship_items': [],
          'internship_period_items': [],
        },
        {
          'page': 9,
          'title': 'Languages',
          'subtitle': 'What languages do you speak?',
          'is_skippable': true,
          'selection_items': [
            {'id': 1, 'tag_id': 1, 'label': 'English', 'level': 1},
            {'id': 2, 'tag_id': 2, 'label': 'French', 'level': 1},
            {'id': 3, 'tag_id': 3, 'label': 'Dutch', 'level': 1},
          ],
          'all_skills': [],
          'internship_items': [],
          'internship_period_items': [],
        },
        {
          'page': 10,
          'title': 'How did you hear about us?',
          'subtitle': 'Help us understand how you found Pooulp.',
          'is_skippable': true,
          'selection_items': [
            {
              'id': 1,
              'type': 'source',
              'label': 'Social Media',
              'category_id': 25,
              'category': 'Sources',
            },
            {
              'id': 2,
              'type': 'source',
              'label': 'Friend/Colleague',
              'category_id': 25,
              'category': 'Sources',
            },
            {
              'id': 3,
              'type': 'source',
              'label': 'School/University',
              'category_id': 25,
              'category': 'Sources',
            },
          ],
          'all_skills': [],
          'internship_items': [],
          'internship_period_items': [],
        },
        {
          'page': 11,
          'title': 'Thank You!',
          'subtitle': "You're all set! Start exploring opportunities.",
          'is_skippable': false,
          'selection_items': [],
          'all_skills': [],
          'internship_items': [],
          'internship_period_items': [],
        },
      ],
    });
  }

  /// Fake postOnboarding API that simulates submitting onboarding data
  /// Matches: OnboardingProvider.postOnboarding()
  @override
  Future<JsonResponse> postOnboarding({
    required OnboardingModel? onboardingData,
  }) async {
    // Simulate network delay
    await Future.delayed(_networkDelay);

    // Validate input
    if (onboardingData == null) {
      return const JsonResponse(
        status: 400,
        message: 'Onboarding data is required',
        data: {'error': 'Onboarding data is required'},
      );
    }

    // Simulate successful onboarding submission
    return const JsonResponse(
      success: true,
      status: 200,
      message: 'Onboarding data saved successfully',
      data: {
        'message': 'Onboarding data saved successfully',
        'status': 'completed',
      },
    );
  }
}
