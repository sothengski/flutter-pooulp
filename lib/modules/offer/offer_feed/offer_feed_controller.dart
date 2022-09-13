import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';
import '../../modules.dart';

class OfferFeedController extends GetxController
    with StateMixin<RxList<JobOfferModel>> {
  // final feedProvider = Get.find<FeedProvider>();
  final offerProvider = Get.find<OfferProvider>();
  final tagProvider = Get.find<TagProvider>();
  final placeApiProvider = Get.put(PlaceApiProvider());

  final offerHelper = OfferHelper();

  final homeController = Get.put(HomeController());

  final profileController = Get.put(ProfileController());
  final ScrollController scrollController = ScrollController();
  // final RefreshController refreshController =
  //     RefreshController(initialRefresh: true);

  RxList<JobOfferModel> feedListRepsonse = <JobOfferModel>[].obs;
  RxList<JobOfferModel> feedFilterList = <JobOfferModel>[].obs;

  Rx<PaginationModel> feedListPagination =
      PaginationModel(meta: MetaModel()).obs;

  int pageNum = 1;

  final FieldModel allType = FieldModel(label: 'All');

  Rx<FieldModel> typeSelected = FieldModel(label: 'All').obs;
  // FieldModel? typeSelected;

  // List<FieldModel> listFilterTypes = [];
  RxList<FieldModel> listJobOfferTypes = <FieldModel>[].obs;

  Set<String?> setOfListTypes = {};

  RxInt workPlaceTypesForSearch = 2.obs;
  // RxList<FieldModel> typesListForSearch = <FieldModel>[].obs;
  RxList<FieldModel> fieldListForSearch = <FieldModel>[].obs;
  RxList<FieldModel> languageListForSearch = <FieldModel>[].obs;
  RxList<FieldModel> availabilitiesTagListForSearch = <FieldModel>[].obs;
  RxList<FieldModel> internshipTypeTagListForSearch = <FieldModel>[].obs;
  RxList<FieldModel> internshipPeriodTagListForSearch = <FieldModel>[].obs;

  RxInt workPlaceTypesInFilter = 2.obs;
  Rx<CountryModel> selectedCountryInFilter = const CountryModel().obs;
  RxList<FieldModel> typesListInFilter = <FieldModel>[].obs;
  RxList<FieldModel> fieldListInFilter = <FieldModel>[].obs;
  RxList<FieldModel> languageListInFilter = <FieldModel>[].obs;
  RxList<FieldModel> availabilitiesTagListInFilter = <FieldModel>[].obs;
  RxList<FieldModel> internshipTypeTagListInFilter = <FieldModel>[].obs;
  RxList<FieldModel> internshipPeriodTagListInFilter = <FieldModel>[].obs;

  RxString keywordToBeSearch = ''.obs;
  TextEditingController keywordToBeSearchTextCtrl = TextEditingController();

  RxInt workPlaceTypesToBeSearch = 2.obs;
  Rx<CountryModel> countryToBeSearch = const CountryModel().obs;
  RxList<FieldModel> typesListToBeSearch = <FieldModel>[].obs;
  RxList<FieldModel> fieldListToBeSearch = <FieldModel>[].obs;
  // RxList<int> fieldListToBeSearch = <int>[].obs;
  RxList<FieldModel> languageListToBeSearch = <FieldModel>[].obs;
  RxList<FieldModel> availabilitiesTagListToBeSearch = <FieldModel>[].obs;
  RxList<FieldModel> internshipTypeTagListToBeSearch = <FieldModel>[].obs;
  RxList<FieldModel> internshipPeriodTagListToBeSearch = <FieldModel>[].obs;

  Rx<PlaceDetailModel> placeDetail = PlaceDetailModel().obs;
  TextEditingController addressCtrl = TextEditingController();

  RxInt radiusRxInt = 10.obs;

  Rx<JobOfferModel> jobOfferToBeSearch = JobOfferModel().obs;
  Rx<SearchPreferencesModel> searchPreferenceData =
      SearchPreferencesModel().obs;

  RxInt filterCountRxInt = 0.obs;

  RxBool isLoadingIndicator = false.obs;

  RxBool isBag = false.obs;

  List<String> suggestionWordList = [
    'Operator',
    'Design',
    'Marketing',
    'Specialist',
    'Information technology',
    'Accounting',
    'Engineering',
    'Finance',
    'Human resources',
    'Recruitment',
    'Procurement',
    'Architecture',
    'Software development',
    'Microsoft Office',
    'Business administration',
    'Information systems',
    'Nursing'
  ];

  @override
  Future<void> onInit() async {
    super.onInit();
    await getSearchPreferenceResponseProvider();
    await getjobOfferTypesListResponseProvider();
    await getFieldsListResponseProvider();
    await getLanguagesListResponseProvider();
    await getAvailabilitiesTagListResponseProvider();
    await getInternshipTypeTagsListResponseProvider();
    await getInternshipPeriodTagsListResponseProvider();
    await getFeedsDataState(refresh: true)
        // .then((value) => isProcessingStudentInfoRepsonse.value = true)
        ;
    await addItemsIntoList();
  }

  String updateKeyword({String? newKeyword = ''}) =>
      keywordToBeSearch.value = newKeyword.toString();

  void syncKeyWord({String? newKeyword = ''}) => {
        keywordToBeSearch.value = newKeyword.toString(),
        keywordToBeSearchTextCtrl.text = newKeyword.toString(),
      };

  CountryModel selectedCountryOnClick(CountryModel selectedItem) {
    return selectedCountryInFilter.value = selectedItem;
  }

  // void addingOrRemovingFieldInFieldListToBeSearch({int? intIdValue}) {
  //   // update();
  //   if (fieldListToBeSearch.contains(intIdValue)) {
  //     fieldListToBeSearch.remove(intIdValue);
  //   } else {
  //     fieldListToBeSearch.add(intIdValue!);
  //   }
  // }

  // void addingOrRemovingFieldInFieldListToBeSearch({FieldModel? fieldValue}) {
  //   // update();
  //   if (fieldListToBeSearch.contains(fieldValue)) {
  //     fieldListToBeSearch.remove(fieldValue);
  //   } else {
  //     fieldListToBeSearch.add(fieldValue!);
  //   }
  // }

  void addingOrRemovingFieldInFieldListToBeSearch({
    RxList<FieldModel>? list,
    FieldModel? fieldValue,
    bool? isList = true,
  }) {
    /// select/add multiple items to the list
    if (isList == true) {
      if (list!.contains(fieldValue)) {
        list.removeWhere((element) => element.id == fieldValue!.id);
      } else {
        list.add(fieldValue!);
      }
    }
    // else select only one item to the list
    else {
      list!.clear();
      list.add(fieldValue!);
    }
  }

  void clearPlaceDetail() {
    addressCtrl.clear();
    placeDetail.value = PlaceDetailModel();
  }

  void clearAllFilterToBeSearch() {
    keywordToBeSearch.value = '';
    keywordToBeSearchTextCtrl.text = '';
    selectedCountryInFilter.value = const CountryModel();

    workPlaceTypesInFilter.value = 2; // 2 == Hybrid(Default)
    languageListInFilter.value = [];
    fieldListInFilter.value = [];
    typesListInFilter.value = [];
    typesListInFilter.add(allType);
    availabilitiesTagListInFilter.value = [];
    internshipTypeTagListInFilter.value = [];
    internshipPeriodTagListInFilter.value = [];

    countryToBeSearch.value = const CountryModel();
    workPlaceTypesToBeSearch.value = 2; // 2 == Hybrid(Default)
    languageListToBeSearch.value = [];
    fieldListToBeSearch.value = [];
    // typesListToBeSearch.value = [];
    selectType(type: allType);
    availabilitiesTagListToBeSearch.value = [];
    internshipTypeTagListToBeSearch.value = [];
    internshipPeriodTagListToBeSearch.value = [];

    placeDetail.value = PlaceDetailModel();
    radiusRxInt.value = 10;
    countFilterField();

    // debugPrint(
    //   'clearAllFilterToBeSearch',
    // );
    // debugPrint(
    //   'languageListToBeSearch:: ${languageListToBeSearch.map((element) => '${element.label}\n')}',
    // );
    // debugPrint(
    //   'fieldListToBeSearch:: ${fieldListToBeSearch.map((element) => '${element.label}\n')}',
    // );
  }

  void dismissFilter() {
    keywordToBeSearchTextCtrl.text = keywordToBeSearch.value;
    workPlaceTypesInFilter.value = workPlaceTypesToBeSearch.value;
    selectedCountryInFilter.value = countryToBeSearch.value;
    languageListInFilter.clear();
    fieldListInFilter.clear();
    typesListInFilter.clear();
    availabilitiesTagListInFilter.clear();
    internshipTypeTagListInFilter.clear();
    internshipPeriodTagListInFilter.clear();
    languageListInFilter.addAll(languageListToBeSearch);
    fieldListInFilter.addAll(fieldListToBeSearch);
    typesListInFilter.addAll(typesListToBeSearch);
    availabilitiesTagListInFilter.addAll(availabilitiesTagListToBeSearch);
    internshipTypeTagListInFilter.addAll(internshipTypeTagListToBeSearch);
    internshipPeriodTagListInFilter.addAll(internshipPeriodTagListToBeSearch);
    countFilterField();
    // debugPrint('dismissFilter');
    // debugPrint(
    //   'languageListToBeSearch:: ${languageListToBeSearch.map((element) => '${element.label}\n')}',
    // );
    // debugPrint(
    //   'languageListInFilter:: ${languageListInFilter.map((element) => '${element.label}\n')}',
    // );
  }

  void applyFilterToBeSearch() {
    keywordToBeSearch.value = keywordToBeSearchTextCtrl.text;
    workPlaceTypesToBeSearch.value = workPlaceTypesInFilter.value;
    countryToBeSearch.value = selectedCountryInFilter.value;
    languageListToBeSearch.clear();
    fieldListToBeSearch.clear();
    typesListToBeSearch.clear();
    selectType(type: typesListInFilter[0]);
    availabilitiesTagListToBeSearch.clear();
    internshipTypeTagListToBeSearch.clear();
    internshipPeriodTagListToBeSearch.clear();
    languageListToBeSearch.addAll(languageListInFilter);
    fieldListToBeSearch.addAll(fieldListInFilter);
    typesListToBeSearch.addAll(typesListInFilter);
    // select internship(id=1) == 1
    if (typesListInFilter[0].id == 1) {
      internshipTypeTagListToBeSearch.addAll(internshipTypeTagListInFilter);
      internshipPeriodTagListToBeSearch.addAll(internshipPeriodTagListInFilter);
    }
    // select different from internship(id=1) != 1
    else {
      availabilitiesTagListToBeSearch.addAll(availabilitiesTagListInFilter);
    }
    countFilterField();
    getFeedsDataState();

    // debugPrint(
    //   'applyFilterToBeSearch',
    // );
    // debugPrint(
    //   'languageListToBeSearch:: ${languageListToBeSearch.map((element) => '${element.label}\n')}',
    // );
    // debugPrint(
    //   'fieldListForSearch:: ${fieldListForSearch.map((element) => '${element.label}\n')}',
    // );
  }

  void countFilterField() {
    int tempCount = 0;
    if (keywordToBeSearchTextCtrl.text.isNotEmpty) {
      tempCount += 1;
    }
    if (workPlaceTypesInFilter.value != 2) {
      tempCount += 1;
    }
    if (languageListInFilter.isNotEmpty) {
      tempCount += 1;
    }
    if (fieldListInFilter.isNotEmpty) {
      tempCount += 1;
    }
    if (typesListInFilter.isNotEmpty) {
      tempCount += 1;
    }
    if (availabilitiesTagListInFilter.isNotEmpty) {
      tempCount += 1;
    }
    if (placeDetail.value.country != '' && placeDetail.value.country != null) {
      tempCount += 1;
    }

    filterCountRxInt.value = tempCount;
  }

  bool jobOfferOnClickBoolSwitching({bool? boolValue}) {
    update();
    return !boolValue!;
  }

  Future<void> onRefresh() async {
    await getFeedsDataState(refresh: true);
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
  }

  Future<void> getFeedsDataState({bool? refresh}) async {
    change(null, status: RxStatus.loading());
    getfeedListResponseProvider(refresh: refresh).then(
      (resp) {
        change(resp, status: RxStatus.success());
      },
      onError: (err) {
        change(
          null,
          status: RxStatus.error('Error'),
        );
        isLoadingIndicator.value = false;
      },
    );
  }

  Future<SearchPreferencesModel> getSearchPreferenceResponseProvider({
    bool? refresh = false,
  }) async {
    searchPreferenceData.value = await offerProvider.getSearchPreferences();
    typesListToBeSearch
        .addAll(searchPreferenceData.value.offerTypePreferences!);
    languageListToBeSearch
        .addAll(searchPreferenceData.value.languagePreferences!);
    fieldListToBeSearch.addAll(searchPreferenceData.value.fieldPreferences!);
    availabilitiesTagListToBeSearch
        .addAll(searchPreferenceData.value.availabilityPreferences!);
    //! Not Implement on the backend-side yet
    // internshipTypeTagListToBeSearch
    //     .addAll(searchPreferenceData.value.internshipTypePreferences!);
    // availabilitiesTagListToBeSearch
    //     .addAll(searchPreferenceData.value.internshipPeriodPreferences!);
    //! Not Implement on the backend-side yet
    placeDetail.value = PlaceDetailModel(
      fullAddress: searchPreferenceData.value.locationPreference,
      streetNumber: searchPreferenceData.value.locationStreet,
      lat: double.tryParse(
        searchPreferenceData.value.locationLatitude.toString(),
      ),
      lng: double.tryParse(
        searchPreferenceData.value.locationLongitude.toString(),
      ),
      areaLevel1: searchPreferenceData.value.locationCity,
      country: searchPreferenceData.value.locationCountry,
      postalCode: searchPreferenceData.value.locationZip,
    );
    radiusRxInt.value = (searchPreferenceData.value.radius! / 1000).round();
    dismissFilter();
    return searchPreferenceData.value;
  }

  Future<List<FieldModel>> getjobOfferTypesListResponseProvider({
    bool? refresh = false,
  }) async {
    selectType(type: allType, isRefresh: false);
    listJobOfferTypes.add(allType);
    listJobOfferTypes.addAll(await tagProvider.getJobOfferTypes());

    return listJobOfferTypes;
  }

  Future<List<FieldModel>> getFieldsListResponseProvider({
    bool? refresh = false,
  }) async {
    fieldListForSearch.addAll(await tagProvider.getAllFields());
    // debugPrint(
    //   'fieldListForSearch:: ${fieldListForSearch.map((element) => '${element.label}\n')}',
    // );
    return fieldListForSearch;
  }

  Future<List<FieldModel>> getLanguagesListResponseProvider({
    bool? refresh = false,
  }) async {
    languageListForSearch.addAll(await tagProvider.getLanguages());
    // debugPrint(
    //   'languageListForSearch:: ${languageListForSearch.map((element) => '${element.label}\n')}',
    // );
    return languageListForSearch;
  }

  Future<List<FieldModel>> getAvailabilitiesTagListResponseProvider({
    bool? refresh = false,
  }) async {
    availabilitiesTagListForSearch
        .addAll(await tagProvider.getAvailabilitiesTags());
    // debugPrint(
    //   'availabilitiesTagListForSearch:: ${availabilitiesTagListForSearch.map((element) => '${element.label}\n')}',
    // );
    return availabilitiesTagListForSearch;
  }

  Future<List<FieldModel>> getInternshipTypeTagsListResponseProvider({
    bool? refresh = false,
  }) async {
    internshipTypeTagListForSearch
        .addAll(await tagProvider.getInternshipTypeTags());
    return internshipTypeTagListForSearch;
  }

  Future<List<FieldModel>> getInternshipPeriodTagsListResponseProvider({
    bool? refresh = false,
  }) async {
    internshipPeriodTagListForSearch
        .addAll(await tagProvider.getInternshipPeriodTags());
    return internshipPeriodTagListForSearch;
  }

  Future<RxList<JobOfferModel>> getfeedListResponseProvider({
    bool? refresh = false,
  }) async {
    final List<JobOfferModel> feedTempListResponse =
        []; // feedListRepsonse.clear();
    PaginationModel feedListPaginationRepsonse = PaginationModel();
    jobOfferToBeSearch.value = JobOfferModel(
      // title: 'commercial',
      title: keywordToBeSearch.value,
      telecommuting: workPlaceTypesToBeSearch.value,
      types: typesListToBeSearch,
      // types: [
      //   typeSelected.value,
      // ],
      spokenLanguages: languageListToBeSearch,
      fields: fieldListToBeSearch,
      availabilities: availabilitiesTagListToBeSearch,
      internshipTypes: internshipTypeTagListToBeSearch,
      internshipPeriods: internshipPeriodTagListToBeSearch,
      // location: countryToBeSearch.value.name,
      location: placeDetail.value.fullAddress,
      addressStreet: placeDetail.value.fullAddress,
      addressLatitude:
          placeDetail.value.lat == null ? '' : placeDetail.value.lat.toString(),
      addressLongitude:
          placeDetail.value.lng == null ? '' : placeDetail.value.lng.toString(),
      addressCity: placeDetail.value.areaLevel1,
      addressCountry: placeDetail.value.country,
      addressZip: placeDetail.value.postalCode,
      range: radiusRxInt.value,
    );
    // debugPrint(
    //   'feedListPagination current page:: ${feedListPagination.value.meta!.currentPage!}',
    // );
    // debugPrint(
    //   'feedListPagination last page:: ${feedListPagination.value.meta!.lastPage!}',
    // );

    if (refresh == false) {
      if (feedListPagination.value.meta!.currentPage! <
          feedListPagination.value.meta!.lastPage!) {
        pageNum = feedListPagination.value.meta!.currentPage! + 1;
        // debugPrint('pageNum if:: $pageNum');
        feedListPaginationRepsonse =
            await offerProvider.postSearchOfferWithPagination(
          pageNumber: pageNum,
          jobOfferForSearch: jobOfferToBeSearch.value,
        );
        feedListPagination.value = feedListPaginationRepsonse;
        feedTempListResponse.addAll(feedListPagination.value.data!);
        feedListRepsonse.addAll(feedTempListResponse);
      } else {
        feedListRepsonse.addAll(feedTempListResponse);
      }
    } else {
      feedListPaginationRepsonse =
          await offerProvider.postSearchOfferWithPagination(
        pageNumber: 1,
        jobOfferForSearch: jobOfferToBeSearch.value,
      );
      feedListPagination.value = feedListPaginationRepsonse;
      feedTempListResponse.addAll(feedListPagination.value.data!);
      feedListRepsonse.value = feedTempListResponse;
    }
    isLoadingIndicator.value = false;
    // debugPrint(
    //   'isLoadingIndicator After:: ${isLoadingIndicator.value}',
    // );

    return feedListRepsonse;
  }

  Future<void> addItemsIntoList() async {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
              scrollController.position.pixels &&
          isLoadingIndicator.value == false) {
        // debugPrint('add Item');
        isLoadingIndicator.value = true;
        // debugPrint('isLoadingIndicator b4:: ${isLoadingIndicator.value}');
        getfeedListResponseProvider();
        // isLoadingIndicator.value = false;
      }
    });
  }

  Future<void> onClickActionButtonJobOfferFeed({
    required String? actionType,
    required int? jobOfferId,
  }) async {
    final offerController = Get.put(OfferController());

    if (actionType == OfferStrings.applyAction) {
      await offerProvider
          .postApplyOffer(
            jobOfferId: jobOfferId,
          )
          .then(
            (value) => offerHelper.removeItemFromJobOfferList(
              jobOfferList: feedListRepsonse,
              jobOfferId: jobOfferId,
            ),
          )
          .then(
            (value) => offerHelper.removeItemFromJobOfferList(
              jobOfferList: feedFilterList,
              jobOfferId: jobOfferId,
            ),
          );
      await offerController.onRefresh();
      homeController.isMyOfferBag.value =
          true; // for Bag status active in My Offer tab
    } else if (actionType == OfferStrings.saveAction) {
      await offerProvider.postSaveOffer(
        jobOfferId: jobOfferId,
      );
      offerHelper.removeItemFromJobOfferList(
        jobOfferList: feedListRepsonse,
        jobOfferId: jobOfferId,
      );
      offerHelper.removeItemFromJobOfferList(
        jobOfferList: feedFilterList,
        jobOfferId: jobOfferId,
      );
      await offerController.onRefresh();
    } else if (actionType == OfferStrings.hideAction) {
      await offerProvider
          .postHideOffer(
            jobOfferId: jobOfferId,
          )
          .then(
            (value) => offerHelper.removeItemFromJobOfferList(
              jobOfferList: feedListRepsonse,
              jobOfferId: jobOfferId,
            ),
          )
          .then(
            (value) => offerHelper.removeItemFromJobOfferList(
              jobOfferList: feedFilterList,
              jobOfferId: jobOfferId,
            ),
          );
      await offerController.onRefresh();
    } else {}
  }

  //Noted:: this function for filter the job offer list in feed Page
  void selectType({FieldModel? type, bool? isRefresh = true}) {
    FieldModel tempType = allType;
    if (typeSelected.value != type) {
      tempType = type!;
    }
    typesListInFilter.clear();
    typesListToBeSearch.clear();
    typesListInFilter.add(tempType);
    typesListToBeSearch.add(tempType);
    // typeSelected.value = tempType;
    if (isRefresh == true) {
      onRefresh();
    }
  }
}
