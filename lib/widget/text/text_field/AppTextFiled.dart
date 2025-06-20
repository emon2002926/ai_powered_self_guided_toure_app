import 'package:ai_powered_self_guided_toure_app/constant/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextFiled extends StatelessWidget {
  final String hintText;
  final TextEditingController? passwordController;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Color? hintColor;
  const AppTextFiled({super.key,
    required this.hintText,
    this.passwordController,
    this.prefixIcon,
    this.suffixIcon,
    this.hintColor});

  @override
  Widget build(BuildContext context) {
    return TextField(

      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: prefixIcon != null ? Icon(prefixIcon, size: 20) : null,
        suffixIcon: suffixIcon != null ? Icon(suffixIcon, size: 20) : null,
        hintText: hintText,
        hintStyle: TextStyle(
          color: hintColor ?? Colors.grey[600], // 👈 Change this to any color you want
          fontSize: 14,       // Optional: adjust the size
          fontWeight: FontWeight.w400, // Optional: control the weight
        ),
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
