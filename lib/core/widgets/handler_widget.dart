import 'package:flutter/material.dart';

import '../core.dart';

class StateHandlerWidget extends StatelessWidget {
  final String? imgPath;
  final String? headerText;
  final String? bodyText;
  final String? buttonText;
  final int? stateId;
  final VoidCallback? onPressedFunctionCall;

  const StateHandlerWidget({
    super.key,
    this.imgPath,
    this.headerText,
    this.bodyText,
    this.buttonText,
    this.stateId,
    this.onPressedFunctionCall,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image(
            height: getWidth * .55,
            width: getWidth * .55,
            image: AssetImage(imgPath!),
            fit: BoxFit.fill,
          ),
          CustomTextWidget(
            text: headerText,
            fontSize: 24.0,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.center,
            maxLine: 3,
          ),
          // const SizedBox(height: 10),
          CustomTextWidget(
            text: bodyText,
            textAlign: TextAlign.center,
            maxLine: 5,
          ),
          const SizedBox(height: 10),
          if (buttonText != null)
            CustomMaterialButton(
              horizonalPadding: AppSize.s8,
              text: buttonText,
              fontSize: 20.0,
              // primaryColor: primaryColor,
              onPressed: onPressedFunctionCall,
              bottomPadding: 30.0,
            )
          else
            Container(),
          // const SizedBox(height: 75),
        ],
      ),
    );
  }
}
