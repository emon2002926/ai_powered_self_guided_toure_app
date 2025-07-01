import 'package:ai_powered_self_guided_toure_app/widget/app_bar/build_app_bar.dart';
import 'package:ai_powered_self_guided_toure_app/widget/buttons/app_button.dart';
import 'package:flutter/material.dart';

import '../../../constant/app_assert_image.dart';
import '../../../constant/app_colors.dart';
import '../../../routes/app_routes.dart';
import '../../../widget/text/app_text.dart';
import '../../../widget/text/text_field/AppTextFiled.dart';
import 'package:get/get.dart';


class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar:BuildAppBar(title: "Forgot Password"),
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset(
            AppAssertImage.instance.backgroundImage,fit: BoxFit.cover,filterQuality: FilterQuality.low,)),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  Container(
                    width: double.infinity,
                    // padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 8),

                        const AppText(data: 'Forgot Password?', fontSize: 22, fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: double.infinity,
                          child: AppText(
                            data: 'Enter your email and we will send you a\nverification code',
                            textAlign: TextAlign.center, fontSize: 14,
                            color: AppColors.instance.white50,
                            fontWeight: FontWeight.normal, height: 1.4,
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.050),

                        SizedBox(
                            width: double.infinity,
                            child: Align(alignment: Alignment.centerLeft,
                              child: AppText(data: 'Email', fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.instance.white50,),)),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.020),
                        AppTextFiled(
                          hintText: 'Enter your email', passwordController: _emailController,
                          hintColor: AppColors.instance.white50,),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.050),
                        // Send code button
                        SizedBox(height: MediaQuery.of(context).size.height * 0.050),

                        AppButton(
                        buttonText: "Login",
                        onPressed: () => Get.toNamed(AppRoutes.verifyCodePage,arguments: _emailController.text),
                        borderRadius: 25,
                        buttonColor: AppColors.instance.transparent,
                        borderColor: AppColors.instance.white50,
                        borderWidth: 1.5,
                        buttonHeight: 48,
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
  void _sendVerificationCode(BuildContext context, TextEditingController emailController) {
    if (emailController.text.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:  Text('Verification code sent!'),
          backgroundColor:  Color(0xFF4CAF50),),);

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your email'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

}