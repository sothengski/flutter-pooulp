import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';
import '../../../routes/app_routes.dart';

class AvailabilityComponent extends StatelessWidget {
  final PeriodModel? availabilityData;
  const AvailabilityComponent({
    Key? key,
    this.availabilityData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        backgroundColor: ColorsManager.white,
        collapsedBackgroundColor: ColorsManager.grey100,
        collapsedIconColor: ColorsManager.grey,
        childrenPadding: const EdgeInsets.only(
          left: AppSize.s12,
        ),
        tilePadding: const EdgeInsets.only(
          left: AppSize.s16,
          right: AppSize.s12,
        ),
        title: CustomTextWidget(
          text: 'profile.periodFromTo'.trParams(
            {
              'dateFrom': '${availabilityData!.dateFromFormat}',
              'dateTo': '${availabilityData!.dateToFormat}'
            },
          ),
          // 'Period from ${availabilityData!.dateFromFormat} to ${availabilityData!.dateToFormat}',
          fontWeight: FontWeight.w600,
          color: ColorsManager.black,
        ),
        children: [
          Stack(
            children: [
              if (availabilityData!.isCustom == 0)
                CustomTextWidget(
                  text: 'profile.alwaysAvailable'.tr,
                  fontSize: AppSize.s16,
                  fontWeight: FontWeight.w400,
                  marginTop: AppSize.s12,
                )
              else
                Wrap(
                  children: availabilityData!.weekly!.map(
                    (e) {
                      return e.slots!.isEmpty
                          ? Container()
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 30,
                                  child: CustomTextWidget(
                                    text: '${e.dayLabel}',
                                    color: ColorsManager.black,
                                  ),
                                ),
                                Expanded(
                                  flex: 70,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: e.slots!
                                        .map(
                                          (e) => CustomTextWidget(
                                            text:
                                                '${e.startTimeToHour} - ${e.endTimeToHour}',
                                            color: ColorsManager.black,
                                            marginTop: AppSize.s2,
                                            marginBottom: AppSize.s2,
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ],
                            );
                    },
                  ).toList(),
                ),
              Align(
                alignment: Alignment.topRight,
                child: CustomIconButtonWidget(
                  iconData: Icons.edit_outlined,
                  iconSize: 20.0,
                  isConstraints: true,
                  onClick: () => {
                    Get.toNamed(
                      Routes.addOrEditAvailabilityRoute,
                      arguments: [Keys.editOperation, availabilityData],
                    ),
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
