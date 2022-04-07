import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import '../../data/data.dart';
import '../modules.dart';

class OnboardingController extends GetxController {
  PageController pageController = PageController();
  RxInt selectedPageIndex = 0.obs;
  RxList<OnboardingInfoModel> onboardingDataToBeAdded =
      <OnboardingInfoModel>[].obs;

  RxList<OnboardingInfoModel> onboardingPages = <OnboardingInfoModel>[].obs;
  RxBool isUpdate = false.obs;

  Offset distance = const Offset(28, 28);
  double blur = 30.0;

  @override
  Future<void> onInit() async {
    super.onInit();
    onboardingDataToBeAdded.addAll([
      OnboardingInfoModel(id: 0, fieldList: []),
      OnboardingInfoModel(id: 1, fieldList: []),
      OnboardingInfoModel(id: 2, fieldList: []),
      OnboardingInfoModel(id: 3, fieldList: []),
    ]);

    onboardingPages.value = [
      OnboardingInfoModel(
        id: 0,
        textTitle: 'What are you looking for?',
        fieldList: [
          FieldModel(id: 0, label: 'Student Job'),
          FieldModel(id: 1, label: 'Internship'),
          FieldModel(id: 2, label: 'Study Subject'),
          FieldModel(id: 3, label: 'Job'),
        ],
      ),
      OnboardingInfoModel(
        id: 1,
        textTitle: 'What are you interested in?',
        fieldList: [
          FieldModel(id: 0, label: 'Information Technology'),
          FieldModel(id: 1, label: 'Marketing & Communication'),
          FieldModel(id: 2, label: 'Engeenering'),
          FieldModel(id: 3, label: 'Finance'),
          FieldModel(id: 4, label: 'Law'),
          FieldModel(id: 5, label: 'Design/Graphism'),
        ],
      ),
      OnboardingInfoModel(
        id: 2,
        textTitle: 'What are you looking for?',
        fieldList: [
          FieldModel(id: 0, label: 'Data analysis'),
          FieldModel(id: 1, label: 'Market Research'),
          FieldModel(id: 2, label: 'Story Telling'),
          FieldModel(id: 3, label: 'Content Creation / Copy Writing'),
          FieldModel(id: 4, label: 'SEO/SEA'),
          FieldModel(id: 5, label: 'Branding'),
          FieldModel(id: 6, label: 'Social Media Management'),
          FieldModel(id: 7, label: 'Emailing'),
          FieldModel(id: 8, label: 'Events'),
          FieldModel(id: 9, label: 'Telephone Sales'),
          FieldModel(id: 10, label: 'Press Officer'),
          FieldModel(id: 11, label: 'Flexibility'),
        ],
      ),
      OnboardingInfoModel(
        id: 3,
        textTitle: 'What are your languages?',
        fieldList: [
          FieldModel(id: 0, label: 'Dutch'),
          FieldModel(id: 1, label: 'French'),
          FieldModel(id: 2, label: 'English'),
        ],
      ),
    ];
  }

  bool get isFirstPage => selectedPageIndex.value == 0;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  void movingAction({bool? forward = true}) {
    forward == false
        ? pageController.previousPage(
            duration: 500.milliseconds,
            curve: Curves.easeInSine,
          )
        : isLastPage
            ? validateData()
            : pageController.nextPage(
                duration: 500.milliseconds,
                curve: Curves.easeInSine,
              );
  }

  void addOrRemoveDataInList({
    required int? pageIndex,
    required FieldModel? itemToBeAdd,
  }) {
    // onboardingDataToBeAdded
    //     .firstWhere((element) => element.id == pageIndex)
    //     .fieldList!
    //     .addIf(
    //       !onboardingDataToBeAdded
    //           .firstWhere(
    //             (element) => element.id == pageIndex,
    //           )
    //           .fieldList!
    //           .contains(itemToBeAdd),
    //       itemToBeAdd!,
    //     );

    for (final page in onboardingDataToBeAdded) {
      if (page.id == pageIndex) {
        if (!page.fieldList!.contains(itemToBeAdd)) {
          page.fieldList!.add(itemToBeAdd!);
          // print('add:');
        } else if (page.fieldList!.contains(itemToBeAdd)) {
          page.fieldList!
              .removeWhere((element) => element.id == itemToBeAdd!.id);
          // print('remove:');
        }
      } else {
        // print('else:');
      }
    }
    // print('onboardingDataToBeAdded: $onboardingDataToBeAdded');
    /// isUpdate is used for trigger the update into the UI
    isUpdate.value = switchingBooleanValue(boolValue: isUpdate.value);
  }

  void validateData() {
    debugPrint('onboardingDataToBeAdded: $onboardingDataToBeAdded');
// Get.offNamed(Routes.homeRoute);
  }
}
