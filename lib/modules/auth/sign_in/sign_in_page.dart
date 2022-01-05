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
      backgroundColor: ColorsManager.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () => unFocusKeyBoard(context),
        child: SizedBox(
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
                  ),
                  child: Image(
                    image: AssetImage(ImageAssets.appLogoWhite),
                  ),
                ),
                // SizedBox(
                //   height: getHeight * 0.05,
                // ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SignInForm(),
                ),
                const CustomTextWidget(
                  text: "Don't have an account yet?",
                  color: ColorsManager.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                  marginTop: AppSize.s16,
                  marginBottom: AppSize.s16,
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(Routes.signUpRoute),
                  child: const CustomTextWidget(
                    text: 'Register Now!',
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
