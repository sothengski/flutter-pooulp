import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import '../../routes/routes.dart';
import 'profile.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: ColorsManager.grey100,
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: CustomAppBar(
          // title: 'Profile Page',
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          actions: [
            if (controller.enterpriseSwitching.value == true)
              IconButton(
                icon: const Icon(Icons.person),
                color: ColorsManager.grey300,
                tooltip: 'User Profile',
                onPressed: () => controller.enterpriseSwitching.value =
                    controller.updateSwitchingToggle(
                  switchingNewValue: controller.enterpriseSwitching.value,
                ),
              )
            else
              IconButton(
                icon: const Icon(Icons.location_city),
                color: ColorsManager.grey300,
                tooltip: 'Enterprise Profile',
                onPressed: () => controller.enterpriseSwitching.value =
                    controller.updateSwitchingToggle(
                  switchingNewValue: controller.enterpriseSwitching.value,
                ),
              ),
            IconButton(
              icon: const Icon(Icons.settings),
              color: ColorsManager.grey300,
              tooltip: 'Settings',
              onPressed: () => {Get.toNamed(Routes.settingsRoute)},
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.only(bottom: AppSize.s32),
          child: controller.enterpriseSwitching.value == true
              ? EnterpriseProfileComponent(
                  controller: controller,
                )
              : UserProfileComponent(controller: controller),
        ),
      ),
    );
  }
}
