import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/data.dart';

class SignInController extends GetxController {
  final authProvider = Get.find<AuthProvider>();

  final signInFormKey = GlobalKey<FormState>();
  final formFieldKey = GlobalKey<FormFieldState>();

  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
}
