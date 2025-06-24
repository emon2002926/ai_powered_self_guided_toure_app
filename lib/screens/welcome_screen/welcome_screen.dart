import 'package:ai_powered_self_guided_toure_app/constant/app_assert_image.dart';
import 'package:ai_powered_self_guided_toure_app/widget/buttons/app_button.dart';
import 'package:ai_powered_self_guided_toure_app/widget/container/glass_container.dart';
import 'package:ai_powered_self_guided_toure_app/widget/text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../constant/app_colors.dart';
import '../../constant/app_constant.dart';
import '../../routes/app_routes.dart';
import '../../routes/app_routes_file.dart';
import '../auth_all_screens/login_screen/login_screen.dart';
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
      backgroundColor: AppColors.instance.primary,
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            if (_controller.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
        
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    AppAssertImage.instance.welcomeScreenImage, width: double.infinity,
                    height: MediaQuery.of(context).size.width * 0.5,
                  ),
                  // AppText(data: "Welcome\nto\nBolt City Tour ",fontFamily: AppConstant.instance.playfair, fontSize: 24,fontWeight: FontWeight.bold,),


                  Lottie.asset(
                    'assets/animations/cycling_animation.json',
                    width: double.infinity,
                    height: 400,
                    repeat: true,
                    onLoaded: (composition) {
                      // Optional: Do something when loaded
                    },
                  ),
                  // const SizedBox(height: 30,),

                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: AppButton(
                      buttonText: "Let’s Start",
                      onPressed: () {
                        Get.toNamed(AppRoutes.login);
                      },
                      borderRadius: 12,
                      buttonColor: AppColors.instance.loginBtnColor,
                    )
                  ),


                ],
              ),
            );
          },
        ),
      ),
    );
  }
}


// AppText(data: "Welcome\nto\nBolt City Tour ",fontFamily: AppConstant.instance.playfair, fontSize: 24,fontWeight: FontWeight.bold,),
