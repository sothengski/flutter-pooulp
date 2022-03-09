import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../modules.dart';

class OfferSearchPage extends SearchDelegate {
  final feedController = Get.find<OfferFeedController>();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          assignKeywordtoVariable();
          // debugPrint(
          //   'buildActions keywordForSearch:: ${feedController.keywordForSearch.value}',
          // );
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        Get.back();
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      assignKeywordtoVariable();
      feedController.getFeedsDataState();
      Get.back();
    });

    return Container();
    // return Container(
    //   padding: const EdgeInsets.only(
    //     top: AppSize.s10,
    //   ),
    //   child: OfferFeedListComponent(),
    // );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // assignKeywordtoVariable(isAssignToQuery: true);
    // debugPrint(
    //   'buildSuggestions keywordForSearch:: ${feedController.keywordForSearch.value}',
    // );
    return const Center(
      child: CustomTextWidget(text: 'search under construction!!'),
    );
  }

  void assignKeywordtoVariable({bool? isAssignToQuery = false}) {
    isAssignToQuery == true
        ? query = feedController.keywordForSearch.value.trim()
        : feedController.keywordForSearch.value = query.trim();
    // debugPrint(
    //   'assignKeywordtoVariable keywordForSearch:: ${feedController.keywordForSearch.value}',
    // );
  }
}
