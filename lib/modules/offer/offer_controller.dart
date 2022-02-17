import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/core.dart';

import '../../data/data.dart';

class OfferController extends GetxController
    with StateMixin<RxList<JobOfferModel>>, GetSingleTickerProviderStateMixin {
  // final profileController = Get.put(ProfileController());
  final offerProvider = Get.find<OfferProvider>();

  final List<Tab> myTabs = <Tab>[
    const Tab(
      // text: 'Pending',
      child: CustomTextWidget(
        text: 'Pending',
        textAlign: TextAlign.center,
        fontWeight: FontWeight.w500,
        color: null,
      ),
    ),
    const Tab(text: 'Matched'),
    const Tab(text: 'Saved'),
    const Tab(text: 'Rejected'),
  ];
  TabController? tabController;
  final ScrollController scrollController = ScrollController();

  Rx<FieldModel> jobOfferStateSelected = FieldModel().obs;

  List<FieldModel> jobOfferStateFilterList = [
    FieldModel(label: 'Pending', total: 5),
    FieldModel(label: 'Matched', total: 10),
    FieldModel(label: 'Saved', total: 15),
    FieldModel(label: 'Rejected', total: 0),
  ];

  RxList<JobOfferModel> allOfferListRepsonse = <JobOfferModel>[].obs;
  RxList<JobOfferModel> pendingOfferListRepsonse = <JobOfferModel>[].obs;
  RxList<JobOfferModel> matchedOfferListRepsonse = <JobOfferModel>[].obs;
  RxList<JobOfferModel> savedOfferListRepsonse = <JobOfferModel>[].obs;
  RxList<JobOfferModel> rejectedOfferListRepsonse = <JobOfferModel>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    tabController = TabController(vsync: this, length: myTabs.length);
    tabController!.addListener(handleTabSelection);
    jobOfferStateSelected.value = jobOfferStateFilterList[0];
    await getOffersDataState(refresh: true)
        // .then((value) => isProcessingStudentInfoRepsonse.value = true)
        ;
  }

  @override
  void onClose() {
    tabController?.dispose();
    super.onClose();
  }

  void handleTabSelection() {
    if (tabController!.indexIsChanging) {
      update();
    }
  }

  Future<void> onRefresh() async {
    // monitor network fetch
    await getOffersDataState(refresh: true);
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
  }

  Future<void> getOffersDataState({bool? refresh}) async {
    change(null, status: RxStatus.loading());
    getOfferListResponseProvider(refresh: refresh).then(
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

  Future<RxList<JobOfferModel>> getOfferListResponseProvider({
    bool? refresh = false,
  }) async {
    pendingOfferListRepsonse.clear();
    matchedOfferListRepsonse.clear();
    savedOfferListRepsonse.clear();
    // rejectedOfferListRepsonse.clear();
    pendingOfferListRepsonse.value = await offerProvider.getPendingOffers();
    matchedOfferListRepsonse.value = await offerProvider.getMatchedOffers();
    savedOfferListRepsonse.value = await offerProvider.getSavedOffers();
    // rejectedOfferListRepsonse.value = await offerProvider.getRejectedOffers();

    return pendingOfferListRepsonse;
  }

  void selectjobOfferState({FieldModel? state}) {
    print('${state!.label}');
    jobOfferStateSelected.value = state;
    // filterFeedlist(
    //   feedList: feedListRepsonse,
    //   type: tempType,
    // );
  }
}
