import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core.dart';

class ConfirmationDialogWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? dialogTitle;
  final String? dialogBody;
  final Widget? contentWidget;
  final Widget? actionWidget;

  const ConfirmationDialogWidget({
    super.key,
    this.dialogTitle, // = AppStrings.confirmationText,
    this.dialogBody, // = "Would you like to remove this information?",
    this.contentWidget,
    this.actionWidget,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialDialogWidget(
      title: dialogTitle ?? 'confirmation'.tr,
      titleHorizontalMargin: AppSize.s12,
      contentWidget:
          contentWidget ??
          Center(
            child: CustomTextWidget(
              marginTop: AppSize.s12,
              marginBottom: AppSize.s12,
              text: dialogBody ?? 'removeConfirm'.tr,
              maxLine: 5,
            ),
          ),
      actionWidget:
          actionWidget ??
          Row(
            children: [
              Expanded(
                flex: 40,
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  icon: const Icon(IconsManager.close, color: Colors.white),
                  label: CustomTextWidget(
                    marginRight: AppSize.s24,
                    text: 'no'.tr,
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
                  icon: const Icon(IconsManager.check, color: Colors.white),
                  label: CustomTextWidget(
                    marginRight: AppSize.s24,
                    text: 'yes'.tr,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
    );
  }
}
