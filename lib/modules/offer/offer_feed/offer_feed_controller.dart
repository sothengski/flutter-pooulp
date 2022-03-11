import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';
import '../../modules.dart';

class OfferFeedController extends GetxController
    with StateMixin<RxList<JobOfferModel>> {
  // final feedProvider = Get.find<FeedProvider>();
  final offerProvider = Get.find<OfferProvider>();
  final tagProvider = Get.find<TagProvider>();

  final offerHelper = OfferHelper();

  final profileController = Get.put(ProfileController());
  final ScrollController scrollController = ScrollController();
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  RxList<JobOfferModel> feedListRepsonse = <JobOfferModel>[].obs;
  RxList<JobOfferModel> feedFilterList = <JobOfferModel>[].obs;

  Rx<PaginationModel> feedListPagination =
      PaginationModel(meta: MetaModel()).obs;

  int pageNum = 1;

  final FieldModel allType = FieldModel(label: 'All');

  Rx<FieldModel> typeSelected = FieldModel(label: 'All').obs;
  // FieldModel? typeSelected;

  List<FieldModel> listFilterTypes = [];
  RxList<FieldModel> listJobOfferTypes = <FieldModel>[].obs;

  Set<String?> setOfListTypes = {};

  RxInt workPlaceTypesForSearch = 2.obs;
  RxList<FieldModel> typesListForSearch = <FieldModel>[].obs;
  RxList<FieldModel> fieldListForSearch = <FieldModel>[].obs;
  RxList<FieldModel> languageListForSearch = <FieldModel>[].obs;

  RxInt workPlaceTypesInFilter = 2.obs;
  Rx<CountryModel> selectedCountryInFilter = const CountryModel().obs;
  RxList<FieldModel> typesListInFilter = <FieldModel>[].obs;
  RxList<FieldModel> fieldListInFilter = <FieldModel>[].obs;
  RxList<FieldModel> languageListInFilter = <FieldModel>[].obs;

  RxString keywordToBeSearch = ''.obs;
  RxInt workPlaceTypesToBeSearch = 2.obs;
  Rx<CountryModel> countryToBeSearch = const CountryModel().obs;
  RxList<FieldModel> typesListToBeSearch = <FieldModel>[].obs;
  RxList<FieldModel> fieldListToBeSearch = <FieldModel>[].obs;
  // RxList<int> fieldListToBeSearch = <int>[].obs;
  RxList<FieldModel> languageListToBeSearch = <FieldModel>[].obs;

  RxBool isLoadingIndicator = false.obs;

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
    await getjobOfferTypesListResponseProvider();
    await getFieldsListResponseProvider();
    await getLanguagesListResponseProvider();
    await getFeedsDataState(refresh: true)
        // .then((value) => isProcessingStudentInfoRepsonse.value = true)
        ;
    await addItemsIntoList();
  }

  String updateKeyword({String? newKeyword = ''}) =>
      keywordToBeSearch.value = newKeyword.toString();

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
  }) {
    if (list!.contains(fieldValue)) {
      list.removeWhere((element) => element.id == fieldValue!.id);
    } else {
      list.add(fieldValue!);
    }
  }

  void clearAllFilterToBeSearch() {
    keywordToBeSearch.value = '';
    selectedCountryInFilter.value = const CountryModel();

    workPlaceTypesInFilter.value = 2; // 2 == Hybrid(Default)
    languageListInFilter.value = [];
    fieldListInFilter.value = [];

    countryToBeSearch.value = const CountryModel();
    workPlaceTypesToBeSearch.value = 2; // 2 == Hybrid(Default)
    languageListToBeSearch.value = [];
    fieldListToBeSearch.value = [];

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
    workPlaceTypesInFilter.value = workPlaceTypesToBeSearch.value;
    selectedCountryInFilter.value = countryToBeSearch.value;
    languageListInFilter.value = [];
    languageListInFilter.addAll(languageListToBeSearch);
    fieldListInFilter.value = [];
    fieldListInFilter.addAll(fieldListToBeSearch);

    // debugPrint('dismissFilter');
    // debugPrint(
    //   'languageListToBeSearch:: ${languageListToBeSearch.map((element) => '${element.label}\n')}',
    // );
    // debugPrint(
    //   'languageListInFilter:: ${languageListInFilter.map((element) => '${element.label}\n')}',
    // );
  }

  void applyFilterToBeSearch() {
    // keywordForSearch.value = '';
    workPlaceTypesToBeSearch.value = workPlaceTypesInFilter.value;
    countryToBeSearch.value = selectedCountryInFilter.value;
    languageListToBeSearch.addAll(languageListInFilter);
    fieldListToBeSearch.addAll(fieldListInFilter);

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
      },
    );
  }

  Future<List<FieldModel>> getjobOfferTypesListResponseProvider({
    bool? refresh = false,
  }) async {
    listJobOfferTypes.add(allType);

    listJobOfferTypes.addAll(await tagProvider.getJobOfferTypes());
    selectType(type: listJobOfferTypes[0]);

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

  Future<RxList<JobOfferModel>> getfeedListResponseProvider({
    bool? refresh = false,
  }) async {
    final List<JobOfferModel> feedTempListResponse =
        []; // feedListRepsonse.clear();
    PaginationModel feedListPaginationRepsonse = PaginationModel();
    final JobOfferModel jobOfferToBeSearch = JobOfferModel(
      // title: 'commercial',
      title: keywordToBeSearch.value,
      location: countryToBeSearch.value.name,
      telecommuting: workPlaceTypesToBeSearch.value,
      types: [
        typeSelected.value,
      ],
      spokenLanguages: languageListToBeSearch,
      fields: fieldListToBeSearch,
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
          jobOfferForSearch: jobOfferToBeSearch,
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
        jobOfferForSearch: jobOfferToBeSearch,
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

  void selectType({FieldModel? type}) {
    FieldModel tempType = allType;
    if (typeSelected.value != type) {
      tempType = type!;
    }
    typeSelected.value = tempType;
    onRefresh();
  }
}
