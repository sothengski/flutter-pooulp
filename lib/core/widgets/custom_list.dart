import 'package:flutter/material.dart';

import '../core.dart';

class CustomList extends StatelessWidget {
  final String? title;
  final List<String>? subtitleList;
  final double? leftPadding;
  final double? rightPadding;
  final double? topPadding;
  final double? bottomPadding;

  const CustomList({
    this.title = '',
    this.subtitleList,
    this.leftPadding = 24.0,
    this.rightPadding = 8.0,
    this.topPadding = 0.0,
    this.bottomPadding = 8.0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        leftPadding!,
        topPadding!,
        rightPadding!,
        bottomPadding!,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title == '')
            Container()
          else
            CustomTextWidget(
              text: title,
              marginBottom: 5.0,
              fontWeight: FontWeight.w600,
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: subtitleList!
                .map(
                  (item) => CustomTextWidget(
                    text: '• $item',
                    marginBottom: 5.0,
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
