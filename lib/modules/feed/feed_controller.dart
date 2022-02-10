import 'package:get/get.dart';

import '../../data/data.dart';

class FeedController extends GetxController with StateMixin<RxList<FeedModel>> {
  final feedProvider = Get.find<FeedProvider>();

  RxList<FeedModel> feedListRepsonse = <FeedModel>[].obs;
  RxList<FeedModel> feedFilterList = <FeedModel>[].obs;

  final FieldModel allType = FieldModel(label: 'All');
  FieldModel? typeSelected;
  List<FieldModel> listFilterTypes = [];
  Set<String?> setOfListTypes = {};

  // RxBool applyButtonState = false.obs;
  // RxBool savedButtonState = false.obs;
  // RxBool hideButtonState = false.obs;
  RxList<bool> applyButtonStateList = <bool>[].obs;
  RxList<bool> savedButtonStateList = <bool>[].obs;
  RxList<bool> hideButtonStateList = <bool>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await getFeedsDataState(refresh: true)
        // .then((value) => isProcessingStudentInfoRepsonse.value = true)
        ;
    // typeSelected = allType;
  }

  bool jobOfferOnClickBoolSwitching({bool? boolValue}) {
    return !boolValue!;
  }

  Future<void> onRefresh() async {
    // monitor network fetch
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

  Future<RxList<FeedModel>> getfeedListResponseProvider({
    bool? refresh = false,
  }) async {
    feedListRepsonse.clear();
    feedListRepsonse.value = await feedProvider.getFeedOffers();
    addTypesIntoSet(jobOfferTrxData: feedListRepsonse);
    return feedListRepsonse;
  }

  List<FeedModel> filterFeedlist({
    List<FeedModel>? feedList,
    FieldModel? type,
  }) {
    List<FeedModel> tempListFeed;
    feedFilterList.clear();

    if (type! == allType) {
      tempListFeed = feedList!;
    } else {
      tempListFeed = feedList!
          .where(
            (feed) => feed.jobOffer!.types!.any(
              (element) => element.label!.contains(type.label.toString()),
            ),
          )
          .toList();
    }

    feedFilterList.addAll(tempListFeed);

    return feedFilterList;
  }

  void selectType({FieldModel? type}) {
    FieldModel tempType = allType;
    if (typeSelected != type) {
      tempType = type!;
    }
    typeSelected = tempType;
    filterFeedlist(
      feedList: feedListRepsonse,
      type: tempType,
    );
  }

  void addTypesIntoSet({List<FeedModel>? jobOfferTrxData}) {
    listFilterTypes.clear();
    setOfListTypes.clear();
    listFilterTypes.add(
      allType,
    );
    selectType(type: listFilterTypes[0]);
    // typeSelected = listFilterTypes[0];

    for (var i = 0; i < jobOfferTrxData!.length; i++) {
      applyButtonStateList.add(false);
      savedButtonStateList.add(false);
      hideButtonStateList.add(false);
      for (var j = 0; j < jobOfferTrxData[i].jobOffer!.types!.length; j++) {
        if (setOfListTypes.add(jobOfferTrxData[i].jobOffer!.types![j].label)) {
          listFilterTypes.add(
            FieldModel(
              id: jobOfferTrxData[i].jobOffer!.types![j].id,
              // totalCategory: outletList.length,
              label: jobOfferTrxData[i].jobOffer!.types![j].label,
              type: jobOfferTrxData[i].jobOffer!.types![j].type,
            ),
          );
        }
      }
    }
    filterFeedlist(
      feedList: jobOfferTrxData,
      type: allType,
    );
  }
}
