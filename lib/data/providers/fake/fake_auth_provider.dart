import 'dart:async';

import '../../data.dart';

/// Fake AuthProvider that mimics the real AuthProvider interface
/// without requiring a backend connection.
///
/// Best practices:
/// 1. Match the exact method signatures from the real provider
/// 2. Use Future.delayed to simulate network latency
/// 3. Return properly structured mock data using model classes
/// 4. Handle error cases appropriately
/// 5. Make it easy to switch between real and fake providers
class FakeAuthProvider {
  // Simulated network delay (adjust as needed)
  static const Duration _networkDelay = Duration(milliseconds: 500);

  /// Fake login API that returns mock data for local testing
  /// Matches: AuthProvider.logInAPI()
  Future<LoginModel> logInAPI({required ProfileModel? loginData}) async {
    // Simulate network delay
    await Future.delayed(_networkDelay);

    // Optional: Validate credentials (remove validation to always succeed)
    if (loginData?.email == 'test@example.com' &&
        loginData?.password == 'password123') {
      // Return mock successful login response
      return LoginModel.fromJson({
        'token':
            'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9hcGkuZGV2LWxhbXAtMDEuc3J2LnBvb3VscC5ldVwvbG9naW4iLCJpYXQiOjE2MzkwMzA3NDQsImV4cCI6MTYzOTExNzE0NCwibmJmIjoxNjM5MDMwNzQ0LCJqdGkiOiJhTDZxcVFvQXFva3R3MmFGIiwic3ViIjoxLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.eQlxq-xcBssX02jB8OaP3hquQn_TuA-Nw5iXtFRIDZ4',
        'token_type': 'bearer',
        'expires_in': 86400,
        'account_type': 'student',
        'token_expiration_date': DateTime.now()
            .add(const Duration(days: 100))
            .toIso8601String(),
      });
    } else {
      // Return error for invalid credentials (matches real API behavior)
      return Future.error('Invalid email or password');
    }
  }

  /// Fake logout API
  /// Matches: AuthProvider.logOutAPI()
  Future<JsonResponse> logOutAPI({required String? token}) async {
    await Future.delayed(_networkDelay);

    // Simulate successful logout
    return const JsonResponse(
      success: true,
      status: 200,
      message: 'Logged out successfully',
      data: {'message': 'Logged out successfully'},
    );
  }

  /// Fake register new user API
  /// Matches: AuthProvider.registerNewUserAPI()
  Future<LoginModel> registerNewUserAPI({
    required ProfileModel? registrationData,
  }) async {
    await Future.delayed(_networkDelay);

    // Validate required fields (optional)
    if (registrationData?.email == null ||
        (registrationData?.email?.isEmpty ?? true)) {
      return Future.error('Email is required');
    }

    // Return mock successful registration response
    return LoginModel.fromJson({
      'token':
          'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9hcGkuZGV2LWxhbXAtMDEuc3J2LnBvb3VscC5ldVwvcmVnaXN0ZXIiLCJpYXQiOjE2Mzk0NjgwNzcsImV4cCI6MTYzOTU1NDQ3NywibmJmIjoxNjM5NDY4MDc3LCJqdGkiOiJ2elBmeEFQVTF2OHRSaThPIiwic3ViIjoxMSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.YFxmdILgFcxtA-xKbVZFd-fW79kjOdAKjES9qAkP7N4',
      'token_type': 'bearer',
      'expires_in': 86400,
      'account_type': 'student',
      'token_expiration_date': DateTime.now()
          .add(const Duration(days: 100))
          .toIso8601String(),
    });
  }

  /// Fake change password API
  /// Matches: AuthProvider.putChangePassword()
  Future<JsonResponse> putChangePassword({
    required String? currentPassword,
    required String? newPassword,
    required String? newPasswordConfirmation,
  }) async {
    await Future.delayed(_networkDelay);

    // Optional: Validate passwords match
    if (newPassword != newPasswordConfirmation) {
      return const JsonResponse(
        status: 400,
        message: 'New passwords do not match',
        data: {'error': 'New passwords do not match'},
      );
    }

    // Simulate successful password change
    return const JsonResponse(
      success: true,
      status: 200,
      message: 'Password changed successfully',
      data: {'message': 'Password changed successfully'},
    );
  }

