import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import 'splash.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (_) => Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: ColorsManager.primary,
          child: const Padding(
            padding: EdgeInsets.only(
              left: AppSize.s48,
              right: AppSize.s48,
            ),
            child: Image(
              image: AssetImage(ImageAssets.appLogoWhite),
              // height: 150,
              // width: 150,
            ),
          ),
        ),
      ),
    );
  }
}
