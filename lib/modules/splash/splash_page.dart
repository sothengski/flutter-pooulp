import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
          child: Padding(
            padding: const EdgeInsets.only(
              left: AppSize.s48,
              right: AppSize.s48,
            ),
            child: SvgPicture.asset(
              AssetsManager.appLogoWhiteSvg,
              height: 80,
              matchTextDirection: true,
            ),
            // child: Image(
            //   image: AssetImage(AssetsManager.appLogoWhite),
            //   // height: 150,
            //   // width: 150,
            // ),
          ),
        ),
      ),
    );
  }
}
