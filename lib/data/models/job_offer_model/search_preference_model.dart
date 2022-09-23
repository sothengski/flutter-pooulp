import 'dart:convert';

import '../../data.dart';

// final searchPreferencesModel = searchPreferencesModelFromJson(jsonString);
class SearchPreferencesModel {
  final String? keywords;
  final int? telecommuting;
  final String? location;
  final String? country;
  final String? city;
  final String? street;
  final String? zipcode;
  final bool? isRangeSearch;
  final String? latitude;
  final String? longitude;
  final String? translationCity;
  final String? translationCountry;
  final int? range;
  final DateTime? dateJobStart;
  final DateTime? dateJobEnd;
  final String? searchName;
  final int? searchId;
  final List<FieldModel>? types;
  final List<FieldModel>? fields;
  final List<FieldModel>? languages;
  final List<FieldModel>? availabilities;
  final List<FieldModel>? internshipTypes;
  final List<FieldModel>? internshipPeriods;

  SearchPreferencesModel({
    this.keywords,
    this.telecommuting,
    this.location,
    this.country,
    this.city,
    this.street,
    this.zipcode,
    this.isRangeSearch,
    this.latitude,
    this.longitude,
    this.translationCity,
    this.translationCountry,
    this.range,
    this.dateJobStart,
    this.dateJobEnd,
    this.searchName,
    this.searchId,
    this.types,
    this.fields,
    this.languages,
    this.availabilities,
    this.internshipTypes,
    this.internshipPeriods,
  });

  factory SearchPreferencesModel.fromRawJson(String str) =>
      SearchPreferencesModel.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory SearchPreferencesModel.fromJson(Map<String, dynamic> json) =>
      SearchPreferencesModel(
        keywords: json['keywords'] as String?,
        telecommuting: json['telecommuting'] as int?,
        location: json['location'] as String?,
        country: json['country'] as String?,
        city: json['city'] as String?,
        street: json['street'] as String?,
        zipcode: json['zipcode'] as String?,
        isRangeSearch: json['is_range_search'] as bool?,
        latitude: json['latitude'] as String?,
        longitude: json['longitude'] as String?,
        translationCity: json['translation_city'] as String?,
        translationCountry: json['translation_country'] as String?,
        range: int.tryParse(json['range'].toString()),
        dateJobStart:
            json['date_job_start'] != null && json['date_job_start'] != ''
                ? DateTime.parse(
                    json['date_job_start'].toString(),
                  )
                : null,
        dateJobEnd: json['date_job_end'] != null && json['date_job_end'] != ''
            ? DateTime.parse(
                json['date_job_end'].toString(),
              )
            : null,
        searchName: json['search_name'] as String?,
        searchId: json['search_id'] as int?,
        types: json['types'] == null || json['types'] == []
            ? []
            : (json['types'] as List)
                .map(
                  (i) => FieldModel(id: i as int),
                  // FieldModel.fromJson(
                  //   i as Map<String, dynamic>,
                  // ),
                )
                .toList(),
        internshipTypes:
            json['internship_types'] == null || json['internship_types'] == []
                ? []
                : (json['internship_types'] as List)
                    .map(
                      (i) => FieldModel(id: i as int),
                    )
                    .toList(),
        internshipPeriods: json['internship_periods'] == null ||
                json['internship_periods'] == []
            ? []
            : (json['internship_periods'] as List)
                .map(
                  (i) => FieldModel(id: i as int),
                )
                .toList(),
        fields: json['fields'] == null || json['fields'] == []
            ? []
            : (json['fields'] as List)
                .map(
                  (i) => FieldModel(id: i as int),
                )
                .toList(),
        availabilities:
            json['availabilities'] == null || json['availabilities'] == []
                ? []
                : (json['availabilities'] as List)
                    .map(
                      (i) => FieldModel(id: i as int),
                    )
                    .toList(),
        languages: json['languages'] == null || json['languages'] == []
            ? []
            : (json['languages'] as List)
                .map(
                  (i) => FieldModel(id: i as int),
                )
                .toList(),
      );

