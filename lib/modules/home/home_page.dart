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
        backgroundColor: ColorsManager.primary,
        body: SafeArea(
          child: IndexedStack(
            index: controller.currentIndex.value,
            children: const [
              FeedPage(),
              OfferPage(),
              ProfilePage(),
            ],
          ),
        ),
        bottomNavigationBar: Obx(
          () => CustomAnimatedBottomBar(
            containerHeight: 60,
            // backgroundColor: ColorsManager.grey100,
            selectedIndex: controller.currentIndex.value,
            itemCornerRadius: 10,
            curve: Curves.easeIn,
            items: <BottomNavBarItem>[
              BottomNavBarItem(
                activeIcon: const Icon(Icons.explore),
                inActiveIcon: const Icon(Icons.explore_outlined),
                title: const Text('Feed'),
                activeColor: ColorsManager.primary,
              ),
              BottomNavBarItem(
                activeIcon: const Icon(Icons.description),
                inActiveIcon: const Icon(Icons.description_outlined),
                title: const Text('My Offers'),
                activeColor: ColorsManager.primary,
              ),
              BottomNavBarItem(
                activeIcon: const Icon(Icons.person),
                inActiveIcon: const Icon(Icons.person_outlined),
                title: const Text('Profile'),
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
