import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import '../../data/data.dart';
import '../modules.dart';

class OnboardingPage extends GetView<OnboardingController> {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      top: AppSize.s72,
                      left: AppSize.s16,
                      right: AppSize.s16,
                    ),
                    child: PageView.builder(
                      controller: controller.pageController,
                      onPageChanged: controller.selectedPageIndex,
                      itemCount: controller.onboardingPages.length,
                      itemBuilder: (context, pageIndex) {
                        final OnboardingPageModel pageData =
                            controller.onboardingPages[pageIndex];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 10,
                              child: CustomTextWidget(
                                text: '${pageData.title}',
                                fontSize: AppSize.s28,
                                fontWeight: FontWeight.w800,
                                color: ColorsManager.white,
                                textAlign: TextAlign.center,
                                marginLeft: AppSize.s8,
                                marginRight: AppSize.s8,
                                maxLine:
                                    controller.isUpdate.value == true ? 3 : 3,
                              ),
                            ),
                            Expanded(
                              flex: 90,
                              child: Container(
                                padding:
                                    const EdgeInsets.only(top: AppSize.s12),
                                child: pageData.pageIndex == 0
                                    ? Obx(
                                        () => Column(
                                          children: [
                                            ListView.builder(
                                              shrinkWrap: true,
                                              // physics:
                                              //     const NeverScrollableScrollPhysics(),
                                              itemCount: controller
                                                  .onboardingPages[pageIndex]
                                                  .selectionItems!
                                                  .length,
                                              itemBuilder: (_, itemIndex) {
                                                final item = controller
                                                    .onboardingPages[pageIndex]
                                                    .selectionItems![itemIndex];
                                                return Obx(
                                                  () => TextCardClickableWidget(
                                                    size: 50.0,
                                                    bottomMargin: AppSize.s32,
                                                    topPadding: 0.0,
                                                    bottomPadding: 0.0,
                                                    rightPadding: 0.0,
                                                    text: item.label,
                                                    // rightTopText: 'profile.soon'.tr,
                                                    maxLine: controller.isUpdate
                                                                .value ==
                                                            true
                                                        ? 3
                                                        : 3,
                                                    fontSize: AppSize.s24,
                                                    itemList: controller
                                                        .lookingForSelectionListPage0
                                                        .value
                                                        .selectionItems,
                                                    item: item,
                                                    onClick: () {
                                                      controller
                                                          .addOrRemoveDataInList(
                                                        pageIndex: pageIndex,
                                                        itemToBeAdd: item,
                                                      );
                                                      // print('on Page:: $pageIndex');
                                                      // print('on Click:: ${item.label}');
                                                      // print('on Click tempItem:: $tempItem');
                                                    },
                                                  ),
                                                );
                                              },
                                            ),
                                            Obx(
                                              () => Visibility(
                                                visible: controller
                                                        .isInternshipSelect
                                                        .value ==
                                                    true,
                                                child: Wrap(
                                                  children: [
                                                    CustomTextWidget(
                                                      text:
                                                          'internshipTypes'.tr,
                                                      fontSize: AppSize.s28,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      maxLine: 3,
                                                      color:
                                                          ColorsManager.white,
                                                      textAlign:
                                                          TextAlign.center,
                                                      marginLeft: AppSize.s8,
                                                      marginRight: AppSize.s8,
                                                      marginBottom: AppSize.s16,
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Wrap(
                                                        children: [
                                                          for (var i = 0;
                                                              i <
                                                                  controller
                                                                      .onboardingPages[
                                                                          pageIndex]
                                                                      .internshipTypeItems!
                                                                      .length;
                                                              i++)
                                                            Obx(
                                                              () => Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  right: AppSize
                                                                      .s8,
                                                                  bottom:
                                                                      AppSize
                                                                          .s12,
                                                                ),
                                                                child:
                                                                    TextCardClickableWidget(
                                                                  isCenterText:
                                                                      false,
                                                                  text: controller
                                                                      .onboardingPages[
                                                                          pageIndex]
                                                                      .internshipTypeItems![
                                                                          i]
                                                                      .label,
                                                                  maxLine: controller
                                                                              .isUpdate
                                                                              .value ==
                                                                          true
                                                                      ? 3
                                                                      : 3,
                                                                  fontSize:
                                                                      AppSize
                                                                          .s24,
                                                                  itemList: controller
                                                                      .internshipTypeSelectionListPage0
                                                                      .value
                                                                      .internshipTypeItems,
                                                                  item: controller
                                                                      .onboardingPages[
                                                                          pageIndex]
                                                                      .internshipTypeItems![i],
                                                                  onClick: () {
                                                                    controller
                                                                        .addOrRemoveDataInList(
                                                                      pageIndex:
                                                                          pageIndex,
                                                                      itemToBeAdd: controller
                                                                          .onboardingPages[
                                                                              pageIndex]
                                                                          .internshipTypeItems![i],
                                                                      listTypeId:
                                                                          2,
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
                                              ),
                                            ),
                                            Obx(
                                              () => Visibility(
                                                visible: controller
                                                        .isInternshipSelect
                                                        .value ==
                                                    true,
                                                child: Wrap(
                                                  children: [
                                                    CustomTextWidget(
                                                      text: 'internshipPeriods'
                                                          .tr,
                                                      fontSize: AppSize.s28,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      maxLine: 3,
                                                      color:
                                                          ColorsManager.white,
                                                      textAlign:
                                                          TextAlign.center,
                                                      marginLeft: AppSize.s8,
                                                      marginRight: AppSize.s8,
                                                      marginBottom: AppSize.s16,
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Wrap(
                                                        children: [
                                                          for (var i = 0;
                                                              i <
                                                                  controller
                                                                      .onboardingPages[
                                                                          pageIndex]
                                                                      .internshipPeriodItems!
                                                                      .length;
                                                              i++)
                                                            Obx(
                                                              () => Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  right: AppSize
                                                                      .s8,
                                                                  bottom:
                                                                      AppSize
                                                                          .s12,
                                                                ),
                                                                child:
                                                                    TextCardClickableWidget(
                                                                  isCenterText:
                                                                      false,
                                                                  text: controller
                                                                      .onboardingPages[
                                                                          pageIndex]
                                                                      .internshipPeriodItems![
                                                                          i]
                                                                      .label,
                                                                  maxLine: controller
                                                                              .isUpdate
                                                                              .value ==
                                                                          true
                                                                      ? 3
                                                                      : 3,
                                                                  fontSize:
                                                                      AppSize
                                                                          .s24,
                                                                  itemList: controller
                                                                      .internshipPeriodSelectionListPage0
                                                                      .value
                                                                      .internshipPeriodItems,
                                                                  item: controller
                                                                      .onboardingPages[
                                                                          pageIndex]
                                                                      .internshipPeriodItems![i],
                                                                  onClick: () {
                                                                    controller
                                                                        .addOrRemoveDataInList(
                                                                      pageIndex:
                                                                          pageIndex,
                                                                      itemToBeAdd: controller
                                                                          .onboardingPages[
                                                                              pageIndex]
                                                                          .internshipPeriodItems![i],
                                                                      listTypeId:
                                                                          3,
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
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : pageData.pageIndex == 1
                                        ? GridView.builder(
                                            shrinkWrap: true,
                                            // physics:
                                            //     const NeverScrollableScrollPhysics(),
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: AppSize.s24,
                                              mainAxisSpacing: AppSize.s24,
                                              childAspectRatio: 3,
                                            ),
                                            // padding: const EdgeInsets.only(
                                            //   top: AppSize.s16,
                                            //   bottom: AppSize.s16,
                                            // ),
                                            itemCount: controller
                                                .onboardingPages[pageIndex]
                                                .selectionItems!
                                                .length,
                                            itemBuilder: (_, itemIndex) {
                                              final item = controller
                                                  .onboardingPages[pageIndex]
                                                  .selectionItems![itemIndex];
                                              return Obx(
                                                () => TextCardClickableWidget(
                                                  text: item.label,
                                                  maxLine: controller
                                                              .isUpdate.value ==
                                                          true
                                                      ? 3
                                                      : 3,
                                                  itemList: controller
                                                      .interestedInSelectionListPage1
                                                      .value
                                                      .selectionItems,
                                                  item: item,
                                                  onClick: () {
                                                    controller
                                                        .addOrRemoveDataInList(
                                                      pageIndex: pageIndex,
                                                      itemToBeAdd: item,
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                          )
                                        : pageData.pageIndex == 2
                                            ? SingleChildScrollView(
                                                child: Wrap(
                                                  children: controller
                                                      .goodAtfieldList!
                                                      .map(
                                                        (element) => Obx(
                                                          () => Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                              right: AppSize.s8,
                                                              bottom:
                                                                  AppSize.s12,
                                                            ),
                                                            child:
                                                                TextCardClickableWidget(
                                                              isCenterText:
                                                                  false,
                                                              text: element
                                                                      .label ??
                                                                  element
                                                                      .category
                                                                      .toString(),
                                                              maxLine: controller
                                                                          .isUpdate
                                                                          .value ==
                                                                      true
                                                                  ? 3
                                                                  : 3,
                                                              fontSize:
                                                                  AppSize.s24,
                                                              itemList: controller
                                                                  .goodAtListSelectionPage2
                                                                  .value
                                                                  .selectionItems,
                                                              item: element,
                                                              onClick: () {
                                                                controller
                                                                    .addOrRemoveDataInList(
                                                                  pageIndex:
                                                                      pageIndex,
                                                                  itemToBeAdd:
                                                                      element,
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                      .toSet()
                                                      .toList(),
                                                  // children: [
                                                  //   for (var i = 0;
                                                  //       i <
                                                  //           controller
                                                  //               .goodAtfieldList!
                                                  //               .length;
                                                  //       i++)
                                                  //     Obx(
                                                  //       () => Padding(
                                                  //         padding:
                                                  //             const EdgeInsets
                                                  //                 .only(
                                                  //           right: AppSize.s8,
                                                  //           bottom: AppSize.s12,
                                                  //         ),
                                                  //         child:
                                                  //             TextCardClickableWidget(
                                                  //           isCenterText: false,
                                                  //           text: controller
                                                  //                   .goodAtfieldList![
                                                  //                       i]
                                                  //                   .label ??
                                                  //               controller
                                                  //                   .goodAtfieldList![
                                                  //                       i]
                                                  //                   .category
                                                  //                   .toString(),
                                                  //           maxLine: controller
                                                  //                       .isUpdate
                                                  //                       .value ==
                                                  //                   true
                                                  //               ? 3
                                                  //               : 3,
                                                  //           fontSize:
                                                  //               AppSize.s24,
                                                  //           itemList: controller
                                                  //               .goodAtListSelectionPage2
                                                  //               .value
                                                  //               .selectionItems,
                                                  //           item: controller
                                                  //               .goodAtfieldList![i],
                                                  //           onClick: () {
                                                  //             controller
                                                  //                 .addOrRemoveDataInList(
                                                  //               pageIndex:
                                                  //                   pageIndex,
                                                  //               itemToBeAdd:
                                                  //                   controller
                                                  //                       .goodAtfieldList![i],
                                                  //             );
                                                  //           },
                                                  //         ),
                                                  //       ),
                                                  //     ),
                                                  // ],
                                                ),
                                              )
                                            : pageData.pageIndex == 3
                                                ? Wrap(
                                                    children: [
                                                      for (var i = 0;
                                                          i <
                                                              controller
                                                                  .onboardingPages[
                                                                      pageIndex]
                                                                  .selectionItems!
                                                                  .length;
                                                          i++)
                                                        Obx(
                                                          () => Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                              right: AppSize.s8,
                                                              bottom:
                                                                  AppSize.s12,
                                                            ),
                                                            child:
                                                                TextCardClickableWidget(
                                                              isCenterText:
                                                                  false,
                                                              text: controller
                                                                  .onboardingPages[
                                                                      pageIndex]
                                                                  .selectionItems![
                                                                      i]
                                                                  .label,
                                                              maxLine: controller
                                                                          .isUpdate
                                                                          .value ==
                                                                      true
                                                                  ? 3
                                                                  : 3,
                                                              fontSize:
                                                                  AppSize.s24,
                                                              itemList: controller
                                                                  .languageSelectionListPage3
                                                                  .value
                                                                  .selectionItems,
                                                              item: controller
                                                                  .onboardingPages[
                                                                      pageIndex]
                                                                  .selectionItems![i],
                                                              onClick: () {
                                                                controller
                                                                    .addOrRemoveDataInList(
                                                                  pageIndex:
                                                                      pageIndex,
                                                                  itemToBeAdd: controller
                                                                      .onboardingPages[
                                                                          pageIndex]
                                                                      .selectionItems![i],
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  )
                                                : pageData.pageIndex == 4
                                                    ? SingleChildScrollView(
                                                        child: Obx(
                                                          () => Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              ///===== Top of Address Component =====//
                                                              GestureDetector(
                                                                onTap:
                                                                    () async {
                                                                  // controller
                                                                  //     .uuidTokenGenerator();
                                                                  controller
                                                                          .results =
                                                                      await showSearch(
                                                                    context:
                                                                        context,
                                                                    delegate:
                                                                        OnBoardingAddressSearchBarWidget(
                                                                      sessionToken:
                                                                          UuidGenerator()
                                                                              .uuidV4(),
                                                                    ),
                                                                  );
                                                                },
                                                                child:
                                                                    AbsorbPointer(
                                                                  child:
                                                                      CustomTextInput(
                                                                    controller:
                                                                        controller
                                                                            .addressCtrl,
                                                                    inputTitle:
                                                                        "${'city'.tr} / ${'zipcode'.tr} *",
                                                                    // "${'profile.city'.tr} / ${'profile.zipCode'.tr} *",
                                                                    titleColor:
                                                                        ColorsManager
                                                                            .white,
                                                                    hintText: controller
                                                                            .placeDetail!
                                                                            .value
                                                                            .fullAddress ??
                                                                        'address'
                                                                            .tr,
                                                                    // 'profile.address'.tr,
                                                                    hintTextColor:
                                                                        ColorsManager
                                                                            .black,
                                                                    isFilled:
                                                                        true,
                                                                    isReadOnly:
                                                                        true,
                                                                    topContentPadding:
                                                                        12.0,
                                                                    bottomContentPadding:
                                                                        12.0,
                                                                    topPadding:
                                                                        AppSize
                                                                            .s12,
                                                                    // counter: true,
                                                                    maxLines: 5,
                                                                    maxLength:
                                                                        150,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .multiline,
                                                                  ),
                                                                ),
                                                              ),
                                                              //===== Bottom of Address Component =====//

                                                              ///===== Top of Radius Component =====//
                                                              CustomTextWidget(
                                                                text:
                                                                    "${'radius'.tr}: ${controller.radiusRxInt.value} Km",
                                                                color:
                                                                    ColorsManager
                                                                        .white,
                                                                marginTop:
                                                                    AppSize.s32,
                                                              ),
                                                              Slider(
                                                                value: controller
                                                                    .radiusRxInt
                                                                    .value
                                                                    .toDouble(),
                                                                min: 10.0,
                                                                max: 200.0,
                                                                divisions: 200,
                                                                activeColor:
                                                                    ColorsManager
                                                                        .primary,
                                                                inactiveColor:
                                                                    ColorsManager
                                                                        .grey300,
                                                                thumbColor:
                                                                    ColorsManager
                                                                        .primary,
                                                                label:
                                                                    '${controller.radiusRxInt.value}',
                                                                onChanged: (
                                                                  double
                                                                      newValue,
                                                                ) {
                                                                  controller
                                                                          .radiusRxInt
                                                                          .value =
                                                                      newValue
                                                                          .toInt();
                                                                },
                                                              ),
                                                              //===== Bottom of Radius Component =====//
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    : pageData.pageIndex == 5
                                                        ? SingleChildScrollView(
                                                            child: Wrap(
                                                              children: controller
                                                                  .onboardingPages[
                                                                      pageIndex]
                                                                  .selectionItems!
                                                                  .map(
                                                                    (element) =>
                                                                        Obx(
                                                                      () =>
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(
                                                                          right:
                                                                              AppSize.s8,
                                                                          bottom:
                                                                              AppSize.s12,
                                                                        ),
                                                                        child:
                                                                            TextCardClickableWidget(
                                                                          isCenterText:
                                                                              false,
                                                                          text: element
                                                                              .label
                                                                              .toString(),
                                                                          maxLine: controller.isUpdate.value == true
                                                                              ? 3
                                                                              : 3,
                                                                          fontSize:
                                                                              AppSize.s24,
                                                                          itemList:
                                                                              controller.knowFromFieldSelected,
                                                                          item:
                                                                              element,
                                                                          onClick:
                                                                              () {
                                                                            controller.addOrRemoveDataInList(
                                                                              pageIndex: pageIndex,
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
                                                          )
                                                        // SingleChildScrollView(
                                                        //     child: Wrap(
                                                        //       children: controller
                                                        //           .belgiumCitiesToField
                                                        //           .map(
                                                        //             (element) =>
                                                        //                 Obx(
                                                        //               () => Padding(
                                                        //                 padding:
                                                        //                     const EdgeInsets
                                                        //                         .only(
                                                        //                   right:
                                                        //                       AppSize
                                                        //                           .s8,
                                                        //                   bottom:
                                                        //                       AppSize
                                                        //                           .s12,
                                                        //                 ),
                                                        //                 child:
                                                        //                     TextCardClickableWidget(
                                                        //                   isCenterText:
                                                        //                       false,
                                                        //                   text: element
                                                        //                       .label
                                                        //                       .toString(),
                                                        //                   maxLine: controller.isUpdate.value ==
                                                        //                           true
                                                        //                       ? 3
                                                        //                       : 3,
                                                        //                   fontSize:
                                                        //                       AppSize
                                                        //                           .s24,
                                                        //                   itemList:
                                                        //                       controller
                                                        //                           .belgiumCitiesToFieldSelected,
                                                        //                   item:
                                                        //                       element,
                                                        //                   onClick:
                                                        //                       () {
                                                        //                     controller
                                                        //                         .addOrRemoveDataInList(
                                                        //                       pageIndex:
                                                        //                           pageIndex,
                                                        //                       itemToBeAdd:
                                                        //                           element,
                                                        //                     );
                                                        //                   },
                                                        //                 ),
                                                        //               ),
                                                        //             ),
                                                        //           )
                                                        //           .toSet()
                                                        //           .toList(),
                                                        //     ),
                                                        //   )
                                                        : const CustomTextWidget(
                                                            text: ' ',
                                                            color: ColorsManager
                                                                .amber,
                                                          ),
                              ),
                            )
                          ],
                        );
                      },
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
                          child: !controller.isFirstPage
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
                          child: CustomIndicator(
                            length: controller.onboardingPages.length,
                            location: controller.selectedPageIndex.value,
                          ),
                        ),
                        Expanded(
                          flex: 25,
                          child: TextButton(
                            onPressed: controller.movingAction,
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                ColorsManager.primary,
                              ),
                              // alignment: Alignment.centerRight,
                              // padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                              //   const EdgeInsets.only(left: AppSize.s24),
                              // ),
                            ),
                            child: CustomTextWidget(
                              text: controller.isLastPage
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
