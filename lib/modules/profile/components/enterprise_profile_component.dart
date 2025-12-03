import 'package:flutter/material.dart';

import '../../modules.dart';

class EnterpriseProfileComponent extends StatelessWidget {
  const EnterpriseProfileComponent({super.key, required this.controller});

  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ///===== Profile Header Widget =====//
        ProfileHeaderComponent(
          userName: controller.userInfoRepsonse.value.enterprise!.name,
          // userRole: controller.userInfoRepsonse.value.enterprise!.enterpriseID,
          // numberStarRate: 0.0,
          controller: controller,
        ),
        //===== Profile Header Widget =====//

        ///===== Personal Information Widget =====//
        // ContactInformationComponent(
        //   headerTitle: 'Enterprise Information',
        //   email: controller.userInfoRepsonse.value.enterprise!.email,
        //   phone: controller.userInfoRepsonse.value.enterprise!.fullPhone1Format,
        //   videoPreentationLink:
        //       controller.userInfoRepsonse.value.enterprise!.description,
        // ),
        //===== Personal Information Widget =====//
      ],
    );
  }
}
