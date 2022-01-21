import 'package:flutter/material.dart';

// Model class to hold menu option data (language and theme)
class MenuOptionsModel {
  final String key;
  final String value;
  final IconData? icon;
  final String? flagPath;

  MenuOptionsModel({
    required this.key,
    required this.value,
    this.icon,
    this.flagPath,
  });
}
