import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';

class ProfileAvailabilityComponent extends StatelessWidget {
  final String? title;
  final String? addOrEditAvailabilityRoute;
  final List<PeriodModel>? availabilityList;

  const ProfileAvailabilityComponent({
    super.key,
    this.availabilityList,
    this.title,
    this.addOrEditAvailabilityRoute,
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
            addOrEditAvailabilityRoute!,
            arguments: [Keys.addOperation],
          ),
        },
      ),
      child: Column(
        children: availabilityList!
            .map(
              (period) => //TODO: remove this condition after offline testing
                  //  period.to!.isBefore(now) == true
                  //   ? Container()
                  //   :
                  Padding(
                    padding: const EdgeInsets.all(AppSize.s4),
                    child: Theme(
                      data: Theme.of(
                        context,
                      ).copyWith(dividerColor: Colors.transparent),
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
                          text:
                              "${'periodFrom'.tr} ${period.dateFromFormat} ${'to'.tr} ${period.dateToFormat}",
                          // text: 'profile.periodFromTo'.trParams(
                          //   {
                          //     'dateFrom': '${period.dateFromFormat}',
                          //     'dateTo': '${period.dateToFormat}'
                          //   },
                          // ),
                          fontWeight: FontWeight.w600,
                          color: ColorsManager.black,
                        ),
                        children: [
                          Stack(
                            children: [
                              if (period.isCustom == 0)
                                CustomTextWidget(
                                  text: 'alwaysAvailable'.tr,
                                  fontSize: AppSize.s16,
                                  fontWeight: FontWeight.w400,
                                  marginTop: AppSize.s12,
                                )
                              else
                                Wrap(
                                  children: period.weekly!.map((e) {
                                    return e.slots!.isEmpty
                                        ? Container()
                                        : Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                                          color: ColorsManager
                                                              .black,
                                                          marginTop: AppSize.s2,
                                                          marginBottom:
                                                              AppSize.s2,
                                                        ),
                                                      )
                                                      .toList(),
                                                ),
                                              ),
                                            ],
                                          );
                                  }).toList(),
                                ),
                              Align(
                                alignment: Alignment.topRight,
                                child: CustomIconButtonWidget(
                                  iconData: Icons.edit_outlined,
                                  iconSize: 20.0,
                                  isConstraints: true,
                                  onClick: () => {
                                    Get.toNamed(
                                      addOrEditAvailabilityRoute!,
                                      arguments: [Keys.editOperation, period],
                                    ),
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
            )
            .toList(),
      ),
    );
  }
}
