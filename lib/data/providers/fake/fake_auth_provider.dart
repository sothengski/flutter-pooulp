import 'dart:async';

import '../../data.dart';

class FakeAuthProvider {
  /// Fake login API that returns mock data for local testing
  Future<LoginModel> loginAPI({required ProfileModel? loginData}) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Validate credentials (optional - you can remove this if you want to always succeed)
    if (loginData?.email == 'john.appleseed@example.com' &&
        loginData?.password == '123456') {
      // Return mock login response
      return LoginModel.fromJson({
        'token':
            'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9hcGkuZGV2LWxhbXAtMDEuc3J2LnBvb3VscC5ldVwvbG9naW4iLCJpYXQiOjE2MzkwMzA3NDQsImV4cCI6MTYzOTExNzE0NCwibmJmIjoxNjM5MDMwNzQ0LCJqdGkiOiJhTDZxcVFvQXFva3R3MmFGIiwic3ViIjoxLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.eQlxq-xcBssX02jB8OaP3hquQn_TuA-Nw5iXtFRIDZ4',
        'token_type': 'bearer',
        'expires_in': 86400,
        'account_type': 'student',
      });
    } else {
      // Return error for invalid credentials
      return Future.error('Invalid email or password');
    }
  }
}

class FakeUserInfoProvider implements IUserInfoProvider {
  /// Fake getUserInfo API that returns mock data for local testing
  @override
  Future<UserModel> getUserInfo() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

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

  @override
  Future<StudentProfileModel> getStudentProfileInfo() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

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

  @override
  Future<StudentProfileModel> putUpdateStudentProfileInfo({
    StudentProfileModel? data,
  }) {
    // TODO: implement putUpdateStudentProfileInfo
    throw UnimplementedError();
  }

  @override
  Future<ProfileModel> putUpdateUserProfileInfo({ProfileModel? data}) {
    // TODO: implement putUpdateUserProfileInfo
    throw UnimplementedError();
  }

  @override
  Future<ProfileModel> uploadImage({String? filepath}) {
    // TODO: implement uploadImage
    throw UnimplementedError();
  }
}
