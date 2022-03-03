import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/core.dart';
import '../../modules.dart';

class OfferSearchPage extends SearchDelegate {
  // OfferSearchPage();

  final feedController = Get.find<OfferFeedController>();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = feedController.keywordForSearch.value;
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
    return Container(
      padding: const EdgeInsets.only(
        top: AppSize.s10,
      ),
      child: FeedListComponent(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: CustomTextWidget(text: 'search under construction!!'),
    );
  }
}
