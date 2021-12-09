import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/core.dart';

import '../../modules.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: GestureDetector(
        onTap: () => unFocusKeyBoard(context),
        child: SizedBox(
          height: getHeight,
          width: getWidth,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: getHeight * 0.1,
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: double72,
                    right: double72,
                  ),
                  child: Image(
                    image: AssetImage(appLogoWhiteImg),
                  ),
                ),
                SizedBox(
                  height: getHeight * 0.03,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SignInForm(),
                ),
                const CustomTextWidget(
                  text: "Don't have an account yet?",
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                  marginTop: double16,
                  marginBottom: double16,
                ),
                const CustomTextWidget(
                  text: "Register Now!",
                  color: AppColors.whiteColor,
                  textDecoration: TextDecoration.underline,
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                  marginBottom: double16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
