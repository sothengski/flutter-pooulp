import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../modules.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
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
                  left: double72,
                  right: double72,
                ),
                child: Image(
                  image: AssetImage(appLogoWhiteImg),
                ),
              ),
              Column(
                children: [
                  const CustomTextWidget(
                    text: "Register an account as",
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    // marginTop: double4,
                    marginBottom: double32,
                  ),
                  CustomMaterialButton(
                    text: "Student",
                    fontSize: 20.0,
                    buttonWidth: getWidth * 0.85,
                    textColor: AppColors.primaryColor,
                    buttonColor: AppColors.whiteColor,
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
                    textColor: AppColors.primaryColor,
                    buttonColor: AppColors.whiteColor,
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
