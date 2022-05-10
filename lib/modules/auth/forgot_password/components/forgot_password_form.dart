import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/core.dart';
import '../../../modules.dart';

class ForgotPasswordForm extends GetView<ForgotPasswordController> {
  const ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.forgotPasswordFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextWidget(
            text: 'auth.forgotPassword'.tr,
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
            color: ColorsManager.primary,
            marginBottom: AppSize.s24,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: CustomTextWidget(
              text: 'auth.forgotPasswordNoted'.tr,
              maxLine: 5,
              color: ColorsManager.black,
              fontWeight: FontWeight.w300,
              fontSize: 16,
              // marginTop: AppSize.s16,
              marginBottom: AppSize.s16,
            ),
          ),
          CustomTextInput(
            controller: controller.emailCtrl,
            inputTitle: 'auth.email'.tr,
            hintText: 'auth.emailHint'.tr,
            isFilled: true,
            topPadding: AppSize.s12,
            validator: Validator().emailValidator,
            keyboardType: TextInputType.emailAddress,
            bottomPadding: AppSize.s20,
          ),
          Visibility(
            child: CustomMaterialButton(
              text: 'auth.sendEmail'.tr,
              fontSize: 20.0,
              buttonWidth: getWidth,
              childWidget: controller.isSubmitBtnProcessing.value == true
                  ? const SizedBox(
                      height: 40,
                      child: LoadingWidget(
                        isTreeBounceLoading: true,
                        color: ColorsManager.white,
                      ),
                    )
                  : null,
              onPressed: () {
                unFocusKeyBoard(context);
                if (!controller.isSubmitBtnProcessing.value == true) {
                  controller.sendEmailButtonOnClick();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
