import 'dart:convert';

import 'package:flutter/services.dart';

import '../../data/data.dart';

// Fetch content from the json file
Future<List<dynamic>> readJson() async {
  final String response =
      await rootBundle.loadString('assets/data/beligium-cities.json');
  final data = await json.decode(response);
  return List<CityModel>.from(
    (data as List).map((i) => CityModel.fromJson(i as Map<String, dynamic>))
        as List,
  );
}
