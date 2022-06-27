import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/core.dart';

class ForgotPasswordInfoComponent extends StatelessWidget {
  final String? email;
  final VoidCallback? switchingForm;

  const ForgotPasswordInfoComponent({
    Key? key,
    this.email = '',
    this.switchingForm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomTextWidget(
          text: 'auth.emailSent'.tr,
          fontSize: 24.0,
          fontWeight: FontWeight.w700,
          color: ColorsManager.primary,
          marginBottom: AppSize.s24,
        ),
        CustomTextWidget(
          text: 'auth.sentToEmail'.trParams({'email': '$email'}),
          maxLine: 5,
          color: ColorsManager.black,
          fontWeight: FontWeight.w300,
          fontSize: 16,
          // marginTop: AppSize.s16,
          marginBottom: AppSize.s16,
        ),
        CustomTextWidget(
          text: 'auth.resetPasswordGuide'.tr,
          maxLine: 5,
          color: ColorsManager.black,
          fontWeight: FontWeight.w300,
          fontSize: 16,
          // marginTop: AppSize.s16,
          marginBottom: AppSize.s16,
        ),
        CustomTextWidget(
          text: 'auth.ForgotPasswordTryAgain'.tr,
          maxLine: 5,
          color: ColorsManager.black,
          fontWeight: FontWeight.w300,
          fontSize: 16,
          // marginTop: AppSize.s16,
          marginBottom: AppSize.s16,
        ),
        CustomMaterialButton(
          text: 'auth.tryAgain'.tr,
          fontSize: 20.0,
          buttonWidth: getWidth,
          onPressed: switchingForm,
        ),
      ],
    );
  }
}
