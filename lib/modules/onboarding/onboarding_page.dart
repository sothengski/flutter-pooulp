import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import '../modules.dart';

class OnboardingPage extends GetView<OnboardingController> {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primaryBlue,
      body: SafeArea(
        child: Container(
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
              final OnboardingInfoModel pageData =
                  controller.onboardingPages[pageIndex];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 10,
                    child: CustomTextWidget(
                      text: pageData.textTitle,
                      fontSize: AppSize.s28,
                      fontWeight: FontWeight.w800,
                      maxLine: 3,
                      color: ColorsManager.white,
                      textAlign: TextAlign.center,
                      marginLeft: AppSize.s8,
                      marginRight: AppSize.s8,
                    ),
                  ),
                  Expanded(
                    flex: 90,
                    child: Container(
                      padding: const EdgeInsets.only(top: AppSize.s60),
                      child: pageData.id == 0
                          ? ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller
                                  .onboardingPages[pageIndex].fieldList!.length,
                              itemBuilder: (_, itemIndex) {
                                final item = controller
                                    .onboardingPages[pageIndex]
                                    .fieldList![itemIndex];
                                return Obx(
                                  () => TextCardClickableWidget(
                                    size: 50.0,
                                    bottomMargin: AppSize.s40,
                                    text: item.label,
                                    maxLine: controller.isUpdate.value == true
                                        ? 3
                                        : 3,
                                    fontSize: AppSize.s24,
                                    itemList: controller
                                        .onboardingDataToBeAdded[pageIndex]
                                        .fieldList,
                                    item: item,
                                    onClick: () {
                                      controller.addOrRemoveDataInList(
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
                            )
                          : pageData.id == 1
                              ? GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
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
                                      .fieldList!
                                      .length,
                                  itemBuilder: (_, itemIndex) {
                                    final item = controller
                                        .onboardingPages[pageIndex]
                                        .fieldList![itemIndex];
                                    return Obx(
                                      () => TextCardClickableWidget(
                                        text: item.label,
                                        maxLine:
                                            controller.isUpdate.value == true
                                                ? 3
                                                : 3,
                                        itemList: controller
                                            .onboardingDataToBeAdded[pageIndex]
                                            .fieldList,
                                        item: item,
                                        onClick: () {
                                          controller.addOrRemoveDataInList(
                                            pageIndex: pageIndex,
                                            itemToBeAdd: item,
                                          );
                                        },
                                      ),
                                    );
                                  },
                                )
                              : Wrap(
                                  children: [
                                    for (var i = 0;
                                        i <
                                            controller
                                                .onboardingPages[pageIndex]
                                                .fieldList!
                                                .length;
                                        i++)
                                      Obx(
                                        () => Padding(
                                          padding: const EdgeInsets.only(
                                            right: AppSize.s8,
                                            bottom: AppSize.s12,
                                          ),
                                          child: TextCardClickableWidget(
                                            isCenterText: false,
                                            text: controller
                                                .onboardingPages[pageIndex]
                                                .fieldList![i]
                                                .label,
                                            maxLine:
                                                controller.isUpdate.value ==
                                                        true
                                                    ? 3
                                                    : 3,
                                            fontSize: AppSize.s24,
                                            itemList: controller
                                                .onboardingDataToBeAdded[
                                                    pageIndex]
                                                .fieldList,
                                            item: controller
                                                .onboardingPages[pageIndex]
                                                .fieldList![i],
                                            onClick: () {
                                              controller.addOrRemoveDataInList(
                                                pageIndex: pageIndex,
                                                itemToBeAdd: controller
                                                    .onboardingPages[pageIndex]
                                                    .fieldList![i],
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: Obx(
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
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.only(left: AppSize.s24),
                          ),
                        ),
                        child: const CustomTextWidget(
                          text: 'Back',
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
                    text: controller.isLastPage ? 'Start' : 'Next',
                    color: ColorsManager.white,
                    fontSize: AppSize.s16,
                    fontWeight: FontWeight.bold,
                    // textAlign: TextAlign.right,
                  ),
                ),
                // Row(
                //   children: [
                //     if (controller.isLastPage)
                //       TextButton(
                //         onPressed: () => {}, //Get.toNamed(Routes.signUpRoute),
                //         child: const CustomTextWidget(
                //           text: "Sign Up",
                //           color: ColorsManager.amber,
                //           fontSize: AppSize.s16,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //     TextButton(
                //       onPressed: controller.forwardAction,
                //       child: CustomTextWidget(
                //         text: controller.isLastPage ? 'Start' : 'Next',
                //         color: ColorsManager.primary,
                //         fontSize: AppSize.s16,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ],
                // ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
