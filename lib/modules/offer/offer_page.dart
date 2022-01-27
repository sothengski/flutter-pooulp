import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import '../modules.dart';

class OfferPage extends GetView<OfferController> {
  const OfferPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Offer Page',
      ),
      body: const Center(
        child: CustomTextWidget(
          textAlign: TextAlign.center,
          text: 'Offer Page\n\nThis Page is under construction!',
        ),
      ),
    );
  }
}
