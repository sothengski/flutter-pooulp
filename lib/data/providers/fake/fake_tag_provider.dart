import 'dart:async';

import '../../data.dart';

/// Fake TagProvider that mimics the real TagProvider interface
/// without requiring a backend connection.
///
/// Best practices:
/// 1. Match the exact method signatures from the real provider
/// 2. Use Future.delayed to simulate network latency
/// 3. Return properly structured mock data using model classes
/// 4. Handle error cases appropriately
/// 5. Make it easy to switch between real and fake providers
class FakeTagProvider implements ITagProvider {
  // Simulated network delay (adjust as needed)
  static const Duration _networkDelay = Duration(milliseconds: 500);

  /// Fake getJobOfferTypes API that returns mock job offer types
  /// Matches: TagProvider.getJobOfferTypes()
  @override
  Future<List<FieldModel>> getJobOfferTypes() async {
    // Simulate network delay
    await Future.delayed(_networkDelay);

    // Return mock job offer types response
    final List<Map<String, dynamic>> mockData = [
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
    ];

    return mockData.map((json) => FieldModel.fromJson(json)).toList();
  }

  /// Fake getAllFields API that returns mock all fields
  /// Matches: TagProvider.getAllFields()
  @override
  Future<List<FieldModel>> getAllFields() async {
    // Simulate network delay
    await Future.delayed(_networkDelay);

    // Return mock all fields response
    final List<Map<String, dynamic>> mockData = [
      {'id': 104, 'type': 'field', 'label': 'Finance', 'category': 'Business'},
      {
        'id': 109,
        'type': 'field',
        'label': 'Communication',
        'category': 'Business',
      },
      {
        'id': 207,
        'type': 'field',
        'label': 'Information Technology',
        'category': 'Science',
      },
      {
        'id': 208,
        'type': 'field',
        'label': 'Business management',
        'category': 'Business',
      },
      {
        'id': 209,
        'type': 'field',
        'label': 'Marketing',
        'category': 'Business',
      },
      {
        'id': 210,
        'type': 'field',
        'label': 'Mathematics',
        'category': 'Science',
      },
      {'id': 211, 'type': 'field', 'label': 'Chemistry', 'category': 'Science'},
      {'id': 212, 'type': 'field', 'label': 'Physics', 'category': 'Science'},
      {'id': 213, 'type': 'field', 'label': 'Literature', 'category': 'Arts'},
      {
        'id': 214,
        'type': 'field',
        'label': 'IT Security',
        'category': 'Science',
      },
      {'id': 215, 'type': 'field', 'label': 'Art', 'category': 'Arts'},
      {
        'id': 216,
        'type': 'field',
        'label': 'Architecture',
        'category': 'Science',
      },
      {
        'id': 217,
        'type': 'field',
        'label': 'Business engeenering',
        'category': 'Business',
      },
      {
        'id': 218,
        'type': 'field',
        'label': 'Hospitality',
        'category': 'Services',
      },
      {'id': 219, 'type': 'field', 'label': 'Cooking', 'category': 'Services'},
      {'id': 220, 'type': 'field', 'label': 'Medecine', 'category': 'Science'},
      {'id': 221, 'type': 'field', 'label': 'Pharmacy', 'category': 'Science'},
      {'id': 222, 'type': 'field', 'label': 'Army', 'category': 'Services'},
      {
        'id': 223,
        'type': 'field',
        'label': 'Agriculture/Farming',
        'category': 'Agriculture',
      },
      {
        'id': 224,
        'type': 'field',
        'label': 'Civil engeenering',
        'category': 'Science',
      },
      {'id': 225, 'type': 'field', 'label': 'Sport', 'category': 'Science'},
      {'id': 226, 'type': 'field', 'label': 'Audio visual', 'category': 'Arts'},
      {
        'id': 227,
        'type': 'field',
        'label': 'Bio engeenering',
        'category': 'Science',
      },
      {
        'id': 228,
        'type': 'field',
        'label': 'Design/Graphism',
        'category': 'Arts',
      },
      {'id': 229, 'type': 'field', 'label': 'Languages', 'category': 'Culture'},
      {'id': 230, 'type': 'field', 'label': 'Ciminal Law', 'category': 'Law'},
      {'id': 231, 'type': 'field', 'label': 'Civil Law', 'category': 'Law'},
      {'id': 232, 'type': 'field', 'label': 'Business Law', 'category': 'Law'},
      {
        'id': 233,
        'type': 'field',
        'label': 'International Law',
        'category': 'Law',
      },
      {
        'id': 234,
        'type': 'field',
        'label': 'HR/Administration',
        'category': 'Business',
      },
      {
        'id': 235,
        'type': 'field',
        'label': 'Politic science',
        'category': 'Law',
      },
      {
        'id': 236,
        'type': 'field',
        'label': 'Psychology',
        'category': 'Science',
      },
      {
        'id': 237,
        'type': 'field',
        'label': 'Digital marketing',
        'category': 'Business',
      },
      {
        'id': 238,
        'type': 'field',
        'label': 'Inudstrial engeneering',
        'category': 'Science',
      },
      {
        'id': 239,
        'type': 'field',
        'label': 'Electrical engeneering',
        'category': 'Science',
      },
      {
        'id': 240,
        'type': 'field',
        'label': 'Civil engeneering',
        'category': 'Science',
      },
      {
        'id': 241,
        'type': 'field',
        'label': 'Sewing',
        'category': 'Arts and crafts',
      },
      {
        'id': 242,
        'type': 'field',
        'label': 'Higher School Preparatory Classes',
        'category': 'Science',
      },
    ];

    return mockData.map((json) => FieldModel.fromJson(json)).toList();
  }

