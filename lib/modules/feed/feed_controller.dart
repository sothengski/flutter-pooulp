import 'package:get/get.dart';

import '../../data/data.dart';

class FeedController extends GetxController with StateMixin<RxList<FeedModel>> {
  final feedProvider = Get.find<FeedProvider>();

  RxList<FeedModel> feedListRepsonse = <FeedModel>[].obs;
  RxList<FeedModel> feedFilterList = <FeedModel>[].obs;

  late FieldModel? typeSelected;
  List<FieldModel> listFilterTypes = [];
  Set<String?> setOfListTypes = {};

  @override
  Future<void> onInit() async {
    super.onInit();
    await getFeedsDataState(refresh: true)
        // .then((value) => isProcessingStudentInfoRepsonse.value = true)
        ;
    typeSelected = FieldModel(label: '');
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

    if (type! == FieldModel(label: '')) {
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
    typeSelected = type;
    filterFeedlist(
      feedList: feedListRepsonse,
      type: type,
    );
  }

  void addTypesIntoSet({List<FeedModel>? jobOfferTrxData}) {
    listFilterTypes.clear();
    setOfListTypes.clear();
    // listFilterTypes.add(
    //   FieldModel(
    //     id: 0,
    //     // totalCategory: FeedList.length,
    //     label: 'All',
    //     type: 'All',
    //   ),
    // );
    //typeSelected = listFilterTypes[0];

    for (var i = 0; i < jobOfferTrxData!.length; i++) {
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
      type: FieldModel(label: ''),
    );
  }
}
