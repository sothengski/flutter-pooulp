import 'package:flutter/material.dart';

import '../../modules.dart';

class EnterpriseProfileComponent extends StatelessWidget {
  const EnterpriseProfileComponent({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ///===== Profile Header Widget =====//
        ProfileHeader(
          userName: controller.userInfoRepsonse.value.enterprise!.name,
          userRole: controller.userInfoRepsonse.value.enterprise!.enterpriseID,
          // numberStarRate: 0.0,
        ),
        //===== Profile Header Widget =====//

        ///===== Personal Information Widget =====//
        ContactInformationComponent(
          headerTitle: 'Enterprise Information',
          email: controller.userInfoRepsonse.value.enterprise!.email,
          phone: controller.userInfoRepsonse.value.enterprise!.fullPhone1Format,
          videoPreentationLink:
              controller.userInfoRepsonse.value.enterprise!.description,
        ),
        //===== Personal Information Widget =====//
      ],
    );
  }
}