  /// Fake forgot password API
  /// Matches: AuthProvider.postForgotPassword()
  Future<JsonResponse> postForgotPassword({required String? email}) async {
    await Future.delayed(_networkDelay);

    // Optional: Validate email format
    if (email == null || !email.contains('@')) {
      return const JsonResponse(
        status: 400,
        message: 'Invalid email address',
        data: {'error': 'Invalid email address'},
      );
    }

    // Simulate successful password reset email sent
    return const JsonResponse(
      success: true,
      status: 200,
      message: 'Password reset email sent',
      data: {'message': 'Password reset email sent successfully'},
    );
  }

  /// Fake delete user account API
  /// Matches: AuthProvider.deleteUserAccount()
  Future<JsonResponse> deleteUserAccount() async {
    await Future.delayed(_networkDelay);

    // Simulate successful account deletion
    return const JsonResponse(
      success: true,
      status: 200,
      message: 'Account deleted successfully',
      data: {'message': 'Account deleted successfully'},
    );
  }

  /// Fake verify email API
  /// Matches: AuthProvider.verifyEmail()
  Future<JsonResponse> verifyEmail({required String? email}) async {
    await Future.delayed(_networkDelay);

    // Optional: Validate email format
    if (email == null || !email.contains('@')) {
      return const JsonResponse(
        status: 400,
        message: 'Invalid email address',
        data: {'error': 'Invalid email address'},
      );
    }

    // Simulate successful verification email sent
    return const JsonResponse(
      success: true,
      status: 200,
      message: 'Verification email sent',
      data: {'message': 'Verification email sent successfully'},
    );
  }

  /// Fake refresh token API
  /// Matches: AuthProvider.refreshTokenAPI()
  Future<LoginModel> refreshTokenAPI() async {
    await Future.delayed(_networkDelay);

    // Return new token with extended expiration
    return LoginModel.fromJson({
      'token':
          'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9hcGkuZGV2LWxhbXAtMDEuc3J2LnBvb3VscC5ldVwvcmVmcmVzaCIsImlhdCI6MTYzOTAzMDc0NCwiZXhwIjoxNjM5MTE3MTQ0LCJuYmYiOjE2MzkwMzA3NDQsImp0aSI6ImFMNnFxUW9BcW9rdHcyYUYiLCJzdWIiOjEsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.new_refresh_token_here',
      'token_type': 'bearer',
      'expires_in': 86400,
      'account_type': 'student',
      'token_expiration_date': DateTime.now()
          .add(const Duration(days: 1))
          .toIso8601String(),
    });
  }
}

/// Fake UserInfoProvider that mimics the real UserInfoProvider interface
/// without requiring a backend connection.
///
/// Best practices:
/// 1. Match the exact method signatures from the real provider
/// 2. Use Future.delayed to simulate network latency
/// 3. Return properly structured mock data using model classes
/// 4. Handle error cases appropriately
/// 5. Make it easy to switch between real and fake providers
class FakeUserInfoProvider implements IUserInfoProvider {
  // Simulated network delay (adjust as needed)
  static const Duration _networkDelay = Duration(milliseconds: 500);

  /// Fake getUserInfo API that returns mock user info
  /// Matches: UserInfoProvider.getUserInfo()
  @override
  Future<UserModel> getUserInfo() async {
    // Simulate network delay
    await Future.delayed(_networkDelay);

    // Return mock user info response
    return UserModel.fromJson({
      'id': 2,
      'uuid': '',
      'email': 'barbara.appleseed@example.com',
      'is_activated': true,
      'profile': {
        'account_type': 'professional',
        'first_name': 'Barbara',
        'last_name': 'Appleseed',
        'description': null,
        'phone1_country_code': '+33',
        'phone1': '07 87 98 07 79',
        'phone2_country_code': null,
        'phone2': null,
        'birthdate': null,
        'address_street': null,
        'address_city': null,
        'address_zip': null,
        'address_country': null,
        'address_latitude': null,
        'address_longitude': null,
        'picture_url': null,
        'ui_language': 'en',
        'settings_notifications_email': true,
      },
      'enterprise': {
        'id': 1,
        'name': 'Orange France',
        'enterprise_id': '380 129 866 46850',
        'description': null,
        'address_street': "6 place d'Alleray",
        'address_city': 'Paris',
        'address_zip': '75015',
        'address_country': 'France',
        'address_latitude': '',
        'address_longitude': null,
        'subsidiary_of': null,
        'school_id': null,
        'logo_urn': 'c89865c0-2de2-419d-bbe0-e99e20b64dc1',
        'created_at': '2021-10-14T13:35:38.000000Z',
        'updated_at': '2022-01-04T03:24:38.000000Z',
        'facebook_link': '',
        'linkedin_link': '',
        'whatsapp_link': '',
        'statecode': 1,
        'uuid': '',
      },
    });
  }

