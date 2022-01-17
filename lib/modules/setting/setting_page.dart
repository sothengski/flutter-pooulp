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
      ),
      body: Column(
        children: [
          const Center(child: Text('Setting Page')),
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
    );
  }
}
