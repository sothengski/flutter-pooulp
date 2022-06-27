import 'dart:convert';

import 'package:flutter/services.dart';

import '../../data/data.dart';

// Fetch content from the json file
//'assets/data/beligium-cities.json'
Future<JsonResponse> readJsonFromFile({String? path}) async {
  final String response = await rootBundle.loadString(path!);
  final data = await json.decode(response);
  final jsonResp = JsonResponse(data: data);
  return jsonResp;
}
