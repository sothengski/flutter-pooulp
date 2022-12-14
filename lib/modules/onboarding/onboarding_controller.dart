import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import '../../data/data.dart';
import '../../routes/routes.dart';

class OnboardingController extends GetxController
    with StateMixin<Rx<OnboardingModel>> {
  final onboardingProvider = Get.find<OnboardingProvider>();
  final placeApiProvider = Get.put(PlaceApiProvider());
  final tagProvider = Get.find<TagProvider>();

  PageController pageController = PageController();
  RxInt selectedPageIndex = 0.obs;
  // RxList<OnboardingPageModel> onboardingDataToBeAdded =
  //     <OnboardingPageModel>[].obs;

  RxList<SchoolModel> schoolList = <SchoolModel>[].obs;
  RxList<FieldModel> fieldListForSelect = <FieldModel>[].obs;
  RxList<FieldModel> schoolDegreeList = <FieldModel>[].obs;

  RxList<OnboardingPageModel> onboardingPages = <OnboardingPageModel>[].obs;
  Rx<OnboardingModel> onboardingPagesAPIData =
      const OnboardingModel(totalPage: 0).obs;

  RxList<FieldModel> lookingForSelectedList = <FieldModel>[].obs;

  RxList<FieldModel> internshipTypeSelectedList = <FieldModel>[].obs;
  RxList<FieldModel> internshipPeriodSelectedList = <FieldModel>[].obs;
  RxList<FieldModel> internshipInterestedInSelectedList = <FieldModel>[].obs;
  RxList<FieldModel> internshipLanguageSelectedList = <FieldModel>[].obs;
  Rx<PlaceDetailModel>? internshipPlaceDetail = PlaceDetailModel().obs;
  RxInt internshipRadiusRxInt = 50.obs;
  TextEditingController internshipAddressCtrl = TextEditingController();
  TextEditingController internshipOtherTextCtrl =
      TextEditingController(text: '');

  RxList<FieldModel> studentJobInterestedInSelectedList = <FieldModel>[].obs;
  RxList<FieldModel> studentJobLanguageSelectedList = <FieldModel>[].obs;
  Rx<PlaceDetailModel>? studentJobPlaceDetail = PlaceDetailModel().obs;
  RxInt studentJobRadiusRxInt = 50.obs;
  TextEditingController studentJobAddressCtrl = TextEditingController();

  RxList<FieldModel>? goodAtfieldSelectedList = <FieldModel>[].obs;
  RxList<FieldModel>? knowFromSourceSelectedList = <FieldModel>[].obs;

  RxBool isCheckGraduated = false.obs;
  // Rx<SchoolModel> selectedSchool = SchoolModel().obs;
  // RxList<RxList<FieldModel>> fieldListSelected = <RxList<FieldModel>>[].obs;
  // TextEditingController degreeTextCtrl = TextEditingController();
  // TextEditingController currentStudyYearTextCtrl = TextEditingController();

  // List<TextEditingController> degreeListTextCtrl = [
  //   TextEditingController(),
  // ];
  // List<TextEditingController> currentStudyYearTextCtrl = [
  //   TextEditingController(),
  // ];
  RxList<String> selectedStartedDateString = <String>[''].obs;

  RxList<EducationModel> educationList = <EducationModel>[
    EducationModel(
      id: 999,
      school: SchoolModel(),
      fields: [],
      // // degree: '',
      degreeTag: FieldModel(),
      completed: false,
    )
  ].obs;

  RxBool isUpdate = false.obs;
  RxInt numPage = 0.obs;

  String? sessionToken = '';
  GooglePlaceSearchModel? results;

  @override
  Future<void> onInit() async {
    super.onInit();
    // onboardingDataToBeAdded.addAll([
    //   OnboardingPageModel(pageIndex: 0, selectionItems: []),
    //   OnboardingPageModel(pageIndex: 1, selectionItems: []),
    //   OnboardingPageModel(pageIndex: 2, selectionItems: []),
    //   OnboardingPageModel(pageIndex: 3, selectionItems: []),
    // ]);
    await getOffersDataState();
    await getSchoolListResponseProvider();
    await getFieldsListResponseProvider();
    await getSchoolDegreeListResponseProvider();
  }

  void uuidTokenGenerator() => sessionToken = UuidGenerator().uuidV4();

  Future<Rx<PlaceDetailModel>> getPlaceDetail({
    String? placeId,
    String? sessionToken,
    Rx<PlaceDetailModel>? placeDetail,
  }) async {
    placeDetail!.value = await placeApiProvider.getGooglePlaceFilterDetail(
      placeId: placeId,
      sessionToken: sessionToken,
    );
    return placeDetail;
  }

  Future<void> getOffersDataState({bool? refresh}) async {
    change(null, status: RxStatus.loading());
    getOnboardingDataListResponseProvider(refresh: refresh).then(
      (resp) {
        change(resp, status: RxStatus.success());
      },
      onError: (err) {
        change(
          null,
          status: RxStatus.error('Error'),
        );
      },
    );
  }

  Future<Rx<OnboardingModel>> getOnboardingDataListResponseProvider({
    bool? refresh = false,
  }) async {
    onboardingPagesAPIData.value =
        await onboardingProvider.getOnboardingDataList();
    // debugPrint(
    //   'onboardingPagesAPIData: $onboardingPagesAPIData',
    // );
    for (var page = 0; page < 11; page++) {
      final List<OnboardingPageModel> onboardingData =
          onboardingPagesAPIData.value.pages!;

      /// page 0 = Introduction Page
      /// page 10 = Thank you page
      if (page == 0 || page == 10) {
        final OnboardingPageModel temp = OnboardingPageModel(
          pageIndex: page == 0 ? 0 : 10,
          title: page == 0
              ? 'onboardingIntroTitle'.tr
              : 'onboarding_advice_text_title'.tr,
          subtitle: page == 0 ? '' : 'onboarding_advice_text_body'.tr,
        );
        onboardingPages.add(temp);
      }

      /// page 1 = looking for
      /// page 2 = specific internship
      if (page == 1 || page == 2) {
        final OnboardingPageModel temp = OnboardingPageModel(
          pageIndex: page == 1 ? 1 : 2,
          title: page == 1
              ? onboardingData[0].title
              : 'Internship'.tr, //'onboardingInternshipTitle'.tr,
          subtitle: page == 2 ? 'onboardingInternshipTitle'.tr : '',
          isSkippable: onboardingData[0].isSkippable,
          selectionItems: onboardingData[0].selectionItems,
          allSkills: onboardingData[0].allSkills,
          internshipTypeItems: onboardingData[0].internshipTypeItems,
          internshipPeriodItems: onboardingData[0].internshipPeriodItems,
        );
        onboardingPages.add(temp);
      }

      /// page 3 & 5 = interested in ? Event, Horeca, ...
      if (page == 3 || page == 5) {
        final OnboardingPageModel temp = OnboardingPageModel(
          pageIndex: page == 3 ? 3 : 5,
          title: page == 3
              ? 'onboardingInternshipTitle'.tr
              : 'onboardingYourStudentJob'.tr,
          subtitle: 'onboardingFieldTitle'.tr, //onboardingData[1].title,
          // title: onboardingData[1].title,
          // subtitle: page == 3
          //     ? 'onboardingInternshipTitle'.tr
          //     : 'onboardingYourStudentJob'.tr,
          isSkippable: onboardingData[1].isSkippable,
          selectionItems: onboardingData[1].selectionItems,
          allSkills: onboardingData[1].allSkills,
          // internshipTypeItems: onboardingData[1].internshipTypeItems,
          // internshipPeriodItems: onboardingData[1].internshipPeriodItems,
        );
        onboardingPages.add(temp);
      }

      /// page 3 & 6 want to work => city & radius
      if (page == 4 || page == 6) {
        final OnboardingPageModel temp = OnboardingPageModel(
          pageIndex: page == 4 ? 4 : 6,
          title: page == 4
              ? 'onboardingInternshipTitle'.tr
              : 'onboardingYourStudentJob'.tr,
          subtitle: 'onboardingLocationTitle'.tr, //onboardingData[4].title,
          // title: onboardingData[4].title,
          // subtitle: page == 4
          //     ? 'onboardingInternshipTitle'.tr
          //     : 'onboardingYourStudentJob'.tr,
          // isSkippable: onboardingData[1].isSkippable,
          // selectionItems: onboardingData[1].selectionItems,
          // allSkills: onboardingData[1].allSkills,
          // internshipTypeItems: onboardingData[1].internshipTypeItems,
          // internshipPeriodItems: onboardingData[1].internshipPeriodItems,
        );
        onboardingPages.add(temp);
      }

      /// page 4 & 7 which language => english, french
      // if (page == 4 || page == 7) {
      //   final OnboardingPageModel temp = OnboardingPageModel(
      //     pageIndex: page == 4 ? 4 : 7,
      //     title: onboardingData[3].title,
      //     subtitle: page == 4 ? 'stage' : 'student job',
      //     isSkippable: onboardingData[3].isSkippable,
      //     selectionItems: onboardingData[3].selectionItems,
      //     allSkills: onboardingData[3].allSkills,
      //     // internshipTypeItems: onboardingData[1].internshipTypeItems,
      //     // internshipPeriodItems: onboardingData[1].internshipPeriodItems,
      //   );
      //   onboardingPages.add(temp);
      // }

      /// page 8 = Education Page
      if (page == 8) {
        final OnboardingPageModel temp = OnboardingPageModel(
          pageIndex: 8,
          title: 'onboardingEducationTitle'.tr,
          subtitle: 'onboardingEducationTitle'.tr,
        );
        onboardingPages.add(temp);
      }

      /// page 7 = good at list: data analysis
      /// page 9 = hear about Pooulp list
      if (page == 7 || page == 9) {
        final OnboardingPageModel temp = OnboardingPageModel(
          pageIndex: page == 7 ? 7 : 10,
          title: onboardingData[page == 7 ? 2 : 5].title,
          // subtitle: page == 4 ? 'stage' : 'student job',
          isSkippable: onboardingData[page == 7 ? 2 : 5].isSkippable,
          selectionItems: onboardingData[page == 7 ? 2 : 5].selectionItems,
          allSkills: onboardingData[page == 7 ? 2 : 5].allSkills,
          // internshipTypeItems: onboardingData[1].internshipTypeItems,
          // internshipPeriodItems: onboardingData[1].internshipPeriodItems,
        );
        onboardingPages.add(temp);
      }

      /// page 10 = Thank you page
      // if (page == 10) {
      //   final OnboardingPageModel temp = OnboardingPageModel(
      //     pageIndex: 10,
      //     title: 'Be the one!',
      //     subtitle:
      //         'Did you know that you have 80% chance to have a match if you complete most of your profile information? Try to detail as much as possible so that recruiter can have a better opinion on your profile!',
      //   );
      //   onboardingPages.add(temp);
      // }
    }
    updateNumberPage(newValue: onboardingPages.length - 1);
    return onboardingPagesAPIData;
  }

  bool haveitemInList(
    List<FieldModel>? list,
    FieldModel? item,
  ) {
    for (final element in list!) {
      if (item!.id == element.id) {
        return true;
      }
    }
    return false;
  }

  void updateNumberPage({int? newValue}) {
    if (haveitemInList(
          lookingForSelectedList,
          FieldModel(id: 1),
        ) &&
        haveitemInList(
              lookingForSelectedList,
              FieldModel(id: 3),
            ) ==
            true) {
      numPage.value = 11;
    } else if (haveitemInList(
          lookingForSelectedList,
          FieldModel(id: 1),
        ) ==
        true) {
      numPage.value = 9;
    } else if (haveitemInList(
          lookingForSelectedList,
          FieldModel(id: 3),
        ) ==
        true) {
      numPage.value = 8;
    } else {
      numPage.value = 11;
    }
  }

  bool get isFirstPage => selectedPageIndex.value == 0;

  bool get isLastPage => selectedPageIndex.value == numPage.value - 1;

  bool isDisableOnNextButton() {
    final bool isSelectInternshipInLookingFor = haveitemInList(
          lookingForSelectedList,
          FieldModel(id: 1),
        ) ==
        true;
    final bool isSelectStudentJobInLookingFor = haveitemInList(
          lookingForSelectedList,
          FieldModel(id: 3),
        ) ==
        true;
    // condition on matching selection in page 1
    // condition on selection in page 8
    // condition on empty internshipInterestedInSelectedList in page 3
    // condition on empty studentJobInterestedInSelectedList in page 5
    if (
        // if we didn't found or selected internship and StudentJob in page 1
        isFirstPage ||
            isLastPage ||
            (!isSelectInternshipInLookingFor &&
                !isSelectStudentJobInLookingFor &&
                selectedPageIndex.value == 1) ||
            // if we didn't found or selected internship and internshipInterested in page 3
            ((selectedPageIndex.value == 3) &&
                isSelectInternshipInLookingFor &&
                internshipInterestedInSelectedList.isEmpty) ||
            // if we didn't found or selected internship and internshipAddress in page 4
            ((selectedPageIndex.value == 4) &&
                isSelectInternshipInLookingFor &&
                internshipPlaceDetail!.value.fullAddress == null) ||
            // if we didn't found or selected StudentJob and StudentJobInterested in page 5
            ((selectedPageIndex.value == 5) &&
                isSelectStudentJobInLookingFor &&
                studentJobInterestedInSelectedList.isEmpty) ||
            // if we didn't found or selected only StudentJob and StudentJobInterested in page 2
            (((selectedPageIndex.value == 2) &&
                    isSelectStudentJobInLookingFor &&
                    !isSelectInternshipInLookingFor) &&
                studentJobInterestedInSelectedList.isEmpty) ||
            // if we didn't found or selected only StudentJob and StudentJobAddress in page 2
            ((selectedPageIndex.value == 3) &&
                isSelectStudentJobInLookingFor &&
                !isSelectInternshipInLookingFor &&
                studentJobPlaceDetail!.value.fullAddress == null) ||
            // if we didn't found or selected knowFromSourceSelectedList in page 6(only studentJob)
            // page 7(only Internship) // page 9 for select both
            (((selectedPageIndex.value == 6 &&
                        isSelectStudentJobInLookingFor &&
                        !isSelectInternshipInLookingFor) ||
                    (selectedPageIndex.value == 7 &&
                        isSelectInternshipInLookingFor &&
                        !isSelectStudentJobInLookingFor) ||
                    (selectedPageIndex.value == 9 &&
                        isSelectInternshipInLookingFor &&
                        isSelectStudentJobInLookingFor)) &&
                knowFromSourceSelectedList!.isEmpty)) {
      return true;
    } else {
      return false;
    }
  }

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
    required RxList<FieldModel>? addToList,
    required FieldModel? itemToBeAdd,
    bool? isList = true,
    // 1 = selectionItems, 2 = iternshipType, 3 = internshipPeriod
  }) {
    /// select/add multiple items to the list
    if (isList == true) {
      if (addToList!.contains(itemToBeAdd)) {
        addToList.removeWhere((element) => element.id == itemToBeAdd!.id);
      } else {
        addToList.add(itemToBeAdd!);
      }
    }
    // else select only one item to the list
    else {
      addToList!.clear();
      addToList.add(itemToBeAdd!);
    }
    isUpdate.value = !isUpdate.value;
  }

  /// Education Page

  void getUpdate() => isUpdate.value = switchingBooleanValue(
        boolValue: isUpdate.value,
      );
  // update();

  SchoolModel selectedSchoolOnClick({SchoolModel? selectedItem}) {
    getUpdate();
    return selectedItem!;
  }

  void addOrRemoveEduSlot({
    bool? isRemove = false, // False == Add // True == Remove
    int? eduIndex,
    // required EducationModel? eduSlotToBeAdd,
  }) {
    // [Remove]
    if (isRemove!) {
      // print('[Remove]');
      // degreeListTextCtrl.removeAt(eduIndex!);
      // currentStudyYearTextCtrl.removeAt(eduIndex);
      selectedStartedDateString.removeAt(eduIndex!);
      educationList.removeAt(eduIndex);
    }
    // [Add]
    else {
      // print('[Add]');
      // degreeListTextCtrl.add(TextEditingController());
      // currentStudyYearTextCtrl.add(TextEditingController());
      selectedStartedDateString.add('');
      educationList.add(
        EducationModel(
          school: SchoolModel(),
          fields: [],
          degreeTag: FieldModel(),
          // degree: '',
          completed: false,
        ),
      );
    }
    getUpdate();
  }
  // Education Page

  void validateData() {
    final List<EducationModel> eduToBeAdd = [];
    for (var i = 0; i < educationList.length; i++) {
      if (educationList[i].school!.id != null) {
        eduToBeAdd.add(
          EducationModel(
            schoolId: educationList[i].school!.id,
            name: '',
            fields: educationList[i].fields,
            description: '',
            // degree: degreeListTextCtrl[i].text,
            degreeId: educationList[i].degreeTag!.id ?? 0,
            dateStart: selectedStartedDateString[i] == ''
                ? null
                : DateTime.tryParse(
                    selectedStartedDateString[i],
                  ),
            studyingYear: 0, //int.tryParse(currentStudyYearTextCtrl[i].text),
            completed: educationList[i].completed,
          ),
        );
      }
    }
    final OnboardingModel onboardingDataToBeAdd = OnboardingModel(
      source: knowFromSourceSelectedList![0],
      skills: goodAtfieldSelectedList,
      educations: eduToBeAdd,
      searches: [
        if (haveitemInList(
              lookingForSelectedList,
              FieldModel(id: 1),
            ) ==
            true)
          SearchPreferencesModel(
            types: [FieldModel(id: 1)],
            internshipTypes: internshipTypeSelectedList,
            internshipPeriods: internshipPeriodSelectedList,
            internshipTypeText: internshipOtherTextCtrl.text,
            fields: internshipInterestedInSelectedList,
            languages: internshipLanguageSelectedList,
            location: internshipPlaceDetail!.value.fullAddress,
            street: internshipPlaceDetail!.value.streetNumber,
            city: internshipPlaceDetail!.value.areaLevel1,
            zipcode: internshipPlaceDetail!.value.postalCode,
            country: internshipPlaceDetail!.value.country,
            latitude: internshipPlaceDetail!.value.lat.toString(),
            longitude: internshipPlaceDetail!.value.lng.toString(),
            range: internshipRadiusRxInt.value,
            telecommuting: 2,
          ),
        if (haveitemInList(
              lookingForSelectedList,
              FieldModel(id: 3),
            ) ==
            true)
          SearchPreferencesModel(
            types: [FieldModel(id: 3)],
            internshipTypes: [],
            internshipPeriods: [],
            fields: studentJobInterestedInSelectedList,
            languages: studentJobLanguageSelectedList,
            location: studentJobPlaceDetail!.value.fullAddress,
            street: studentJobPlaceDetail!.value.streetNumber,
            city: studentJobPlaceDetail!.value.areaLevel1,
            zipcode: studentJobPlaceDetail!.value.postalCode,
            country: studentJobPlaceDetail!.value.country,
            latitude: studentJobPlaceDetail!.value.lat.toString(),
            longitude: studentJobPlaceDetail!.value.lng.toString(),
            range: studentJobRadiusRxInt.value,
            telecommuting: 2,
          ),
      ],
    );
    // if (belgiumCitiesToFieldSelected == [] ||
    //     belgiumCitiesToFieldSelected.isEmpty) {
    //   customSnackbar(
    //     msgTitle: 'validator.requireFieldsMsg'.tr,
    //     msgContent: '',
    //     bgColor: ColorsManager.red,
    //     duration: DurationConstant.d1500,
    //   );
    // } else {
    // final OnboardingModel onboardingDataToBeAdd = OnboardingModel(
    //   offerTypePreferences: lookingForSelectedList,
    //   internshipTypePreferences:
    //       internshipTypeSelectedList,
    //   internshipPeriodPreferences:
    //       internshipPeriodSelectedList,
    //   fieldPreferences: interestedInSelectionListPage1.value.selectionItems,
    //   skills: goodAtListSelectionPage2.value.selectionItems,
    //   languages: languageSelectionListPage3.value.selectionItems,
    //   location: placeDetail!
    //       .value.fullAddress, //belgiumCitiesToFieldSelected.first.label,
    //   locationStreet:
    //       placeDetail!.value.streetNumber ?? placeDetail!.value.route,
    //   locationZipCode: placeDetail!.value.postalCode,
    //   locationCity: placeDetail!.value.areaLevel1,
    //   locationCountry: placeDetail!.value.country,
    //   locationLat: placeDetail!.value.lat
    //       .toString(), // belgiumCitiesToFieldSelected.first.type,
    //   locationLng: placeDetail!.value.lng
    //       .toString(), //  belgiumCitiesToFieldSelected.first.category,
    //   locationRadius: radiusRxInt.value,
    //   source: FieldModel(id: knowFromFieldSelected.first.id),
    // );

    // debugPrint('placeDetail: $placeDetail');

    // debugPrint('onboardingDataToBeAdd: ${onboardingDataToBeAdd.toJson()}');
    submitDataToAPI(onboardingData: onboardingDataToBeAdd);
  }

  Future<void> submitDataToAPI({OnboardingModel? onboardingData}) async {
    final JsonResponse responseData =
        await onboardingProvider.postOnboarding(onboardingData: onboardingData);

    if (responseData.success!) {
      // debugPrint('=====success=====');
      customSnackbar(
        msgTitle: 'success'.tr,
        msgContent: '',
        bgColor: ColorsManager.green,
        duration: DurationConstant.d1500,
      );
      Get.offNamed(Routes.homeRoute);
    }
  }

  Future<List<SchoolModel>> getSchoolListResponseProvider({
    bool? refresh = false,
  }) async {
    schoolList.addAll(await tagProvider.getSchools());
    return schoolList;
  }

  Future<List<FieldModel>> getFieldsListResponseProvider({
    bool? refresh = false,
  }) async {
    fieldListForSelect.addAll(await tagProvider.getAllFields());
    // debugPrint(
    //   'fieldListForSelect:: ${fieldListForSelect.map((element) => '${element.label}\n')}',
    // );
    return fieldListForSelect;
  }

  Future<List<FieldModel>> getSchoolDegreeListResponseProvider({
    bool? refresh = false,
  }) async {
    schoolDegreeList.addAll(await tagProvider.getSchoolDegreeTags());
    // debugPrint(
    //   'fieldListForSelect:: ${fieldListForSelect.map((element) => '${element.label}\n')}',
    // );
    return schoolDegreeList;
  }
}
