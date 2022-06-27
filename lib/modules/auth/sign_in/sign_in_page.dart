import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../routes/app_routes.dart';
import '../../modules.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primaryBlue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.flag),
            color: ColorsManager.grey300,
            tooltip: 'settings.language'.tr,
            onPressed: () => changeLanguageDialog(
              languageOptions: controller.languageController.languageOptions,
            ),
          ),
        ],
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
                const Padding(
                  padding: EdgeInsets.all(AppSize.s16),
                  child: SignInForm(),
                ),
                CustomTextWidget(
                  text: 'loginCallRegister'.tr, //'auth.dontHaveAccount'.tr,
                  color: ColorsManager.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                  marginTop: AppSize.s16,
                  marginBottom: AppSize.s16,
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(Routes.signUpRoute),
                  child: CustomTextWidget(
                    text: 'registerNow'.tr, //'auth.registerNow'.tr,
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
