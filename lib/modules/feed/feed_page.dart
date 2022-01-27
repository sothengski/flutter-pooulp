import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import 'feed.dart';

class FeedPage extends GetView<FeedController> {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Feed Page',
      ),
      body: const Center(
        child: CustomTextWidget(
          textAlign: TextAlign.center,
          text: 'Feed Page\n\nThis Page is under construction!',
        ),
      ),
    );
  }
}
