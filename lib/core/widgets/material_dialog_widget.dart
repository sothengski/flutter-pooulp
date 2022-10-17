import 'package:flutter/material.dart';

import '../core.dart';

class MaterialDialogWidget extends StatelessWidget {
  final String? title;
  final double? titleFontSize;
  final double? titleHorizontalMargin;
  final double? titleVerticalMargin;
  final Widget? rightWidget;
  final double? dialogMargin;
  final Widget? contentWidget;
  final Widget? actionWidget;

  const MaterialDialogWidget({
    Key? key,
    this.title = '',
    this.titleFontSize = 16.0,
    this.titleHorizontalMargin = 16.0,
    this.titleVerticalMargin = 16.0,
    this.rightWidget,
    this.dialogMargin = 40,
    this.contentWidget,
    this.actionWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        // color: labelTextColor.withOpacity(0.7),
        alignment: Alignment.center,
        child: Container(
          margin: EdgeInsets.all(dialogMargin!),
          // padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            // padding: const EdgeInsets.only(bottom: AppSize.s32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (title == '')
                  Container()
                else
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppSize.s12),
                    child: Row(
                      mainAxisAlignment: rightWidget == null
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextWidget(
                          marginTop: titleHorizontalMargin,
                          marginBottom: titleHorizontalMargin,
                          text: title,
                          fontSize: titleFontSize,
                          fontWeight: FontWeightManager.medium,
                        ),
                        rightWidget ?? Container()
                      ],
                    ),
                  ),
                const Divider(
                  height: 1.0,
                  color: ColorsManager.grey,
                ),

                ///===== Top of Body/Content Component =====//
                Container(
                  // height: getHeight * 0.25,
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(
                    AppSize.s8,
                  ),
                  child: contentWidget,
                ),
                //===== Bottom Body/Content Component =====//

                ///===== Top of Actions Component =====//
                if (actionWidget == null)
                  Container()
                else
                  const Divider(
                    height: 1.0,
                    color: ColorsManager.grey,
                  ),
                Container(
                  // height: getHeight * 0.25,
                  alignment: Alignment.topCenter,
                  // padding: const EdgeInsets.all(
                  //   AppSize.s8,
                  // ),
                  child: actionWidget,
                ),
                //===== Bottom Actions Component =====//
              ],
            ),
          ),
        ),
      ),
    );
  }
}