  /// Fake getAvailabilitiesTags API that returns mock availability tags
  /// Matches: TagProvider.getAvailabilitiesTags()
  @override
  Future<List<FieldModel>> getAvailabilitiesTags() async {
    // Simulate network delay
    await Future.delayed(_networkDelay);

    // Return mock availability tags response
    final List<Map<String, dynamic>> mockData = [
      {'id': 508, 'type': 'availability', 'label': 'Week'},
      {'id': 509, 'type': 'availability', 'label': 'Weekend'},
      {'id': 510, 'type': 'availability', 'label': 'Morning'},
      {'id': 511, 'type': 'availability', 'label': 'Afternoon'},
      {'id': 512, 'type': 'availability', 'label': 'Evening'},
    ];

    return mockData.map((json) => FieldModel.fromJson(json)).toList();
  }

  /// Fake getExperienceTypes API that returns mock experience types
  /// Matches: TagProvider.getExperienceTypes()
  @override
  Future<List<FieldModel>> getExperienceTypes() async {
    // Simulate network delay
    await Future.delayed(_networkDelay);

    // Return mock experience types response
    final List<Map<String, dynamic>> mockData = [
      {
        'id': 246,
        'type': 'experience',
        'label': 'Volunteering',
        'category_id': 24,
        'category': 'Personal experience',
      },
      {
        'id': 247,
        'type': 'experience',
        'label': 'Trip',
        'category_id': 24,
        'category': 'Personal experience',
      },
      {
        'id': 248,
        'type': 'experience',
        'label': 'Sport',
        'category_id': 24,
        'category': 'Personal experience',
      },
      {
        'id': 249,
        'type': 'experience',
        'label': 'Hobby',
        'category_id': 24,
        'category': 'Personal experience',
      },
    ];

    return mockData.map((json) => FieldModel.fromJson(json)).toList();
  }

  /// Fake getHardAndSoftSkills API that returns mock hard and soft skills
  /// Matches: TagProvider.getHardAndSoftSkills()
  @override
  Future<List<FieldModel>> getHardAndSoftSkills() async {
    // Simulate network delay
    await Future.delayed(_networkDelay);

    // Combine hard and soft skills
    final hardSkills = await getOnlyHardSkills();
    final softSkills = await getOnlySoftSkills();
    return [...hardSkills, ...softSkills];
  }

  /// Fake getInternshipPeriodTags API that returns mock internship period tags
  /// Matches: TagProvider.getInternshipPeriodTags()
  @override
  Future<List<FieldModel>> getInternshipPeriodTags() async {
    // Simulate network delay
    await Future.delayed(_networkDelay);

    // Return mock internship period tags
    final List<Map<String, dynamic>> mockData = [
      {
        'id': 1,
        'type': 'internship_period',
        'label': 'Summer (June - August)',
        'category_id': 25,
        'category': 'Internship Periods',
      },
      {
        'id': 2,
        'type': 'internship_period',
        'label': 'Fall (September - November)',
        'category_id': 25,
        'category': 'Internship Periods',
      },
      {
        'id': 3,
        'type': 'internship_period',
        'label': 'Winter (December - February)',
        'category_id': 25,
        'category': 'Internship Periods',
      },
      {
        'id': 4,
        'type': 'internship_period',
        'label': 'Spring (March - May)',
        'category_id': 25,
        'category': 'Internship Periods',
      },
      {
        'id': 5,
        'type': 'internship_period',
        'label': 'Full Year',
        'category_id': 25,
        'category': 'Internship Periods',
      },
    ];

    return mockData.map((json) => FieldModel.fromJson(json)).toList();
  }

  /// Fake getInternshipTypeTags API that returns mock internship type tags
  /// Matches: TagProvider.getInternshipTypeTags()
  @override
  Future<List<FieldModel>> getInternshipTypeTags() async {
    // Simulate network delay
    await Future.delayed(_networkDelay);

    // Return mock internship type tags
    final List<Map<String, dynamic>> mockData = [
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
      {
        'id': 3,
        'type': 'internship_type',
        'label': 'Part-time Internship',
        'category_id': 24,
        'category': 'Internship Types',
      },
      {
        'id': 4,
        'type': 'internship_type',
        'label': 'Full-time Internship',
        'category_id': 24,
        'category': 'Internship Types',
      },
    ];

    return mockData.map((json) => FieldModel.fromJson(json)).toList();
  }

