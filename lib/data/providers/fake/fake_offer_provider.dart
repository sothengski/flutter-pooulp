import 'dart:async';

import '../../data.dart';

class FakeOfferProvider implements IOfferProvider {
  @override
  /// Fake getSavedOffers API that returns mock data for local testing
  Future<List<JobOfferModel>> getSavedOffers() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Return mock saved offers response
    final List<Map<String, dynamic>> mockData = [
      {
        'id': 12,
        'uuid': 'afc61f0c-9869-11ec-b015-fa163ec78948',
        'title': 'Special Education Teacher',
        'study_subject': null,
        'description':
            "When they take us up and throw us, with the Queen say only yesterday you deserved to be beheaded!' 'What for?' said the Duchess; 'and the moral of THAT is--\"Take care of the e--e--evening.",
        'is_draft': false,
        'date_offer_start': '2022-02-20 08:40:22',
        'date_offer_end': '2022-03-11 08:40:22',
        'date_job_start': '2022-02-19 08:40:22',
        'date_job_end': '2022-06-01 08:40:22',
        'telecommuting': 1,
        'shifting': 0,
        'number_of_working_hour_per_week': 39,
        'address_street': '',
        'address_city': 'Parisianville',
        'address_zip': '00579-9816',
        'address_country': 'Syrian Arab Republic',
        'address_latitude': '',
        'address_longitude': '',
        'types': [
          {
            'id': 242,
            'type': 'joboffer',
            'label': 'Internship',
            'category_id': 23,
            'category': 'Job offer types',
          },
          {
            'id': 243,
            'type': 'joboffer',
            'label': 'Study subject',
            'category_id': 23,
            'category': 'Job offer types',
          },
          {
            'id': 244,
            'type': 'joboffer',
            'label': 'Student job',
            'category_id': 23,
            'category': 'Job offer types',
          },
          {
            'id': 245,
            'type': 'joboffer',
            'label': 'Job',
            'category_id': 23,
            'category': 'Job offer types',
          },
        ],
        'fields': [
          {
            'id': 108,
            'type': 'field',
            'label': 'Communication',
            'category_id': 16,
            'category': 'Business',
          },
        ],
        'spoken_languages': [
          {
            'id': 30,
            'tag_id': 7,
            'label': 'Arabic',
            'level': 3,
            'video_url': null,
          },
        ],
        'skills': [
          {
            'id': 78,
            'tag_id': 163,
            'label': 'Logical reasoning',
            'category_id': 2,
            'category': 'Soft skills',
            'type': 'soft skill',
            'level': null,
          },
          {
            'id': 79,
            'tag_id': 193,
            'label': 'Coping',
            'category_id': 2,
            'category': 'Soft skills',
            'type': 'soft skill',
            'level': null,
          },
          {
            'id': 80,
            'tag_id': 52,
            'label': 'Photo ',
            'category_id': 5,
            'category': 'Marketing and communication',
            'type': 'hard skill',
            'level': 4,
          },
          {
            'id': 81,
            'tag_id': 95,
            'label': 'Legal content writing',
            'category_id': 11,
            'category': 'Legal',
            'type': 'hard skill',
            'level': 2,
          },
        ],
        'job_offer_state': {
          'id': 2,
          'state_id': 1,
          'datetime_saved': '2022-02-28 11:10:03',
          'datetime_refused': null,
          'datetime_matched': null,
          'datetime_enterprise_matched': null,
          'datetime_enterprise_refused': null,
        },
        'enterprise': {
          'id': 1,
          'name': 'Orange France',
          'enterprise_id': '380 129 866 46850',
          'email': '',
          'description': '',
          'address_street': "6 place d'Alleray",
          'address_city': 'Paris',
          'address_zip': '75015',
          'address_country': 'France',
          'address_latitude': '',
          'address_longitude': null,
          'subsidiary_of': <String, dynamic>{},
          'school': <String, dynamic>{},
          'fields': [
            {
              'id': 206,
              'type': 'field',
              'label': 'Information Technology',
              'category_id': 15,
              'category': 'Science',
            },
            {
              'id': 206,
              'type': 'field',
              'label': 'Information Technology',
              'category_id': 15,
              'category': 'Science',
            },
            {
              'id': 207,
              'type': 'field',
              'label': 'Business management',
              'category_id': 16,
              'category': 'Business',
            },
            {
              'id': 213,
              'type': 'field',
              'label': 'IT Security',
              'category_id': 15,
              'category': 'Science',
            },
            {
              'id': 238,
              'type': 'field',
              'label': 'Electrical engeneering',
              'category_id': 15,
              'category': 'Science',
            },
          ],
          'spoken_languages': [
            {
              'id': 3,
              'tag_id': 1,
              'label': 'English',
              'level': 1,
              'video_url': null,
            },
            {
              'id': 4,
              'tag_id': 2,
              'label': 'French',
              'level': 1,
              'video_url': null,
            },
          ],
          'logo_url': '',
          'facebook_link': '',
          'linkedin_link': '',
          'whatsapp_link': '',
          'managers': [
            {
              'id': 1,
              'role': 'admin',
              'user': {
                'id': 2,
                'uuid': '9bf63494-9869-11ec-bee7-fa163ec78948',
                'email': 'barbara.appleseed@example.com',
                'is_activated': true,
                'profile': {
                  'account_type': 'professional',
                  'first_name': 'Barbara',
                  'last_name': 'Appleseed',
                  'description': '',
                  'phone1_country_code': '+33',
                  'phone1': '07 87 98 07 79',
                  'phone2_country_code': '',
                  'phone2': '',
                  'birthdate': null,
                  'address_street': '',
                  'address_city': '',
                  'address_zip': '',
                  'address_country': '',
                  'address_latitude': '',
                  'address_longitude': '',
                  'picture_url': '',
                  'ui_language': 'en',
                  'settings_notifications_email': true,
                },
                'enterprise': {
                  'id': 1,
                  'name': 'Orange France',
                  'enterprise_id': '380 129 866 46850',
                  'email': '',
                  'description': '',
                  'address_street': "6 place d'Alleray",
                  'address_city': 'Paris',
                  'address_zip': '75015',
                  'address_country': 'France',
                  'address_latitude': '',
                  'address_longitude': '',
                  'subsidiary_of': <String, dynamic>{},
                  'school': <String, dynamic>{},
                  'fields': [
                    {
                      'id': 206,
                      'type': 'field',
                      'label': 'Information Technology',
                      'category_id': 15,
                      'category': 'Science',
                    },
                    {
                      'id': 206,
                      'type': 'field',
                      'label': 'Information Technology',
                      'category_id': 15,
                      'category': 'Science',
                    },
                    {
                      'id': 207,
                      'type': 'field',
                      'label': 'Business management',
                      'category_id': 16,
                      'category': 'Business',
                    },
                    {
                      'id': 213,
                      'type': 'field',
                      'label': 'IT Security',
                      'category_id': 15,
                      'category': 'Science',
                    },
                    {
                      'id': 238,
                      'type': 'field',
                      'label': 'Electrical engeneering',
                      'category_id': 15,
                      'category': 'Science',
                    },
                  ],
                  'spoken_languages': [
                    {
                      'id': 3,
                      'tag_id': 1,
                      'label': 'English',
                      'level': 1,
                      'video_url': null,
                    },
                    {
                      'id': 4,
                      'tag_id': 2,
                      'label': 'French',
                      'level': 1,
                      'video_url': null,
                    },
                  ],
                  'logo_url': '',
                  'facebook_link': '',
                  'linkedin_link': '',
                  'whatsapp_link': '',
                },
              },
            },
          ],
        },
      },
      {
        'id': 35,
        'uuid': 'afcd1366-9869-11ec-979a-fa163ec78948',
        'title': 'Cutting Machine Operator',
        'study_subject': null,
        'description':
            "Alice coming. 'There's PLENTY of room!' said Alice desperately: 'he's perfectly idiotic!' And she thought at first she thought there was no use denying it. I suppose you'll be asleep again before.",
        'is_draft': false,
        'date_offer_start': '2022-02-24 08:40:22',
        'date_offer_end': '2022-03-26 08:40:22',
        'date_job_start': '2022-02-23 08:40:22',
        'date_job_end': '2022-12-17 08:40:22',
        'telecommuting': 1,
        'shifting': 0,
        'number_of_working_hour_per_week': 44,
        'address_street': '',
        'address_city': 'Nataliaville',
        'address_zip': '53136',
        'address_country': 'Guadeloupe',
        'address_latitude': '',
        'address_longitude': '',
        'types': [
          {
            'id': 243,
            'type': 'joboffer',
            'label': 'Study subject',
            'category_id': 23,
            'category': 'Job offer types',
          },
          {
            'id': 244,
            'type': 'joboffer',
            'label': 'Student job',
            'category_id': 23,
            'category': 'Job offer types',
          },
        ],
        'fields': [
          {
            'id': 212,
            'type': 'field',
            'label': 'Literature',
            'category_id': 17,
            'category': 'Arts',
          },
          {
            'id': 216,
            'type': 'field',
            'label': 'Business engeenering',
            'category_id': 16,
            'category': 'Business',
          },
        ],
        'spoken_languages': [
          {
            'id': 77,
            'tag_id': 13,
            'label': 'Vietnamese',
            'level': 3,
            'video_url': null,
          },
        ],
        'skills': [
          {
            'id': 219,
            'tag_id': 152,
            'label': 'Negotiating',
            'category_id': 2,
            'category': 'Soft skills',
            'type': 'soft skill',
            'level': null,
          },
          {
            'id': 220,
            'tag_id': 185,
            'label': 'Tolerence',
            'category_id': 2,
            'category': 'Soft skills',
            'type': 'soft skill',
            'level': null,
          },
          {
            'id': 221,
            'tag_id': 204,
            'label': 'Memory',
            'category_id': 2,
            'category': 'Soft skills',
            'type': 'soft skill',
            'level': null,
          },
          {
            'id': 222,
            'tag_id': 22,
            'label': 'C++',
            'category_id': 4,
            'category': 'Programming',
            'type': 'hard skill',
            'level': 3,
          },
          {
            'id': 223,
            'tag_id': 38,
            'label': 'SQL',
            'category_id': 4,
            'category': 'Programming',
            'type': 'hard skill',
            'level': 3,
          },
          {
            'id': 224,
            'tag_id': 73,
            'label': 'Editing',
            'category_id': 7,
            'category': 'HR and adminstration',
            'type': 'hard skill',
            'level': 3,
          },
          {
            'id': 225,
            'tag_id': 74,
            'label': 'Layout',
            'category_id': 7,
            'category': 'HR and adminstration',
            'type': 'hard skill',
            'level': 3,
          },
          {
            'id': 226,
            'tag_id': 104,
            'label': 'Logistics',
            'category_id': 13,
            'category': 'Management',
            'type': 'hard skill',
            'level': 1,
          },
        ],
        'job_offer_state': {
          'id': 5,
          'state_id': 1,
          'datetime_saved': '2022-03-01 04:00:19',
          'datetime_refused': null,
          'datetime_matched': null,
          'datetime_enterprise_matched': null,
          'datetime_enterprise_refused': null,
        },
        'enterprise': {
          'id': 7,
          'name': 'Ullrich-Reichel',
          'enterprise_id': '4480079045',
          'email': '',
          'description': '',
          'address_street': '6951 Abbott Ridges',
          'address_city': 'Dannieside',
          'address_zip': '06805',
          'address_country': 'Kiribati',
          'address_latitude': '',
          'address_longitude': '',
          'subsidiary_of': <String, dynamic>{},
          'school': <String, dynamic>{},
          'fields': [],
          'spoken_languages': [],
          'logo_url': '',
          'facebook_link': '',
          'linkedin_link': '',
          'whatsapp_link': '',
          'managers': [
            {
              'id': 7,
              'role': 'admin',
              'user': {
                'id': 308,
                'uuid': 'ad316e72-9869-11ec-8f63-fa163ec78948',
                'email': 'gottlieb.rick@example.net',
                'is_activated': true,
                'profile': {
                  'account_type': 'professional',
                  'first_name': 'Otho',
                  'last_name': 'Robel',
                  'description': '',
                  'phone1_country_code': '',
                  'phone1': '',
                  'phone2_country_code': '',
                  'phone2': '',
                  'birthdate': null,
                  'address_street': '',
                  'address_city': '',
                  'address_zip': '',
                  'address_country': '',
                  'address_latitude': '',
                  'address_longitude': '',
                  'picture_url': '',
                  'ui_language': 'en',
                  'settings_notifications_email': true,
                },
                'enterprise': {
                  'id': 7,
                  'name': 'Ullrich-Reichel',
                  'enterprise_id': '4480079045',
                  'email': '',
                  'description': '',
                  'address_street': '6951 Abbott Ridges',
                  'address_city': 'Dannieside',
                  'address_zip': '06805',
                  'address_country': 'Kiribati',
                  'address_latitude': '',
                  'address_longitude': '',
                  'subsidiary_of': <String, dynamic>{},
                  'school': <String, dynamic>{},
                  'fields': [],
                  'spoken_languages': [],
                  'logo_url': '',
                  'facebook_link': '',
                  'linkedin_link': '',
                  'whatsapp_link': '',
                },
              },
            },
          ],
        },
      },
    ];

