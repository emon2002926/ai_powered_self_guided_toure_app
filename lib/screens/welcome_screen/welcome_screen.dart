import 'package:ai_powered_self_guided_toure_app/constant/app_assert_image.dart';
import 'package:ai_powered_self_guided_toure_app/widget/buttons/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/app_colors.dart';
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
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          if (_controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(AppAssertImage.instance.welcomeScreenImage),
                  Text(
                    "Welcome \n to \n Bolt City tour",
                    style: const TextStyle(
                      fontFamily: 'PlayfairDisplay',
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Image.asset(AppAssertImage.instance.cycleImage,height: 200,),
                  const SizedBox(height: 30,),

                  AppButton(buttonText: "Get Started",
                      onPressed: (){
                        Get.to(() => LoginScreen());
                      },textColor: Colors.black,),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}