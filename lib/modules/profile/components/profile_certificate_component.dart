import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';

class ProfileCertificateComponent extends StatelessWidget {
  final String? title;
  final String? addOrEditCertificateRoute;
  final List<CertificateModel>? certificateList;

  const ProfileCertificateComponent({
    super.key,
    this.title,
    this.addOrEditCertificateRoute,
    this.certificateList,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainerWidget.profileComponent(
      leftTitle: title!.toUpperCase(),
      rightWidget: CustomIconButtonWidget(
        iconData: Icons.add,
        padding: 0.0,
        isConstraints: true,
        onClick: () => {
          Get.toNamed(
            addOrEditCertificateRoute!,
            arguments: [Keys.addOperation],
          ),
        },
      ),
      child: Column(
        children: certificateList!
            .map(
              (e) => CustomListTileWidget(
                text1: e.title,
                text1Color: ColorsManager.grey850,
                text1FontWeight: FontWeightManager.medium,
                text1FontSize: AppSize.s16,

                text2: "${'received'.tr} ${e.receivedDateFormat}",
                // text2: 'profile.issuedDate'
                //     .trParams({'date': '${e.receivedDateFormat}'}),
                // 'Issued: ${e.receivedDateFormat}',
                text2Color: ColorsManager.grey800,
                // text3: e.expirationDate != null
                //     ? 'profile.expiredDate'
                //         .trParams({'date': '${e.receivedDateFormat}'})
                //     // 'Expired: ${e.expirationDateFormat}'
                //     : 'profile.noExpiredDate'.tr,
                // text3FontSize: AppSize.s14,
                text4: e.description,
                // bottomPadding: 8.0,
                leftWidget: const CustomBoxWidget(
                  size: 40,
                  child: Icon(
                    Icons.emoji_events,
                    color: ColorsManager.primary75,
                    size: AppSize.s20,
                  ),
                ),
                rightWidget: CustomIconButtonWidget(
                  iconData: Icons.edit_outlined,
                  padding: 0.0,
                  iconSize: 20.0,
                  isConstraints: true,
                  onClick: () => {
                    Get.toNamed(
                      addOrEditCertificateRoute!,
                      arguments: [Keys.editOperation, e],
                    ),
                  },
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
