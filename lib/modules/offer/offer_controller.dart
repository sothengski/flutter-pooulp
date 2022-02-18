import 'package:get/get.dart';

import '../../data/data.dart';

class OfferController extends GetxController
    with StateMixin<RxList<JobOfferModel>> {
  // final profileController = Get.put(ProfileController());
  final offerProvider = Get.find<OfferProvider>();

  Rx<FieldModel> jobOfferStateSelected = FieldModel().obs;

  RxList<FieldModel> jobOfferStateFilterList = <FieldModel>[].obs;

  RxList<JobOfferModel> allOfferListRepsonse = <JobOfferModel>[].obs;
  RxList<JobOfferModel> pendingOfferListRepsonse = <JobOfferModel>[].obs;
  RxList<JobOfferModel> matchedOfferListRepsonse = <JobOfferModel>[].obs;
  RxList<JobOfferModel> savedOfferListRepsonse = <JobOfferModel>[].obs;
  RxList<JobOfferModel> rejectedOfferListRepsonse = <JobOfferModel>[].obs;

  RxList<JobOfferModel> savedOfferListFilter = <JobOfferModel>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    jobOfferStateFilterList.value = [
      FieldModel(id: 0, label: 'Pending', total: 0),
      FieldModel(id: 1, label: 'Matched', total: 0),
      FieldModel(id: 2, label: 'Saved', total: 0),
      FieldModel(id: 3, label: 'Rejected', total: 0),
    ];
    jobOfferStateSelected.value = jobOfferStateFilterList[0];

    await getOffersDataState(refresh: true)
        // .then((value) => isProcessingStudentInfoRepsonse.value = true)
        ;
  }

  bool jobOfferOnClickBoolSwitching({bool? boolValue}) {
    update();
    return !boolValue!;
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
    savedOfferListFilter.clear();
    rejectedOfferListRepsonse.clear();
    pendingOfferListRepsonse.value = await offerProvider.getPendingOffers();
    int pendingItemCount = 0;
    int matchedItemCount = 0;
    int savedItemCount = 0;
    int rejectedItemCount = 0;

    if (pendingOfferListRepsonse.isNotEmpty) {
      for (int i = 0; i < pendingOfferListRepsonse.length; i++) {
        if (pendingOfferListRepsonse[i].jobOfferStateModel!.isPendingState ==
            1) {
          pendingItemCount += 1;
        }
      }
    }
    matchedOfferListRepsonse.value = await offerProvider.getMatchedOffers();
    if (matchedOfferListRepsonse.isNotEmpty) {
      for (int i = 0; i < matchedOfferListRepsonse.length; i++) {
        if (matchedOfferListRepsonse[i]
                .jobOfferStateModel!
                .isEnterpriseMatchedState ==
            1) {
          matchedItemCount += 1;
        }
      }
    }
    savedOfferListRepsonse.value = await offerProvider.getSavedOffers();
    if (savedOfferListRepsonse.isNotEmpty) {
      for (int i = 0; i < savedOfferListRepsonse.length; i++) {
        if (savedOfferListRepsonse[i].jobOfferStateModel!.isSavedState == 1) {
          savedOfferListFilter.add(savedOfferListRepsonse[i]);
          savedItemCount += 1;
        }
      }
    }
    rejectedOfferListRepsonse.value = await offerProvider.getRejectedOffers();
    if (rejectedOfferListRepsonse.isNotEmpty) {
      for (int i = 0; i < rejectedOfferListRepsonse.length; i++) {
        if (rejectedOfferListRepsonse[i].jobOfferStateModel!.isRejectedState ==
            1) {
          rejectedItemCount += 1;
        }
      }
    }
    countEachOfferItem(
      pendingTotalItems: pendingItemCount,
      matchedTotalItems: matchedItemCount,
      savedTotalItems: savedItemCount,
      rejectedTotalItems: rejectedItemCount,
    );

    return pendingOfferListRepsonse;
  }

  bool isJobOfferStateList({String? inputValue}) {
    if (jobOfferStateSelected.value.label == inputValue) {
      return true;
    } else {
      return false;
    }
  }

  void selectjobOfferState({FieldModel? state}) {
    jobOfferStateSelected.value = state!;
  }

  void countEachOfferItem({
    int? pendingTotalItems,
    int? savedTotalItems,
    int? matchedTotalItems,
    int? rejectedTotalItems,
  }) {
    jobOfferStateFilterList.value = [
      FieldModel(
        label: 'Pending',
        total: pendingTotalItems,
      ),
      FieldModel(
        label: 'Matched',
        total: matchedTotalItems,
      ),
      FieldModel(
        label: 'Saved',
        total: savedTotalItems,
      ),
      FieldModel(
        label: 'Rejected',
        total: rejectedTotalItems,
      ),
    ];
  }
}
