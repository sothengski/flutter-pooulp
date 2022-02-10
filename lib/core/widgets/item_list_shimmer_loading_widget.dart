import 'package:flutter/material.dart';

import '../core.dart';

class ItemListShimmerLoadingWidget extends StatelessWidget {
  const ItemListShimmerLoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 7,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: AppSize.s8,
                  vertical: AppSize.s10,
                ),
                child: ShimmerWidget.rectangular(
                  width: 120,
                  height: 1,
                  shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSize.s16),
                  ),
                ),
              );
            },
          ),
        ),
        Expanded(
          flex: 90,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(
                  bottom: AppSize.s12,
                  left: AppSize.s12,
                  right: AppSize.s12,
                ),
                child: ShimmerWidget.rectangular(
                  height: 150,
                  shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSize.s12),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