  /// Fake getLanguages API that returns mock languages
  /// Matches: TagProvider.getLanguages()
  @override
  Future<List<FieldModel>> getLanguages() async {
    // Simulate network delay
    await Future.delayed(_networkDelay);

    // Return mock languages response
    final List<Map<String, dynamic>> mockData = [
      {
        'id': 1,
        'type': 'language',
        'label': 'English',
        'category_id': 1,
        'category': 'Language',
      },
      {
        'id': 2,
        'type': 'language',
        'label': 'French',
        'category_id': 1,
        'category': 'Language',
      },
      {
        'id': 3,
        'type': 'language',
        'label': 'Dutch',
        'category_id': 1,
        'category': 'Language',
      },
      {
        'id': 4,
        'type': 'language',
        'label': 'German',
        'category_id': 1,
        'category': 'Language',
      },
      {
        'id': 5,
        'type': 'language',
        'label': 'Italian',
        'category_id': 1,
        'category': 'Language',
      },
      {
        'id': 6,
        'type': 'language',
        'label': 'Spanish',
        'category_id': 1,
        'category': 'Language',
      },
      {
        'id': 7,
        'type': 'language',
        'label': 'Arabic',
        'category_id': 1,
        'category': 'Language',
      },
      {
        'id': 8,
        'type': 'language',
        'label': 'Chinese (Simplified)',
        'category_id': 1,
        'category': 'Language',
      },
      {
        'id': 9,
        'type': 'language',
        'label': 'Chinese (Traditional)',
        'category_id': 1,
        'category': 'Language',
      },
      {
        'id': 10,
        'type': 'language',
        'label': 'Khmer',
        'category_id': 1,
        'category': 'Language',
      },
      {
        'id': 11,
        'type': 'language',
        'label': 'Russian',
        'category_id': 1,
        'category': 'Language',
      },
      {
        'id': 12,
        'type': 'language',
        'label': 'Thai',
        'category_id': 1,
        'category': 'Language',
      },
      {
        'id': 13,
        'type': 'language',
        'label': 'Vietnamese',
        'category_id': 1,
        'category': 'Language',
      },
    ];

    return mockData.map((json) => FieldModel.fromJson(json)).toList();
  }

