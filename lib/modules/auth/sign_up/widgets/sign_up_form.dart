import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/core.dart';
import '../../../../routes/routes.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      extendBodyBehindAppBar: true,
      extendBody: true,
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
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    top: 100.0,
                    left: double72,
                    right: double72,
                  ),
                  child: Image(
                    image: AssetImage(appLogoWhiteImg),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomContainerWidget(
                    child: Padding(
                      padding: const EdgeInsets.all(double24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CustomTextWidget(
                            text: 'Create User Account',
                            fontSize: 24.0,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryColor,
                          ),
                          const CustomTextInput(
                            inputTitle: "First name",
                            hintText: "Enter your first name",
                            isFilled: true,
                            topPadding: double16,
                          ),
                          const CustomTextInput(
                            inputTitle: "Last name",
                            hintText: "Enter your last name",
                            isFilled: true,
                            topPadding: double16,
                          ),
                          const CustomTextInput(
                            inputTitle: "Email",
                            hintText: "Enter your email",
                            isFilled: true,
                            topPadding: double16,
                          ),
                          const CustomTextInput(
                            inputTitle: "Phone number",
                            hintText: "Enter your phone number",
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
                          const CustomTextInput(
                            inputTitle: "Password Confirmation",
                            hintText: "Enter your password confirmation",
                            obscureText: true,
                            isFilled: true,
                            topPadding: double16,
                          ),
                          const CustomTextInput(
                            inputTitle: "Enterprise Name",
                            hintText: "Enter your enterprise name",
                            isFilled: true,
                            topPadding: double16,
                          ),
                          const CustomTextInput(
                            inputTitle: "Enterprise ID",
                            hintText: "Enter your enterprise ID",
                            isFilled: true,
                            topPadding: double16,
                            bottomPadding: double32,
                          ),
                          CustomMaterialButton(
                            text: "Register",
                            fontSize: 20.0,
                            buttonWidth: getWidth,
                            onPressed: () {
                              customSnackbar(
                                msgTitle: "Click Register Button.",
                                msgContent:
                                    "Click Register Button Description.",
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const CustomTextWidget(
                  text: "You already have an account?",
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                  marginTop: double16,
                  marginBottom: double16,
                ),
                GestureDetector(
                  onTap: () => Get.offAllNamed(
                    Routes.signInRoute,
                  ),
                  child: const CustomTextWidget(
                    text: "Login",
                    color: AppColors.whiteColor,
                    textDecoration: TextDecoration.underline,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    marginBottom: double48,
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
