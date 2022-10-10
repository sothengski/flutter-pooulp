import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import '../../data/data.dart';
import '../../routes/routes.dart';

class OnboardingController extends GetxController
    with StateMixin<Rx<OnboardingModel>> {
  final onboardingProvider = Get.find<OnboardingProvider>();
  final placeApiProvider = Get.put(PlaceApiProvider());

  PageController pageController = PageController();
  RxInt selectedPageIndex = 0.obs;
  // RxList<OnboardingPageModel> onboardingDataToBeAdded =
  //     <OnboardingPageModel>[].obs;

  RxList<OnboardingPageModel> onboardingPages = <OnboardingPageModel>[].obs;
  Rx<OnboardingModel> onboardingPagesAPIData =
      const OnboardingModel(totalPage: 0).obs;

  RxList<FieldModel> lookingForSelectedList = <FieldModel>[].obs;

  RxList<FieldModel> internshipTypeSelectedList = <FieldModel>[].obs;
  RxList<FieldModel> internshipPeriodSelectedList = <FieldModel>[].obs;
  RxList<FieldModel> internshipInterestedInSelectedList = <FieldModel>[].obs;
  RxList<FieldModel> internshipLanguageSelectedList = <FieldModel>[].obs;
  Rx<PlaceDetailModel>? internshipPlaceDetail = PlaceDetailModel().obs;
  RxInt internshipRadiusRxInt = 100.obs;
  TextEditingController internshipAddressCtrl = TextEditingController();

  RxList<FieldModel> studentJobInterestedInSelectedList = <FieldModel>[].obs;
  RxList<FieldModel> studentJobLanguageSelectedList = <FieldModel>[].obs;
  Rx<PlaceDetailModel>? studentJobPlaceDetail = PlaceDetailModel().obs;
  RxInt studentJobRadiusRxInt = 100.obs;
  TextEditingController studentJobAddressCtrl = TextEditingController();

  RxList<FieldModel>? goodAtfieldSelectedList = <FieldModel>[].obs;
  RxList<FieldModel>? knowFromSourceSelectedList = <FieldModel>[].obs;

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
    for (var page = 0; page < 10; page++) {
      final List<OnboardingPageModel> onboardingData =
          onboardingPagesAPIData.value.pages!;

      /// page 0 = Introduction Page
      /// page 9 = Thank you page
      if (page == 0 || page == 9) {
        final OnboardingPageModel temp = OnboardingPageModel(
          pageIndex: page == 0 ? 0 : 9,
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
              : 'onboardingInternshipTitle'.tr,
          subtitle: page == 2 ? 'Internship'.tr : '',
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
          title: onboardingData[1].title,
          subtitle: page == 3 ? 'Internship'.tr : 'Student job'.tr,
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
          title: onboardingData[4].title,
          subtitle: page == 4 ? 'Internship'.tr : 'Student job'.tr,
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

      /// page 7 = good at list: data analysis
      /// page 8 = hear about Pooulp list
      if (page == 7 || page == 8) {
        final OnboardingPageModel temp = OnboardingPageModel(
          pageIndex: page == 7 ? 7 : 9,
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
      numPage.value = 10;
    } else if (haveitemInList(
          lookingForSelectedList,
          FieldModel(id: 1),
        ) ==
        true) {
      numPage.value = 8;
    } else if (haveitemInList(
          lookingForSelectedList,
          FieldModel(id: 3),
        ) ==
        true) {
      numPage.value = 7;
    } else {
      numPage.value = 10;
    }
  }

  bool get isFirstPage => selectedPageIndex.value == 0;

  bool get isLastPage => selectedPageIndex.value == numPage.value - 1;

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

  void validateData() {
    final OnboardingModel onboardingDataToBeAdd = OnboardingModel(
      source: knowFromSourceSelectedList![0],
      skills: goodAtfieldSelectedList,
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
}
