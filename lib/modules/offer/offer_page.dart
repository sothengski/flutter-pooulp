import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import '../modules.dart';

class OfferPage extends GetView<OfferController> {
  const OfferPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'My Offers',
        // bottomPreferredSizeWidget: TabBar(
        //   controller: controller.tabController,
        //   tabs: controller.myTabs,
        // ),
      ),
      // appBar: AppBar(
      //   bottom: TabBar(
      //     controller: controller.tabController,
      //     tabs: controller.myTabs,
      //   ),
      // ),
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: JobOfferStateListComponent(),
          ),
          Expanded(
            flex: 91,
            child: RefreshIndicator(
              color: ColorsManager.primary,
              onRefresh: () => controller.onRefresh(),
              child: controller.obx(
                (state) => Obx(
                  () => controller.pendingOfferListRepsonse.isNotEmpty
                      ?
                      // ListView(
                      //     controller: controller.scrollController,
                      //     children: [
                      //       Container(
                      //         // padding: const EdgeInsets.only(
                      //         //   top: AppSize.s8,
                      //         //   bottom: AppSize.s8,
                      //         // ),
                      //         decoration: BoxDecoration(
                      //           // color: ColorsManager.blue,
                      //           borderRadius: BorderRadius.circular(10),
                      //         ),
                      //         child: TabBar(
                      //           controller: controller.tabController,
                      //           // tabs: controller.myTabs,
                      //           labelColor: ColorsManager.primary,
                      //           // indicator: const UnderlineTabIndicator(
                      //           //   borderSide: BorderSide(
                      //           //     color: ColorsManager.primary,
                      //           //     width: 2.0,
                      //           //   ),
                      //           // ),
                      //           isScrollable: true,
                      //           unselectedLabelColor: ColorsManager.grey,
                      //           tabs: [
                      //             // first tab [you can add an icon using the icon property]
                      //             Tab(
                      //               // text: 'Pending',
                      //               child: SizedBox(
                      //                 width: getWidth * 0.25,
                      //                 child: const CustomBoxWidget(
                      //                   backgroundColor: ColorsManager.primary25,
                      //                   borderRadius: AppSize.s16,
                      //                   topPadding: AppSize.s16,
                      //                   insideObj: CustomTextWidget(
                      //                     text: 'Pending',
                      //                     textAlign: TextAlign.center,
                      //                     fontWeight: FontWeight.w500,
                      //                     color: null,
                      //                     marginLeft: AppSize.s8,
                      //                     marginRight: AppSize.s8,
                      //                   ),
                      //                 ),
                      //               ),
                      //             ),
                      //             Tab(
                      //               child: SizedBox(
                      //                 width: getWidth * 0.25,
                      //                 child: const CustomBoxWidget(
                      //                   backgroundColor: ColorsManager.primary25,
                      //                   borderRadius: AppSize.s16,
                      //                   // objPadding: AppSize.s8,
                      //                   insideObj: CustomTextWidget(
                      //                     text: 'Matched',
                      //                     textAlign: TextAlign.center,
                      //                     fontWeight: FontWeight.w500,
                      //                     color: null,
                      //                     marginLeft: AppSize.s8,
                      //                     marginRight: AppSize.s8,
                      //                   ),
                      //                 ),
                      //               ),
                      //             ),
                      //             Tab(
                      //               child: SizedBox(
                      //                 width: getWidth * 0.25,
                      //                 child: const CustomBoxWidget(
                      //                   backgroundColor: ColorsManager.primary25,
                      //                   borderRadius: AppSize.s16,
                      //                   // objPadding: AppSize.s8,
                      //                   insideObj: CustomTextWidget(
                      //                     text: 'Saved',
                      //                     textAlign: TextAlign.center,
                      //                     fontWeight: FontWeight.w500,
                      //                     color: null,
                      //                     marginLeft: AppSize.s8,
                      //                     marginRight: AppSize.s8,
                      //                   ),
                      //                 ),
                      //               ),
                      //             ),
                      //             Tab(
                      //               child: SizedBox(
                      //                 width: getWidth * 0.25,
                      //                 child: const CustomBoxWidget(
                      //                   backgroundColor: ColorsManager.primary25,
                      //                   borderRadius: AppSize.s16,
                      //                   // objPadding: AppSize.s8,
                      //                   insideObj: CustomTextWidget(
                      //                     text: 'Rejected',
                      //                     textAlign: TextAlign.center,
                      //                     fontWeight: FontWeight.w500,
                      //                     color: null,
                      //                     marginLeft: AppSize.s8,
                      //                     marginRight: AppSize.s8,
                      //                   ),
                      //                 ),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //       [
                      //         Column(
                      //           children: const [
                      //             CustomTextWidget(text: 'data Pending')
                      //           ],
                      //         ),
                      //         Column(
                      //           children: const [
                      //             CustomTextWidget(text: 'data Matched')
                      //           ],
                      //         ),
                      //         Column(
                      //           children: const [
                      //             CustomTextWidget(text: 'data Saved')
                      //           ],
                      //         ),
                      //         Column(
                      //           children: const [
                      //             CustomTextWidget(text: 'data Rejected')
                      //           ],
                      //         )
                      //       ][controller.tabController!.index]
                      //       // TabBarView(
                      //       //   controller: controller.tabController,
                      //       //   children: controller.myTabs.map((Tab tab) {
                      //       //     final String label = tab.text!.toLowerCase();
                      //       //     return Center(
                      //       //       child: Text(
                      //       //         'This is the $label tab',
                      //       //         style: const TextStyle(fontSize: 36),
                      //       //       ),
                      //       //     );
                      //       //   }).toList(),
                      //       // )
                      //     ],
                      //   )
                      // OfferListComponent()
                      OfferListComponent()
                      : const Center(
                          child: StateHandlerWidget(
                            imgPath: AssetsManager.emptyDataIcon,
                            headerText: 'No feed results found.',
                            bodyText:
                                "Make sure you complete your profile information.",
                            buttonText: 'Try again',
                            // onPressedFunctionCall: controller.onRefresh,
                          ),
                        ),
                ),
                onLoading: const Center(
                  child: ItemListShimmerLoadingWidget(),
                ),
                onError: (error) => const Center(
                  child: StateHandlerWidget(
                    imgPath: AssetsManager.emptyDataIcon,
                    headerText: 'Sorry! Something went wrong',
                    bodyText:
                        "Make sure that Wi-Fi or mobile data is turned on and try again..",
                    buttonText: 'Try again',
                    // onPressedFunctionCall: controller.onRefresh,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
