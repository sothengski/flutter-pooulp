import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../routes/routes.dart';

class ForgotPasswordPage extends StatelessWidget {
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
                  // child: SvgPicture.asset(
                  //   AssetsManager.appLogoWhiteSvg,
                  //   height: 80,
                  //   matchTextDirection: true,
                  // ),
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
                    child:
                        // Obx(
                        //   () =>
                        Form(
                      // key: controller.signInFormKey,
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
                            // controller: controller.emailCtrl,
                            inputTitle: 'auth.email'.tr,
                            hintText: 'auth.emailHint'.tr,
                            isFilled: true,
                            topPadding: AppSize.s12,
                            validator: Validator().emailValidator,
                            keyboardType: TextInputType.emailAddress,
                            bottomPadding: AppSize.s20,
                          ),

                          // Obx(
                          //   () =>
                          Visibility(
                            // visible: !controller.isSubmitBtnProcessing.value,
                            child: CustomMaterialButton(
                              text: 'auth.sendEmail'.tr,
                              fontSize: 20.0,
                              buttonWidth: getWidth,
                              childWidget:
                                  //                 controller.isSubmitBtnProcessing.value == true
                                  // ?
                                  const SizedBox(
                                height: 40,
                                child: LoadingWidget(
                                  isTreeBounceLoading: true,
                                  color: ColorsManager.white,
                                ),
                              )
                              // : null
                              ,
                              onPressed: () {
                                unFocusKeyBoard(context);
                                //  if (!controller.isSubmitBtnProcessing.value == true) {
                                // controller.saveButtonOnClick();
                                // }
                              },
                            ),
                          ),
                          // ),
                        ],
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
                  onTap: () => Get.toNamed(Routes.signInRoute),
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
