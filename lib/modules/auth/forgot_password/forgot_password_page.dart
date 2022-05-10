import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../modules.dart';

class ForgotPasswordPage extends GetView<ForgotPasswordController> {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primaryBlue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () => unFocusKeyBoard(context),
        child: Container(
          alignment: Alignment.topCenter,
          height: getHeight,
          width: getWidth,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(
                    left: AppSize.s72,
                    right: AppSize.s72,
                    bottom: AppSize.s12,
                  ),
                  child: Image(
                    // height: 80,
                    image: AssetImage(AssetsManager.appLogoRose),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(AppSize.s16),
                  child: CustomContainerWidget(
                    isBoxShadow: false,
                    elevation: 0.0,
                    childPadding: 20.0,
                    titleInSide: false,
                    child: Obx(
                      () => controller.isForgotPwdForm.value == true
                          ? const ForgotPasswordForm()
                          : ForgotPasswordInfoComponent(
                              email: controller.emailCtrl.text,
                              switchingForm: controller.switchBoolValue,
                            ),
                    ),
                  ),
                ),
                CustomTextWidget(
                  text: 'auth.acountExist'.tr,
                  color: ColorsManager.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                  marginTop: AppSize.s16,
                  marginBottom: AppSize.s16,
                ),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: CustomTextWidget(
                    text: 'auth.logIn'.tr,
                    color: ColorsManager.white,
                    textDecoration: TextDecoration.underline,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    marginBottom: AppSize.s16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
