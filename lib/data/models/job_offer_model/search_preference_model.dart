import 'dart:convert';

import '../../data.dart';

// final searchPreferencesModel = searchPreferencesModelFromJson(jsonString);

class SearchPreferencesModel {
  final List<FieldModel>? offerTypePreferences;
  final List<FieldModel>? fieldPreferences;
  final List<FieldModel>? availabilityPreferences;
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
    this.availabilityPreferences,
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
