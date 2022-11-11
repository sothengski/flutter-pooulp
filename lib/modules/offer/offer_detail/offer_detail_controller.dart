import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../../data/data.dart';

class OfferDetailController extends GetxController
    with GetTickerProviderStateMixin {
  late final TabController? tabController;
  final ScrollController scrollController = ScrollController();
  final offerProvider = Get.find<OfferProvider>();

  // final offerController = Get.put(OfferController());

  RxInt currentIndexRx = 0.obs;

  Rx<JobOfferModel>? jobOfferDetail = JobOfferModel(uuid: '1').obs;

  Rx<String?> jobOfferUUID = ''.obs;

  String? youtubeVideoId = '';

  late YoutubePlayerController youtubeController;

  // final FirebaseDynamicLinkService firebaseDynamicLinkService =
  //     FirebaseDynamicLinkService();

  @override
  Future<void> onInit() async {
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
    Future.delayed(const Duration(milliseconds: 300), () async {
      // print('controller: jobOfferDetail UUID ${jobOfferUUID.value}');
      if (jobOfferUUID.value == '') {
        await getJobOfferDetail(jobOfferUUID: jobOfferUUID.value);
      }
    });
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

  Future<void> getJobOfferDetail({
    required String? jobOfferUUID,
  }) async {
    final tempResp = await offerProvider.getJobOfferDetailByUUID(
      jobOfferUUID: jobOfferUUID,
    );
    // if (tempResp.uuid!.isNotEmpty) {
    debugPrint(
      "getJobOfferDetail: $tempResp",
    );
    // }
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