  /// Fake getOnlyHardSkills API that returns mock hard skills
  /// Matches: TagProvider.getOnlyHardSkills()
  @override
  Future<List<FieldModel>> getOnlyHardSkills() async {
    // Simulate network delay
    await Future.delayed(_networkDelay);

    // Return mock hard skills response
    final List<Map<String, dynamic>> mockData = [
      {
        'id': 15,
        'label': 'Power Point',
        'type_id': 1,
        'type': 'hard skill',
        'category_id': 1,
        'category': 'tools and technologies',
      },
      {
        'id': 16,
        'type': 'hard skill',
        'label': 'Excel',
        'category': 'tools and technologies',
      },
      {
        'id': 17,
        'type': 'hard skill',
        'label': 'Word',
        'category': 'tools and technologies',
      },
      {
        'id': 18,
        'type': 'hard skill',
        'label': 'LucidChart',
        'category': 'tools and technologies',
      },
      {
        'id': 19,
        'type': 'hard skill',
        'label': 'iOS/Swift',
        'category': 'Programming',
      },
      {
        'id': 20,
        'type': 'hard skill',
        'label': 'Android/Java',
        'category': 'Programming',
      },
      {
        'id': 21,
        'type': 'hard skill',
        'label': 'Android/Kotlin',
        'category': 'Programming',
      },
      {'id': 22, 'type': 'hard skill', 'label': 'C', 'category': 'Programming'},
      {
        'id': 23,
        'type': 'hard skill',
        'label': 'C++',
        'category': 'Programming',
      },
      {
        'id': 24,
        'type': 'hard skill',
        'label': 'C#',
        'category': 'Programming',
      },
      {
        'id': 25,
        'type': 'hard skill',
        'label': 'HTML',
        'category': 'Programming',
      },
      {
        'id': 26,
        'type': 'hard skill',
        'label': 'CSS',
        'category': 'Programming',
      },
      {
        'id': 27,
        'type': 'hard skill',
        'label': 'Wordpress',
        'category': 'Programming',
      },
      {
        'id': 28,
        'type': 'hard skill',
        'label': 'Joomla',
        'category': 'Programming',
      },
      {
        'id': 29,
        'type': 'hard skill',
        'label': 'php',
        'category': 'Programming',
      },
      {
        'id': 30,
        'type': 'hard skill',
        'label': 'Symfony',
        'category': 'Programming',
      },
      {
        'id': 31,
        'type': 'hard skill',
        'label': 'Laravel',
        'category': 'Programming',
      },
      {
        'id': 32,
        'type': 'hard skill',
        'label': 'Lumen',
        'category': 'Programming',
      },
      {
        'id': 33,
        'type': 'hard skill',
        'label': 'Javascript',
        'category': 'Programming',
      },
      {
        'id': 34,
        'type': 'hard skill',
        'label': 'NodeJS',
        'category': 'Programming',
      },
      {
        'id': 35,
        'type': 'hard skill',
        'label': 'ExpressJS',
        'category': 'Programming',
      },
      {
        'id': 36,
        'type': 'hard skill',
        'label': 'Java',
        'category': 'Programming',
      },
      {
        'id': 37,
        'type': 'hard skill',
        'label': 'Django',
        'category': 'Programming',
      },
      {
        'id': 38,
        'type': 'hard skill',
        'label': 'Python',
        'category': 'Programming',
      },
      {
        'id': 39,
        'type': 'hard skill',
        'label': 'SQL',
        'category': 'Programming',
      },
      {
        'id': 40,
        'type': 'hard skill',
        'label': 'MySQL',
        'category': 'Programming',
      },
      {
        'id': 41,
        'type': 'hard skill',
        'label': 'MongoDB',
        'category': 'Programming',
      },
      {
        'id': 42,
        'type': 'hard skill',
        'label': 'MariaDB',
        'category': 'Programming',
      },
      {
        'id': 43,
        'type': 'hard skill',
        'label': 'Docker',
        'category': 'tools and technologies',
      },
      {
        'id': 44,
        'type': 'hard skill',
        'label': 'Kubernetes',
        'category': 'tools and technologies',
      },
      {
        'id': 45,
        'type': 'hard skill',
        'label': 'CRM Platform',
        'category': 'tools and technologies',
      },
      {
        'id': 46,
        'type': 'hard skill',
        'label': 'Microsoft Office',
        'category': 'tools and technologies',
      },
      {
        'id': 47,
        'type': 'hard skill',
        'label': 'Google drive',
        'category': 'tools and technologies',
      },
      {
        'id': 48,
        'type': 'hard skill',
        'label': 'Database management',
        'category': 'tools and technologies',
      },
      {
        'id': 49,
        'type': 'hard skill',
        'label': 'BPMN',
        'category': 'tools and technologies',
      },
      {
        'id': 50,
        'type': 'hard skill',
        'label': 'Social media marketing ',
        'category': 'Marketing and communication',
      },
      {
        'id': 51,
        'type': 'hard skill',
        'label': 'Copywriting',
        'category': 'Marketing and communication',
      },
      {
        'id': 52,
        'type': 'hard skill',
        'label': 'Video',
        'category': 'Marketing and communication',
      },
      {
        'id': 53,
        'type': 'hard skill',
        'label': 'Photo ',
        'category': 'Marketing and communication',
      },
      {
        'id': 54,
        'type': 'hard skill',
        'label': 'Market study',
        'category': 'Marketing and communication',
      },
      {
        'id': 55,
        'type': 'hard skill',
        'label': 'Presentations',
        'category': 'Marketing and communication',
      },
      {
        'id': 56,
        'type': 'hard skill',
        'label': 'E-mailings',
        'category': 'Marketing and communication',
      },
      {
        'id': 57,
        'type': 'hard skill',
        'label': 'Telemarketing',
        'category': 'Marketing and communication',
      },
      {
        'id': 58,
        'type': 'hard skill',
        'label': 'Paid social media advertising',
        'category': 'Marketing and communication',
      },
      {
        'id': 59,
        'type': 'hard skill',
        'label': 'Data Analysis',
        'category': 'IT',
      },
      {'id': 60, 'type': 'hard skill', 'label': 'Website', 'category': 'IT'},
      {
        'id': 61,
        'type': 'hard skill',
        'label': 'Programmation',
        'category': 'IT',
      },
      {
        'id': 62,
        'type': 'hard skill',
        'label': 'SEO',
        'category': 'Marketing and communication',
      },
      {
        'id': 63,
        'type': 'hard skill',
        'label': 'SEM',
        'category': 'Marketing and communication',
      },
      {
        'id': 64,
        'type': 'hard skill',
        'label': 'AdWords',
        'category': 'Marketing and communication',
      },
      {'id': 65, 'type': 'hard skill', 'label': 'E-trade', 'category': 'IT'},
      {
        'id': 66,
        'type': 'hard skill',
        'label': 'Applications',
        'category': 'IT',
      },
      {
        'id': 67,
        'type': 'hard skill',
        'label': 'CV',
        'category': 'HR and adminstration',
      },
      {
        'id': 68,
        'type': 'hard skill',
        'label': 'Motivation letter',
        'category': 'HR and adminstration',
      },
      {
        'id': 69,
        'type': 'hard skill',
        'label': 'Reception',
        'category': 'HR and adminstration',
      },
      {
        'id': 70,
        'type': 'hard skill',
        'label': 'Billing assistance',
        'category': 'HR and adminstration',
      },
      {
        'id': 71,
        'type': 'hard skill',
        'label': 'Secretary',
        'category': 'HR and adminstration',
      },
      {
        'id': 72,
        'type': 'hard skill',
        'label': 'Client management',
        'category': 'HR and adminstration',
      },
      {
        'id': 73,
        'type': 'hard skill',
        'label': 'Translation',
        'category': 'HR and adminstration',
      },
      {
        'id': 74,
        'type': 'hard skill',
        'label': 'Editing',
        'category': 'HR and adminstration',
      },
      {
        'id': 75,
        'type': 'hard skill',
        'label': 'Layout',
        'category': 'HR and adminstration',
      },
      {
        'id': 76,
        'type': 'hard skill',
        'label': 'Rewording',
        'category': 'HR and adminstration',
      },
      {
        'id': 77,
        'type': 'hard skill',
        'label': 'Research',
        'category': 'HR and adminstration',
      },
      {
        'id': 78,
        'type': 'hard skill',
        'label': 'Videos',
        'category': 'Audiovisuel',
      },
      {
        'id': 79,
        'type': 'hard skill',
        'label': 'Photography',
        'category': 'Audiovisuel',
      },
      {
        'id': 80,
        'type': 'hard skill',
        'label': 'Sound effects',
        'category': 'Audiovisuel',
      },
      {
        'id': 81,
        'type': 'hard skill',
        'label': 'Music edition',
        'category': 'Audiovisuel',
      },
      {
        'id': 82,
        'type': 'hard skill',
        'label': 'Audio edition',
        'category': 'Audiovisuel',
      },
      {
        'id': 83,
        'type': 'hard skill',
        'label': 'Subtitles',
        'category': 'Audiovisuel',
      },
      {
        'id': 84,
        'type': 'hard skill',
        'label': 'Voicing',
        'category': 'Audiovisuel',
      },
      {
        'id': 85,
        'type': 'hard skill',
        'label': '3D Animation',
        'category': 'Audiovisuel',
      },
      {
        'id': 86,
        'type': 'hard skill',
        'label': 'Adobe Illustrator',
        'category': 'Design/Graphism',
      },
      {
        'id': 87,
        'type': 'hard skill',
        'label': 'Drawing',
        'category': 'Design/Graphism',
      },
      {
        'id': 88,
        'type': 'hard skill',
        'label': 'Adobe XD',
        'category': 'Design/Graphism',
      },
      {
        'id': 89,
        'type': 'hard skill',
        'label': 'Adobe Photoshop',
        'category': 'Design/Graphism',
      },
      {
        'id': 90,
        'type': 'hard skill',
        'label': 'InDesign',
        'category': ' Design/Graphism',
      },
      {
        'id': 91,
        'type': 'hard skill',
        'label': 'Merchandising',
        'category': 'Design/Graphism',
      },
      {
        'id': 92,
        'type': 'hard skill',
        'label': 'Architectural Plan',
        'category': 'Design/Graphism',
      },
      {
        'id': 93,
        'type': 'hard skill',
        'label': 'AutoCAD',
        'category': 'Design/Graphism',
      },
      {
        'id': 94,
        'type': 'hard skill',
        'label': 'Web Design',
        'category': 'Design/Graphism',
      },
      {
        'id': 95,
        'type': 'hard skill',
        'label': 'Law Advisor',
        'category': 'Legal',
      },
      {
        'id': 96,
        'type': 'hard skill',
        'label': 'Legal content writing',
        'category': 'Legal',
      },
      {
        'id': 97,
        'type': 'hard skill',
        'label': 'Legal research',
        'category': 'Legal',
      },
      {
        'id': 98,
        'type': 'hard skill',
        'label': 'Law Analysis',
        'category': 'Legal',
      },
      {
        'id': 99,
        'type': 'hard skill',
        'label': 'Trial Summary',
        'category': 'Legal',
      },
      {
        'id': 100,
        'type': 'hard skill',
        'label': 'Prototyping',
        'category': 'Technical',
      },
      {
        'id': 101,
        'type': 'hard skill',
        'label': 'Workflow development',
        'category': 'Technical',
      },
      {
        'id': 102,
        'type': 'hard skill',
        'label': 'Budgeting',
        'category': 'Management',
      },
      {
        'id': 103,
        'type': 'hard skill',
        'label': 'Project management',
        'category': 'Management',
      },
      {
        'id': 105,
        'type': 'hard skill',
        'label': 'Logistics',
        'category': 'Management',
      },
      {
        'id': 106,
        'type': 'hard skill',
        'label': 'Planning',
        'category': 'Management',
      },
      {
        'id': 107,
        'type': 'hard skill',
        'label': 'Scrum',
        'category': 'Project Management',
      },
      {
        'id': 108,
        'type': 'hard skill',
        'label': 'Agile',
        'category': 'Project Management',
      },
    ];

    return mockData.map((json) => FieldModel.fromJson(json)).toList();
  }

