import 'dart:convert';

import '../../data.dart';

class StudentProfileModel {
  final bool? telecommuting;
  final bool? shifting;
  final int? radius;
  final bool? drivingLicense;
  final bool? hasAutomobile;
  final String? facebookLink;
  final String? linkedinLink;
  final String? whatsappLink;
  final String? youtubeLink;
  final String? gender;
  final List<SkillModel>? skills;
  final List<FieldModel>? spokenLanguages;
  final List<EducationModel>? educations;
  final List<ExperienceModel>? experiences;
  final List<AchievementModel>? achievements;
  final List<CertificateModel>? certificates;
  final List<PeriodModel>? periods;

  StudentProfileModel({
    this.telecommuting,
    this.shifting,
    this.radius,
    this.drivingLicense,
    this.hasAutomobile,
    this.facebookLink,
    this.linkedinLink,
    this.whatsappLink,
    this.youtubeLink,
    this.gender,
    this.skills,
    this.spokenLanguages,
    this.educations,
    this.experiences,
    this.achievements,
    this.certificates,
    this.periods,
  });

  double? get calculatingProfileCompleteness {
    const int fieldCounter = 8;
    const int fullPercentage = 100;
    double completePercent = 0;
    if (linkedinLink != '') {
      completePercent += fullPercentage / fieldCounter;
    }
    if (skills != null) {
      if (skills!.isNotEmpty) {
        completePercent += fullPercentage / fieldCounter;
      }
    }
    if (spokenLanguages != null) {
      if (spokenLanguages!.isNotEmpty) {
        completePercent += fullPercentage / fieldCounter;
      }
    }
    if (educations != null) {
      if (educations!.isNotEmpty) {
        completePercent += fullPercentage / fieldCounter;
      }
    }
    if (experiences != null) {
      if (experiences!.isNotEmpty) {
        completePercent += fullPercentage / fieldCounter;
      }
    }
    if (achievements != null) {
      if (achievements!.isNotEmpty) {
        completePercent += fullPercentage / fieldCounter;
      }
    }
    if (certificates != null) {
      if (certificates!.isNotEmpty) {
        completePercent += fullPercentage / fieldCounter;
      }
    }
    if (periods != null) {
      if (periods!.isNotEmpty) {
        completePercent += fullPercentage / fieldCounter;
      }
    }
    return double.tryParse(completePercent.toStringAsFixed(2));
  }

  factory StudentProfileModel.fromRawJson(String str) =>
      StudentProfileModel.fromJson(
        json.decode(str) as Map<String, dynamic>,
      );

  String toRawJson() => json.encode(toJson());

  factory StudentProfileModel.fromJson(Map<String, dynamic> json) =>
      StudentProfileModel(
        telecommuting: json['telecommuting'] as bool?,
        shifting: json['shifting'] as bool?,
        radius: json['radius'] as int?,
        drivingLicense: json['driving_license'] as bool?,
        hasAutomobile: json['has_automobile'] as bool?,
        facebookLink: json['facebook_link'] as String?,
        linkedinLink: json['linkedin_link'] as String?,
        whatsappLink: json['whatsapp_link'] as String?,
        youtubeLink: json['youtube_link'] as String?,
        gender: json['gender'] as String?,
        skills: json['skills'] != null || json['skills'] != []
            ? (json['skills'] as List)
                .map(
                  (i) => SkillModel.fromJson(
                    i as Map<String, dynamic>,
                  ),
                )
                .toList()
            : [],
        spokenLanguages:
            json['spoken_languages'] != null || json['spoken_languages'] != []
                ? (json['spoken_languages'] as List)
                    .map(
                      (i) => FieldModel.fromJson(
                        i as Map<String, dynamic>,
                      ),
                    )
                    .toList()
                : [],
        educations: json['educations'] != null || json['educations'] != []
            ? (json['educations'] as List)
                .map(
                  (i) => EducationModel.fromJson(
                    i as Map<String, dynamic>,
                  ),
                )
                .toList()
            : [],
        experiences: json['experiences'] != null || json['experiences'] != []
            ? (json['experiences'] as List)
                .map(
                  (i) => ExperienceModel.fromJson(
                    i as Map<String, dynamic>,
                  ),
                )
                .toList()
            : [],
        achievements: json['achievements'] != null || json['achievements'] != []
            ? (json['achievements'] as List)
                .map(
                  (i) => AchievementModel.fromJson(
                    i as Map<String, dynamic>,
                  ),
                )
                .toList()
            : [],
        certificates: json['certificates'] == null || json['certificates'] == []
            ? []
            : (json['certificates'] as List)
                .map(
                  (i) => CertificateModel.fromJson(
                    i as Map<String, dynamic>,
                  ),
                )
                .toList(),
        periods: json['periods'] != null || json['periods'] != []
            ? (json['periods'] as List)
                .map(
                  (i) => PeriodModel.fromJson(
                    i as Map<String, dynamic>,
                  ),
                )
                .toList()
            : [],
      );

