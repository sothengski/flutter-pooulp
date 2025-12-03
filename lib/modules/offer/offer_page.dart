import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import '../../data/data.dart';
import '../modules.dart';

class OfferPage extends GetView<OfferController> {
  const OfferPage({super.key});

  void notificationMessageAlert(BuildContext context) {
    Get.dialog(
      MaterialDialogWidget(
        // title: controller.notificationMessageList[0].title,
        titleHorizontalMargin: AppSize.s12,
        dialogMargin: AppSize.s28,
        actionWidget: Row(
          children: [
            Expanded(
              flex: 40,
              child: OutlinedButton.icon(
                onPressed: () {
                  controller.postSeenNotificationMessagesProvider(
                    notificationMsgId: controller.notificationMessageList[0].id,
                  );
                  controller.getNotificationMessagesProvider();
                  Navigator.pop(context, true);
                },
                icon: const Icon(IconsManager.close, color: Colors.white),
                label: CustomTextWidget(
                  marginRight: AppSize.s24,
                  text: 'Close'.tr,
                  color: Colors.red,
                ),
              ),
            ),
            const SizedBox(
              height: AppSize.s28,
              child: VerticalDivider(
                color: ColorsManager.grey,
                thickness: 0.5,
                width: 0.5,
              ),
            ),
            // Expanded(
            //   flex: 40,
            //   child: OutlinedButton.icon(
            //     onPressed: onPressed,
            //     icon: const Icon(
            //       IconsManager.check,
            //       color: Colors.white,
            //     ),
            //     label: CustomTextWidget(
            //       marginRight: AppSize.s24,
            //       text: 'yes'.tr,
            //       color: Colors.red,
            //     ),
            //   ),
            // ),
          ],
        ),
        // rightWidget: CustomIconButtonWidget(
        //   iconData: Icons.close,
        //   padding: 0.0,
        //   isConstraints: true,
        //   onClick: () => {
        //     Get.back(),
        //   },
        // ),
        contentWidget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextWidget(
              text: '${controller.notificationMessageList[0].title}',
              fontSize: AppSize.s16,
              fontWeight: FontWeight.w600,
              color: ColorsManager.black,
              maxLine: 50,
              marginTop: AppSize.s4,
              marginLeft: AppSize.s16,
              marginRight: AppSize.s16,
              marginBottom: AppSize.s12,
            ),
            // if ('profileModel!.description' == '')
            //   Container()
            // else
            CustomTextWidget(
              text: '${controller.notificationMessageList[0].body}',
              color: ColorsManager.grey850,
              maxLine: 50,
              marginTop: AppSize.s4,
              marginLeft: AppSize.s16,
              marginRight: AppSize.s16,
              marginBottom: AppSize.s4,
            ),
            // CustomListTileWidget(
            //   text1: 'email'.tr,
            //   text2: 'userModel!.email',
            //   // isLauching: true,
            //   text2Color: ColorsManager.blue,
            //   leftWidget: const CustomBoxWidget(
            //     child: Icon(
            //       Icons.email_outlined,
            //       color: ColorsManager.grey,
            //       size: AppSize.s20,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
      barrierDismissible: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      DurationConstant.d2000,
      () =>
          (controller.notificationMessageList.isNotEmpty &&
              controller.notificationMessageList[0].status == 1)
          ? () => notificationMessageAlert(context)
          : null,
    );

    return Scaffold(
      appBar: CustomAppBar(title: 'myOffers'.tr),
      body: Column(
        children: [
          // pop dialog
          // GetX<OfferController>(
          //   init: OfferController(),
          //   builder: (_) {
          //     return _.popDialog != null
          //         ? Dialog(
          //             child: _.popDialog,
          //             shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(10),
          //             ),
          //           )
          //         : Container();
          //   },
          // ),
          Expanded(
            flex: 9,
            child: Obx(
              () => OfferStateListComponent(
                jobOfferStateList: controller.jobOfferStateFilterList,
                offerController: controller,
              ),
            ),
          ),
          Expanded(
            flex: 91,
            child: Obx(
              () =>
                  controller.isJobOfferStateList(
                    inputValue: OfferStrings.pendingState,
                  )
                  ? OfferListStateComponent(
                      controller: controller,
                      offerList: controller.pendingOfferListRepsonse,
                      jobOfferType: OfferStrings.pendingState,
                      noDataHeader: 'noResult'.tr,
                    )
                  : controller.isJobOfferStateList(
                      inputValue: OfferStrings.matchedState,
                    )
                  ? OfferListStateComponent(
                      controller: controller,
                      offerList: controller.matchedOfferListRepsonse,
                      jobOfferType: OfferStrings.matchedState,
                      noDataHeader: 'noResult'.tr,
                    )
                  : controller.isJobOfferStateList(
                      inputValue: OfferStrings.savedState,
                    )
                  ? OfferListStateComponent(
                      controller: controller,
                      offerList: controller.savedOfferListFilter,
                      jobOfferType: OfferStrings.savedState,
                      noDataHeader: 'noResult'.tr,
                    )
                  : OfferListStateComponent(
                      controller: controller,
                      offerList: controller.rejectedOfferListRepsonse,
                      jobOfferType: OfferStrings.rejectedState,
                      noDataHeader: 'noResult'.tr,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class OfferListStateComponent extends StatelessWidget {
  final OfferController controller;
  final List<JobOfferModel>? offerList;
  final String? jobOfferType;
  final String? noDataHeader;
  final String? noDataBody;
  final String? errorHeader;
  final String? errorBody;

  const OfferListStateComponent({
    super.key,
    required this.controller,
    this.offerList,
    this.jobOfferType,
    this.noDataHeader = 'No feed results found.',
    this.noDataBody = '',
    this.errorHeader,
    this.errorBody,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: ColorsManager.primary,
      onRefresh: () => controller.onRefresh(),
      child: controller.obx(
        (state) => Obx(
          () => offerList!.isNotEmpty
              ? OfferListComponent(
                  offerList: offerList,
                  offerController: controller,
                  jobOfferType: jobOfferType,
                )
              : Center(
                  child: controller.isLoadingIndicator.value == true
                      ? const ItemListShimmerLoadingWidget(isTopRowList: false)
                      : StateHandlerWidget(
                          imgPath: AssetsManager.emptyDataIcon,
                          headerText: noDataHeader,
                          bodyText: noDataBody, //?? 'offer.contentMsg'.tr,
                          buttonText: 'tryAgain'.tr,
                          onPressedFunctionCall: controller.onRefresh,
                        ),
                ),
        ),
        onLoading: const Center(
          child: ItemListShimmerLoadingWidget(isTopRowList: false),
        ),
        onError: (error) => Center(
          child: StateHandlerWidget(
            imgPath: AssetsManager.emptyDataIcon,
            headerText: errorHeader ?? 'sthWentWrong'.tr,
            bodyText: errorBody ?? 'connectionFailedMsg'.tr,
            buttonText: 'tryAgain'.tr,
            onPressedFunctionCall: controller.onRefresh,
          ),
        ),
      ),
    );
  }
}