  /// Fake getOnlySoftSkills API that returns mock soft skills
  /// Matches: TagProvider.getOnlySoftSkills()
  @override
  Future<List<FieldModel>> getOnlySoftSkills() async {
    // Simulate network delay
    await Future.delayed(_networkDelay);

    // Return mock soft skills response
    final List<Map<String, dynamic>> mockData = [
      {
        'id': 110,
        'type': 'soft skill',
        'label': 'Persuasion',
        'category': 'Soft skills',
      },
      {
        'id': 111,
        'type': 'soft skill',
        'label': 'Responsability',
        'category': 'Soft skills',
      },
      {
        'id': 112,
        'type': 'soft skill',
        'label': 'Confidence',
        'category': 'Soft skills',
      },
      {
        'id': 113,
        'type': 'soft skill',
        'label': 'Resilience',
        'category': 'Soft skills',
      },
      {
        'id': 114,
        'type': 'soft skill',
        'label': 'Collaboration',
        'category': 'Soft skills',
      },
      {
        'id': 115,
        'type': 'soft skill',
        'label': 'Feedback',
        'category': 'Soft skills',
      },
      {
        'id': 116,
        'type': 'soft skill',
        'label': 'Time management',
        'category': 'Soft skills',
      },
      {
        'id': 117,
        'type': 'soft skill',
        'label': 'Lifelong learning',
        'category': 'Soft skills',
      },
      {
        'id': 118,
        'type': 'soft skill',
        'label': 'Diligence',
        'category': 'Soft skills',
      },
      {
        'id': 119,
        'type': 'soft skill',
        'label': 'Ideation',
        'category': 'Soft skills',
      },
      {
        'id': 120,
        'type': 'soft skill',
        'label': 'Teamwork',
        'category': 'Soft skills',
      },
      {
        'id': 121,
        'type': 'soft skill',
        'label': 'Clear communication',
        'category': 'Soft skills',
      },
      {
        'id': 122,
        'type': 'soft skill',
        'label': 'Empathy',
        'category': 'Soft skills',
      },
      {
        'id': 123,
        'type': 'soft skill',
        'label': 'Active listening',
        'category': 'Soft skills',
      },
      {
        'id': 124,
        'type': 'soft skill',
        'label': 'Ability to influence',
        'category': 'Soft skills',
      },
      {
        'id': 125,
        'type': 'soft skill',
        'label': 'Organization',
        'category': 'Soft skills',
      },
      {
        'id': 126,
        'type': 'soft skill',
        'label': 'Relationship management',
        'category': 'Soft skills',
      },
      {
        'id': 127,
        'type': 'soft skill',
        'label': 'Compassion',
        'category': 'Soft skills',
      },
      {
        'id': 128,
        'type': 'soft skill',
        'label': 'Interpersonal communication',
        'category': 'Soft skills',
      },
      {
        'id': 129,
        'type': 'soft skill',
        'label': 'Conflict resolution',
        'category': 'Soft skills',
      },
      {
        'id': 130,
        'type': 'soft skill',
        'label': 'Equity',
        'category': 'Soft skills',
      },
      {
        'id': 131,
        'type': 'soft skill',
        'label': 'Trustworthy',
        'category': 'Soft skills',
      },
      {
        'id': 132,
        'type': 'soft skill',
        'label': 'Adaptability',
        'category': 'Soft skills',
      },
      {
        'id': 133,
        'type': 'soft skill',
        'label': 'Flexibility',
        'category': 'Soft skills',
      },
      {
        'id': 134,
        'type': 'soft skill',
        'label': 'Patience',
        'category': 'Soft skills',
      },
      {
        'id': 135,
        'type': 'soft skill',
        'label': 'Pragmatic approach',
        'category': 'Soft skills',
      },
      {
        'id': 136,
        'type': 'soft skill',
        'label': 'Persistence',
        'category': 'Soft skills',
      },
      {
        'id': 137,
        'type': 'soft skill',
        'label': 'Humility',
        'category': 'Soft skills',
      },
      {
        'id': 138,
        'type': 'soft skill',
        'label': 'Leadership',
        'category': 'Soft skills',
      },
      {
        'id': 139,
        'type': 'soft skill',
        'label': 'Self-Starter',
        'category': 'Soft skills',
      },
      {
        'id': 140,
        'type': 'soft skill',
        'label': 'Problem-solving',
        'category': 'Soft skills',
      },
      {
        'id': 141,
        'type': 'soft skill',
        'label': 'Creativity',
        'category': 'Soft skills',
      },
      {
        'id': 142,
        'type': 'soft skill',
        'label': 'Work ethic',
        'category': 'Soft skills',
      },
      {
        'id': 143,
        'type': 'soft skill',
        'label': 'Verbal communication',
        'category': 'Soft skills',
      },
      {
        'id': 144,
        'type': 'soft skill',
        'label': 'Non-verbal communication',
        'category': 'Soft skills',
      },
      {
        'id': 145,
        'type': 'soft skill',
        'label': 'Written communication',
        'category': 'Soft skills',
      },
      {
        'id': 146,
        'type': 'soft skill',
        'label': 'Friendliness',
        'category': 'Soft skills',
      },
      {
        'id': 147,
        'type': 'soft skill',
        'label': 'Delegation',
        'category': 'Soft skills',
      },
      {
        'id': 148,
        'type': 'soft skill',
        'label': 'Listening',
        'category': 'Soft skills',
      },
      {
        'id': 149,
        'type': 'soft skill',
        'label': 'Cooperation',
        'category': 'Soft skills',
      },
      {
        'id': 150,
        'type': 'soft skill',
        'label': 'Coordination',
        'category': 'Soft skills',
      },
      {
        'id': 151,
        'type': 'soft skill',
        'label': 'Idea exchange',
        'category': 'Soft skills',
      },
      {
        'id': 152,
        'type': 'soft skill',
        'label': 'Mediation',
        'category': 'Soft skills',
      },
      {
        'id': 153,
        'type': 'soft skill',
        'label': 'Negotiating',
        'category': 'Soft skills',
      },
      {
        'id': 154,
        'type': 'soft skill',
        'label': 'Curiosity',
        'category': 'Soft skills',
      },
      {
        'id': 155,
        'type': 'soft skill',
        'label': 'Self-management',
        'category': 'Soft skills',
      },
      {
        'id': 156,
        'type': 'soft skill',
        'label': 'Decision-making',
        'category': 'Soft skills',
      },
      {
        'id': 157,
        'type': 'soft skill',
        'label': 'Calmness',
        'category': 'Soft skills',
      },
      {
        'id': 158,
        'type': 'soft skill',
        'label': 'Optimism',
        'category': 'Soft skills',
      },
      {
        'id': 159,
        'type': 'soft skill',
        'label': 'Open-mindedness',
        'category': 'Soft skills',
      },
      {
        'id': 160,
        'type': 'soft skill',
        'label': 'Analysis',
        'category': 'Soft skills',
      },
      {
        'id': 161,
        'type': 'soft skill',
        'label': 'Self-confidence',
        'category': 'Soft skills',
      },
      {
        'id': 162,
        'type': 'soft skill',
        'label': 'Self-motivation',
        'category': 'Soft skills',
      },
      {
        'id': 163,
        'type': 'soft skill',
        'label': 'Lateral thinking',
        'category': 'Soft skills',
      },
      {
        'id': 164,
        'type': 'soft skill',
        'label': 'Logical reasoning',
        'category': 'Soft skills',
      },
      {
        'id': 165,
        'type': 'soft skill',
        'label': 'Initiative',
        'category': 'Soft skills',
      },
      {
        'id': 166,
        'type': 'soft skill',
        'label': 'Observation',
        'category': 'Soft skills',
      },
      {
        'id': 167,
        'type': 'soft skill',
        'label': 'Brainstorming',
        'category': 'Soft skills',
      },
      {
        'id': 168,
        'type': 'soft skill',
        'label': 'Divergent thinking',
        'category': 'Soft skills',
      },
      {
        'id': 169,
        'type': 'soft skill',
        'label': 'Inspiration',
        'category': 'Soft skills',
      },
      {
        'id': 170,
        'type': 'soft skill',
        'label': 'Imagination',
        'category': 'Soft skills',
      },
      {
        'id': 171,
        'type': 'soft skill',
        'label': 'Reframing',
        'category': 'Soft skills',
      },
      {
        'id': 172,
        'type': 'soft skill',
        'label': 'Mind mapping',
        'category': 'Soft skills',
      },
      {
        'id': 173,
        'type': 'soft skill',
        'label': 'Insight',
        'category': 'Soft skills',
      },
      {
        'id': 174,
        'type': 'soft skill',
        'label': 'Innovation',
        'category': 'Soft skills',
      },
      {
        'id': 175,
        'type': 'soft skill',
        'label': 'Experimenting',
        'category': 'Soft skills',
      },
      {
        'id': 176,
        'type': 'soft skill',
        'label': 'Questioning',
        'category': 'Soft skills',
      },
      {
        'id': 177,
        'type': 'soft skill',
        'label': 'Integrity',
        'category': 'Soft skills',
      },
      {
        'id': 178,
        'type': 'soft skill',
        'label': 'Discipline',
        'category': 'Soft skills',
      },
      {
        'id': 179,
        'type': 'soft skill',
        'label': 'Dependability',
        'category': 'Soft skills',
      },
      {
        'id': 180,
        'type': 'soft skill',
        'label': 'Commitment',
        'category': 'Soft skills',
      },
      {
        'id': 181,
        'type': 'soft skill',
        'label': 'Professionalism',
        'category': 'Soft skills',
      },
      {
        'id': 182,
        'type': 'soft skill',
        'label': 'Humor',
        'category': 'Soft skills',
      },
      {
        'id': 183,
        'type': 'soft skill',
        'label': 'Mentoring',
        'category': 'Soft skills',
      },
      {
        'id': 184,
        'type': 'soft skill',
        'label': 'Networking',
        'category': 'Soft skills',
      },
      {
        'id': 185,
        'type': 'soft skill',
        'label': 'Sensitivity',
        'category': 'Soft skills',
      },
      {
        'id': 186,
        'type': 'soft skill',
        'label': 'Tolerence',
        'category': 'Soft skills',
      },
      {
        'id': 187,
        'type': 'soft skill',
        'label': 'Public speaking',
        'category': 'Soft skills',
      },
      {
        'id': 188,
        'type': 'soft skill',
        'label': 'Positive reinforcement',
        'category': 'Soft skills',
      },
      {
        'id': 189,
        'type': 'soft skill',
        'label': 'Diplomacy',
        'category': 'Soft skills',
      },
      {
        'id': 190,
        'type': 'soft skill',
        'label': 'Goal setting',
        'category': 'Soft skills',
      },
      {
        'id': 191,
        'type': 'soft skill',
        'label': 'Prioritizing',
        'category': 'Soft skills',
      },
      {
        'id': 192,
        'type': 'soft skill',
        'label': 'Focus',
        'category': 'Soft skills',
      },
      {
        'id': 193,
        'type': 'soft skill',
        'label': 'Stress management',
        'category': 'Soft skills',
      },
      {
        'id': 194,
        'type': 'soft skill',
        'label': 'Coping',
        'category': 'Soft skills',
      },
      {
        'id': 195,
        'type': 'soft skill',
        'label': 'Cultural intelligence',
        'category': 'Soft skills',
      },
      {
        'id': 196,
        'type': 'soft skill',
        'label': 'Authenticity',
        'category': 'Soft skills',
      },
      {
        'id': 197,
        'type': 'soft skill',
        'label': 'Versatility',
        'category': 'Soft skills',
      },
      {
        'id': 198,
        'type': 'soft skill',
        'label': 'Generosity',
        'category': 'Soft skills',
      },
      {
        'id': 199,
        'type': 'soft skill',
        'label': 'Trust',
        'category': 'Soft skills',
      },
      {
        'id': 200,
        'type': 'soft skill',
        'label': 'Mentorship',
        'category': 'Soft skills',
      },
      {
        'id': 201,
        'type': 'soft skill',
        'label': 'Hiring',
        'category': 'Soft skills',
      },
      {
        'id': 202,
        'type': 'soft skill',
        'label': 'Critical observation',
        'category': 'Soft skills',
      },
      {
        'id': 203,
        'type': 'soft skill',
        'label': 'Scheduling',
        'category': 'Soft skills',
      },
      {
        'id': 204,
        'type': 'soft skill',
        'label': 'Introspection',
        'category': 'Soft skills',
      },
      {
        'id': 205,
        'type': 'soft skill',
        'label': 'Memory',
        'category': 'Soft skills',
      },
      {
        'id': 206,
        'type': 'soft skill',
        'label': 'Acuity',
        'category': 'Soft skills',
      },
    ];

    return mockData.map((json) => FieldModel.fromJson(json)).toList();
  }

