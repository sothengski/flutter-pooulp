import 'package:get/get.dart';

import '../../data/data.dart';

class FeedController extends GetxController with StateMixin<RxList<FeedModel>> {
  final feedProvider = Get.find<FeedProvider>();

  RxList<FeedModel> feedListRepsonse = <FeedModel>[].obs;

  late FieldModel? categorySelect;
  List<FieldModel> listFilterCategory = [];
  Set<String?> setCategories = {};

  @override
  Future<void> onInit() async {
    super.onInit();
    await getFeedsDataState(refresh: true)
        // .then((value) => isProcessingStudentInfoRepsonse.value = true)
        ;
  }

  Future<void> getFeedsDataState({bool? refresh}) async {
    change(null, status: RxStatus.loading());
    getfeedListResponseProvider(refresh: refresh).then(
      (resp) {
        // addCategoryIntoSet(resp);
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
    feedListRepsonse.value = await feedProvider.getFeedOffers();
    // debugPrint('feedListRepsonse: $userInfoRepsonse');
    return feedListRepsonse;
  }

  // void addCategoryIntoSet(List<FeedModel> feedList) {
  //   // listCategory = outletList
  //   //     .where((outlet) => setCommunes.add(outlet.communeId))
  //   //     .toList();
  //   listFilterCategory.clear();
  //   setCategories.clear();
  //   // listFilterCategory.add(
  //   //   FieldModel(
  //   //     id: 0,
  //   //     // totalCategory: outletList.length,
  //   //     label: "សរុប",
  //   //     type: "All",
  //   //   ),
  //   // );
  //   // categorySelect = listFilterCategory[0];
  //   for (final feed in feedList) {
  //     if (setCategories.add(feed.label)) {
  //       listFilterCategory.add(
  //         FilterCommuneModel(
  //           communeId: outlet.communeId,
  //           totalCategory: outletList
  //               .where((element) => element.communeId == outlet.communeId)
  //               .length,
  //           communeNameEn: outlet.communeEn,
  //           communeNameKh: outlet.communeKh,
  //         ),
  //       );
  //     }
  //   }
  //   filterOutletlist(listOutlets, 0);
  // }
}
