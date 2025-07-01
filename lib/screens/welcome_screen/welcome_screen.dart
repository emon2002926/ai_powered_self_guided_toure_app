import 'package:ai_powered_self_guided_toure_app/constant/app_assert_image.dart';
import 'package:ai_powered_self_guided_toure_app/constant/app_colors.dart';
import 'package:ai_powered_self_guided_toure_app/routes/app_routes.dart';
import 'package:ai_powered_self_guided_toure_app/widget/buttons/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widget/frosted_backgroung/frosted_background.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light, // Forces white icons
      ),
      body: Stack(
        children: [
          frostedBackground(),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  AppAssertImage.instance.welcomeScreenImage,
                  width: double.infinity,
                  height: 200.h,
                ),
                Lottie.asset(
                  'assets/animations/cycling_animation.json',
                  width: double.infinity,
                  height: 250.h,
                ),
                Padding(
                  padding: EdgeInsets.all(24.w),
                  child: AppButton(
                    buttonText: "Let’s Start",
                    onPressed: () {
                      Get.toNamed(AppRoutes.login);
                    },
                    borderRadius: 12.r,
                    buttonColor: AppColors.instance.transparent,
                    borderColor: AppColors.instance.white50,
                    borderWidth: 1.5,
                    buttonHeight: 55.h,
                    buttonWidth: 260.w,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
