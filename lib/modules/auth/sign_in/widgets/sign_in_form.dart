import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainerWidget(
      child: Padding(
        padding: const EdgeInsets.all(double24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomTextWidget(
              text: 'Login',
              fontSize: 24.0,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryColor,
            ),
            const CustomTextInput(
              inputTitle: "Email",
              hintText: "Enter your email",
              isFilled: true,
              topPadding: double16,
            ),
            const CustomTextInput(
              inputTitle: "Password",
              hintText: "Enter your password",
              obscureText: true,
              isFilled: true,
              topPadding: double16,
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: CustomTextWidget(
                text: 'Forget password?',
                color: AppColors.primaryColor,
                textDecoration: TextDecoration.underline,
                marginTop: double16,
                marginBottom: double16,
              ),
            ),
            CustomMaterialButton(
              text: "Login",
              fontSize: 20.0,
              buttonWidth: getWidth,
              onPressed: () {
                customSnackbar(
                  msgTitle: "Click Login Button.",
                  msgContent: "Click Login Button Description.",
                );
              },
            ),
            Row(
              children: const [
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: AppColors.grey600Color,
                  ),
                ),
                SizedBox(width: 10),
                CustomTextWidget(
                  text: 'Or',
                  fontSize: 20.0,
                  marginTop: double16,
                  marginBottom: double16,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: AppColors.grey600Color,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: double48,
                right: double48,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundColor: AppColors.whiteColor,
                    child: Image(
                      image: AssetImage(googleLogoImg),
                    ),
                  ),
                  CircleAvatar(
                    radius: 30.0,
                    backgroundColor: AppColors.whiteColor,
                    child: Image(
                      image: AssetImage(linkedInLogoImg),
                    ),
                  ),
                  CircleAvatar(
                    radius: 30.0,
                    backgroundColor: AppColors.whiteColor,
                    child: Image(
                      image: AssetImage(facebookLogoImg),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