  /// Fake getSchoolDegreeTags API that returns mock school degree tags
  /// Matches: TagProvider.getSchoolDegreeTags()
  @override
  Future<List<FieldModel>> getSchoolDegreeTags() async {
    // Simulate network delay
    await Future.delayed(_networkDelay);

    // Return mock school degree tags
    final List<Map<String, dynamic>> mockData = [
      {
        'id': 1,
        'type': 'degree',
        'label': 'High School Diploma',
        'category_id': 26,
        'category': 'School Degrees',
      },
      {
        'id': 2,
        'type': 'degree',
        'label': "Bachelor's Degree",
        'category_id': 26,
        'category': 'School Degrees',
      },
      {
        'id': 3,
        'type': 'degree',
        'label': "Master's Degree",
        'category_id': 26,
        'category': 'School Degrees',
      },
      {
        'id': 4,
        'type': 'degree',
        'label': 'PhD',
        'category_id': 26,
        'category': 'School Degrees',
      },
      {
        'id': 5,
        'type': 'degree',
        'label': 'Associate Degree',
        'category_id': 26,
        'category': 'School Degrees',
      },
    ];

    return mockData.map((json) => FieldModel.fromJson(json)).toList();
  }

  /// Fake getSchools API that returns mock schools
  /// Matches: TagProvider.getSchools()
  @override
  Future<List<SchoolModel>> getSchools() async {
    // Simulate network delay
    await Future.delayed(_networkDelay);

    // Return mock schools
    final List<Map<String, dynamic>> mockData = [
      {
        'id': 1,
        'name': 'University of Brussels',
        'description': 'A leading university in Belgium',
        'website': 'https://www.ulb.be',
        'address_street': 'Avenue Franklin Roosevelt 50',
        'address_city': 'Brussels',
        'address_zip': '1050',
        'address_country': 'Belgium',
        'fields': [
          {
            'id': 104,
            'type': 'field',
            'label': 'Finance',
            'category_id': 16,
            'category': 'Business',
          },
          {
            'id': 207,
            'type': 'field',
            'label': 'Information Technology',
            'category_id': 17,
            'category': 'Science',
          },
        ],
      },
      {
        'id': 2,
        'name': 'KU Leuven',
        'description': 'Catholic University of Leuven',
        'website': 'https://www.kuleuven.be',
        'address_street': 'Oude Markt 13',
        'address_city': 'Leuven',
        'address_zip': '3000',
        'address_country': 'Belgium',
        'fields': [
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
      },
      {
        'id': 3,
        'name': 'Ghent University',
        'description': 'Public research university in Ghent',
        'website': 'https://www.ugent.be',
        'address_street': 'Sint-Pietersnieuwstraat 33',
        'address_city': 'Ghent',
        'address_zip': '9000',
        'address_country': 'Belgium',
        'fields': [
          {
            'id': 208,
            'type': 'field',
            'label': 'Business management',
            'category_id': 16,
            'category': 'Business',
          },
        ],
      },
    ];

    return mockData.map((json) => SchoolModel.fromJson(json)).toList();
  }
}
