import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../modules.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  left: AppSize.s72,
                  right: AppSize.s72,
                ),
                child: Image(
                  image: AssetImage(AssetsManager.appLogoWhite),
                ),
              ),
              Column(
                children: [
                  const CustomTextWidget(
                    text: "Register an account as",
                    color: ColorsManager.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    // marginTop: AppSize.s4,
                    marginBottom: AppSize.s32,
                  ),
                  CustomMaterialButton(
                    text: "Student",
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
                    text: "Enterprise",
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