  /// Fake getStudentProfileInfo API that returns mock student profile info
  /// Matches: UserInfoProvider.getStudentProfileInfo()
  @override
  Future<StudentProfileModel> getStudentProfileInfo() async {
    // Simulate network delay
    await Future.delayed(_networkDelay);

    // Return mock student profile info response
    return StudentProfileModel.fromJson({
      'telecommuting': true,
      'shifting': true,
      'radius': 19,
      'driving_license': true,
      'has_automobile': true,
      'facebook_link': 'facebook.com',
      'linkedin_link': 'linkedin.com',
      'whatsapp_link': 'whatsapp.com',
      'youtube_link': 'https://www.youtube.com/watch?v=_fP43gcBywU',
      'gender': 'male',
      'skills': [
        {
          'id': 15,
          'tag_id': 110,
          'label': 'Persuasion',
          'category_id': 2,
          'category': 'Soft skills',
          'type': 'soft skill',
          'level': null,
        },
        {
          'id': 16,
          'tag_id': 111,
          'label': 'Responsability',
          'category_id': 2,
          'category': 'Soft skills',
          'type': 'soft skill',
          'level': null,
        },
        {
          'id': 17,
          'tag_id': 112,
          'label': 'Confidence',
          'category_id': 2,
          'category': 'Soft skills',
          'type': 'soft skill',
          'level': null,
        },
        {
          'id': 18,
          'tag_id': 115,
          'label': 'Feedback',
          'category_id': 2,
          'category': 'Soft skills',
          'type': 'soft skill',
          'level': null,
        },
        {
          'id': 19,
          'tag_id': 28,
          'label': 'Joomla',
          'category_id': 4,
          'category': 'Programming',
          'type': 'hard skill',
          'level': 1,
        },
        {
          'id': 20,
          'tag_id': 126,
          'label': 'Relationship management',
          'category_id': 2,
          'category': 'Soft skills',
          'type': 'soft skill',
          'level': null,
        },
        {
          'id': 21,
          'tag_id': 185,
          'label': 'Sensitivity',
          'category_id': 2,
          'category': 'Soft skills',
          'type': 'soft skill',
          'level': null,
        },
        {
          'id': 22,
          'tag_id': 113,
          'label': 'Resilience',
          'category_id': 2,
          'category': 'Soft skills',
          'type': 'soft skill',
          'level': null,
        },
        {
          'id': 24,
          'tag_id': 100,
          'label': 'Prototyping',
          'category_id': 12,
          'category': 'Technical',
          'type': 'hard skill',
          'level': 3,
        },
        {
          'id': 25,
          'tag_id': 93,
          'label': 'AutoCAD',
          'category_id': 9,
          'category': 'Design/Graphism',
          'type': 'hard skill',
          'level': 1,
        },
        {
          'id': 27,
          'tag_id': 131,
          'label': 'Trustworthy',
          'category_id': 2,
          'category': 'Soft skills',
          'type': 'soft skill',
          'level': null,
        },
        {
          'id': 28,
          'tag_id': 21,
          'label': 'Android/Kotlin',
          'category_id': 4,
          'category': 'Programming',
          'type': 'hard skill',
          'level': 1,
        },
      ],
      'spoken_languages': [
        {
          "id": 427,
          "tag_id": 1,
          "label": "English",
          'spoken': 3,
          'written': 2,
          "level": 1,
          "video_url": null,
        },
        {
          "id": 428,
          "tag_id": 2,
          "label": "French",
          'spoken': 1,
          'written': 1,
          "level": 1,
          "video_url": null,
        },
      ],
      'educations': [
        {
          'id': 1,
          'name': 'General engineering degree',
          'description': 'I study IT and aerodynamics',
          'degree': 'Master in general engineering',
          'studying_year': 3,
          'date_start': '2018-09-01',
          'date_end': '2021-09-30',
          'completed': false,
          'school': {
            'id': 2,
            'name':
                'Académie royale des Beaux-Arts de la Ville de Bruxelles - École supérieure des Arts',
            'description': '',
            'website': 'http://www.arba-esa.be',
            'address_street': 'Rue du Midi 144',
            'address_city': 'BRUXELLES',
            'address_zip': '1000',
            'address_country': 'Belgique',
            'fields': [
              {
                'id': 215,
                'type': 'field',
                'label': 'Art',
                'category_id': 17,
                'category': 'Arts',
              },
            ],
          },
          'fields': [
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
          ],
        },
        {
          'id': 2,
          'name': 'Drawing',
          'description': 'Drawing Skill Description',
          'degree': 'Bachelor',
          'studying_year': 5,
          'date_start': '2021-12-02',
          'date_end': '2022-02-28',
          'completed': true,
          'school': {
            'id': 5,
            'name': 'Arts²',
            'description': '',
            'website': 'http://www.artsaucarre.be',
            'address_street': 'Rue de Nimy 7',
            'address_city': 'MONS',
            'address_zip': '7000',
            'address_country': 'Belgique',
            'fields': [
              {
                'id': 215,
                'type': 'field',
                'label': 'Art',
                'category_id': 17,
                'category': 'Arts',
              },
            ],
          },
          'fields': [],
        },
      ],
      'experiences': [
        {
          'id': 1,
          'type': 'professional',
          'name': 'Automation internship at Orange France',
          'description':
              "Through this 6-month internship in the direction of network supervision at Orange France, I develop automation solutions to improve efficiency in maintaining and restoring breakdowns on Orange's fixed networks.",
          'company': 'Orange France',
          'date_start': '2020-02-14',
          'date_end': '2020-08-30',
          'completed': 0,
          'address_city': "Villeneuve d'Ascq",
          'address_country': 'France',
          'job': null,
          'tags': [],
        },
        {
          'id': 2,
          'type': 'personal',
          'name': 'Soccer',
          'description': 'Soccer description',
          'company': '',
          'date_start': '2021-12-03',
          'date_end': '2021-12-25',
          'completed': 1,
          'address_city': 'Phnom Penh',
          'address_country': 'Cambodia',
          'job': null,
          'tags': [],
        },
        {
          'id': 3,
          'type': 'personal',
          'name': 'Graphic design',
          'description': '',
          'company': '',
          'date_start': '2016-01-12',
          'date_end': null,
          'completed': 1,
          'address_city': 'Phnom Penh',
          'address_country': 'Cambodia',
          'job': null,
          'tags': [],
        },
      ],
      'achievements': [
        {
          'id': 1,
          'name': 'TOEIC',
          'description': 'I scored 970 points out of 990 on the TOEIC.',
          'date_completion': '2019-01-26',
          'fields': [
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
              'id': 208,
              'type': 'field',
              'label': 'Business management',
              'category_id': 16,
              'category': 'Business',
            },
          ],
        },
      ],
      'certificates': [
        {
          'id': 2,
          'title': 'Vue Js',
          'description':
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
          'received_date': '2021-12-01',
          'expiration_date': '2022-01-01',
        },
        {
          'id': 3,
          'title': 'PHP',
          'description':
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
          'received_date': '2020-01-01',
          'expiration_date': '2021-01-01',
        },
      ],
      'periods': [
        {
          'id': 1,
          'from': '2022-01-01',
          'to': '2022-01-01',
          'is_custom': 1,
          'weekly': [
            {
              'day': 1,
              'day_label': 'Monday',
              'slots': [
                {'id': 1, 'start_time': 28800, 'end_time': 43200},
                {'id': 2, 'start_time': 50400, 'end_time': 64800},
              ],
            },
            {
              'day': 2,
              'day_label': 'Tuesday',
              'slots': [
                {'id': 3, 'start_time': 28800, 'end_time': 64800},
              ],
            },
            {'day': 3, 'day_label': 'Wednesday', 'slots': []},
            {'day': 4, 'day_label': 'Thursday', 'slots': []},
            {'day': 5, 'day_label': 'Friday', 'slots': []},
            {'day': 6, 'day_label': 'Saturday', 'slots': []},
            {'day': 7, 'day_label': 'Sunday', 'slots': []},
          ],
        },
        {
          'id': 3,
          'from': '2022-01-01',
          'to': '2022-01-01',
          'is_custom': 1,
          'weekly': [
            {
              'day': 1,
              'day_label': 'Monday',
              'slots': [
                {'id': 58, 'start_time': 28800, 'end_time': 43200},
                {'id': 59, 'start_time': 50400, 'end_time': 64800},
              ],
            },
            {
              'day': 2,
              'day_label': 'Tuesday',
              'slots': [
                {'id': 60, 'start_time': 28800, 'end_time': 64800},
              ],
            },
            {'day': 3, 'day_label': 'Wednesday', 'slots': []},
            {'day': 4, 'day_label': 'Thursday', 'slots': []},
            {'day': 5, 'day_label': 'Friday', 'slots': []},
            {
              'day': 6,
              'day_label': 'Saturday',
              'slots': [
                {'id': 61, 'start_time': 3600, 'end_time': 28800},
              ],
            },
            {'day': 7, 'day_label': 'Sunday', 'slots': []},
          ],
        },
        {
          'id': 4,
          'from': '2022-01-01',
          'to': '2022-01-01',
          'is_custom': 1,
          'weekly': [
            {
              'day': 1,
              'day_label': 'Monday',
              'slots': [
                {'id': 7, 'start_time': 28800, 'end_time': 43200},
                {'id': 8, 'start_time': 50400, 'end_time': 64800},
              ],
            },
            {
              'day': 2,
              'day_label': 'Tuesday',
              'slots': [
                {'id': 9, 'start_time': 28800, 'end_time': 64800},
              ],
            },
            {'day': 3, 'day_label': 'Wednesday', 'slots': []},
            {'day': 4, 'day_label': 'Thursday', 'slots': []},
            {'day': 5, 'day_label': 'Friday', 'slots': []},
            {'day': 6, 'day_label': 'Saturday', 'slots': []},
            {'day': 7, 'day_label': 'Sunday', 'slots': []},
          ],
        },
        {
          'id': 5,
          'from': '2022-01-01',
          'to': '2022-01-01',
          'is_custom': 1,
          'weekly': [
            {
              'day': 1,
              'day_label': 'Monday',
              'slots': [
                {'id': 67, 'start_time': 28800, 'end_time': 43200},
                {'id': 68, 'start_time': 50400, 'end_time': 64800},
              ],
            },
            {
              'day': 2,
              'day_label': 'Tuesday',
              'slots': [
                {'id': 69, 'start_time': 28800, 'end_time': 64800},
              ],
            },
            {'day': 3, 'day_label': 'Wednesday', 'slots': []},
            {
              'day': 4,
              'day_label': 'Thursday',
              'slots': [
                {'id': 70, 'start_time': 10800, 'end_time': 25200},
              ],
            },
            {'day': 5, 'day_label': 'Friday', 'slots': []},
            {
              'day': 6,
              'day_label': 'Saturday',
              'slots': [
                {'id': 71, 'start_time': 10800, 'end_time': 32400},
              ],
            },
            {'day': 7, 'day_label': 'Sunday', 'slots': []},
          ],
        },
        {
          'id': 20,
          'from': '2021-10-01',
          'to': '2021-12-31',
          'is_custom': 1,
          'weekly': [
            {
              'day': 1,
              'day_label': 'Monday',
              'slots': [
                {'id': 45, 'start_time': 25200, 'end_time': 43200},
                {'id': 46, 'start_time': 61200, 'end_time': 79200},
              ],
            },
            {
              'day': 2,
              'day_label': 'Tuesday',
              'slots': [
                {'id': 47, 'start_time': 25200, 'end_time': 43200},
              ],
            },
            {
              'day': 3,
              'day_label': 'Wednesday',
              'slots': [
                {'id': 48, 'start_time': 25200, 'end_time': 43200},
              ],
            },
            {
              'day': 4,
              'day_label': 'Thursday',
              'slots': [
                {'id': 49, 'start_time': 25200, 'end_time': 43200},
              ],
            },
            {
              'day': 5,
              'day_label': 'Friday',
              'slots': [
                {'id': 50, 'start_time': 25200, 'end_time': 43200},
              ],
            },
            {
              'day': 6,
              'day_label': 'Saturday',
              'slots': [
                {'id': 51, 'start_time': 25200, 'end_time': 43200},
              ],
            },
            {'day': 7, 'day_label': 'Sunday', 'slots': []},
          ],
        },
        {
          'id': 22,
          'from': '2022-01-01',
          'to': '2022-04-30',
          'is_custom': 1,
          'weekly': [
            {
              'day': 1,
              'day_label': 'Monday',
              'slots': [
                {'id': 52, 'start_time': 28800, 'end_time': 43200},
              ],
            },
            {
              'day': 2,
              'day_label': 'Tuesday',
              'slots': [
                {'id': 53, 'start_time': 28800, 'end_time': 43200},
              ],
            },
            {
              'day': 3,
              'day_label': 'Wednesday',
              'slots': [
                {'id': 54, 'start_time': 28800, 'end_time': 43200},
              ],
            },
            {
              'day': 4,
              'day_label': 'Thursday',
              'slots': [
                {'id': 55, 'start_time': 28800, 'end_time': 43200},
              ],
            },
            {
              'day': 5,
              'day_label': 'Friday',
              'slots': [
                {'id': 56, 'start_time': 28800, 'end_time': 43200},
              ],
            },
            {
              'day': 6,
              'day_label': 'Saturday',
              'slots': [
                {'id': 57, 'start_time': 28800, 'end_time': 43200},
              ],
            },
            {'day': 7, 'day_label': 'Sunday', 'slots': []},
          ],
        },
        {
          'id': 24,
          'from': '2022-01-01',
          'to': '2022-03-31',
          'is_custom': 0,
          'weekly': [
            {'day': 1, 'day_label': 'Monday', 'slots': []},
            {'day': 2, 'day_label': 'Tuesday', 'slots': []},
            {'day': 3, 'day_label': 'Wednesday', 'slots': []},
            {'day': 4, 'day_label': 'Thursday', 'slots': []},
            {'day': 5, 'day_label': 'Friday', 'slots': []},
            {'day': 6, 'day_label': 'Saturday', 'slots': []},
            {'day': 7, 'day_label': 'Sunday', 'slots': []},
          ],
        },
      ],
    });
  }

  /// Fake putUpdateStudentProfileInfo API that simulates updating student profile
  /// Matches: UserInfoProvider.putUpdateStudentProfileInfo()
  @override
  Future<StudentProfileModel> putUpdateStudentProfileInfo({
    StudentProfileModel? data,
  }) async {
    // Simulate network delay
    await Future.delayed(_networkDelay);

    // Validate input
    if (data == null) {
      return Future.error('Student profile data is required');
    }

    // Return the updated student profile (in real scenario, this would be the updated data from server)
    return getStudentProfileInfo();
  }

  /// Fake putUpdateUserProfileInfo API that simulates updating user profile
  /// Matches: UserInfoProvider.putUpdateUserProfileInfo()
  @override
  Future<ProfileModel> putUpdateUserProfileInfo({ProfileModel? data}) async {
    // Simulate network delay
    await Future.delayed(_networkDelay);

    // Validate input
    if (data == null) {
      return Future.error('Profile data is required');
    }

    // Return the updated profile (in real scenario, this would be the updated data from server)
    final userInfo = await getUserInfo();
    return userInfo.profile!;
  }

  /// Fake uploadImage API that simulates uploading a profile picture
  /// Matches: UserInfoProvider.uploadImage()
  @override
  Future<ProfileModel> uploadImage({String? filepath}) async {
    // Simulate network delay
    await Future.delayed(_networkDelay);

    // Validate input
    if (filepath == null || filepath.isEmpty) {
      return Future.error('File path is required');
    }

    // Return updated profile with new picture URL
    final userInfo = await getUserInfo();
    final profile = userInfo.profile!;

    // In a real scenario, the server would return the updated profile with the new picture URL
    // For fake provider, we'll return the existing profile
    return ProfileModel(
      firstName: profile.firstName,
      lastName: profile.lastName,
      email: profile.email,
      description: profile.description,
      phone1CountryCode: profile.phone1CountryCode,
      phone1: profile.phone1,
      phone2CountryCode: profile.phone2CountryCode,
      phone2: profile.phone2,
      uiLanguage: profile.uiLanguage,
      accountType: profile.accountType,
      birthDate: profile.birthDate,
      pictureUrl:
          '/uploads/images/profile_picture/mock_${DateTime.now().millisecondsSinceEpoch}.jpg',
      emailNotification: profile.emailNotification,
      newsLetterNotification: profile.newsLetterNotification,
      addressStreet: profile.addressStreet,
      addressCity: profile.addressCity,
      addressZip: profile.addressZip,
      addressCountry: profile.addressCountry,
      addressLatitude: profile.addressLatitude,
      addressLongitude: profile.addressLongitude,
    );
  }
}
