import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ai_powered_self_guided_toure_app/constant/app_assert_image.dart';
import 'package:ai_powered_self_guided_toure_app/constant/app_colors.dart';
import 'package:ai_powered_self_guided_toure_app/routes/app_routes.dart';
import 'package:ai_powered_self_guided_toure_app/widget/buttons/app_button.dart';
import 'package:ai_powered_self_guided_toure_app/widget/text/app_text.dart';
import 'package:ai_powered_self_guided_toure_app/widget/text/text_field/AppTextFiled.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// 🔹 Blurred Background using `blur` package
          Image.asset(
            AppAssertImage.instance.backgroundImage,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            filterQuality: FilterQuality.low,
          ).blurred(
            blur: 8,
            blurColor: Colors.black.withOpacity(0.1),
          ),

          /// 🔹 Foreground Content
          SafeArea(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                iconTheme: const IconThemeData(color: Colors.white),
                title: AppText(
                  data: "Sign In",
                  color: AppColors.instance.white50,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 12),
                      AppText(
                        data: "Welcome Back",
                        color: AppColors.instance.white50,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.08),

                      /// Username
                      Align(
                        alignment: Alignment.centerLeft,
                        child: AppText(
                          data: "User Name",
                          fontWeight: FontWeight.w900,
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
                        child: AppText(
                          data: "Password",
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                          color: AppColors.instance.white50,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const AppTextFiled(hintText: "Enter your password"),

                      const SizedBox(height: 16),

                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () => Get.toNamed(AppRoutes.forgotPassword),
                          child: AppText(
                            data: "Forget Password?",
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      /// Login Button
                      AppButton(
                        buttonText: "Login",
                        onPressed: () => Get.toNamed(AppRoutes.citySearch),
                        borderRadius: 25,
                        buttonColor: AppColors.instance.transparent,
                        borderColor: AppColors.instance.white50,
                        borderWidth: 1.5,
                        buttonHeight: 48,
                      ),

                      const SizedBox(height: 24),

                      /// Divider
                      const Row(
                        children: [
                          Expanded(child: Divider(color: Colors.white)),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text("or", style: TextStyle(color: Colors.white)),
                          ),
                          Expanded(child: Divider(color: Colors.white)),
                        ],
                      ),

                      const SizedBox(height: 24),

                      /// Google Button
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

                      /// Apple Button
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

                      /// Register Prompt
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
                                fontSize: 14,
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
        ],
      ),
    );
  }
}
