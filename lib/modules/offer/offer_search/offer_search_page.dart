import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/custom_text_widget.dart';

class OfferSearchPage extends SearchDelegate {
  // const OfferSearchPage({Key? key}) : super(key: key);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
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
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: CustomTextWidget(text: 'search under construction!!'),
    );
  }
}
