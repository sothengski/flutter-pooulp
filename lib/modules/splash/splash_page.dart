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
          color: ColorsManager.primaryBlue,
          child: const Padding(
            padding: EdgeInsets.only(
              left: AppSize.s12,
              right: AppSize.s12,
              top: 150,
            ),
            // child: SvgPicture.asset(
            //   AssetsManager.appLogoWhiteSvg,
            //   height: 80,
            //   matchTextDirection: true,
            // ),
            child: Align(
              alignment: Alignment.topCenter,
              child: Image(
                //   // height: 150,
                //   // width: 150,
                image: AssetImage(AssetsManager.splashScreen),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
