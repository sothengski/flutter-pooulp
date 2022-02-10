import 'package:flutter/material.dart';
import '../../core/core.dart';
import '../../data/data.dart';

class FeedItemDetailPage extends StatelessWidget {
  final JobOfferModel? feedItemDetail;
  const FeedItemDetailPage({
    this.feedItemDetail,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primary,
      appBar: CustomAppBar(
        title: 'Offer Details',
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: AppSize.s16,
              right: AppSize.s16,
            ),
            child: CustomContainerWidget(
              elevation: 0.0,
              // childPadding: 10.0,
              titleInSide: false,
              child: Column(
                children: [
                  CustomTextWidget(
                    marginTop: AppSize.s10,
                    marginBottom: AppSize.s10,
                    text: '${feedItemDetail!.title}',
                    fontSize: AppSize.s20,
                    fontWeight: FontWeightManager.bold,
                    color: ColorsManager.primary,
                    maxLine: 4,
                  ),
                  const Divider(
                    height: AppSize.s5,
                    thickness: 1,
                  ),
                  CustomListTileWidget(
                    isDivider: false,
                    leftRightPadding: AppSize.s8,
                    text1: '${feedItemDetail!.enterprise!.name}',
                    text1Color: ColorsManager.primary,
                    text2:
                        '${feedItemDetail!.companyLocation} (${feedItemDetail!.workPlaceType})',
                    // text2Color: ColorsManager.grey600,
                    leftWidget: CustomBoxWidget(
                      insideObj: CachedNetworkImgWidget(
                        imgUrl: '${feedItemDetail!.enterprise!.logoUrl}',
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomTextWidget(
                      // marginTop: AppSize.s5,
                      marginBottom: AppSize.s5,
                      marginLeft: AppSize.s16,
                      text:
                          'Posted on ${feedItemDetail!.dateActiveJobStartFormat}',
                      fontWeight: FontWeight.w100,
                      color: ColorsManager.primary75,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
