import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';

// matching various patterns for kinds of data
class Validator {
  Validator();
  static const String emptySpaceRegExpPattern = r'^\S+$';
  static const String avoidSpaceRegExpPattern = r'\s';
  static const String emailRegExpPattern =
      r'^[a-zA-Z0-9.-]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
  static const String phoneNumberRegExpPattern = r'(^(?:[+0]9)?[0-9]{7,13}$)';
  static const String lengthMin6RegExppattern = r'^.{6,}$';
  static const String noNumberRegExpPattern =
      r"^[a-zA-Z]+(([',. -][a-zA-Z ])[a-zA-Z]*)*$";
  static const String userNameRegExpPattern =
      r"^[a-zA-Z0-9]+\.+[a-zA-Z0-9]"; //user.name
  static const String numberRegExpPattern = r'^\d+$';

  static const requiredMsg = "This is required.";
  String requiredFieldMsg = 'requiredField'.tr; //'validator.requireField'.tr;
  // static const requiredFieldMsg = "This field is required.";

  static const formatNotValid = "format is not valid.";
  static const inValidFieldMsg = "This is invalid.";

  static const enterAValidField = "Please enter a valid";

  // TextInputFormatter avoidSpaceInputFormatter() =>
  //     FilteringTextInputFormatter.deny(
  //       RegExp(Validator.avoidSpaceRegExpPattern),
  //     );

  String? emailValidator(String? value) {
    final RegExp regex = RegExp(emailRegExpPattern);

    if (value!.isEmpty || regex.hasMatch(emptySpaceRegExpPattern)) {
      return requiredFieldMsg;
    } else if (!regex.hasMatch(value)) {
      return "$enterAValidField Email(e.g: a@xyz.co)";
    } else {
      return null;
    }
  }

  String? passwordValidatorWithMin6Chars(String? value) {
    final RegExp regex = RegExp(lengthMin6RegExppattern);
    if (value!.isEmpty || regex.hasMatch(emptySpaceRegExpPattern)) {
      return requiredFieldMsg;
    } else if (!regex.hasMatch(value)) {
      return 'passwordMin6'.tr; //'validator.passwordMin6'.tr;
      // return 'Password should be at least 6 characters.';
    } else {
      return null;
    }
  }

  String? nameValidator(String? value) {
    final RegExp regex = RegExp(noNumberRegExpPattern);
    if (value!.isEmpty) {
      return requiredFieldMsg;
    } else if (!regex.hasMatch(value)) {
      return 'validator.name'.tr;
    } else {
      return null;
    }
  }

  String? userNameValidator(String? value) {
    final RegExp regex = RegExp(userNameRegExpPattern);
    if (value!.isEmpty) {
      return requiredFieldMsg;
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
      return requiredFieldMsg;
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
      return requiredFieldMsg;
    } else if (!regex.hasMatch(value)) {
      return 'validator.number'.tr;
    } else {
      return null;
    }
  }

  String? phoneNumberValidator(String? value) {
    final RegExp regExp = RegExp(phoneNumberRegExpPattern);
    if (value!.isEmpty) {
      return requiredFieldMsg;
    } else if (!regExp.hasMatch(value)) {
      return "$enterAValidField Phone number.";
    }
    return null;
  }

  bool isPhoneNumberValidate(String? value) {
    final RegExp regExp = RegExp(phoneNumberRegExpPattern);
    if (value!.isEmpty || !regExp.hasMatch(value)) {
      return false;
    }
    return true;
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
      return requiredFieldMsg;
    } else {
      return null;
    }
  }

  String? matchingPasswords({
    required String? password,
    required String? matchPassword,
  }) {
    if (stringsComparation(
      object1: password,
      object2: matchPassword,
    )) {
      return Validator().passwordValidatorWithMin6Chars(matchPassword);
    } else {
      return 'passwordsDontMatch'.tr;
    }
  }
}

class FilterTextInputFormat {
  FilterTextInputFormat();
  TextInputFormatter digitsOnly() => FilteringTextInputFormatter.digitsOnly;

  TextInputFormatter allow({required String? regExpString}) =>
      FilteringTextInputFormatter.allow(RegExp(regExpString!));

  TextInputFormatter deny({required String? regExpString}) =>
      FilteringTextInputFormatter.deny(RegExp(regExpString!));

  // TextInputFormatter allow({required Pattern? filterPattern}) {
  //   return FilteringTextInputFormatter.allow(filterPattern!);
  // }
  // RegExp(
  //   Validator.avoidSpaceRegExpPattern,
  // ),
  // RegExp(
  //   Validator.numberRegExpPattern,
  // ),

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
