import 'package:flutter/services.dart';
import 'package:get/get.dart';

// matching various patterns for kinds of data
class Validator {
  Validator();
  static const String emptySpaceRegExpPattern = r'^\S+$';
  static const String avoidSpaceRegExpPattern = r'\s';
  static const String emailRegExpPattern =
      r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
  static const String phoneNumberRegExpPattern = r'(^(?:[+0]9)?[0-9]{8,12}$)';
  static const String length6RegExppattern = r'^.{6,}$';
  static const String noNumberRegExpPattern =
      r"^[a-zA-Z]+(([',. -][a-zA-Z ])[a-zA-Z]*)*$";
  static const String userNameRegExpPattern =
      r"^[a-zA-Z0-9]+\.+[a-zA-Z0-9]"; //user.name
  static const String numberRegExpPattern = r'^\d+$';

  String? emailValidator(String? value) {
    final RegExp regex = RegExp(emailRegExpPattern);
    if (!regex.hasMatch(value!)) {
      return 'validator.email'.tr;
    } else {
      return null;
    }
  }

  String? passwordValidator(String? value) {
    final RegExp regex = RegExp(length6RegExppattern);
    if (value!.isEmpty || regex.hasMatch(emptySpaceRegExpPattern)) {
      return 'validator.passwordRequired'.tr;
    } else if (!regex.hasMatch(value)) {
      return 'Password should be 6~15 characters.';
    } else {
      return null;
    }
  }

  String? nameValidator(String? value) {
    final RegExp regex = RegExp(noNumberRegExpPattern);
    if (value!.isEmpty) {
      return 'validator.fieldRequired'.tr;
    } else if (!regex.hasMatch(value)) {
      return 'validator.name'.tr;
    } else {
      return null;
    }
  }

  String? userNameValidator(String? value) {
    final RegExp regex = RegExp(userNameRegExpPattern);
    if (value!.isEmpty) {
      return 'validator.usernameRequired'.tr;
    } else if (!regex.hasMatch(value)) {
      return 'validator.name';
    } else {
      return null;
    }
  }

  String? numberValidator(String? value) {
    const String pattern = r'^\D?(\d{3})\D?\D?(\d{3})\D?(\d{4})$';
    final RegExp regex = RegExp(pattern);
    if (value!.isEmpty) {
      return 'validator.customerRequired'.tr;
    } else if (!regex.hasMatch(value)) {
      return 'validator.number'.tr;
    } else {
      return null;
    }
  }

  String? customerId(String? value) {
    const String pattern = r'(^[0-9]{6,15}$)';
    final RegExp regex = RegExp(pattern);
    if (value!.isEmpty) {
      return 'validator.customerRequired'.tr;
    } else if (!regex.hasMatch(value)) {
      return 'validator.number'.tr;
    } else {
      return null;
    }
  }

  String? phoneNumberValidator(String? value) {
    final RegExp regExp = RegExp(phoneNumberRegExpPattern);
    if (value!.isEmpty) {
      return 'Please enter phone number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid phone number';
    }
    return null;
  }

  String amount(String value) {
    final RegExp regex = RegExp(numberRegExpPattern);
    if (!regex.hasMatch(value)) {
      return 'validator.amount'.tr;
    } else {
      return '';
    }
  }

  String? notEmptyValidator(String? value) {
    if (value!.isEmpty) {
      return 'validator.fieldRequired'.tr;
    } else {
      return null;
    }
  }
}

class NumericalRangeFormatter extends TextInputFormatter {
  final double min;
  final double max;

  NumericalRangeFormatter({required this.min, required this.max});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text == '') {
      return newValue;
    } else if (int.parse(newValue.text) < min) {
      return TextEditingValue.empty;
      // return const TextEditingValue().copyWith(text: min.toStringAsFixed(2));
    } else {
      return int.parse(newValue.text) > max ? oldValue : newValue;
    }
  }
}
