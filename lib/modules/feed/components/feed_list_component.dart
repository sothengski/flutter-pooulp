import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../modules.dart';

class FeedListComponent extends StatelessWidget {
  // const FeedListComponent({Key? key}) : super(key: key);
  final controller = Get.find<FeedController>();

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        // shrinkWrap: true,
        padding: const EdgeInsets.only(
          bottom: kFloatingActionButtonMargin + 10,
        ),
        itemCount: controller.feedListRepsonse.length,
        // physics: const BouncingScrollPhysics(),
        // scrollDirection: Axis.vertical,
        itemBuilder: (_, index) {
          return FeedItemCard(
            feedItem: controller.feedListRepsonse[index],
          );
        },
      ),
    );
  }
}
