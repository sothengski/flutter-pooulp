import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../../data/data.dart';
import '../offer_controller.dart';

class OfferDetailController extends GetxController
    with GetTickerProviderStateMixin {
  late final TabController? tabController;
  final ScrollController scrollController = ScrollController();
  final offerProvider = Get.find<OfferProvider>();

  final offerController = Get.put(OfferController());

  RxInt currentIndexRx = 0.obs;

  late JobOfferModel? feedItemDetail;

  String? youtubeVideoId = '';

  late YoutubePlayerController youtubeController;

  // final FirebaseDynamicLinkService firebaseDynamicLinkService =
  //     FirebaseDynamicLinkService();

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(
      length: 2,
      vsync: this,
    );
    tabController!.addListener(handleTabSelection);
    // youtubeVideoId = feedItemDetail?.enterprise!.youtubeLink ?? '';
    // debugPrint('controller youtubeVideoId: $youtubeVideoId');
    youtubeController = YoutubePlayerController(
      initialVideoId: 'K2NePZwi0Ok', //'tcodrIK2P_I',
      params: const YoutubePlayerParams(
        playlist: [
          'K2NePZwi0Ok'
          // 'nPt8bK2gbaU',
          // 'K18cpp_-gP8',
          // 'iLnmTe5Q2Qw',
          // '_WoCV4c6XOE',
          // 'KmzdUe0RSJo',
          // '6jZDSSZZxjQ',
          // 'p2lYr3vM_1w',
          // '7QUtEmBT_-w',
          // '34_PXCzGw1M',
          // 'https://www.youtube.com/watch?v=0LQlSCidcfM'
        ],
        // startAt: Duration(minutes: 1, seconds: 36),
        showFullscreenButton: true,
        privacyEnhanced: true,
      ),
    );
    youtubeController.onEnterFullscreen = () {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      // debugPrint('Entered Fullscreen');
    };
    youtubeController.onExitFullscreen = () {
      // debugPrint('Exited Fullscreen');
    };
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  void handleTabSelection() {
    if (tabController!.indexIsChanging) {
      currentIndexRx.value = tabController!.index;
      youtubeController = YoutubePlayerController(
        initialVideoId: youtubeVideoId! == ''
            ? 'K2NePZwi0Ok'
            : youtubeVideoId!, //'tcodrIK2P_I',
        params: YoutubePlayerParams(
          playlist: [
            if (youtubeVideoId! == '') 'K2NePZwi0Ok' else youtubeVideoId!
          ],
          showFullscreenButton: true,
          privacyEnhanced: true,
        ),
      );
    }
  }

  Future<void> makeRequestToPOSTJobOfferViewCountAPI({
    required String? jobOfferUUID,
  }) async {
    final tempResp = await offerProvider.postJobOfferViewCount(
      jobOfferUUID: jobOfferUUID,
    );
    if (tempResp.success!) {
      // debugPrint(
      //   "makeRequestToPOSTJobOfferViewCountAPI: ${tempResp.data}",
      // );
    }
  }
}
