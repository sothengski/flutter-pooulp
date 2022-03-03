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

  final offerHelper = OfferHelper();

  final profileController = Get.put(ProfileController());
  final ScrollController scrollController = ScrollController();

  RxList<JobOfferModel> feedListRepsonse = <JobOfferModel>[].obs;
  RxList<JobOfferModel> feedFilterList = <JobOfferModel>[].obs;

  final FieldModel allType = FieldModel(label: 'All');

  Rx<FieldModel> typeSelected = FieldModel(label: 'All').obs;
  // FieldModel? typeSelected;

  List<FieldModel> listFilterTypes = [];
  RxList<FieldModel> listJobOfferTypes = <FieldModel>[].obs;

  Set<String?> setOfListTypes = {};

  RxString keywordForSearch = ''.obs;
  RxList<FieldModel> typesListForSearch = <FieldModel>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await getjobOfferTypesListResponseProvider();

    await getFeedsDataState(refresh: true)
        // .then((value) => isProcessingStudentInfoRepsonse.value = true)
        ;
  }

  String updateKeyword({String? newKeyword = ''}) =>
      keywordForSearch.value = newKeyword.toString();

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

  Future<RxList<JobOfferModel>> getfeedListResponseProvider({
    bool? refresh = false,
  }) async {
    // feedListRepsonse.clear();
    final JobOfferModel jobOfferToBeSearch = JobOfferModel(
      // title: 'commercial',
      title: keywordForSearch.value,
      types: [
        typeSelected.value,
      ],
    );

    feedListRepsonse.value = await offerProvider.postSearchOffer(
      pageNumber: 1,
      jobOfferForSearch: jobOfferToBeSearch,
    );

    // addTypesIntoSet(jobOfferTrxData: feedListRepsonse);

    return feedListRepsonse;
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
    // filterFeedlist(
    //   feedList: feedListRepsonse,
    //   type: tempType,
    // );
  }

  // List<JobOfferModel> filterFeedlist({
  //   List<JobOfferModel>? feedList,
  //   FieldModel? type,
  // }) {
  //   List<JobOfferModel> tempListFeed;
  //   feedFilterList.clear();

  //   if (type! == allType) {
  //     tempListFeed = feedList!;
  //   } else {
  //     tempListFeed = feedList!
  //         .where(
  //           (feed) => feed.types!.any(
  //             (element) => element.label!.contains(type.label.toString()),
  //           ),
  //         )
  //         .toList();
  //   }
  //   feedFilterList.addAll(tempListFeed);

  //   return feedFilterList;
  // }

  // void addTypesIntoSet({List<JobOfferModel>? jobOfferTrxData}) {
  //   listFilterTypes.clear();
  //   setOfListTypes.clear();
  //   listFilterTypes.add(
  //     allType,
  //   );
  //   selectType(type: listFilterTypes[0]);

  //   for (var i = 0; i < jobOfferTrxData!.length; i++) {
  //     for (var j = 0; j < jobOfferTrxData[i].types!.length; j++) {
  //       if (setOfListTypes.add(jobOfferTrxData[i].types![j].label)) {
  //         listFilterTypes.add(
  //           FieldModel(
  //             id: jobOfferTrxData[i].types![j].id,
  //             // totalCategory: outletList.length,
  //             label: jobOfferTrxData[i].types![j].label,
  //             type: jobOfferTrxData[i].types![j].type,
  //           ),
  //         );
  //       }
  //     }
  //   }

  //   filterFeedlist(
  //     feedList: jobOfferTrxData,
  //     type: allType,
  //   );
  // }
}
