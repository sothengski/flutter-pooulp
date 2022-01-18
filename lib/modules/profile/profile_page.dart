import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import '../../routes/routes.dart';
import 'profile.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => Obx(
        () => Scaffold(
          backgroundColor: ColorsManager.grey100,
          extendBodyBehindAppBar: true,
          extendBody: true,
          appBar: CustomAppBar(
            // title: 'Profile Page',
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            actions: [
              if (controller.homeController.userToken!.accountType == 'student')
                Container()
              else if (controller.enterpriseSwitching.value == true)
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
          body: RefreshIndicator(
            onRefresh: () => controller.onRefresh(),
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.only(bottom: AppSize.s32),
              child: Container(
                child: controller.enterpriseSwitching.value == true
                    ? EnterpriseProfileComponent(controller: controller)
                    : UserProfileComponent(controller: controller),
              ),
            ),
          ),
        ),
      ),
      onLoading: const Center(child: Text('Loading...')),
      onError: (error) => Center(
        child: Text('Uh... Error $error...'),
        // child: StateHandlerWidget(
        //   imgPath: underConstructionIcon,
        //   headerText: "Uh... Error $error",
        //   bodyText:
        //       "Something went wrong at our end.\n Don't worry. it's not you - it's us.\n Sorry about that.",
        // ),
      ),
    );
  }
}
