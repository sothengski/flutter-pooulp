import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import '../../data/data.dart';
import '../modules.dart';

class OnboardingPage extends GetView<OnboardingController> {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<OnboardingPageModel> pageData = controller.onboardingPages;
    return Scaffold(
      backgroundColor: ColorsManager.primaryBlue,
      body: SafeArea(
        child: controller.obx(
          (state) => Obx(
            () => controller.onboardingPagesAPIData.value ==
                    const OnboardingModel(totalPage: 0)
                ? Container()
                : Container(
                    padding: const EdgeInsets.only(
                      top: AppSize.s48,
                      left: AppSize.s16,
                      right: AppSize.s16,
                    ),
                    child: PageView(
                      controller: controller.pageController,
                      onPageChanged: controller.selectedPageIndex,
                      children: [
                        PageTemplateWidget(
                          bodyPageWidget: Column(
                            children: [
                              Center(
                                child: CustomTextWidget(
                                  text: pageData[0].title,
                                  color: ColorsManager.white,
                                  fontSize: AppSize.s28,
                                  fontWeight: FontWeight.w600,
                                  height: 1.75,
                                  marginTop: AppSize.s48,
                                  textAlign: TextAlign.center,
                                  maxLine: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                        PageTemplateWidget(
                          title: pageData[1].title,
                          subTitle2: "(${'multipleSelectLabel'.tr})",
                          bodyPageWidget: ListView.builder(
                            shrinkWrap: true,
                            // physics:
                            //     const NeverScrollableScrollPhysics(),
                            itemCount: controller
                                .onboardingPages[1].selectionItems!.length,
                            itemBuilder: (_, itemIndex) {
                              final item =
                                  pageData[1].selectionItems![itemIndex];
                              return item.id == 1 || item.id == 3
                                  ? Obx(
                                      () => TextCardClickableWidget(
                                        size: 50.0,
                                        bottomMargin: AppSize.s32,
                                        topPadding: 0.0,
                                        bottomPadding: 0.0,
                                        rightPadding: 0.0,
                                        text: item.label,
                                        // rightTopText: 'profile.soon'.tr,
                                        maxLine:
                                            controller.isUpdate.value == true
                                                ? 3
                                                : 3,
                                        fontSize: AppSize.s24,
                                        itemList:
                                            controller.lookingForSelectedList,
                                        item: item,
                                        onClick: () {
                                          controller.addOrRemoveDataInList(
                                            pageIndex: 0,
                                            addToList: controller
                                                .lookingForSelectedList,
                                            itemToBeAdd: item,
                                          );
                                          controller.updateNumberPage();
                                        },
                                      ),
                                    )
                                  : Container();
                            },
                          ),
                        ),
                        // id:1 == internship selected in looking for list
                        if (controller.haveitemInList(
                              controller.lookingForSelectedList,
                              FieldModel(id: 1),
                            ) ==
                            true)
                          PageTemplateWidget(
                            title: pageData[2].subtitle,
                            subTitle2: "(${'multipleSelectLabel'.tr})",
                            bodyPageWidget: Obx(
                              () => Column(
                                children: [
                                  Wrap(
                                    children: [
                                      CustomTextWidget(
                                        text: 'internshipTypes'.tr,
                                        fontSize: AppSize.s20,
                                        fontWeight: FontWeight.w600,
                                        maxLine:
                                            controller.isUpdate.value == true
                                                ? 3
                                                : 3,
                                        color: ColorsManager.white,
                                        textAlign: TextAlign.center,
                                        marginTop: AppSize.s16,
                                        marginLeft: AppSize.s8,
                                        marginRight: AppSize.s8,
                                        marginBottom: AppSize.s16,
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Wrap(
                                          children: [
                                            for (var i = 0;
                                                i <
                                                    pageData[2]
                                                        .internshipTypeItems!
                                                        .length;
                                                i++)
                                              Obx(
                                                () => Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    right: AppSize.s8,
                                                    bottom: AppSize.s12,
                                                  ),
                                                  child:
                                                      TextCardClickableWidget(
                                                    isCenterText: false,
                                                    text: pageData[2]
                                                        .internshipTypeItems![i]
                                                        .label,
                                                    maxLine: controller.isUpdate
                                                                .value ==
                                                            true
                                                        ? 3
                                                        : 3,
                                                    fontSize: AppSize.s24,
                                                    itemList: controller
                                                        .internshipTypeSelectedList,
                                                    item: pageData[2]
                                                        .internshipTypeItems![i],
                                                    onClick: () {
                                                      controller
                                                          .addOrRemoveDataInList(
                                                        pageIndex: 1,
                                                        addToList: controller
                                                            .internshipTypeSelectedList,
                                                        itemToBeAdd: pageData[2]
                                                            .internshipTypeItems![i],
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (controller.internshipTypeSelectedList
                                          .isNotEmpty &&
                                      controller.internshipTypeSelectedList
                                          .where(
                                            (element) =>
                                                element.keyLabel == 'other',
                                          )
                                          .isNotEmpty)
                                    CustomTextInput(
                                      controller:
                                          controller.internshipOtherTextCtrl,
                                      // inputTitle: "",
                                      titleColor: ColorsManager.white,
                                      hintText: 'otherInternshipPlaceholder'.tr,
                                      isFilled: true,
                                      topContentPadding: AppSize.s12,
                                      bottomContentPadding: AppSize.s12,
                                      topPadding: AppSize.s12,
                                      maxLength: 100,
                                      keyboardType: TextInputType.multiline,
                                    ),
                                  Wrap(
                                    children: [
                                      CustomTextWidget(
                                        text: 'internshipPeriods'.tr,
                                        fontSize: AppSize.s20,
                                        fontWeight: FontWeight.w600,
                                        maxLine:
                                            controller.isUpdate.value == true
                                                ? 3
                                                : 3,
                                        color: ColorsManager.white,
                                        textAlign: TextAlign.center,
                                        marginTop: AppSize.s16,
                                        marginLeft: AppSize.s8,
                                        marginRight: AppSize.s8,
                                        marginBottom: AppSize.s16,
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Wrap(
                                          children: [
                                            for (var i = 0;
                                                i <
                                                    pageData[2]
                                                        .internshipPeriodItems!
                                                        .length;
                                                i++)
                                              Obx(
                                                () => Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    right: AppSize.s8,
                                                    bottom: AppSize.s12,
                                                  ),
                                                  child:
                                                      TextCardClickableWidget(
                                                    isCenterText: false,
                                                    text: pageData[2]
                                                        .internshipPeriodItems![
                                                            i]
                                                        .label,
                                                    maxLine: controller.isUpdate
                                                                .value ==
                                                            true
                                                        ? 3
                                                        : 3,
                                                    fontSize: AppSize.s24,
                                                    itemList: controller
                                                        .internshipPeriodSelectedList,
                                                    item: pageData[2]
                                                        .internshipPeriodItems![i],
                                                    onClick: () {
                                                      controller
                                                          .addOrRemoveDataInList(
                                                        pageIndex: 1,
                                                        addToList: controller
                                                            .internshipPeriodSelectedList,
                                                        itemToBeAdd: pageData[2]
                                                            .internshipPeriodItems![i],
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        // id:1 == internship selected in looking for list
                        if (controller.haveitemInList(
                              controller.lookingForSelectedList,
                              FieldModel(id: 1),
                            ) ==
                            true)
                          PageTemplateWidget(
                            title: pageData[3].title,
                            subTitle: pageData[3].subtitle,
                            subTitle2: "(${'multipleSelectLabel'.tr})",
                            bodyPageWidget: SingleChildScrollView(
                              child: Wrap(
                                children: pageData[3]
                                    .selectionItems!
                                    .map(
                                      (element) => Obx(
                                        () => Padding(
                                          padding: const EdgeInsets.only(
                                            right: AppSize.s8,
                                            bottom: AppSize.s12,
                                          ),
                                          child: TextCardClickableWidget(
                                            isCenterText: false,
                                            text: element.label ??
                                                element.category.toString(),
                                            maxLine:
                                                controller.isUpdate.value ==
                                                        true
                                                    ? 3
                                                    : 3,
                                            fontSize: AppSize.s24,
                                            itemList: controller
                                                .internshipInterestedInSelectedList,
                                            item: element,
                                            onClick: () {
                                              controller.addOrRemoveDataInList(
                                                pageIndex: 2,
                                                addToList: controller
                                                    .internshipInterestedInSelectedList,
                                                itemToBeAdd: element,
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    )
                                    .toSet()
                                    .toList(),
                              ),
                            ),
                            // bodyPageWidget: GridView.builder(
                            //   shrinkWrap: true,
                            //   gridDelegate:
                            //       const SliverGridDelegateWithFixedCrossAxisCount(
                            //     crossAxisCount: 2,
                            //     crossAxisSpacing: AppSize.s16,
                            //     mainAxisSpacing: AppSize.s16,
                            //     childAspectRatio: 3,
                            //   ),
                            //   // padding: const EdgeInsets.only(
                            //   //   top: AppSize.s16,
                            //   //   bottom: AppSize.s16,
                            //   // ),
                            //   itemCount: pageData[3].selectionItems!.length,
                            //   itemBuilder: (_, itemIndex) {
                            //     final item =
                            //         pageData[3].selectionItems![itemIndex];
                            //     return Obx(
                            //       () => TextCardClickableWidget(
                            //         text: item.label,
                            //         maxLine: controller.isUpdate.value == true
                            //             ? 3
                            //             : 3,
                            //         itemList: controller
                            //             .internshipInterestedInSelectedList,
                            //         item: item,
                            //         onClick: () {
                            //           controller.addOrRemoveDataInList(
                            //             pageIndex: 2,
                            //             addToList: controller
                            //                 .internshipInterestedInSelectedList,
                            //             itemToBeAdd: item,
                            //           );
                            //         },
                            //       ),
                            //     );
                            //   },
                            // ),
                          ),
                        // id:1 == internship selected in looking for list
                        if (controller.haveitemInList(
                              controller.lookingForSelectedList,
                              FieldModel(id: 1),
                            ) ==
                            true)
                          PageTemplateWidget(
                            title: pageData[4].title,
                            subTitle: pageData[4].subtitle,
                            bodyPageWidget: SingleChildScrollView(
                              child: Obx(
                                () => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ///===== Top of Address Component =====//
                                    GestureDetector(
                                      onTap: () async {
                                        // controller
                                        //     .uuidTokenGenerator();
                                        controller.results = await showSearch(
                                          context: context,
                                          delegate:
                                              OnBoardingAddressSearchBarWidget(
                                            sessionToken:
                                                UuidGenerator().uuidV4(),
                                            placeDetail: controller
                                                .internshipPlaceDetail,
                                          ),
                                        );
                                      },
                                      child: AbsorbPointer(
                                        child: CustomTextInput(
                                          controller:
                                              controller.internshipAddressCtrl,
                                          inputTitle:
                                              "${'city'.tr} / ${'zipcode'.tr} *",
                                          // "${'profile.city'.tr} / ${'profile.zipCode'.tr} *",
                                          titleColor: ColorsManager.white,
                                          hintText: controller
                                                  .internshipPlaceDetail!
                                                  .value
                                                  .fullAddress ??
                                              'address'.tr,
                                          // 'profile.address'.tr,
                                          hintTextColor: ColorsManager.black,
                                          isFilled: true,
                                          isReadOnly: true,
                                          topContentPadding: 12.0,
                                          bottomContentPadding: 12.0,
                                          topPadding: AppSize.s12,
                                          // counter: true,
                                          maxLines: 5,
                                          maxLength: 150,
                                          keyboardType: TextInputType.multiline,
                                        ),
                                      ),
                                    ),
                                    //===== Bottom of Address Component =====//

                                    ///===== Top of Radius Component =====//
                                    CustomTextWidget(
                                      text:
                                          "${'radius'.tr}: ${controller.internshipRadiusRxInt.value} Km",
                                      color: ColorsManager.white,
                                      marginTop: AppSize.s32,
                                    ),
                                    Slider(
                                      value: controller
                                          .internshipRadiusRxInt.value
                                          .toDouble(),
                                      min: 10.0,
                                      max: 200.0,
                                      divisions: 200,
                                      activeColor: ColorsManager.primary,
                                      inactiveColor: ColorsManager.grey300,
                                      thumbColor: ColorsManager.primary,
                                      label:
                                          '${controller.internshipRadiusRxInt.value}',
                                      onChanged: (
                                        double newValue,
                                      ) {
                                        controller.internshipRadiusRxInt.value =
                                            newValue.toInt();
                                      },
                                    ),
                                    //===== Bottom of Radius Component =====//
                                  ],
                                ),
                              ),
                            ),
                          ),
                        // id:1 == internship selected in looking for list
                        // if (controller.haveitemInList(
                        //       controller.lookingForSelectedList,
                        //       FieldModel(id: 1),
                        //     ) ==
                        //     true)
                        //   PageTemplateWidget(
                        //     title: pageData[4].title,
                        //     subTitle: pageData[4].subtitle,
                        //     bodyPageWidget: Wrap(
                        //       children: [
                        //         for (var i = 0;
                        //             i <
                        //                 controller.onboardingPages[4]
                        //                     .selectionItems!.length;
                        //             i++)
                        //           Obx(
                        //             () => Padding(
                        //               padding: const EdgeInsets.only(
                        //                 right: AppSize.s8,
                        //                 bottom: AppSize.s12,
                        //               ),
                        //               child: TextCardClickableWidget(
                        //                 isCenterText: false,
                        //                 text: controller.onboardingPages[4]
                        //                     .selectionItems![i].label,
                        //                 maxLine:
                        //                     controller.isUpdate.value == true
                        //                         ? 3
                        //                         : 3,
                        //                 fontSize: AppSize.s24,
                        //                 itemList: controller
                        //                     .internshipLanguageSelectedList,
                        //                 item: controller.onboardingPages[4]
                        //                     .selectionItems![i],
                        //                 onClick: () {
                        //                   controller.addOrRemoveDataInList(
                        //                     pageIndex: 4,
                        //                     addToList: controller
                        //                         .internshipLanguageSelectedList,
                        //                     itemToBeAdd: controller
                        //                         .onboardingPages[4]
                        //                         .selectionItems![i],
                        //                   );
                        //                 },
                        //               ),
                        //             ),
                        //           ),
                        //       ],
                        //     ),
                        //   ),
                        // id:3 == student job selected in looking for list
                        if (controller.haveitemInList(
                              controller.lookingForSelectedList,
                              FieldModel(id: 3),
                            ) ==
                            true)
                          PageTemplateWidget(
                            title: pageData[5].title,
                            subTitle: pageData[5].subtitle,
                            subTitle2: "(${'multipleSelectLabel'.tr})",
                            bodyPageWidget: SingleChildScrollView(
                              child: Wrap(
                                children: pageData[3]
                                    .selectionItems!
                                    .map(
                                      (element) => Obx(
                                        () => Padding(
                                          padding: const EdgeInsets.only(
                                            right: AppSize.s8,
                                            bottom: AppSize.s12,
                                          ),
                                          child: TextCardClickableWidget(
                                            isCenterText: false,
                                            text: element.label ??
                                                element.category.toString(),
                                            maxLine:
                                                controller.isUpdate.value ==
                                                        true
                                                    ? 3
                                                    : 3,
                                            fontSize: AppSize.s24,
                                            itemList: controller
                                                .studentJobInterestedInSelectedList,
                                            item: element,
                                            onClick: () {
                                              controller.addOrRemoveDataInList(
                                                pageIndex: 5,
                                                addToList: controller
                                                    .studentJobInterestedInSelectedList,
                                                itemToBeAdd: element,
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    )
                                    .toSet()
                                    .toList(),
                              ),
                            ),
                            // bodyPageWidget: GridView.builder(
                            //   shrinkWrap: true,
                            //   gridDelegate:
                            //       const SliverGridDelegateWithFixedCrossAxisCount(
                            //     crossAxisCount: 2,
                            //     crossAxisSpacing: AppSize.s16,
                            //     mainAxisSpacing: AppSize.s16,
                            //     childAspectRatio: 3,
                            //   ),
                            //   itemCount: pageData[3].selectionItems!.length,
                            //   itemBuilder: (_, itemIndex) {
                            //     final item =
                            //         pageData[5].selectionItems![itemIndex];
                            //     return Obx(
                            //       () => TextCardClickableWidget(
                            //         text: item.label,
                            //         maxLine: controller.isUpdate.value == true
                            //             ? 3
                            //             : 3,
                            //         itemList: controller
                            //             .studentJobInterestedInSelectedList,
                            //         item: item,
                            //         onClick: () {
                            //           controller.addOrRemoveDataInList(
                            //             pageIndex: 5,
                            //             addToList: controller
                            //                 .studentJobInterestedInSelectedList,
                            //             itemToBeAdd: item,
                            //           );
                            //         },
                            //       ),
                            //     );
                            //   },
                            // ),
                          ),
                        // id:3 == student job selected in looking for list
                        if (controller.haveitemInList(
                              controller.lookingForSelectedList,
                              FieldModel(id: 3),
                            ) ==
                            true)
                          PageTemplateWidget(
                            title: pageData[6].title,
                            subTitle: pageData[6].subtitle,
                            bodyPageWidget: SingleChildScrollView(
                              child: Obx(
                                () => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ///===== Top of Address Component =====//
                                    GestureDetector(
                                      onTap: () async {
                                        // controller
                                        //     .uuidTokenGenerator();
                                        controller.results = await showSearch(
                                          context: context,
                                          delegate:
                                              OnBoardingAddressSearchBarWidget(
                                            sessionToken:
                                                UuidGenerator().uuidV4(),
                                            placeDetail: controller
                                                .studentJobPlaceDetail,
                                          ),
                                        );
                                      },
                                      child: AbsorbPointer(
                                        child: CustomTextInput(
                                          controller:
                                              controller.studentJobAddressCtrl,
                                          inputTitle:
                                              "${'city'.tr} / ${'zipcode'.tr} *",
                                          // "${'profile.city'.tr} / ${'profile.zipCode'.tr} *",
                                          titleColor: ColorsManager.white,
                                          hintText: controller
                                                  .studentJobPlaceDetail!
                                                  .value
                                                  .fullAddress ??
                                              'address'.tr,
                                          // 'profile.address'.tr,
                                          hintTextColor: ColorsManager.black,
                                          isFilled: true,
                                          isReadOnly: true,
                                          topContentPadding: 12.0,
                                          bottomContentPadding: 12.0,
                                          topPadding: AppSize.s12,
                                          // counter: true,
                                          maxLines: 5,
                                          maxLength: 150,
                                          keyboardType: TextInputType.multiline,
                                        ),
                                      ),
                                    ),
                                    //===== Bottom of Address Component =====//

                                    ///===== Top of Radius Component =====//
                                    CustomTextWidget(
                                      text:
                                          "${'radius'.tr}: ${controller.studentJobRadiusRxInt.value} Km",
                                      color: ColorsManager.white,
                                      marginTop: AppSize.s32,
                                    ),
                                    Slider(
                                      value: controller
                                          .studentJobRadiusRxInt.value
                                          .toDouble(),
                                      min: 10.0,
                                      max: 200.0,
                                      divisions: 200,
                                      activeColor: ColorsManager.primary,
                                      inactiveColor: ColorsManager.grey300,
                                      thumbColor: ColorsManager.primary,
                                      label:
                                          '${controller.studentJobRadiusRxInt.value}',
                                      onChanged: (
                                        double newValue,
                                      ) {
                                        controller.studentJobRadiusRxInt.value =
                                            newValue.toInt();
                                      },
                                    ),
                                    //===== Bottom of Radius Component =====//
                                  ],
                                ),
                              ),
                            ),
                          ),
                        // // id:3 == student job selected in looking for list
                        // if (controller.haveitemInList(
                        //       controller.lookingForSelectedList,
                        //       FieldModel(id: 3),
                        //     ) ==
                        //     true)
                        //   PageTemplateWidget(
                        //     title: pageData[7].title,
                        //     subTitle: pageData[7].subtitle,
                        //     bodyPageWidget: Wrap(
                        //       children: [
                        //         for (var i = 0;
                        //             i <
                        //                 controller.onboardingPages[4]
                        //                     .selectionItems!.length;
                        //             i++)
                        //           Obx(
                        //             () => Padding(
                        //               padding: const EdgeInsets.only(
                        //                 right: AppSize.s8,
                        //                 bottom: AppSize.s12,
                        //               ),
                        //               child: TextCardClickableWidget(
                        //                 isCenterText: false,
                        //                 text: controller.onboardingPages[4]
                        //                     .selectionItems![i].label,
                        //                 maxLine:
                        //                     controller.isUpdate.value == true
                        //                         ? 3
                        //                         : 3,
                        //                 fontSize: AppSize.s24,
                        //                 itemList: controller
                        //                     .studentJobLanguageSelectedList,
                        //                 item: controller.onboardingPages[4]
                        //                     .selectionItems![i],
                        //                 onClick: () {
                        //                   controller.addOrRemoveDataInList(
                        //                     pageIndex: 7,
                        //                     addToList: controller
                        //                         .studentJobLanguageSelectedList,
                        //                     itemToBeAdd: controller
                        //                         .onboardingPages[4]
                        //                         .selectionItems![i],
                        //                   );
                        //                 },
                        //               ),
                        //             ),
                        //           ),
                        //       ],
                        //     ),
                        //   ),
                        // Good At
                        PageTemplateWidget(
                          title: pageData[7].title,
                          // subTitle: pageData[7].title,
                          subTitle2: "(${'multipleSelectLabel'.tr})",
                          bodyPageWidget: SingleChildScrollView(
                            child: Wrap(
                              children: pageData[7]
                                  .allSkills!
                                  .map(
                                    (element) => Obx(
                                      () => Padding(
                                        padding: const EdgeInsets.only(
                                          right: AppSize.s8,
                                          bottom: AppSize.s12,
                                        ),
                                        child: TextCardClickableWidget(
                                          isCenterText: false,
                                          text: element.label ??
                                              element.category.toString(),
                                          maxLine:
                                              controller.isUpdate.value == true
                                                  ? 3
                                                  : 3,
                                          fontSize: AppSize.s24,
                                          itemList: controller
                                              .goodAtfieldSelectedList,
                                          item: element,
                                          onClick: () {
                                            controller.addOrRemoveDataInList(
                                              pageIndex: 7,
                                              addToList: controller
                                                  .goodAtfieldSelectedList,
                                              itemToBeAdd: element,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  )
                                  .toSet()
                                  .toList(),
                            ),
                          ),
                        ),
                        PageTemplateWidget(
                          title: pageData[8].title,
                          // subTitle: pageData[8].title,
                          bodyPageWidget: Padding(
                            padding: const EdgeInsets.all(AppSize.s8),
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Column(
                                children: [
                                  ...controller.educationList
                                      .asMap()
                                      .map(
                                        (i, element) => MapEntry(
                                          i,
                                          EducationForm(
                                            eduIndex: i,
                                            isCurrentStudy: element.completed,
                                            school: element.school,
                                            fieldList: element.fields,
                                            // degreeTextCtrl: controller
                                            //     .degreeListTextCtrl[i],
                                            // currentStudyYearTextCtrl: controller
                                            //     .currentStudyYearTextCtrl[i],
                                            isUpdateTrigger:
                                                controller.isUpdate.value,
                                          ),
                                        ),
                                      )
                                      .values
                                      .toList(),
                                  CustomMaterialButton(
                                    topPadding: AppSize.s12,
                                    leftPadding: AppSize.s12,
                                    rightPadding: AppSize.s12,
                                    bottomPadding: AppSize.s20,
                                    text: 'addMore'.tr,
                                    fontSize: AppSize.s20,
                                    // buttonHeight: 45,
                                    buttonWidth: getWidth,
                                    onPressed: () {
                                      unFocusKeyBoard(context);
                                      controller.addOrRemoveEduSlot(
                                          // isRemove: slotList!.indexOf(e) != 0,
                                          // eduIndex: controller,
                                          // removeIndex: slotList!.indexOf(e) != 0
                                          //     ? slotList!.indexOf(e)
                                          //     : -1,
                                          // eduSlotToBeAdd: EducationModel(),
                                          );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        PageTemplateWidget(
                          title: pageData[9].title,
                          // subTitle: pageData[9].title,
                          bodyPageWidget: SingleChildScrollView(
                            child: Wrap(
                              children: pageData[9]
                                  .selectionItems!
                                  .map(
                                    (element) => Obx(
                                      () => Padding(
                                        padding: const EdgeInsets.only(
                                          right: AppSize.s8,
                                          bottom: AppSize.s12,
                                        ),
                                        child: TextCardClickableWidget(
                                          isCenterText: false,
                                          text: element.label.toString(),
                                          maxLine:
                                              controller.isUpdate.value == true
                                                  ? 3
                                                  : 3,
                                          fontSize: AppSize.s24,
                                          itemList: controller
                                              .knowFromSourceSelectedList,
                                          item: element,
                                          onClick: () {
                                            controller.addOrRemoveDataInList(
                                              pageIndex: 9,
                                              addToList: controller
                                                  .knowFromSourceSelectedList,
                                              itemToBeAdd: element,
                                              isList: false,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  )
                                  .toSet()
                                  .toList(),
                            ),
                          ),
                        ),
                        PageTemplateWidget(
                          title: pageData[10].title,
                          // subTitle: pageData[10].subtitle,
                          bodyPageWidget: Column(
                            children: [
                              Center(
                                child: CustomTextWidget(
                                  text: 'onboarding_advice_text_body'.tr,
                                  color: ColorsManager.white,
                                  marginTop: AppSize.s32,
                                  fontSize: AppSize.s18,
                                  height: 1.75,
                                  textAlign: TextAlign.center,
                                  maxLine: 10,
                                ),
                              ),
                              Center(
                                child: CustomTextWidget(
                                  text: 'onboarding_advice_text_footer'.tr,
                                  color: ColorsManager.white,
                                  fontSize: AppSize.s18,
                                  fontWeight: FontWeight.w600,
                                  marginTop: AppSize.s48,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
          onLoading: const Center(
            child: LoadingWidget(size: AppSize.s100, isTreeBounceLoading: true),
          ),
          onError: (error) => const Center(
            child: StateHandlerWidget(
              imgPath: AssetsManager.emptyDataIcon,
              headerText: 'Sorry! Something went wrong',
              bodyText: 'Make sure you complete your profile information.',
              buttonText: '',
              // onPressedFunctionCall: controller.onRefresh,
            ),
          ),
        ),
      ),
      bottomNavigationBar: controller.obx(
        (state) => Obx(
          () => controller.onboardingPagesAPIData.value ==
                  const OnboardingModel(totalPage: 0)
              ? Container()
              : Obx(
                  () => Container(
                    padding: const EdgeInsets.only(
                      // left: AppSize.s0,
                      // right: AppSize.s0,
                      bottom: AppSize.s24,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 25,
                          child: !controller.isFirstPage &&
                                  !controller.isLastPage
                              ? TextButton(
                                  onPressed: () =>
                                      controller.movingAction(forward: false),
                                  style: ButtonStyle(
                                    alignment: Alignment.centerLeft,
                                    padding: MaterialStateProperty.all<
                                        EdgeInsetsGeometry>(
                                      const EdgeInsets.only(left: AppSize.s24),
                                    ),
                                  ),
                                  child: CustomTextWidget(
                                    text: 'back'.tr, // 'core.back'.tr,
                                    color: ColorsManager.white,
                                    fontSize: AppSize.s16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : const CustomTextWidget(
                                  color: ColorsManager.white,
                                  fontSize: AppSize.s16,
                                  fontWeight: FontWeight.bold,
                                ),
                        ),
                        Expanded(
                          flex: 50,
                          child: controller.isFirstPage || controller.isLastPage
                              ? TextButton(
                                  onPressed: controller.movingAction,
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      ColorsManager.primary,
                                    ),
                                  ),
                                  child: CustomTextWidget(
                                    text: controller.isLastPage
                                        ? 'onBoardingFinishBtn'.tr
                                        : 'onBoardingStartBtn'.tr,
                                    color: ColorsManager.white,
                                    fontSize: AppSize.s16,
                                    fontWeight: FontWeight.bold,
                                    // textAlign: TextAlign.right,
                                  ),
                                )
                              : CustomIndicator(
                                  length: controller.numPage.value,
                                  location: controller.selectedPageIndex.value,
                                  size: 8.0,
                                  spaceBtwIndicator: 3.0,
                                ),
                        ),
                        Expanded(
                          flex: 25,
                          child: controller.isDisableOnNextButton()
                              ? TextButton(
                                  onPressed: null,
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      const Color(0x00ffffff),
                                    ),
                                  ),
                                  child: CustomTextWidget(
                                    text: ''.tr, //'core.next'.tr,
                                    color: ColorsManager.white,
                                    fontSize: AppSize.s16,
                                    fontWeight: FontWeight.bold,
                                    // textAlign: TextAlign.right,
                                  ),
                                )
                              : TextButton(
                                  onPressed: controller.movingAction,
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      ColorsManager.primary,
                                    ),
                                    // alignment: Alignment.centerRight,
                                    // padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                    //   const EdgeInsets.only(left: AppSize.s24),
                                    // ),
                                  ),
                                  child: CustomTextWidget(
                                    text: (controller.numPage.value - 2 ==
                                            controller.selectedPageIndex.value)
                                        ? 'finish'.tr //'core.finish'.tr
                                        : 'next'.tr, //'core.next'.tr,
                                    color: ColorsManager.white,
                                    fontSize: AppSize.s16,
                                    fontWeight: FontWeight.bold,
                                    // textAlign: TextAlign.right,
                                  ),
                                ),
                        )
                      ],
                    ),
                  ),
                ),
        ),
        onLoading: const Center(
          child: LoadingWidget(size: AppSize.s100, isTreeBounceLoading: true),
        ),
        onError: (error) => const Center(
          child: StateHandlerWidget(
            imgPath: AssetsManager.emptyDataIcon,
            headerText: 'Sorry! Something went wrong',
            bodyText: 'Make sure you complete your profile information.',
            buttonText: 'Try again',
            // onPressedFunctionCall: controller.onRefresh,
          ),
        ),
      ),
    );
  }
}
