import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import 'home.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'token:${controller.userToken!.token}',
              style: const TextStyle(
                fontFamily: FontConstants.typoRound,
                fontSize: 20,
              ),
            ),
            Text(
              'tokenType:${controller.userToken!.tokenType}',
              style: const TextStyle(
                fontFamily: FontConstants.typoRound,
                fontSize: 20,
              ),
            ),
            Text(
              'expireIn:${controller.userToken!.expireIn}',
              style: const TextStyle(
                fontFamily: FontConstants.typoRound,
                fontSize: 20,
              ),
            ),
            Text(
              'accountType:${controller.userToken!.accountType}',
              style: const TextStyle(
                fontFamily: FontConstants.typoRound,
                fontSize: 20,
              ),
            ),
            MaterialButton(
              onPressed: () {
                controller.signOut();
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
    );
  }
}
