import 'package:get/get.dart';

import '../../core/core.dart';
import '../../data/data.dart';
import '../modules.dart';

class OfferController extends GetxController
    with StateMixin<RxList<JobOfferModel>> {
  final profileController = Get.put(ProfileController());
  // final settingController = Get.put(SettingController());

  final offerProvider = Get.find<OfferProvider>();
  final notificationMessageProvider = Get.put(NotificationMessagesProvider());

  final offerHelper = OfferHelper();

  final feedController = Get.put(OfferFeedController());

  Rx<FieldModel> jobOfferStateSelected = FieldModel().obs;

  RxList<FieldModel> jobOfferStateFilterList = <FieldModel>[].obs;

  RxList<JobOfferModel> allOfferListRepsonse = <JobOfferModel>[].obs;
  RxList<JobOfferModel> pendingOfferListRepsonse = <JobOfferModel>[].obs;
  RxList<JobOfferModel> matchedOfferListRepsonse = <JobOfferModel>[].obs;
  RxList<JobOfferModel> savedOfferListRepsonse = <JobOfferModel>[].obs;
  RxList<JobOfferModel> rejectedOfferListRepsonse = <JobOfferModel>[].obs;

  RxList<JobOfferModel> savedOfferListFilter = <JobOfferModel>[].obs;

  List<NotificationMessageModel> notificationMessageList = [];

  RxBool isLoadingIndicator = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    jobOfferStateFilterList.value = [
      FieldModel(id: 0, label: OfferStrings.pendingState, total: 0),
      FieldModel(id: 1, label: OfferStrings.matchedState, total: 0),
      FieldModel(id: 2, label: OfferStrings.savedState, total: 0),
      FieldModel(id: 3, label: OfferStrings.rejectedState, total: 0),
    ];
    jobOfferStateSelected.value = jobOfferStateFilterList[0];

    await getOffersDataState(refresh: true)
        // .then((value) => isProcessingStudentInfoRepsonse.value = true)
        ;
    await getNotificationMessagesProvider();
  }

  bool jobOfferOnClickBoolSwitching({bool? boolValue}) {
    update();
    return !boolValue!;
  }

  Future<void> onRefresh() async {
    // monitor network fetch
    isLoadingIndicator.value = true;
    await getOffersDataState(refresh: true);
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
  }

  Future<void> stateOnRefresh({
    required String? actionStateName,
    // int? jobOfferId,
    RxList<JobOfferModel>? jobOfferList,
    int? jobOfferState,
    RxList<JobOfferModel>? jobOfferListFilter,
    Future<List<JobOfferModel>>? getListFomProvider,
    bool? isStateFilter = true,
  }) async {
    jobOfferList!.clear();
    jobOfferListFilter?.clear();
    jobOfferList.value = await getListFomProvider!;
    int itemCount = 0;
    if (jobOfferList.isNotEmpty) {
      for (int i = 0; i < jobOfferList.length; i++) {
        if (actionStateName == OfferStrings.savedState) {
          if (jobOfferList[i].jobOfferStateModel!.isSavedState == 1) {
            jobOfferListFilter!.add(jobOfferList[i]);
            itemCount += 1;
          }
        } else {
          itemCount += 1;
        }
      }
    }
    if (isStateFilter!) {
      offerHelper.updateOfferStateItem(
        actionStateName: actionStateName,
        totalItem: itemCount,
        jobOfferStateList: jobOfferStateFilterList,
      );
    }
  }

  // void updateOfferStateItem({
  //   required String? actionStateName,
  //   int? totalItem = 0,
  //   List<FieldModel>? jobOfferStateList,
  // }) {
  //   final FieldModel itemToBeUpdated =
  //       jobOfferStateList!.firstWhere((e) => e.label == actionStateName);
  //   itemToBeUpdated.total = totalItem;
  // }

  // void removeAndUpdateItemJobOfferList({
  //   required String? actionStateName,
  //   RxList<JobOfferModel>? jobOfferList,
  //   int? jobOfferId,
  //   int? totalItem = 0,
  // }) {
  //   jobOfferList!.removeWhere((item) => item.id == jobOfferId);
  //   updateOfferStateItem(
  //     actionStateName: actionStateName,
  //     totalItem: jobOfferList.length,
  //     jobOfferStateList: jobOfferStateFilterList,
  //   );
  // }

  Future<void> onClickActionButtonJobOffer({
    required String? actionType,
    required int? jobOfferId,
  }) async {
    if (actionType == OfferStrings.applyAction) {
      await offerProvider.postApplyOffer(
        jobOfferId: jobOfferId,
      );
      offerHelper.removeItemFromJobOfferList(
        jobOfferList: savedOfferListFilter,
        jobOfferId: jobOfferId,
      );
      offerHelper.updateOfferStateItem(
        actionStateName: OfferStrings.savedState,
        totalItem: savedOfferListFilter.length,
        jobOfferStateList: jobOfferStateFilterList,
      );
      await stateOnRefresh(
        actionStateName: OfferStrings.pendingState,
        jobOfferList: pendingOfferListRepsonse,
        getListFomProvider: offerProvider.getPendingOffers(),
      );
    } else if (actionType == OfferStrings.cancelAction) {
      await offerProvider.postUnApplyOffer(
        jobOfferId: jobOfferId,
      );
      offerHelper.removeItemFromJobOfferList(
        jobOfferList: pendingOfferListRepsonse,
        jobOfferId: jobOfferId,
      );
      offerHelper.updateOfferStateItem(
        actionStateName: OfferStrings.pendingState,
        totalItem: pendingOfferListRepsonse.length,
        jobOfferStateList: jobOfferStateFilterList,
      );
      await stateOnRefresh(
        actionStateName: OfferStrings.savedState,
        jobOfferList: savedOfferListRepsonse,
        jobOfferListFilter: savedOfferListFilter,
        getListFomProvider: offerProvider.getSavedOffers(),
      );
      feedController.onRefresh();
    } else if (actionType == OfferStrings.saveAction) {
      await offerProvider.postSaveOffer(
        jobOfferId: jobOfferId,
      );
    } else if (actionType == OfferStrings.unSaveAction) {
      await offerProvider
          .postUnSaveOffer(
            jobOfferId: jobOfferId,
          )
          .then(
            (value) => offerHelper.removeItemFromJobOfferList(
              jobOfferList: savedOfferListFilter,
              jobOfferId: jobOfferId,
            ),
          )
          .then(
            (value) => offerHelper.updateOfferStateItem(
              actionStateName: OfferStrings.savedState,
              totalItem: savedOfferListFilter.length,
              jobOfferStateList: jobOfferStateFilterList,
            ),
          );
      await feedController.onRefresh();
    } else if (actionType == OfferStrings.hideAction) {
      await offerProvider.postHideOffer(
        jobOfferId: jobOfferId,
      );
    } else if (actionType == OfferStrings.unHideAction) {
      await offerProvider.postUnHideOffer(
        jobOfferId: jobOfferId,
      );
    } else {}
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
        isLoadingIndicator.value = false;
      },
    );
  }

  Future<RxList<JobOfferModel>> getOfferListResponseProvider({
    bool? refresh = false,
  }) async {
    stateOnRefresh(
      actionStateName: OfferStrings.pendingState,
      jobOfferList: pendingOfferListRepsonse,
      getListFomProvider: offerProvider.getPendingOffers(),
    );
    stateOnRefresh(
      actionStateName: OfferStrings.matchedState,
      jobOfferList: matchedOfferListRepsonse,
      getListFomProvider: offerProvider.getMatchedOffers(),
    );
    stateOnRefresh(
      actionStateName: OfferStrings.savedState,
      jobOfferList: savedOfferListRepsonse,
      jobOfferListFilter: savedOfferListFilter,
      getListFomProvider: offerProvider.getSavedOffers(),
    );
    stateOnRefresh(
      actionStateName: OfferStrings.rejectedState,
      jobOfferList: rejectedOfferListRepsonse,
      getListFomProvider: offerProvider.getRejectedOffers(),
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

  Future<List<NotificationMessageModel>> getNotificationMessagesProvider({
    bool? refresh = false,
  }) async {
    final temp = await notificationMessageProvider.getNotificationMessages();
    // debugPrint('temp: $temp');
    for (final e in temp) {
      if (e.target != 1) {
        // print('e.target: ${e.target}');
        notificationMessageList.add(e);
      }
    }

    // debugPrint('notificationMessageList: $notificationMessageList');

    return notificationMessageList;
  }
}
