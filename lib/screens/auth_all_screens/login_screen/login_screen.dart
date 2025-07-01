import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ai_powered_self_guided_toure_app/constant/app_assert_image.dart';
import 'package:ai_powered_self_guided_toure_app/constant/app_colors.dart';
import 'package:ai_powered_self_guided_toure_app/routes/app_routes.dart';
import 'package:ai_powered_self_guided_toure_app/widget/buttons/app_button.dart';
import 'package:ai_powered_self_guided_toure_app/widget/text/app_text.dart';
import 'package:ai_powered_self_guided_toure_app/widget/text/text_field/AppTextFiled.dart';

import '../../../widget/app_bar/build_app_bar.dart';
import '../../../widget/frosted_backgroung/frosted_background.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: BuildAppBar(title: "Landmark"),
      body: Stack(
        children: [
          frostedBackground(),
          SafeArea(
            child: Padding(
              padding:  EdgeInsets.symmetric( horizontal: MediaQuery.of(context).size.width * 0.10),
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 12),
                        AppText(data: "Welcome Back", color: AppColors.instance.white50, fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: AppText(data: "User Name", fontWeight: FontWeight.w900,
                            fontSize: 16,
                            color: AppColors.instance.white50,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const AppTextFiled(hintText: "Enter your user name here"),

                        const SizedBox(height: 16),

                        /// Password
                        Align(
                          alignment: Alignment.centerLeft,
                          child: AppText(data: "Password", fontWeight: FontWeight.w900,
                            fontSize: 16,
                            color: AppColors.instance.white50,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const AppTextFiled(hintText: "Enter your password"),

                        const SizedBox(height: 16),

                        /// Forget password
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () => Get.toNamed(AppRoutes.forgotPassword),
                            child: AppText(data: "Forget Password?", fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),

                        const SizedBox(height: 24),

                        /// Login button
                        AppButton(buttonText: "Login",
                          onPressed: () => Get.toNamed(AppRoutes.citySearch),
                          borderRadius: 25, buttonColor: AppColors.instance.transparent,
                          borderColor: AppColors.instance.white50, borderWidth: 1.5,
                          buttonHeight: 48,
                        ),
                        const SizedBox(height: 24),
                        const Row(
                          children: [
                            Expanded(child: Divider(color: Colors.white)),
                            Padding(padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text("or", style: TextStyle(color: Colors.white)),
                            ),
                            Expanded(child: Divider(color: Colors.white)),
                          ],
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: SizedBox(
                              width: 20,
                              height: 20,
                              child: Image.asset(AppAssertImage.instance.googleLogo),
                            ),
                            label: const AppText(color: Colors.white, data: "Continue with Google"),
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              side: const BorderSide(color: Colors.white, width: 1.5),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        /// Apple login
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: SizedBox(
                              width: 20,
                              height: 20,
                              child: Image.asset('assets/icons/apple_logo.png'),
                            ),
                            label: const AppText(color: Colors.white, data: "Continue with Apple"),
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              side: const BorderSide(color: Colors.white, width: 1.5),
                            ),
                          ),
                        ),

                        const SizedBox(height: 24),

                        /// Register prompt
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account? ",
                              style: TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            GestureDetector(
                              onTap: () => Get.toNamed(AppRoutes.register),
                              child: const Text(
                                "Register Now",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
