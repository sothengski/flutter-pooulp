import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import 'setting.dart';

class SettingPage extends GetView<SettingController> {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Setting Page',
        // elevation: 0.0,
      ),
      body: const Center(
        child: CustomTextWidget(
          textAlign: TextAlign.center,
          text:
              'App Version: 1.0.7(7)\nSetting Page\n\nThis Page is under construction!',
        ),
      ),
      bottomNavigationBar: // Obx(
          //   () => Visibility(
          //     visible: controller.isSubmitBtnProcessing.value,
          //     child: const LoadingWidget(),
          //   ),
          // ),
          // Obx(
          //   () => Visibility(
          //     visible:
          //         !controller.isSubmitBtnProcessing.value,
          // child:
          CustomMaterialButton(
        leftPadding: AppSize.s12,
        rightPadding: AppSize.s12,
        bottomPadding: AppSize.s20,
        text: 'Sign Out',
        fontSize: 20.0,
        buttonWidth: getWidth,
        onPressed: () {
          unFocusKeyBoard(context);
          controller.homeController.signOut();
        },
      ),
      //   ),
      // ),
    );
  }
}
