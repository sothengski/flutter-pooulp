import 'package:flutter/material.dart';

import '../core.dart';

class MaterialDialogWidget extends StatelessWidget {
  final String? title;
  final Widget? contentWidget;

  const MaterialDialogWidget({
    Key? key,
    this.title = '',
    this.contentWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        // color: labelTextColor.withOpacity(0.7),
        alignment: Alignment.center,
        child: Container(
          margin: const EdgeInsets.all(40),
          // padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (title == '')
                Container()
              else
                CustomTextWidget(
                  marginTop: 16.0,
                  marginBottom: 16.0,
                  text: title,
                  fontSize: 20.0,
                  fontWeight: FontWeightManager.medium,
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
            ],
          ),
        ),
      ),
    );
  }
}
