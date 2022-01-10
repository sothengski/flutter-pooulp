import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import 'profile.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: CustomAppBar(
        // title: 'Profile Page',
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            color: ColorsManager.white,
            tooltip: 'Settings',
            onPressed: () => {},
          )
        ],
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: AppSize.s32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const ProfileHeader(),
                Text(
                  'token:${controller.homeController.userToken!.token}',
                  style: const TextStyle(
                    fontFamily: FontConstants.typoRound,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'tokenType:${controller.homeController.userToken!.tokenType}',
                  style: const TextStyle(
                    fontFamily: FontConstants.typoRound,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'expireIn:${controller.homeController.userToken!.expireIn}',
                  style: const TextStyle(
                    fontFamily: FontConstants.typoRound,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'accountType:${controller.homeController.userToken!.accountType}',
                  style: const TextStyle(
                    fontFamily: FontConstants.typoRound,
                    fontSize: 20,
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    controller.homeController.signOut();
                  },
                  child: const CustomTextWidget(
                    text: 'Sign Out',
                    fontSize: 24.0,
                    marginTop: 20.0,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
