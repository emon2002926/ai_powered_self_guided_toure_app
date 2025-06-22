import 'package:ai_powered_self_guided_toure_app/widget/text/text_field/AppTextFiled.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../constant/app_colors.dart';
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
      backgroundColor: AppColors.instance.background,
      appBar: AppBar(
        centerTitle: true,
        title: AppText(
          data: "Sign Up",
          color: Colors.grey[900],
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 12),
              // AppText(
              //   data: "Create Account",
              //   color: AppColors.instance.welcomeTextColor,
              //   fontSize: 24,
              //   fontWeight: FontWeight.bold,
              // ),
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
              AppButton(buttonText: "Sign Up", onPressed: () {},textColor: Colors.black,buttonColor: AppColors.instance.loginBtnColor,borderRadius: 25,),
              SizedBox(height: MediaQuery.of(context).size.height * 0.020),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(data: "Already have an account? ",color: Colors.grey[700],fontSize: 14,),
                  GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: AppText(data: "Sing In",color: Colors.grey[900],fontSize: 14,fontWeight: FontWeight.bold,),
                  )

              ],),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