    return mockData.map((json) => JobOfferModel.fromJson(json)).toList();
  }

  /// Fake getPendingOffers API that returns mock data for local testing
  @override
  Future<List<JobOfferModel>> getPendingOffers() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Return mock pending offers response
    final List<Map<String, dynamic>> mockData = [
      {
        'id': 13,
        'uuid': 'afc673c6-9869-11ec-888c-fa163ec78948',
        'title': 'Bailiff',
        'study_subject': null,
        'description':
            "Alice. 'Oh, don't bother ME,' said Alice loudly. 'The idea of having the sentence first!' 'Hold your tongue, Ma!' said the Caterpillar. Here was another long passage, and the baby with some surprise.",
        'is_draft': false,
        'date_offer_start': '2022-02-19 08:40:22',
        'date_offer_end': '2022-03-08 08:40:22',
        'date_job_start': '2022-02-20 08:40:22',
        'date_job_end': '2022-08-16 08:40:22',
        'telecommuting': 0,
        'shifting': 1,
        'number_of_working_hour_per_week': 39,
        'address_street': '',
        'address_city': 'West Daphnechester',
        'address_zip': '10888-0244',
        'address_country': 'Ecuador',
        'address_latitude': '',
        'address_longitude': '',
        'types': [
          {
            'id': 243,
            'type': 'joboffer',
            'label': 'Study subject',
            'category_id': 23,
            'category': 'Job offer types',
          },
          {
            'id': 244,
            'type': 'joboffer',
            'label': 'Student job',
            'category_id': 23,
            'category': 'Job offer types',
          },
          {
            'id': 245,
            'type': 'joboffer',
            'label': 'Job',
            'category_id': 23,
            'category': 'Job offer types',
          },
        ],
        'fields': [
          {
            'id': 226,
            'type': 'field',
            'label': 'Bio engeenering',
            'category_id': 15,
            'category': 'Science',
          },
        ],
        'spoken_languages': [
          {
            'id': 31,
            'tag_id': 10,
            'label': 'Khmer',
            'level': 2,
            'video_url': null,
          },
          {
            'id': 32,
            'tag_id': 12,
            'label': 'Thai',
            'level': 2,
            'video_url': null,
          },
        ],
        'skills': [
          {
            'id': 82,
            'tag_id': 169,
            'label': 'Imagination',
            'category_id': 2,
            'category': 'Soft skills',
            'type': 'soft skill',
            'level': null,
          },
          {
            'id': 83,
            'tag_id': 180,
            'label': 'Professionalism',
            'category_id': 2,
            'category': 'Soft skills',
            'type': 'soft skill',
            'level': null,
          },
          {
            'id': 84,
            'tag_id': 17,
            'label': 'LucidChart',
            'category_id': 3,
            'category': 'tools and technologies',
            'type': 'hard skill',
            'level': 4,
          },
          {
            'id': 85,
            'tag_id': 77,
            'label': 'Videos',
            'category_id': 8,
            'category': 'Audiovisuel',
            'type': 'hard skill',
            'level': 3,
          },
          {
            'id': 86,
            'tag_id': 78,
            'label': 'Photography',
            'category_id': 8,
            'category': 'Audiovisuel',
            'type': 'hard skill',
            'level': 4,
          },
          {
            'id': 87,
            'tag_id': 80,
            'label': 'Music edition',
            'category_id': 8,
            'category': 'Audiovisuel',
            'type': 'hard skill',
            'level': 1,
          },
        ],
        'job_offer_state': {
          'id': 1,
          'state_id': 2,
          'datetime_saved': null,
          'datetime_refused': null,
          'datetime_matched': '2022-02-28 11:09:56',
          'datetime_enterprise_matched': null,
          'datetime_enterprise_refused': null,
        },
        'enterprise': {
          'id': 1,
          'name': 'Orange France',
          'enterprise_id': '380 129 866 46850',
          'email': '',
          'description': '',
          'address_street': "6 place d'Alleray",
          'address_city': 'Paris',
          'address_zip': '75015',
          'address_country': 'France',
          'address_latitude': '',
          'address_longitude': '',
          'subsidiary_of': <String, dynamic>{},
          'school': <String, dynamic>{},
          'fields': [
            {
              'id': 206,
              'type': 'field',
              'label': 'Information Technology',
              'category_id': 15,
              'category': 'Science',
            },
            {
              'id': 206,
              'type': 'field',
              'label': 'Information Technology',
              'category_id': 15,
              'category': 'Science',
            },
            {
              'id': 207,
              'type': 'field',
              'label': 'Business management',
              'category_id': 16,
              'category': 'Business',
            },
            {
              'id': 213,
              'type': 'field',
              'label': 'IT Security',
              'category_id': 15,
              'category': 'Science',
            },
            {
              'id': 238,
              'type': 'field',
              'label': 'Electrical engeneering',
              'category_id': 15,
              'category': 'Science',
            },
          ],
          'spoken_languages': [
            {
              'id': 3,
              'tag_id': 1,
              'label': 'English',
              'level': 1,
              'video_url': null,
            },
            {
              'id': 4,
              'tag_id': 2,
              'label': 'French',
              'level': 1,
              'video_url': null,
            },
          ],
          'logo_url': '',
          'facebook_link': '',
          'linkedin_link': '',
          'whatsapp_link': '',
          'managers': [
            {
              'id': 1,
              'role': 'admin',
              'user': {
                'id': 2,
                'uuid': '9bf63494-9869-11ec-bee7-fa163ec78948',
                'email': 'barbara.appleseed@example.com',
                'is_activated': true,
                'profile': {
                  'account_type': 'professional',
                  'first_name': 'Barbara',
                  'last_name': 'Appleseed',
                  'description': '',
                  'phone1_country_code': '+33',
                  'phone1': '07 87 98 07 79',
                  'phone2_country_code': '',
                  'phone2': '',
                  'birthdate': null,
                  'address_street': '',
                  'address_city': '',
                  'address_zip': '',
                  'address_country': '',
                  'address_latitude': '',
                  'address_longitude': '',
                  'picture_url': '',
                  'ui_language': 'en',
                  'settings_notifications_email': true,
                },
                'enterprise': {
                  'id': 1,
                  'name': 'Orange France',
                  'enterprise_id': '380 129 866 46850',
                  'email': '',
                  'description': '',
                  'address_street': "6 place d'Alleray",
                  'address_city': 'Paris',
                  'address_zip': '75015',
                  'address_country': 'France',
                  'address_latitude': '',
                  'address_longitude': '',
                  'subsidiary_of': <String, dynamic>{},
                  'school': <String, dynamic>{},
                  'fields': [
                    {
                      'id': 206,
                      'type': 'field',
                      'label': 'Information Technology',
                      'category_id': 15,
                      'category': 'Science',
                    },
                    {
                      'id': 206,
                      'type': 'field',
                      'label': 'Information Technology',
                      'category_id': 15,
                      'category': 'Science',
                    },
                    {
                      'id': 207,
                      'type': 'field',
                      'label': 'Business management',
                      'category_id': 16,
                      'category': 'Business',
                    },
                    {
                      'id': 213,
                      'type': 'field',
                      'label': 'IT Security',
                      'category_id': 15,
                      'category': 'Science',
                    },
                    {
                      'id': 238,
                      'type': 'field',
                      'label': 'Electrical engeneering',
                      'category_id': 15,
                      'category': 'Science',
                    },
                  ],
                  'spoken_languages': [
                    {
                      'id': 3,
                      'tag_id': 1,
                      'label': 'English',
                      'level': 1,
                      'video_url': null,
                    },
                    {
                      'id': 4,
                      'tag_id': 2,
                      'label': 'French',
                      'level': 1,
                      'video_url': null,
                    },
                  ],
                  'logo_url': '',
                  'facebook_link': '',
                  'linkedin_link': '',
                  'whatsapp_link': '',
                },
              },
            },
          ],
        },
      },
      {
        'id': 41,
        'uuid': 'afce88f4-9869-11ec-830c-fa163ec78948',
        'title': 'Precious Stone Worker',
        'study_subject': null,
        'description':
            'I the same when I sleep" is the same as the White Rabbit. She was a little of it?\' said the Hatter, \'I cut some more of it at all. \'But perhaps it was very hot, she kept on good terms with him, he\'d.',
        'is_draft': false,
        'date_offer_start': '2022-02-24 08:40:22',
        'date_offer_end': '2022-03-15 08:40:22',
        'date_job_start': '2022-02-27 08:40:22',
        'date_job_end': '2022-10-16 08:40:22',
        'telecommuting': 0,
        'shifting': 0,
        'number_of_working_hour_per_week': 35,
        'address_street': '',
        'address_city': 'Port Kaya',
        'address_zip': '13357-2661',
        'address_country': 'San Marino',
        'address_latitude': '',
        'address_longitude': '',
        'types': [
          {
            'id': 242,
            'type': 'joboffer',
            'label': 'Internship',
            'category_id': 23,
            'category': 'Job offer types',
          },
          {
            'id': 244,
            'type': 'joboffer',
            'label': 'Student job',
            'category_id': 23,
            'category': 'Job offer types',
          },
          {
            'id': 245,
            'type': 'joboffer',
            'label': 'Job',
            'category_id': 23,
            'category': 'Job offer types',
          },
        ],
        'fields': [
          {
            'id': 237,
            'type': 'field',
            'label': 'Inudstrial engeneering',
            'category_id': 15,
            'category': 'Science',
          },
          {
            'id': 240,
            'type': 'field',
            'label': 'Sewing',
            'category_id': 22,
            'category': 'Arts and crafts',
          },
        ],
        'spoken_languages': [
          {
            'id': 86,
            'tag_id': 6,
            'label': 'Spanish',
            'level': 2,
            'video_url': null,
          },
          {
            'id': 87,
            'tag_id': 11,
            'label': 'Russian',
            'level': 2,
            'video_url': null,
          },
        ],
        'skills': [
          {
            'id': 259,
            'tag_id': 133,
            'label': 'Patience',
            'category_id': 2,
            'category': 'Soft skills',
            'type': 'soft skill',
            'level': null,
          },
          {
            'id': 260,
            'tag_id': 157,
            'label': 'Optimism',
            'category_id': 2,
            'category': 'Soft skills',
            'type': 'soft skill',
            'level': null,
          },
          {
            'id': 261,
            'tag_id': 19,
            'label': 'Android/Java',
            'category_id': 4,
            'category': 'Programming',
            'type': 'hard skill',
            'level': 4,
          },
          {
            'id': 262,
            'tag_id': 28,
            'label': 'php',
            'category_id': 4,
            'category': 'Programming',
            'type': 'hard skill',
            'level': 2,
          },
          {
            'id': 263,
            'tag_id': 48,
            'label': 'BPMN',
            'category_id': 3,
            'category': 'tools and technologies',
            'type': 'hard skill',
            'level': 2,
          },
          {
            'id': 264,
            'tag_id': 78,
            'label': 'Photography',
            'category_id': 8,
            'category': 'Audiovisuel',
            'type': 'hard skill',
            'level': 1,
          },
          {
            'id': 265,
            'tag_id': 93,
            'label': 'Web Design',
            'category_id': 9,
            'category': 'Design/Graphism',
            'type': 'hard skill',
            'level': 3,
          },
        ],
        'job_offer_state': {
          'id': 3,
          'state_id': 2,
          'datetime_saved': null,
          'datetime_refused': null,
          'datetime_matched': '2022-02-28 11:10:17',
          'datetime_enterprise_matched': null,
          'datetime_enterprise_refused': null,
        },
        'enterprise': {
          'id': 1,
          'name': 'Orange France',
          'enterprise_id': '380 129 866 46850',
          'email': '',
          'description': '',
          'address_street': "6 place d'Alleray",
          'address_city': 'Paris',
          'address_zip': '75015',
          'address_country': 'France',
          'address_latitude': '',
          'address_longitude': '',
          'subsidiary_of': <String, dynamic>{},
          'school': <String, dynamic>{},
          'fields': [
            {
              'id': 206,
              'type': 'field',
              'label': 'Information Technology',
              'category_id': 15,
              'category': 'Science',
            },
            {
              'id': 206,
              'type': 'field',
              'label': 'Information Technology',
              'category_id': 15,
              'category': 'Science',
            },
            {
              'id': 207,
              'type': 'field',
              'label': 'Business management',
              'category_id': 16,
              'category': 'Business',
            },
            {
              'id': 213,
              'type': 'field',
              'label': 'IT Security',
              'category_id': 15,
              'category': 'Science',
            },
            {
              'id': 238,
              'type': 'field',
              'label': 'Electrical engeneering',
              'category_id': 15,
              'category': 'Science',
            },
          ],
          'spoken_languages': [
            {
              'id': 3,
              'tag_id': 1,
              'label': 'English',
              'level': 1,
              'video_url': null,
            },
            {
              'id': 4,
              'tag_id': 2,
              'label': 'French',
              'level': 1,
              'video_url': null,
            },
          ],
          'logo_url': '',
          'facebook_link': '',
          'linkedin_link': '',
          'whatsapp_link': '',
          'managers': [
            {
              'id': 1,
              'role': 'admin',
              'user': {
                'id': 2,
                'uuid': '9bf63494-9869-11ec-bee7-fa163ec78948',
                'email': 'barbara.appleseed@example.com',
                'is_activated': true,
                'profile': {
                  'account_type': 'professional',
                  'first_name': 'Barbara',
                  'last_name': 'Appleseed',
                  'description': '',
                  'phone1_country_code': '+33',
                  'phone1': '07 87 98 07 79',
                  'phone2_country_code': '',
                  'phone2': '',
                  'birthdate': null,
                  'address_street': '',
                  'address_city': '',
                  'address_zip': '',
                  'address_country': '',
                  'address_latitude': '',
                  'address_longitude': '',
                  'picture_url': '',
                  'ui_language': 'en',
                  'settings_notifications_email': true,
                },
                'enterprise': {
                  'id': 1,
                  'name': 'Orange France',
                  'enterprise_id': '380 129 866 46850',
                  'email': '',
                  'description': '',
                  'address_street': "6 place d'Alleray",
                  'address_city': 'Paris',
                  'address_zip': '75015',
                  'address_country': 'France',
                  'address_latitude': '',
                  'address_longitude': '',
                  'subsidiary_of': <String, dynamic>{},
                  'school': <String, dynamic>{},
                  'fields': [
                    {
                      'id': 206,
                      'type': 'field',
                      'label': 'Information Technology',
                      'category_id': 15,
                      'category': 'Science',
                    },
                    {
                      'id': 206,
                      'type': 'field',
                      'label': 'Information Technology',
                      'category_id': 15,
                      'category': 'Science',
                    },
                    {
                      'id': 207,
                      'type': 'field',
                      'label': 'Business management',
                      'category_id': 16,
                      'category': 'Business',
                    },
                    {
                      'id': 213,
                      'type': 'field',
                      'label': 'IT Security',
                      'category_id': 15,
                      'category': 'Science',
                    },
                    {
                      'id': 238,
                      'type': 'field',
                      'label': 'Electrical engeneering',
                      'category_id': 15,
                      'category': 'Science',
                    },
                  ],
                  'spoken_languages': [
                    {
                      'id': 3,
                      'tag_id': 1,
                      'label': 'English',
                      'level': 1,
                      'video_url': null,
                    },
                    {
                      'id': 4,
                      'tag_id': 2,
                      'label': 'French',
                      'level': 1,
                      'video_url': null,
                    },
                  ],
                  'logo_url': '',
                  'facebook_link': '',
                  'linkedin_link': '',
                  'whatsapp_link': '',
                },
              },
            },
          ],
        },
      },
    ];

    return mockData.map((json) => JobOfferModel.fromJson(json)).toList();
  }

  @override
  Future<JsonResponse> deleteSavedSearch({required int? savedSearchId}) {
    // TODO: implement deleteSavedSearch
    throw UnimplementedError();
  }

  @override
  Future<List<JobOfferModel>> getFeedOffers() {
    // TODO: implement getFeedOffers
    throw UnimplementedError();
  }

  @override
  Future<JobOfferModel> getJobOfferDetailByID({
    required String? jobOfferID,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Return mock job offer detail response
    return JobOfferModel.fromJson({
      'id': 10,
      'uuid': '2261712a-908a-11ec-b60c-fa163ec78948',
      'title': 'Full Stack Developper Intern',
      'study_subject': '',
      'description':
          "Internship\n\nYou and your role at Pivot\n\nRole: Full stack Developer (we accept competences on Front or back only)\nStart date: ASAP\nFramework : Experience with a JS framework: Front (React/Redux is a plus); Technologies : Machine Learning, VueJS, Angular, React, iOS, Android; UI/UX : Figma, Wireframing, CSS\nYour team: The Foundry @Pivot – Responsible for the design and the implementation of our data products and services for our clients.\nTeam player and willingness to learn\nGood oral and written communication of technical challenges\nGood problem solving skills\nBeing comfortable with English is a must have as we are an international team\n\nAbout Pivot:\n\nPivot and Co is a decision science strategy advisory. We focus on business transformation, combining the power of Artificial Intelligence and human intuition to empower leaders and decision makers to better navigate their businesses.\n\n\nYour mission:\n\nAs Full stack developer and working with Machine Learning scientist, UI designer and Product Officer, you will assist the development of a web application for a subscription process and improve your skills in integrating Artificial Intelligence for automatic image recognition, real time scoring and API development.\n\n\nYour role will be to:\n\nDesign the User Experience and assisting the developpement of wireframes for the Front End and the Back end\nCreate and extend functionality of our products by contributing to our microservice-based platform\nDevelop clean and highly maintainable code\nShare best practices in web app development and enhance Pivot & co knowledge.\n\nYour mission beyond your day-to-day tasks\n\nIn complement with your day-to-day tasks, you'll have a dedicated mission with full responsibility of methodology and delivery on this specific mission. This mission will be agreed upon between you and your supervisor during the first week of your integration.\n\n\nGratification\n\n1300 Eur/Mois + Ticket Restau (9,5 Eur) + Navigo (50%)\nYou and your role at Pivot\n\nRole: Full stack Developer (we accept competences on Front or back only)\nStart date: ASAP\nFramework : Experience with a JS framework: Front (React/Redux is a plus); Technologies : Machine Learning, VueJS, Angular, React, iOS, Android; UI/UX : Figma, Wireframing, CSS\nYour team: The Foundry @Pivot – Responsible for the design and the implementation of our data products and services for our clients.\nTeam player and willingness to learn\nGood oral and written communication of technical challenges\nGood problem solving skills\nBeing comfortable with English is a must have as we are an international team\n\nAbout Pivot:\n\nPivot and Co is a decision science strategy advisory. We focus on business transformation, combining the power of Artificial Intelligence and human intuition to empower leaders and decision makers to better navigate their businesses.\n\n\nYour mission:\n\nAs Full stack developer and working with Machine Learning scientist, UI designer and Product Officer, you will assist the development of a web application for a subscription process and improve your skills in integrating Artificial Intelligence for automatic image recognition, real time scoring and API development.\n\n\nYour role will be to:\n\nDesign the User Experience and assisting the developpement of wireframes for the Front End and the Back end\nCreate and extend functionality of our products by contributing to our microservice-based platform\nDevelop clean and highly maintainable code\nShare best practices in web app development and enhance Pivot & co knowledge.\n\nYour mission beyond your day-to-day tasks\n\nIn complement with your day-to-day tasks, you'll have a dedicated mission with full responsibility of methodology and delivery on this specific mission. This mission will be agreed upon between you and your supervisor during the first week of your integration.\n\n\nGratification\n\n1300 Eur/Mois + Ticket Restau (9,5 Eur) + Navigo (50%)",
      'is_draft': false,
      'date_offer_start': '2022-02-18 00:00:00',
      'date_offer_end': '2022-07-18 00:00:00',
      'date_job_start': '2022-09-01 00:00:00',
      'date_job_end': null,
      'telecommuting': 0,
      'shifting': 1,
      'number_of_working_hour_per_week': 30,
      'address_street': 'Paris, Île-de-France, France',
      'address_city': 'Paris',
      'address_zip': '123123',
      'address_country': 'France',
      'address_latitude': '0',
      'address_longitude': '0',
      'types': [
        {
          'id': 243,
          'type': 'joboffer',
          'label': 'Internship',
          'category_id': 23,
          'category': 'Job offer types',
        },
      ],
      'fields': [
        {
          'id': 207,
          'type': 'field',
          'label': 'Information Technology',
          'category_id': 15,
          'category': 'Science',
        },
      ],
      'spoken_languages': [
        {
          'id': 117,
          'tag_id': 1,
          'label': 'English',
          'level': 1,
          'video_url': null,
        },
        {
          'id': 118,
          'tag_id': 2,
          'label': 'French',
          'level': 2,
          'video_url': null,
        },
        {
          'id': 119,
          'tag_id': 4,
          'label': 'Dutch',
          'level': 4,
          'video_url': null,
        },
      ],
      'skills': [
        {
          'id': 64,
          'tag_id': 111,
          'label': 'Responsability',
          'category_id': 2,
          'category': 'Soft skills',
          'type': 'soft skill',
          'level': null,
        },
      ],
      'job_offer_state': {
        'id': null,
        'datetime_saved': null,
        'datetime_refused': null,
        'datetime_matched': null,
        'datetime_enterprise_matched': null,
        'datetime_enterprise_refused': null,
      },
      'enterprise': {
        'id': 1,
        'name': 'Orange France',
        'enterprise_id': '380 129 866 46850',
        'email': '',
        'description': '',
        'address_street': "6 place d'Alleray",
        'address_city': 'Paris',
        'address_zip': '75015',
        'address_country': 'France',
        'address_latitude': '',
        'address_longitude': '',
        'subsidiary_of': <String, dynamic>{},
        'school': <String, dynamic>{},
        'fields': [
          {
            'id': 214,
            'type': 'field',
            'label': 'IT Security',
            'category_id': 15,
            'category': 'Science',
          },
          {
            'id': 207,
            'type': 'field',
            'label': 'Information Technology',
            'category_id': 15,
            'category': 'Science',
          },
          {
            'id': 239,
            'type': 'field',
            'label': 'Electrical engeneering',
            'category_id': 15,
            'category': 'Science',
          },
          {
            'id': 207,
            'type': 'field',
            'label': 'Information Technology',
            'category_id': 15,
            'category': 'Science',
          },
          {
            'id': 208,
            'type': 'field',
            'label': 'Business management',
            'category_id': 16,
            'category': 'Business',
          },
        ],
        'spoken_languages': [
          {
            'id': 3,
            'tag_id': 1,
            'label': 'English',
            'level': 2,
            'video_url': null,
          },
          {
            'id': 4,
            'tag_id': 2,
            'label': 'French',
            'level': 2,
            'video_url': null,
          },
        ],
        'logo_url':
            '/uploads/images/logo/1/c89865c0-2de2-419d-bbe0-e99e20b64dc1',
        'facebook_link': '',
        'linkedin_link': '',
        'whatsapp_link': '',
        'managers': [
          {
            'id': 1,
            'role': 'admin',
            'user': {
              'id': 2,
              'uuid': 'cb3e0e6e-7d9a-11ec-90d6-0242ac120003',
              'email': 'barbara.appleseed@example.com',
              'is_activated': true,
              'profile': {
                'account_type': 'professional',
                'first_name': 'Barbara',
                'last_name': 'Appleseed',
                'description': '',
                'phone1_country_code': '+33',
                'phone1': '07 87 98 07 80',
                'phone2_country_code': '',
                'phone2': '',
                'birthdate': null,
                'address_street': '',
                'address_city': '',
                'address_zip': '',
                'address_country': '',
                'address_latitude': '',
                'address_longitude': '',
                'picture_url': '',
                'ui_language': 'en',
                'settings_notifications_email': true,
              },
              'enterprise': {
                'id': 1,
                'name': 'Orange France',
                'enterprise_id': '380 129 866 46850',
                'email': '',
                'description': '',
                'address_street': "6 place d'Alleray",
                'address_city': 'Paris',
                'address_zip': '75015',
                'address_country': 'France',
                'address_latitude': '',
                'address_longitude': '',
                'subsidiary_of': <String, dynamic>{},
                'school': <String, dynamic>{},
                'fields': [
                  {
                    'id': 214,
                    'type': 'field',
                    'label': 'IT Security',
                    'category_id': 15,
                    'category': 'Science',
                  },
                  {
                    'id': 207,
                    'type': 'field',
                    'label': 'Information Technology',
                    'category_id': 15,
                    'category': 'Science',
                  },
                  {
                    'id': 239,
                    'type': 'field',
                    'label': 'Electrical engeneering',
                    'category_id': 15,
                    'category': 'Science',
                  },
                  {
                    'id': 207,
                    'type': 'field',
                    'label': 'Information Technology',
                    'category_id': 15,
                    'category': 'Science',
                  },
                  {
                    'id': 208,
                    'type': 'field',
                    'label': 'Business management',
                    'category_id': 16,
                    'category': 'Business',
                  },
                ],
                'spoken_languages': [
                  {
                    'id': 3,
                    'tag_id': 1,
                    'label': 'English',
                    'level': 2,
                    'video_url': null,
                  },
                  {
                    'id': 4,
                    'tag_id': 2,
                    'label': 'French',
                    'level': 2,
                    'video_url': null,
                  },
                ],
                'logo_url':
                    '/uploads/images/logo/1/c89865c0-2de2-419d-bbe0-e99e20b64dc1',
                'facebook_link': '',
                'linkedin_link': '',
                'whatsapp_link': '',
              },
            },
          },
        ],
      },
    });
  }

  @override
  Future<JobOfferModel> getJobOfferDetailByUUID({
    required String? jobOfferUUID,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Return mock job offer detail response
    return JobOfferModel.fromJson({
      'id': 10,
      'uuid': '2261712a-908a-11ec-b60c-fa163ec78948',
      'title': 'Full Stack Developper Intern',
      'study_subject': '',
      'description':
          "Internship\n\nYou and your role at Pivot\n\nRole: Full stack Developer (we accept competences on Front or back only)\nStart date: ASAP\nFramework : Experience with a JS framework: Front (React/Redux is a plus); Technologies : Machine Learning, VueJS, Angular, React, iOS, Android; UI/UX : Figma, Wireframing, CSS\nYour team: The Foundry @Pivot – Responsible for the design and the implementation of our data products and services for our clients.\nTeam player and willingness to learn\nGood oral and written communication of technical challenges\nGood problem solving skills\nBeing comfortable with English is a must have as we are an international team\n\nAbout Pivot:\n\nPivot and Co is a decision science strategy advisory. We focus on business transformation, combining the power of Artificial Intelligence and human intuition to empower leaders and decision makers to better navigate their businesses.\n\n\nYour mission:\n\nAs Full stack developer and working with Machine Learning scientist, UI designer and Product Officer, you will assist the development of a web application for a subscription process and improve your skills in integrating Artificial Intelligence for automatic image recognition, real time scoring and API development.\n\n\nYour role will be to:\n\nDesign the User Experience and assisting the developpement of wireframes for the Front End and the Back end\nCreate and extend functionality of our products by contributing to our microservice-based platform\nDevelop clean and highly maintainable code\nShare best practices in web app development and enhance Pivot & co knowledge.\n\nYour mission beyond your day-to-day tasks\n\nIn complement with your day-to-day tasks, you'll have a dedicated mission with full responsibility of methodology and delivery on this specific mission. This mission will be agreed upon between you and your supervisor during the first week of your integration.\n\n\nGratification\n\n1300 Eur/Mois + Ticket Restau (9,5 Eur) + Navigo (50%)\nYou and your role at Pivot\n\nRole: Full stack Developer (we accept competences on Front or back only)\nStart date: ASAP\nFramework : Experience with a JS framework: Front (React/Redux is a plus); Technologies : Machine Learning, VueJS, Angular, React, iOS, Android; UI/UX : Figma, Wireframing, CSS\nYour team: The Foundry @Pivot – Responsible for the design and the implementation of our data products and services for our clients.\nTeam player and willingness to learn\nGood oral and written communication of technical challenges\nGood problem solving skills\nBeing comfortable with English is a must have as we are an international team\n\nAbout Pivot:\n\nPivot and Co is a decision science strategy advisory. We focus on business transformation, combining the power of Artificial Intelligence and human intuition to empower leaders and decision makers to better navigate their businesses.\n\n\nYour mission:\n\nAs Full stack developer and working with Machine Learning scientist, UI designer and Product Officer, you will assist the development of a web application for a subscription process and improve your skills in integrating Artificial Intelligence for automatic image recognition, real time scoring and API development.\n\n\nYour role will be to:\n\nDesign the User Experience and assisting the developpement of wireframes for the Front End and the Back end\nCreate and extend functionality of our products by contributing to our microservice-based platform\nDevelop clean and highly maintainable code\nShare best practices in web app development and enhance Pivot & co knowledge.\n\nYour mission beyond your day-to-day tasks\n\nIn complement with your day-to-day tasks, you'll have a dedicated mission with full responsibility of methodology and delivery on this specific mission. This mission will be agreed upon between you and your supervisor during the first week of your integration.\n\n\nGratification\n\n1300 Eur/Mois + Ticket Restau (9,5 Eur) + Navigo (50%)",
      'is_draft': false,
      'date_offer_start': '2022-02-18 00:00:00',
      'date_offer_end': '2022-07-18 00:00:00',
      'date_job_start': '2022-09-01 00:00:00',
      'date_job_end': null,
      'telecommuting': 0,
      'shifting': 1,
      'number_of_working_hour_per_week': 30,
      'address_street': 'Paris, Île-de-France, France',
      'address_city': 'Paris',
      'address_zip': '123123',
      'address_country': 'France',
      'address_latitude': '0',
      'address_longitude': '0',
      'types': [
        {
          'id': 243,
          'type': 'joboffer',
          'label': 'Internship',
          'category_id': 23,
          'category': 'Job offer types',
        },
      ],
      'fields': [
        {
          'id': 207,
          'type': 'field',
          'label': 'Information Technology',
          'category_id': 15,
          'category': 'Science',
        },
      ],
      'spoken_languages': [
        {
          'id': 117,
          'tag_id': 1,
          'label': 'English',
          'level': 1,
          'video_url': null,
        },
        {
          'id': 118,
          'tag_id': 2,
          'label': 'French',
          'level': 2,
          'video_url': null,
        },
        {
          'id': 119,
          'tag_id': 4,
          'label': 'Dutch',
          'level': 4,
          'video_url': null,
        },
      ],
      'skills': [
        {
          'id': 64,
          'tag_id': 111,
          'label': 'Responsability',
          'category_id': 2,
          'category': 'Soft skills',
          'type': 'soft skill',
          'level': null,
        },
      ],
      'job_offer_state': {
        'id': null,
        'datetime_saved': null,
        'datetime_refused': null,
        'datetime_matched': null,
        'datetime_enterprise_matched': null,
        'datetime_enterprise_refused': null,
      },
      'enterprise': {
        'id': 1,
        'name': 'Orange France',
        'enterprise_id': '380 129 866 46850',
        'email': '',
        'description': '',
        'address_street': "6 place d'Alleray",
        'address_city': 'Paris',
        'address_zip': '75015',
        'address_country': 'France',
        'address_latitude': '',
        'address_longitude': '',
        'subsidiary_of': <String, dynamic>{},
        'school': <String, dynamic>{},
        'fields': [
          {
            'id': 214,
            'type': 'field',
            'label': 'IT Security',
            'category_id': 15,
            'category': 'Science',
          },
          {
            'id': 207,
            'type': 'field',
            'label': 'Information Technology',
            'category_id': 15,
            'category': 'Science',
          },
          {
            'id': 239,
            'type': 'field',
            'label': 'Electrical engeneering',
            'category_id': 15,
            'category': 'Science',
          },
          {
            'id': 207,
            'type': 'field',
            'label': 'Information Technology',
            'category_id': 15,
            'category': 'Science',
          },
          {
            'id': 208,
            'type': 'field',
            'label': 'Business management',
            'category_id': 16,
            'category': 'Business',
          },
        ],
        'spoken_languages': [
          {
            'id': 3,
            'tag_id': 1,
            'label': 'English',
            'level': 2,
            'video_url': null,
          },
          {
            'id': 4,
            'tag_id': 2,
            'label': 'French',
            'level': 2,
            'video_url': null,
          },
        ],
        'logo_url':
            '/uploads/images/logo/1/c89865c0-2de2-419d-bbe0-e99e20b64dc1',
        'facebook_link': '',
        'linkedin_link': '',
        'whatsapp_link': '',
        'managers': [
          {
            'id': 1,
            'role': 'admin',
            'user': {
              'id': 2,
              'uuid': 'cb3e0e6e-7d9a-11ec-90d6-0242ac120003',
              'email': 'barbara.appleseed@example.com',
              'is_activated': true,
              'profile': {
                'account_type': 'professional',
                'first_name': 'Barbara',
                'last_name': 'Appleseed',
                'description': '',
                'phone1_country_code': '+33',
                'phone1': '07 87 98 07 80',
                'phone2_country_code': '',
                'phone2': '',
                'birthdate': null,
                'address_street': '',
                'address_city': '',
                'address_zip': '',
                'address_country': '',
                'address_latitude': '',
                'address_longitude': '',
                'picture_url': '',
                'ui_language': 'en',
                'settings_notifications_email': true,
              },
              'enterprise': {
                'id': 1,
                'name': 'Orange France',
                'enterprise_id': '380 129 866 46850',
                'email': '',
                'description': '',
                'address_street': "6 place d'Alleray",
                'address_city': 'Paris',
                'address_zip': '75015',
                'address_country': 'France',
                'address_latitude': '',
                'address_longitude': '',
                'subsidiary_of': <String, dynamic>{},
                'school': <String, dynamic>{},
                'fields': [
                  {
                    'id': 214,
                    'type': 'field',
                    'label': 'IT Security',
                    'category_id': 15,
                    'category': 'Science',
                  },
                  {
                    'id': 207,
                    'type': 'field',
                    'label': 'Information Technology',
                    'category_id': 15,
                    'category': 'Science',
                  },
                  {
                    'id': 239,
                    'type': 'field',
                    'label': 'Electrical engeneering',
                    'category_id': 15,
                    'category': 'Science',
                  },
                  {
                    'id': 207,
                    'type': 'field',
                    'label': 'Information Technology',
                    'category_id': 15,
                    'category': 'Science',
                  },
                  {
                    'id': 208,
                    'type': 'field',
                    'label': 'Business management',
                    'category_id': 16,
                    'category': 'Business',
                  },
                ],
                'spoken_languages': [
                  {
                    'id': 3,
                    'tag_id': 1,
                    'label': 'English',
                    'level': 2,
                    'video_url': null,
                  },
                  {
                    'id': 4,
                    'tag_id': 2,
                    'label': 'French',
                    'level': 2,
                    'video_url': null,
                  },
                ],
                'logo_url':
                    '/uploads/images/logo/1/c89865c0-2de2-419d-bbe0-e99e20b64dc1',
                'facebook_link': '',
                'linkedin_link': '',
                'whatsapp_link': '',
              },
            },
          },
        ],
      },
    });
  }

  @override
  Future<List<JobOfferModel>> getMatchedOffers() {
    // TODO: implement getMatchedOffers
    throw UnimplementedError();
  }

  @override
  Future<List<JobOfferModel>> getRejectedOffers() {
    // TODO: implement getRejectedOffers
    throw UnimplementedError();
  }

  @override
  Future<List<SearchModel>> getSavedSearchList() {
    // TODO: implement getSavedSearchList
    throw UnimplementedError();
  }

  @override
  Future<SearchPreferencesModel> getSearchPreferences() {
    // TODO: implement getSearchPreferences
    throw UnimplementedError();
  }

  @override
  Future<JobOfferModel> postApplyOffer({required int? jobOfferId}) {
    // TODO: implement postApplyOffer
    throw UnimplementedError();
  }

  @override
  Future<SearchModel> postCreateSavedSearch({
    JobOfferModel? jobOfferForSearch,
  }) {
    // TODO: implement postCreateSavedSearch
    throw UnimplementedError();
  }

  @override
  Future<JobOfferModel> postHideOffer({required int? jobOfferId}) {
    // TODO: implement postHideOffer
    throw UnimplementedError();
  }

  @override
  Future<JsonResponse> postJobOfferViewCount({required String? jobOfferUUID}) {
    // TODO: implement postJobOfferViewCount
    throw UnimplementedError();
  }

  @override
  Future<JobOfferModel> postSaveOffer({required int? jobOfferId}) {
    // TODO: implement postSaveOffer
    throw UnimplementedError();
  }

  @override
  Future<List<JobOfferModel>> postSearchOffer({
    int? pageNumber = 1,
    JobOfferModel? jobOfferForSearch,
  }) {
    // TODO: implement postSearchOffer
    throw UnimplementedError();
  }

  @override
  Future<PaginationModel> postSearchOfferWithPagination({
    int? pageNumber = 1,
    JobOfferModel? jobOfferForSearch,
  }) {
    // TODO: implement postSearchOfferWithPagination
    throw UnimplementedError();
  }

  @override
  Future<JobOfferModel> postUnApplyOffer({required int? jobOfferId}) {
    // TODO: implement postUnApplyOffer
    throw UnimplementedError();
  }

  @override
  Future<JobOfferModel> postUnHideOffer({required int? jobOfferId}) {
    // TODO: implement postUnHideOffer
    throw UnimplementedError();
  }

  @override
  Future<JobOfferModel> postUnSaveOffer({required int? jobOfferId}) {
    // TODO: implement postUnSaveOffer
    throw UnimplementedError();
  }

  @override
  Future<SearchModel> putEditSavedSearch({JobOfferModel? jobOfferForSearch}) {
    // TODO: implement putEditSavedSearch
    throw UnimplementedError();
  }
}
