// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:pooulp_flutter/data/data.dart';

// OnboardingModel onboardingModelFromJson(String str) =>
//     OnboardingModel.fromJson(json.decode(str) as Map<String, dynamic>);

List<CityModel> cityModelFromJson(String str) => List<CityModel>.from(
      (json.decode(str) as List).map(
        (x) => CityModel.fromJson(x as Map<String, dynamic>),
      ) as List<Map<String, dynamic>>,
    );

String cityModelToJson(List<CityModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CityModel {
  final String? city;
  final String? lat;
  final String? lng;
  final Country? country;
  final Iso2? iso2;
  final AdminName? adminName;
  final Capital? capital;
  final String? population;
  final String? populationProper;

  const CityModel({
    this.city,
    this.lat,
    this.lng,
    this.country,
    this.iso2,
    this.adminName,
    this.capital,
    this.population,
    this.populationProper,
  });

  factory CityModel.fromRawJson(String str) =>
      CityModel.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        city: json["city"] as String?,
        lat: json["lat"] as String?,
        lng: json["lng"] as String?,
        country: countryValues.map![json["country"]],
        iso2: iso2Values.map![json["iso2"]],
        adminName: adminNameValues.map![json["admin_name"]],
        capital: capitalValues.map![json["capital"]],
        population: json["population"] as String?,
        populationProper: json["population_proper"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "lat": lat,
        "lng": lng,
        "country": countryValues.reverse[country],
        "iso2": iso2Values.reverse[iso2],
        "admin_name": adminNameValues.reverse[adminName],
        "capital": capitalValues.reverse[capital],
        "population": population,
        "population_proper": populationProper,
      };

  @override
  String toString() => '''
    CityModel(
      city: $city,
      lat: $lat,
      lng: $lng,
      country: $country,
      iso2: $iso2,
      adminName: $adminName,
      capital: $capital,
      population: $population,
      populationProper: $populationProper)
    ''';
}

enum AdminName { BRUSSELS_CAPITAL_REGION, FLANDERS, WALLONIA }

final adminNameValues = EnumValues({
  "Brussels-Capital Region": AdminName.BRUSSELS_CAPITAL_REGION,
  "Flanders": AdminName.FLANDERS,
  "Wallonia": AdminName.WALLONIA,
});

enum Capital { PRIMARY, MINOR, EMPTY, ADMIN }

final capitalValues = EnumValues({
  "admin": Capital.ADMIN,
  "": Capital.EMPTY,
  "minor": Capital.MINOR,
  "primary": Capital.PRIMARY,
});

enum Country { BELGIUM }

final countryValues = EnumValues({"Belgium": Country.BELGIUM});

enum Iso2 { BE }

final iso2Values = EnumValues({"BE": Iso2.BE});

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     // reverseMap ??= map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
