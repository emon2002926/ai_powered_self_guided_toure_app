import 'package:ai_powered_self_guided_toure_app/constant/app_assert_image.dart';
import 'package:ai_powered_self_guided_toure_app/constant/app_colors.dart';
import 'package:ai_powered_self_guided_toure_app/routes/app_routes.dart';
import 'package:ai_powered_self_guided_toure_app/widget/buttons/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'controller/welcome_screen_controller.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late WelcomeScreenController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WelcomeScreenController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          /// 🔹 Pre-blurred Background Image
          SizedBox.expand(
            child: Image.asset(
              AppAssertImage.instance.backgroundImage,
              fit: BoxFit.cover,
            ),
          ),

          /// 🔹 Foreground Content
          SafeArea(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                if (_controller.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      /// Welcome image (logo/banner)
                      Image.asset(
                        AppAssertImage.instance.welcomeScreenImage,
                        width: double.infinity,
                        height: MediaQuery.of(context).size.width * 0.5,
                      ),

                      /// Lottie animation
                      Lottie.asset(
                        'assets/animations/cycling_animation.json',
                        width: double.infinity,
                        height: 400,
                        repeat: true,
                      ),

                      /// Let's Start button
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: AppButton(
                          buttonText: "Let’s Start",
                          onPressed: () {
                            // Get.toNamed(AppRoutes.submitPage);
                            Get.toNamed(AppRoutes.login);
                          },
                          borderRadius: 12,
                          buttonColor: AppColors.instance.transparent,
                          borderColor: AppColors.instance.white50,
                          borderWidth: 1.5,
                          buttonHeight: 60
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
