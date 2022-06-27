import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../modules.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  left: AppSize.s72,
                  right: AppSize.s72,
                  top: AppSize.s72,
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
              Column(
                children: [
                  CustomTextWidget(
                    text: 'registerAccountAs'.tr, //'auth.registerAs'.tr,
                    color: ColorsManager.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    // marginTop: AppSize.s4,
                    marginBottom: AppSize.s32,
                  ),
                  CustomMaterialButton(
                    text: 'student'.tr, //'auth.student'.tr,
                    fontSize: 20.0,
                    buttonWidth: getWidth * 0.85,
                    textColor: ColorsManager.primary,
                    buttonColor: ColorsManager.white,
                    onPressed: () {
                      customGeneralDialog(
                        context: context,
                        widget: const SignUpForm(
                          userType: "Student",
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  CustomMaterialButton(
                    text: 'enterprise'.tr, // 'auth.enterprise'.tr,
                    fontSize: 20.0,
                    buttonWidth: getWidth * 0.85,
                    textColor: ColorsManager.primary,
                    buttonColor: ColorsManager.white,
                    onPressed: () {
                      customGeneralDialog(
                        context: context,
                        widget: const SignUpForm(
                          userType: "Professional",
                          isStudent: false,
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: getHeight * 0.2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