  Map<String, dynamic> toJson() => {
        'telecommuting': telecommuting,
        'shifting': shifting,
        'radius': radius,
        'driving_license': drivingLicense,
        'has_automobile': hasAutomobile,
        'facebook_link': facebookLink,
        'linkedin_link': linkedinLink,
        'whatsapp_link': whatsappLink,
        'youtube_link': youtubeLink,
        'gender': gender,
        'skills': skills == null || skills == []
            ? null
            : List<dynamic>.from(skills!.map((x) => x.toJson())),
        'spoken_languages': spokenLanguages == null || spokenLanguages == []
            ? null
            : List<dynamic>.from(spokenLanguages!.map((x) => x.toJson())),
        'educations': educations == null || educations == []
            ? null
            : List<dynamic>.from(educations!.map((x) => x.toJson())),
        'experiences': experiences == null || experiences == []
            ? null
            : List<dynamic>.from(experiences!.map((x) => x.toJson())),
        'achievements': achievements == null || achievements == []
            ? null
            : List<dynamic>.from(achievements!.map((x) => x.toJson())),
        'certificates': certificates == null || certificates == []
            ? null
            : List<dynamic>.from(certificates!.map((x) => x.toJson())),
        'periods': periods == null || periods == []
            ? null
            : List<dynamic>.from(periods!.map((x) => x.toJson())),
      }..removeWhere((_, v) => v == null);

  @override
  String toString() {
    return '''
    StudentProfileModel(
      telecommuting: $telecommuting,
      shifting: $shifting,
      radius: $radius,
      drivingLicense: $drivingLicense,
      hasAutomobile: $hasAutomobile,
      facebookLink: $facebookLink,
      linkedinLink: $linkedinLink,
      whatsappLink: $whatsappLink,
      youtubeLink: $youtubeLink,
      gender: $gender,
      skills: $skills,
      spokenLanguages: $spokenLanguages,
      educations: $educations,
      experiences: $experiences,
      achievements: $achievements,
      certificates: $certificates,
      periods: $periods,
    )''';
  }
}

