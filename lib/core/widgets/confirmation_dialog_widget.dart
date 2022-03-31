import 'package:flutter/material.dart';

import '../core.dart';

class ConfirmationDialogWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? dialogTitle;
  final String? dialogBody;
  final Widget? contentWidget;

  const ConfirmationDialogWidget({
    Key? key,
    this.dialogTitle = AppStrings.confirmationText,
    this.dialogBody = "Would you like to remove this information?",
    this.contentWidget,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialDialogWidget(
      title: dialogTitle,
      titleHorizontalMargin: AppSize.s12,
      contentWidget: contentWidget ??
          Center(
            child: CustomTextWidget(
              marginTop: AppSize.s12,
              marginBottom: AppSize.s12,
              text: dialogBody,
            ),
          ),
      actionWidget: Row(
        children: [
          Expanded(
            flex: 40,
            child: OutlinedButton.icon(
              onPressed: () {
                Navigator.pop(
                  context,
                  true,
                );
              },
              icon: const Icon(
                IconsManager.close,
                color: Colors.white,
              ),
              label: const CustomTextWidget(
                marginRight: AppSize.s24,
                text: AppStrings.noText,
                color: Colors.blue,
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
          Expanded(
            flex: 40,
            child: OutlinedButton.icon(
              onPressed: onPressed,
              icon: const Icon(
                IconsManager.check,
                color: Colors.white,
              ),
              label: const CustomTextWidget(
                marginRight: AppSize.s24,
                text: AppStrings.yesText,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