  Map<String, dynamic> toJson() => {
        'keywords': keywords,
        'telecommuting': telecommuting,
        'location': location,
        'country': country,
        'city': city,
        'street': street,
        'zipcode': zipcode,
        'is_range_search': isRangeSearch,
        'latitude': latitude,
        'longitude': longitude,
        'translation_city': translationCity,
        'translation_country': translationCountry,
        'range': range,
        'date_job_start': dateJobStart?.toIso8601String(),
        'date_job_end': dateJobEnd?.toIso8601String(),
        'search_name': searchName,
        'search_id': searchId,
        'types': types == null || types == []
            ? []
            : List<dynamic>.from(
                types!
                    .skipWhile(
                      (x) => x.id == null,
                    )
                    .map(
                      (e) => e.id,
                    ),
              ),
        'internship_types': internshipTypes == null || internshipTypes == []
            ? []
            : List<dynamic>.from(
                internshipTypes!
                    .skipWhile(
                      (x) => x.id == null,
                    )
                    .map(
                      (e) => e.id,
                    ),
              ),
        'internship_periods':
            internshipPeriods == null || internshipPeriods == []
                ? []
                : List<dynamic>.from(
                    internshipPeriods!
                        .skipWhile(
                          (x) => x.id == null,
                        )
                        .map(
                          (e) => e.id,
                        ),
                  ),
        'fields': fields == null || fields == []
            ? []
            : List<dynamic>.from(
                fields!
                    .skipWhile(
                      (x) => x.id == null,
                    )
                    .map(
                      (e) => e.id,
                    ),
              ),
        'availabilities': availabilities == null || availabilities == []
            ? []
            : List<dynamic>.from(
                availabilities!
                    .skipWhile(
                      (x) => x.id == null,
                    )
                    .map(
                      (e) => e.id,
                    ),
              ),
        'languages': languages == null || languages == []
            ? []
            : List<dynamic>.from(
                languages!
                    .skipWhile(
                      (x) => x.id == null,
                    )
                    .map(
                      (e) => e.id,
                    ),
              ),
      }..removeWhere((_, v) => v == null);

  @override
  String toString() => '''
      SearchPreferencesModel(
        keywords: $keywords, 
        telecommuting: $telecommuting, 
        location: $location, 
        country: $country, 
        city: $city, 
        street: $street, 
        zipcode: $zipcode, 
        isRangeSearch: $isRangeSearch, 
        latitude: $latitude, 
        longitude: $longitude, 
        translationCity: $translationCity, 
        translationCountry: $translationCountry, 
        range: $range, 
        dateJobStart: $dateJobStart, 
        dateJobEnd: $dateJobEnd, 
        searchName: $searchName, 
        searchId: $searchId, 
        types: $types, 
        fields: $fields, 
        languages: $languages, 
        availabilities: $availabilities, 
        internshipTypes: $internshipTypes, 
        internshipPeriods: $internshipPeriods,
      )''';
}