///==================== Student Profile API Schema ====================
/*
/// End point: {{base_url}}/users/me/student_profile
{
    "telecommuting": true,
    "shifting": true,
    "radius": 19,
    "driving_license": true,
    "has_automobile": true,
    "facebook_link": "facebook.com",
    "linkedin_link": "linkedin.com",
    "whatsapp_link": "whatsapp.com",
    "youtube_link": "https://www.youtube.com/watch?v=_fP43gcBywU",
    "gender": "male",
    "skills": [
        {
            "id": 15,
            "tag_id": 110,
            "label": "Persuasion",
            "category_id": 2,
            "category": "Soft skills",
            "type": "soft skill",
            "level": null
        },
        {
            "id": 16,
            "tag_id": 111,
            "label": "Responsability",
            "category_id": 2,
            "category": "Soft skills",
            "type": "soft skill",
            "level": null
        },
        {
            "id": 17,
            "tag_id": 112,
            "label": "Confidence",
            "category_id": 2,
            "category": "Soft skills",
            "type": "soft skill",
            "level": null
        },
        {
            "id": 18,
            "tag_id": 115,
            "label": "Feedback",
            "category_id": 2,
            "category": "Soft skills",
            "type": "soft skill",
            "level": null
        },
        {
            "id": 19,
            "tag_id": 28,
            "label": "Joomla",
            "category_id": 4,
            "category": "Programming",
            "type": "hard skill",
            "level": 1
        },
        {
            "id": 20,
            "tag_id": 126,
            "label": "Relationship management",
            "category_id": 2,
            "category": "Soft skills",
            "type": "soft skill",
            "level": null
        },
        {
            "id": 21,
            "tag_id": 185,
            "label": "Sensitivity",
            "category_id": 2,
            "category": "Soft skills",
            "type": "soft skill",
            "level": null
        },
        {
            "id": 22,
            "tag_id": 113,
            "label": "Resilience",
            "category_id": 2,
            "category": "Soft skills",
            "type": "soft skill",
            "level": null
        },
        {
            "id": 24,
            "tag_id": 100,
            "label": "Prototyping",
            "category_id": 12,
            "category": "Technical",
            "type": "hard skill",
            "level": 3
        },
        {
            "id": 25,
            "tag_id": 93,
            "label": "AutoCAD",
            "category_id": 9,
            "category": "Design/Graphism",
            "type": "hard skill",
            "level": 1
        },
        {
            "id": 27,
            "tag_id": 131,
            "label": "Trustworthy",
            "category_id": 2,
            "category": "Soft skills",
            "type": "soft skill",
            "level": null
        },
        {
            "id": 28,
            "tag_id": 21,
            "label": "Android/Kotlin",
            "category_id": 4,
            "category": "Programming",
            "type": "hard skill",
            "level": 1
        }
    ],
    "spoken_languages": [
        {
            "id": 1,
            "level": 3,
            "label": "English"
        },
        {
            "id": 2,
            "level": 4,
            "label": "French"
        }
    ],
    "educations": [
        {
            "id": 1,
            "name": "General engineering degree",
            "description": "I study IT and aerodynamics",
            "degree": "Master in general engineering",
            "studying_year": 3,
            "date_start": "2018-09-01",
            "date_end": "2021-09-30",
            "completed": false,
            "school": {
                "id": 2,
                "name": "Académie royale des Beaux-Arts de la Ville de Bruxelles - École supérieure des Arts",
                "description": "",
                "website": "http://www.arba-esa.be",
                "address_street": "Rue du Midi 144",
                "address_city": "BRUXELLES",
                "address_zip": "1000",
                "address_country": "Belgique",
                "fields": [
                    {
                        "id": 215,
                        "type": "field",
                        "label": "Art",
                        "category_id": 17,
                        "category": "Arts"
                    }
                ]
            },
            "fields": [
                {
                    "id": 104,
                    "type": "field",
                    "label": "Finance",
                    "category_id": 16,
                    "category": "Business"
                },
                {
                    "id": 109,
                    "type": "field",
                    "label": "Communication",
                    "category_id": 16,
                    "category": "Business"
                }
            ]
        },
        {
            "id": 2,
            "name": "Drawing",
            "description": "Drawing Skill Description",
            "degree": "Bachelor",
            "studying_year": 5,
            "date_start": "2021-12-02",
            "date_end": "2022-02-28",
            "completed": true,
            "school": {
                "id": 5,
                "name": "Arts²",
                "description": "",
                "website": "http://www.artsaucarre.be",
                "address_street": "Rue de Nimy 7",
                "address_city": "MONS",
                "address_zip": "7000",
                "address_country": "Belgique",
                "fields": [
                    {
                        "id": 215,
                        "type": "field",
                        "label": "Art",
                        "category_id": 17,
                        "category": "Arts"
                    }
                ]
            },
            "fields": []
        }
    ],
    "experiences": [
        {
            "id": 1,
            "type": "professional",
            "name": "Automation internship at Orange France",
            "description": "Through this 6-month internship in the direction of network supervision at Orange France, I develop automation solutions to improve efficiency in maintaining and restoring breakdowns on Orange's fixed networks.",
            "company": "Orange France",
            "date_start": "2020-02-14",
            "date_end": "2020-08-30",
            "completed": 0,
            "address_city": "Villeneuve d'Ascq",
            "address_country": "France",
            "job": null,
            "tags": []
        },
        {
            "id": 2,
            "type": "personal",
            "name": "Soccer",
            "description": "Soccer description",
            "company": "",
            "date_start": "2021-12-03",
            "date_end": "2021-12-25",
            "completed": 1,
            "address_city": "Phnom Penh",
            "address_country": "Cambodia",
            "job": null,
            "tags": []
        },
        {
            "id": 3,
            "type": "personal",
            "name": "Graphic design",
            "description": "",
            "company": "",
            "date_start": "2016-01-12",
            "date_end": null,
            "completed": 1,
            "address_city": "Phnom Penh",
            "address_country": "Cambodia",
            "job": null,
            "tags": []
        }
    ],
    "achievements": [
        {
            "id": 1,
            "name": "TOEIC",
            "description": "I scored 970 points out of 990 on the TOEIC.",
            "date_completion": "2019-01-26",
            "fields": [
                {
                    "id": 104,
                    "type": "field",
                    "label": "Finance",
                    "category_id": 16,
                    "category": "Business"
                },
                {
                    "id": 109,
                    "type": "field",
                    "label": "Communication",
                    "category_id": 16,
                    "category": "Business"
                },
                {
                    "id": 208,
                    "type": "field",
                    "label": "Business management",
                    "category_id": 16,
                    "category": "Business"
                }
            ]
        }
    ],
    "certificates": [
        {
            "id": 2,
            "title": "Vue Js",
            "description": "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            "received_date": "2021-12-01",
            "expiration_date": "2022-01-01"
        },
        {
            "id": 3,
            "title": "PHP",
            "description": "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            "received_date": "2020-01-01",
            "expiration_date": "2021-01-01"
        }
    ],
    "periods": [
        {
            "id": 1,
            "from": "2022-01-01",
            "to": "2022-01-01",
            "is_custom": 1,
            "weekly": [
                {
                    "day": 1,
                    "day_label": "Monday",
                    "slots": [
                        {
                            "id": 1,
                            "start_time": 28800,
                            "end_time": 43200
                        },
                        {
                            "id": 2,
                            "start_time": 50400,
                            "end_time": 64800
                        }
                    ]
                },
                {
                    "day": 2,
                    "day_label": "Tuesday",
                    "slots": [
                        {
                            "id": 3,
                            "start_time": 28800,
                            "end_time": 64800
                        }
                    ]
                },
                {
                    "day": 3,
                    "day_label": "Wednesday",
                    "slots": []
                },
                {
                    "day": 4,
                    "day_label": "Thursday",
                    "slots": []
                },
                {
                    "day": 5,
                    "day_label": "Friday",
                    "slots": []
                },
                {
                    "day": 6,
                    "day_label": "Saturday",
                    "slots": []
                },
                {
                    "day": 7,
                    "day_label": "Sunday",
                    "slots": []
                }
            ]
        },
        {
            "id": 3,
            "from": "2022-01-01",
            "to": "2022-01-01",
            "is_custom": 1,
            "weekly": [
                {
                    "day": 1,
                    "day_label": "Monday",
                    "slots": [
                        {
                            "id": 58,
                            "start_time": 28800,
                            "end_time": 43200
                        },
                        {
                            "id": 59,
                            "start_time": 50400,
                            "end_time": 64800
                        }
                    ]
                },
                {
                    "day": 2,
                    "day_label": "Tuesday",
                    "slots": [
                        {
                            "id": 60,
                            "start_time": 28800,
                            "end_time": 64800
                        }
                    ]
                },
                {
                    "day": 3,
                    "day_label": "Wednesday",
                    "slots": []
                },
                {
                    "day": 4,
                    "day_label": "Thursday",
                    "slots": []
                },
                {
                    "day": 5,
                    "day_label": "Friday",
                    "slots": []
                },
                {
                    "day": 6,
                    "day_label": "Saturday",
                    "slots": [
                        {
                            "id": 61,
                            "start_time": 3600,
                            "end_time": 28800
                        }
                    ]
                },
                {
                    "day": 7,
                    "day_label": "Sunday",
                    "slots": []
                }
            ]
        },
        {
            "id": 4,
            "from": "2022-01-01",
            "to": "2022-01-01",
            "is_custom": 1,
            "weekly": [
                {
                    "day": 1,
                    "day_label": "Monday",
                    "slots": [
                        {
                            "id": 7,
                            "start_time": 28800,
                            "end_time": 43200
                        },
                        {
                            "id": 8,
                            "start_time": 50400,
                            "end_time": 64800
                        }
                    ]
                },
                {
                    "day": 2,
                    "day_label": "Tuesday",
                    "slots": [
                        {
                            "id": 9,
                            "start_time": 28800,
                            "end_time": 64800
                        }
                    ]
                },
                {
                    "day": 3,
                    "day_label": "Wednesday",
                    "slots": []
                },
                {
                    "day": 4,
                    "day_label": "Thursday",
                    "slots": []
                },
                {
                    "day": 5,
                    "day_label": "Friday",
                    "slots": []
                },
                {
                    "day": 6,
                    "day_label": "Saturday",
                    "slots": []
                },
                {
                    "day": 7,
                    "day_label": "Sunday",
                    "slots": []
                }
            ]
        },
        {
            "id": 5,
            "from": "2022-01-01",
            "to": "2022-01-01",
            "is_custom": 1,
            "weekly": [
                {
                    "day": 1,
                    "day_label": "Monday",
                    "slots": [
                        {
                            "id": 67,
                            "start_time": 28800,
                            "end_time": 43200
                        },
                        {
                            "id": 68,
                            "start_time": 50400,
                            "end_time": 64800
                        }
                    ]
                },
                {
                    "day": 2,
                    "day_label": "Tuesday",
                    "slots": [
                        {
                            "id": 69,
                            "start_time": 28800,
                            "end_time": 64800
                        }
                    ]
                },
                {
                    "day": 3,
                    "day_label": "Wednesday",
                    "slots": []
                },
                {
                    "day": 4,
                    "day_label": "Thursday",
                    "slots": [
                        {
                            "id": 70,
                            "start_time": 10800,
                            "end_time": 25200
                        }
                    ]
                },
                {
                    "day": 5,
                    "day_label": "Friday",
                    "slots": []
                },
                {
                    "day": 6,
                    "day_label": "Saturday",
                    "slots": [
                        {
                            "id": 71,
                            "start_time": 10800,
                            "end_time": 32400
                        }
                    ]
                },
                {
                    "day": 7,
                    "day_label": "Sunday",
                    "slots": []
                }
            ]
        },
        {
            "id": 20,
            "from": "2021-10-01",
            "to": "2021-12-31",
            "is_custom": 1,
            "weekly": [
                {
                    "day": 1,
                    "day_label": "Monday",
                    "slots": [
                        {
                            "id": 45,
                            "start_time": 25200,
                            "end_time": 43200
                        },
                        {
                            "id": 46,
                            "start_time": 61200,
                            "end_time": 79200
                        }
                    ]
                },
                {
                    "day": 2,
                    "day_label": "Tuesday",
                    "slots": [
                        {
                            "id": 47,
                            "start_time": 25200,
                            "end_time": 43200
                        }
                    ]
                },
                {
                    "day": 3,
                    "day_label": "Wednesday",
                    "slots": [
                        {
                            "id": 48,
                            "start_time": 25200,
                            "end_time": 43200
                        }
                    ]
                },
                {
                    "day": 4,
                    "day_label": "Thursday",
                    "slots": [
                        {
                            "id": 49,
                            "start_time": 25200,
                            "end_time": 43200
                        }
                    ]
                },
                {
                    "day": 5,
                    "day_label": "Friday",
                    "slots": [
                        {
                            "id": 50,
                            "start_time": 25200,
                            "end_time": 43200
                        }
                    ]
                },
                {
                    "day": 6,
                    "day_label": "Saturday",
                    "slots": [
                        {
                            "id": 51,
                            "start_time": 25200,
                            "end_time": 43200
                        }
                    ]
                },
                {
                    "day": 7,
                    "day_label": "Sunday",
                    "slots": []
                }
            ]
        },
        {
            "id": 22,
            "from": "2022-01-01",
            "to": "2022-04-30",
            "is_custom": 1,
            "weekly": [
                {
                    "day": 1,
                    "day_label": "Monday",
                    "slots": [
                        {
                            "id": 52,
                            "start_time": 28800,
                            "end_time": 43200
                        }
                    ]
                },
                {
                    "day": 2,
                    "day_label": "Tuesday",
                    "slots": [
                        {
                            "id": 53,
                            "start_time": 28800,
                            "end_time": 43200
                        }
                    ]
                },
                {
                    "day": 3,
                    "day_label": "Wednesday",
                    "slots": [
                        {
                            "id": 54,
                            "start_time": 28800,
                            "end_time": 43200
                        }
                    ]
                },
                {
                    "day": 4,
                    "day_label": "Thursday",
                    "slots": [
                        {
                            "id": 55,
                            "start_time": 28800,
                            "end_time": 43200
                        }
                    ]
                },
                {
                    "day": 5,
                    "day_label": "Friday",
                    "slots": [
                        {
                            "id": 56,
                            "start_time": 28800,
                            "end_time": 43200
                        }
                    ]
                },
                {
                    "day": 6,
                    "day_label": "Saturday",
                    "slots": [
                        {
                            "id": 57,
                            "start_time": 28800,
                            "end_time": 43200
                        }
                    ]
                },
                {
                    "day": 7,
                    "day_label": "Sunday",
                    "slots": []
                }
            ]
        },
        {
            "id": 24,
            "from": "2022-01-01",
            "to": "2022-03-31",
            "is_custom": 0,
            "weekly": [
                {
                    "day": 1,
                    "day_label": "Monday",
                    "slots": []
                },
                {
                    "day": 2,
                    "day_label": "Tuesday",
                    "slots": []
                },
                {
                    "day": 3,
                    "day_label": "Wednesday",
                    "slots": []
                },
                {
                    "day": 4,
                    "day_label": "Thursday",
                    "slots": []
                },
                {
                    "day": 5,
                    "day_label": "Friday",
                    "slots": []
                },
                {
                    "day": 6,
                    "day_label": "Saturday",
                    "slots": []
                },
                {
                    "day": 7,
                    "day_label": "Sunday",
                    "slots": []
                }
            ]
        }
    ]
}
*/
