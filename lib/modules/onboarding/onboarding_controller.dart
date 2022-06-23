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

  Rx<OnboardingPageModel> lookingForSelectionListPage0 =
      OnboardingPageModel(pageIndex: 0, selectionItems: []).obs;
  Rx<OnboardingPageModel> interestedInSelectionListPage1 =
      OnboardingPageModel(pageIndex: 1, selectionItems: []).obs;
  Rx<OnboardingPageModel> goodAtListSelectionPage2 =
      OnboardingPageModel(pageIndex: 2, selectionItems: []).obs;
  Rx<OnboardingPageModel> goodAtListSelectionPage2BasedonPage1 =
      OnboardingPageModel(pageIndex: 2, selectionItems: []).obs;
  Rx<OnboardingPageModel> languageSelectionListPage3 =
      OnboardingPageModel(pageIndex: 3, selectionItems: []).obs;

  RxList<FieldModel>? goodAtfieldList = <FieldModel>[].obs;
  // RxList<FieldModel>? goodAtfieldListBasedOnCategory = <FieldModel>[].obs;

  RxBool isUpdate = false.obs;

  RxList<CityModel> belgiumCitiesList = <CityModel>[].obs;
  RxList<FieldModel> belgiumCitiesToField = <FieldModel>[].obs;
  RxList<FieldModel> belgiumCitiesToFieldSelected = <FieldModel>[].obs;

  String? sessionToken = '';
  Rx<PlaceDetailModel>? placeDetail = PlaceDetailModel().obs;
  GooglePlaceSearchModel? results;

  TextEditingController addressCtrl = TextEditingController();
  RxInt radiusRxInt = 10.obs;

  // Rx<FieldModel> belgiumCitySelected = FieldModel(label: '').obs;

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
    getBelgiumCities();
  }

  void uuidTokenGenerator() => sessionToken = UuidGenerator().uuidV4();

  Future<Rx<PlaceDetailModel>> getPlaceDetail({
    String? placeId,
    String? sessionToken,
  }) async {
    placeDetail!.value = await placeApiProvider.getGooglePlaceFilterDetail(
      placeId: placeId,
      sessionToken: sessionToken,
    );
    return placeDetail!;
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
    for (final item in onboardingPagesAPIData.value.pages!) {
      /// need some modifies to start the pageIndex from 0 instead of 1
      final OnboardingPageModel temp = OnboardingPageModel(
        pageIndex: item.pageIndex! - 1,
        title: item.title,
        isSkippable: item.isSkippable,
        selectionItems: item.selectionItems,
        allSkills: item.allSkills,
      );

      onboardingPages.add(temp);
      if (item.pageIndex == 3) {
        final tempGoodAtfieldList = <FieldModel>{};
        for (final subField in item.selectionItems!) {
          tempGoodAtfieldList.addAll(subField.subFieldList!);
        }

        /// remove duplicate fieldItem based on ID
        for (final item in tempGoodAtfieldList) {
          final i = goodAtfieldList!.indexWhere((x) => x.id == item.id);
          if (i <= -1) {
            goodAtfieldList!.add(item);
          }
        }
      }
    }
    // onboardingPages.add(
    //   OnboardingPageModel(
    //     pageIndex: 4,
    //     title: 'Where do you want to work?',
    //     isSkippable: false,
    //     selectionItems: [],
    //   ),
    // );

    return onboardingPagesAPIData;
  }

  void getBelgiumCities() {
    belgiumCitiesList.value = belgiumCities;
    for (final item in belgiumCitiesList) {
      final temp = FieldModel(
        label: item.city, //convert city name to label in FieldModel
        type: item.lat, //convert lat of the city to type in FieldModel
        category: item.lng, //convert lng of the city  to category in FieldModel
      );
      belgiumCitiesToField.add(temp);
    }
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
    if (pageIndex == 0) {
      if (!lookingForSelectionListPage0.value.selectionItems!
          .contains(itemToBeAdd)) {
        lookingForSelectionListPage0.value.selectionItems!.add(itemToBeAdd!);
        // print('add:');
        // print('lookingForSelectionListPage0:::: $lookingForSelectionListPage0');
      } else if (lookingForSelectionListPage0.value.selectionItems!
          .contains(itemToBeAdd)) {
        lookingForSelectionListPage0.value.selectionItems!
            .removeWhere((element) => element.id == itemToBeAdd!.id);
        // print('remove:');
        // print('lookingForSelectionListPage0:::: $lookingForSelectionListPage0');
      }
    }
    if (pageIndex == 1) {
      if (!interestedInSelectionListPage1.value.selectionItems!
          .contains(itemToBeAdd)) {
        interestedInSelectionListPage1.value.selectionItems!.add(itemToBeAdd!);
        // for (final fieldItem in onboardingPages) {
        // if (fieldItem.pageIndex == pageIndex! + 1) {
        //   goodAtListSelectionPage2BasedonPage1.value.selectionItems!.add(
        //     fieldItem.selectionItems!
        //         .firstWhere((element) => element.id == itemToBeAdd.id),
        //   );
        //   final tempGoodAtfieldList = <FieldModel>{};
        //   for (final subField
        //       in goodAtListSelectionPage2BasedonPage1.value.selectionItems!) {
        //     tempGoodAtfieldList.addAll(subField.subFieldList!);
        //   }
        //   goodAtfieldList!.clear();

        //   /// remove duplicate fieldItem based on ID
        //   for (final item in tempGoodAtfieldList) {
        //     final i = goodAtfieldList!.indexWhere((x) => x.id == item.id);
        //     if (i <= -1) {
        //       goodAtfieldList!.add(item);
        //     }
        //   }
        //   // debugPrint(
        //   //   'goodAtListSelectionPage2BasedonPage1:: $goodAtListSelectionPage2BasedonPage1',
        //   // );
        //   // print(
        //   //   'add:: ${goodAtListSelectionPage2BasedonPage1.value.selectionItems!.length}',
        //   // );
        //   // print(
        //   //   'add:: ${goodAtListSelectionPage2BasedonPage1.value.selectionItems!.map(
        //   //     (e) => e.subFieldList!.length,
        //   //   )}',
        //   // );
        // }
        // }

        // print('add:');
      } else if (interestedInSelectionListPage1.value.selectionItems!
          .contains(itemToBeAdd)) {
        interestedInSelectionListPage1.value.selectionItems!
            .removeWhere((element) => element.id == itemToBeAdd!.id);
        // print('remove:');

        //   for (final fieldItem in onboardingPages) {
        //     if (fieldItem.pageIndex == pageIndex! + 1) {
        //       goodAtListSelectionPage2BasedonPage1.value.selectionItems!
        //           .removeWhere(
        //         (element) => element.id == itemToBeAdd!.id,
        //       );
        //       final tempGoodAtfieldList = <FieldModel>{};
        //       for (final subField
        //           in goodAtListSelectionPage2BasedonPage1.value.selectionItems!) {
        //         tempGoodAtfieldList.addAll(subField.subFieldList!);
        //       }
        //       goodAtListSelectionPage2.value.selectionItems!.clear();
        //       goodAtfieldList!.clear();

        //       /// remove duplicate fieldItem based on ID
        //       for (final item in tempGoodAtfieldList) {
        //         final i = goodAtfieldList!.indexWhere((x) => x.id == item.id);
        //         if (i <= -1) {
        //           goodAtfieldList!.add(item);
        //         }
        //       }
        //       // debugPrint(
        //       //   'goodAtListSelectionPage2BasedonPage1:: $goodAtListSelectionPage2BasedonPage1',
        //       // );
        //       // print(
        //       //   'remove:: ${goodAtListSelectionPage2BasedonPage1.value.selectionItems!.length}',
        //       // );
        //     }
        //   }
      }
    }
    if (pageIndex == 2) {
      if (!goodAtListSelectionPage2.value.selectionItems!
          .contains(itemToBeAdd)) {
        goodAtListSelectionPage2.value.selectionItems!.add(itemToBeAdd!);
        // print('add:');
      } else if (goodAtListSelectionPage2.value.selectionItems!
          .contains(itemToBeAdd)) {
        goodAtListSelectionPage2.value.selectionItems!
            .removeWhere((element) => element.id == itemToBeAdd!.id);
        // print('remove:');
      }
    }
    if (pageIndex == 3) {
      if (!languageSelectionListPage3.value.selectionItems!
          .contains(itemToBeAdd)) {
        languageSelectionListPage3.value.selectionItems!.add(itemToBeAdd!);
        // print('add:');
      } else if (languageSelectionListPage3.value.selectionItems!
          .contains(itemToBeAdd)) {
        languageSelectionListPage3.value.selectionItems!
            .removeWhere((element) => element.id == itemToBeAdd!.id);
        // print('remove:');
      }
    }

    if (pageIndex == 4) {
      belgiumCitiesToFieldSelected.clear();
      if (!belgiumCitiesToFieldSelected.contains(itemToBeAdd)) {
        belgiumCitiesToFieldSelected.add(itemToBeAdd!);
      } else if (belgiumCitiesToFieldSelected.contains(itemToBeAdd)) {
        belgiumCitiesToFieldSelected
            .removeWhere((element) => element.id == itemToBeAdd!.id);
      }
    }

    /// isUpdate is used for trigger the update into the UI
    isUpdate.value = switchingBooleanValue(boolValue: isUpdate.value);
  }

  void validateData() {
    // debugPrint('lookingForSelectionListPage0: $lookingForSelectionListPage0');
    // debugPrint(
    //   'interestedInSelectionListPage1: $interestedInSelectionListPage1',
    // );
    // debugPrint('goodAtListSelectionPage2: $goodAtListSelectionPage2');
    // debugPrint('languageSelectionListPage3: $languageSelectionListPage3');
    // debugPrint('belgiumCitiesToFieldSelected: $belgiumCitiesToFieldSelected');
    // if (belgiumCitiesToFieldSelected == [] ||
    //     belgiumCitiesToFieldSelected.isEmpty) {
    //   customSnackbar(
    //     msgTitle: 'validator.requireFieldsMsg'.tr,
    //     msgContent: '',
    //     bgColor: ColorsManager.red,
    //     duration: DurationConstant.d1500,
    //   );
    // } else {
    final OnboardingModel onboardingDataToBeAdd = OnboardingModel(
      offerTypePreferences: lookingForSelectionListPage0.value.selectionItems,
      fieldPreferences: interestedInSelectionListPage1.value.selectionItems,
      skills: goodAtListSelectionPage2.value.selectionItems,
      languages: languageSelectionListPage3.value.selectionItems,
      location: placeDetail!
          .value.fullAddress, //belgiumCitiesToFieldSelected.first.label,
      locationStreet:
          placeDetail!.value.streetNumber ?? placeDetail!.value.route,
      locationZipCode: placeDetail!.value.postalCode,
      locationCity: placeDetail!.value.areaLevel1,
      locationCountry: placeDetail!.value.country,
      locationLat: placeDetail!.value.lat
          .toString(), // belgiumCitiesToFieldSelected.first.type,
      locationLng: placeDetail!.value.lng
          .toString(), //  belgiumCitiesToFieldSelected.first.category,
      locationRadius: radiusRxInt.value,
    );

    // debugPrint('placeDetail: $placeDetail');

    // debugPrint('onboardingDataToBeAdd: ${onboardingDataToBeAdd.toJson()}');
    submitDataToAPI(onboardingData: onboardingDataToBeAdd);
    // }
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