/* V1
class SearchPreferencesModel {
  final List<FieldModel>? offerTypePreferences;
  final List<FieldModel>? fieldPreferences;
  final List<FieldModel>? languagePreferences;
  final List<FieldModel>? availabilityPreferences;
  final List<FieldModel>? internshipTypePreferences;
  final List<FieldModel>? internshipPeriodPreferences;
  final String? locationPreference;
  final String? locationStreet;
  final String? locationCity;
  final String? locationZip;
  final String? locationCountry;
  final String? locationLatitude;
  final String? locationLongitude;
  final String? translationCity;
  final String? translationCountry;
  final int? radius;

  SearchPreferencesModel({
    this.offerTypePreferences,
    this.fieldPreferences,
    this.languagePreferences,
    this.availabilityPreferences,
    this.internshipTypePreferences,
    this.internshipPeriodPreferences,
    this.locationPreference,
    this.locationStreet,
    this.locationCity,
    this.locationZip,
    this.locationCountry,
    this.locationLatitude,
    this.locationLongitude,
    this.translationCity,
    this.translationCountry,
    this.radius,
  });

  factory SearchPreferencesModel.fromRawJson(String str) =>
      SearchPreferencesModel.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory SearchPreferencesModel.fromJson(Map<String, dynamic> json) =>
      SearchPreferencesModel(
        offerTypePreferences: json['offer_type_preferences'] == null ||
                json['offer_type_preferences'] == []
            ? []
            : (json['offer_type_preferences'] as List)
                .map(
                  (i) => FieldModel.fromJson(
                    i as Map<String, dynamic>,
                  ),
                )
                .toList(),
        fieldPreferences:
            json['field_preferences'] == null || json['field_preferences'] == []
                ? []
                : (json['field_preferences'] as List)
                    .map(
                      (i) => FieldModel.fromJson(
                        i as Map<String, dynamic>,
                      ),
                    )
                    .toList(),
        languagePreferences: json['language_preferences'] == null ||
                json['language_preferences'] == []
            ? []
            : (json['language_preferences'] as List)
                .map(
                  (i) => FieldModel.fromJson(
                    i as Map<String, dynamic>,
                  ),
                )
                .toList(),
        availabilityPreferences: json['availability_preferences'] == null ||
                json['availability_preferences'] == []
            ? []
            : (json['availability_preferences'] as List)
                .map(
                  (i) => FieldModel.fromJson(
                    i as Map<String, dynamic>,
                  ),
                )
                .toList(),
        internshipTypePreferences:
            json['internship_types'] == null || json['internship_types'] == []
                ? []
                : (json['internship_types'] as List)
                    .map(
                      (i) => FieldModel.fromJson(
                        i as Map<String, dynamic>,
                      ),
                    )
                    .toList(),
        internshipPeriodPreferences: json['internship_periods'] == null ||
                json['internship_periods'] == []
            ? []
            : (json['internship_periods'] as List)
                .map(
                  (i) => FieldModel.fromJson(
                    i as Map<String, dynamic>,
                  ),
                )
                .toList(),
        locationPreference: json['location_preference'] as String?,
        locationStreet: json['location_street'] as String?,
        locationCity: json['location_city'] as String?,
        locationZip: json['location_zip'] as String?,
        locationCountry: json['location_country'] as String?,
        locationLatitude: json['location_latitude'] as String?,
        locationLongitude: json['location_longitude'] as String?,
        translationCity: json['translation_city'] as String?,
        translationCountry: json['translation_country'] as String?,
        radius: json['radius'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'offer_type_preferences': offerTypePreferences != null ||
                offerTypePreferences != []
            ? List<dynamic>.from(offerTypePreferences!.map((x) => x.toJson()))
            : [],
        'field_preferences': fieldPreferences != null || fieldPreferences != []
            ? List<dynamic>.from(fieldPreferences!.map((x) => x.toJson()))
            : [],
        'language_preferences': languagePreferences != null ||
                languagePreferences != []
            ? List<dynamic>.from(languagePreferences!.map((x) => x.toJson()))
            : [],
        'availability_preferences':
            availabilityPreferences != null || availabilityPreferences != []
                ? List<dynamic>.from(
                    availabilityPreferences!.map((x) => x.toJson()),
                  )
                : [],
        'location_preference': locationPreference,
        'location_street': locationStreet,
        'location_city': locationCity,
        'location_zip': locationZip,
        'location_country': locationCountry,
        'location_latitude': locationLatitude,
        'location_longitude': locationLongitude,
        'translation_city': translationCity,
        'translation_country': translationCountry,
        'radius': radius! * 1000,
      }..removeWhere((_, v) => v == null);

  @override
  String toString() => '''
  SearchPreferencesModel(
    offerTypePreferences: $offerTypePreferences,
    fieldPreferences: $fieldPreferences,
    languagePreferences: $languagePreferences,
    availabilityPreferences: $availabilityPreferences,
    locationPreference: $locationPreference,
    locationStreet: $locationStreet,
    locationCity: $locationCity,
    locationZip: $locationZip,
    locationCountry: $locationCountry,
    locationLatitude: $locationLatitude,
    locationLongitude: $locationLongitude,
    translationCity: $translationCity,
    translationCountry: $translationCountry,
    radius: $radius,
  ''';
}
*/
