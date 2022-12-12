import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import '../modules.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        //change bgColor here also change the status Bar Color
        backgroundColor: ColorsManager.primaryBlue,
        body: SafeArea(
          child: IndexedStack(
            index: controller.currentIndex.value,
            children: [
              const OfferFeedPage(),
              // FeedPage(),
              const OfferPage(),
              RoomListPage(),
              const ProfilePage(),
            ],
          ),
        ),
        bottomNavigationBar: Obx(
          () => CustomAnimatedBottomBar(
            containerHeight: 60,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // backgroundColor: ColorsManager.grey100,
            selectedIndex: controller.currentIndex.value,
            itemCornerRadius: 10,
            curve: Curves.easeIn,
            items: <BottomNavBarItem>[
              BottomNavBarItem(
                activeIcon: const Icon(Icons.explore),
                inActiveIcon: const Icon(Icons.explore_outlined),
                title: Text('feed'.tr),
                activeColor: ColorsManager.primary,
              ),
              // BottomNavBarItem(
              //   activeIcon: const Icon(Icons.explore),
              //   inActiveIcon: const Icon(Icons.explore_outlined),
              //   title: const Text('Feed'),
              //   activeColor: ColorsManager.primary,
              // ),
              BottomNavBarItem(
                activeIcon: const Icon(Icons.description),
                inActiveIcon: const Icon(Icons.description_outlined),
                title: Text('myOffers'.tr),
                activeColor: ColorsManager.primary,
                isBag: controller.isMyOfferBag.value,
              ),
              BottomNavBarItem(
                activeIcon: const Icon(Icons.message_rounded),
                inActiveIcon: const Icon(Icons.message_outlined),
                title: Text('messaging'.tr),
                activeColor: ColorsManager.primary,
                isBag: controller.isMessagingBag.value,
                bagLabel: controller.messagingBagLabel.value,
              ),
              BottomNavBarItem(
                activeIcon: const Icon(Icons.person),
                inActiveIcon: const Icon(Icons.person_outlined),
                title: Text('profile'.tr),
                activeColor: ColorsManager.primary,
              ),
            ],
            onItemSelected: (index) => controller.pageNavigate(index: index),
          ),
        ),
      ),
    );
  }
}
