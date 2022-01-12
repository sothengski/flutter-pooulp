import 'package:get/get.dart';

import '../home/home.dart';

class ProfileController extends GetxController {
  final homeController = Get.put(HomeController());
  final List<String> skillList = [
    "Persuasion",
    "Responsability",
    "Confidence",
  ];

  final List<String> languagesList = [
    "English - Level 2",
    "French - Level 3",
    "German - Level 4",
  ];
}
