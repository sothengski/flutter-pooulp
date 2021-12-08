import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';

class UnknownRoutePage extends StatelessWidget {
  const UnknownRoutePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Not Found Page"),
      ),
      body: ListTile(
        title: const Text("Not Found Page Please go back to home page"),
        subtitle: const Text('Go to Home Page'),
        onTap: () => Get.offAllNamed(Routes.splashRoute),
      ),
    );
  }
}
