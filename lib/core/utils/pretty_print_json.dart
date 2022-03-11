import 'dart:convert';

import 'package:flutter/material.dart';

void printJson({String? input}) {
  const JsonDecoder decoder = JsonDecoder();
  const JsonEncoder encoder = JsonEncoder.withIndent('  ');
  final dynamic object = decoder.convert(input!);
  final String prettyString = encoder.convert(object);
  prettyString
      .split('\n')
      .forEach((dynamic element) => debugPrint(element.toString()));
}
