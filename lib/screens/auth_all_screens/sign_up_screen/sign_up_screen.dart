import 'package:ai_powered_self_guided_toure_app/widget/text/text_field/AppTextFiled.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/app_assert_image.dart';
import '../../../constant/app_colors.dart';
import '../../../widget/app_bar/build_app_bar.dart';
import '../../../widget/buttons/app_button.dart';
import '../../../widget/text/app_text.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.instance.transparent,
      extendBodyBehindAppBar: true,
      appBar: BuildAppBar(
        title: "Sign Up",
      ),
      body: Stack(
        children: [
          Image.asset(
            AppAssertImage.instance.backgroundImage, // make sure this is your blurred image
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            filterQuality: FilterQuality.low,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(height: 12),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                    SizedBox(width: double.infinity,child: AppText(data: "Full Name",fontWeight: FontWeight.w900, fontSize: 16)), // (corrected typo from "Sing In")
                    SizedBox(height: MediaQuery.of(context).size.height * 0.020),
                    AppTextFiled(hintText: "Full Name"),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                    SizedBox(width: double.infinity,child: AppText(data: "Email",fontWeight: FontWeight.w900, fontSize: 16)),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.020),
                    AppTextFiled(hintText: "Email"),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                    SizedBox(width: double.infinity,child: AppText(data: "Phone Number",fontWeight: FontWeight.w900, fontSize: 16)), // (corrected typo from "Sing In")
                    SizedBox(height: MediaQuery.of(context).size.height * 0.020),
                    AppTextFiled(hintText: "Phone Number"),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                    SizedBox(width: double.infinity,child: AppText(data: "Password",fontWeight: FontWeight.w900, fontSize: 16)),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.020),
                    AppTextFiled(hintText: "Password",suffixIcon: Icons.visibility_off,),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                    SizedBox(width: double.infinity,child: AppText(data: "Password",fontWeight: FontWeight.w900, fontSize: 16)),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.020),
                    AppTextFiled(hintText: "Password",suffixIcon: Icons.visibility_off),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.035),
                    AppButton(
                      buttonText: "Login",
                      onPressed: (){},
                      borderRadius: 25,
                      buttonColor: AppColors.instance.transparent,
                      borderColor: AppColors.instance.white50,
                      borderWidth: 1.5,
                      buttonHeight: 48,
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.020),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(data: "Already have an account? ",fontSize: 14,),
                        GestureDetector(
                          onTap: (){
                            Get.back();
                          },
                          child: AppText(data: "Sing In",color: AppColors.instance.white50,fontSize: 15,fontWeight: FontWeight.bold,),
                        )

                      ],),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
