import 'package:ai_powered_self_guided_toure_app/constant/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextFiled extends StatelessWidget {
  final String hintText;
  final TextEditingController? passwordController;
  final IconData? icon;
  const AppTextFiled({super.key, required this.hintText, this.passwordController, this.icon});

  @override
  Widget build(BuildContext context) {
    return TextField(

      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: icon != null ? Icon(icon, size: 20) : null,
        hintText: hintText,
        // prefixIcon: const Icon(Icons.lock_outline, size: 20),
        filled: true,
        fillColor: AppColors.instance.textFilledColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

}
