import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/data.dart';

class OfferDetailController extends GetxController
    with GetTickerProviderStateMixin {
  late final TabController? tabController;
  final ScrollController scrollController = ScrollController();
  RxInt currentIndexRx = 0.obs;

  late JobOfferModel? feedItemDetail;

  // final FeedController feedController = Get.find<FeedController>();

  @override
  void onInit() {
    tabController = TabController(
      length: 2,
      vsync: this,
    );
    tabController!.addListener(handleTabSelection);
    super.onInit();
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  void handleTabSelection() {
    if (tabController!.indexIsChanging) {
      currentIndexRx.value = tabController!.index;
    }
  }
}
