import 'package:ai_powered_self_guided_toure_app/constant/app_colors.dart';
import 'package:ai_powered_self_guided_toure_app/constant/app_constant.dart';
import 'package:ai_powered_self_guided_toure_app/widget/buttons/app_button.dart';
import 'package:ai_powered_self_guided_toure_app/widget/text/app_text.dart';
import 'package:ai_powered_self_guided_toure_app/widget/text/text_field/AppTextFiled.dart';
import 'package:flutter/material.dart';

import '../../../constant/app_assert_image.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.instance.background,
        appBar: AppBar(
          centerTitle: true, // 👈 This centers the title
          title: AppText(
            data: "Sign In", // (corrected typo from "Sing In")
            color: Colors.grey[900],
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 12,),
              AppText(
                data: "Welcome Back",
                color: Colors.grey[900],
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height:  MediaQuery.of(context).size.height*0.08,),
              SizedBox( width: 374,
                  child: const Text(" User Name",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 16),)),
              const SizedBox(height: 8,),
              AppTextFiled(hintText: "Enter your user name here"),
              const SizedBox(height: 16),
              SizedBox( width: 374,
                  child: const Text(" Password",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 16),)),
              const SizedBox(height: 8,),
              AppTextFiled(hintText: "Enter your password", ),
              SizedBox(height: 16,),
              Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {},
                        child: AppText(
                          data: "Forget Password?",
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              AppButton(
                buttonText: "Login", onPressed: () {  },textColor: Colors.black ,borderRadius: 20,),
              const SizedBox(height: 24),
              // Divider
              const Row(
                children: [
                  Expanded(child: Divider(thickness: 0)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("or"),
                  ),
                  Expanded(child: Divider(thickness: 0)),
                ],
              ),
              const SizedBox(height: 24),

              // Google Button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton.icon(
                  onPressed: (){
                    // TODO: Handle Google Sign-In
                  },
                  icon: SizedBox(
                    width: 20,
                    height: 20,
                    child: Image.asset(AppAssertImage.instance.googleLogo),
                  ),
                  label: const Text("Continue with Google",style: TextStyle(color: Colors.black),),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton.icon(
                  onPressed: () {
                    // TODO: Handle Apple Sign-In
                  },
                  icon: SizedBox(
                    width: 20,
                    height: 20,
                    child: Image.asset('assets/icons/apple_logo.png'),
                  ),
                  label: const Text(
                    "Continue with Apple",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),),
                ),
              ),

              // Register Option
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(color: Colors.grey[700], fontSize: 14),
                  ),
                  GestureDetector(

                    // onTap: onRegisterTap,
                    child:  Text(
                      "Register Now",
                      style: TextStyle(
                        color:Colors.grey[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}
