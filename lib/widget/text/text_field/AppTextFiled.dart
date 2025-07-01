import 'package:ai_powered_self_guided_toure_app/constant/app_colors.dart';
import 'package:ai_powered_self_guided_toure_app/constant/app_constant.dart';
import 'package:flutter/material.dart';

class AppTextFiled extends StatelessWidget {
  final String hintText;
  final TextEditingController? passwordController;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Color? hintColor;
  final double? hintSize;

  const AppTextFiled({
    super.key,
    required this.hintText,
    this.passwordController,
    this.prefixIcon,
    this.suffixIcon,
    this.hintColor,
    this.hintSize,
  });

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
          color: hintColor ?? AppColors.instance.white50,
          fontSize: hintSize ?? 14,
          fontWeight: FontWeight.w400,
          fontFamily: AppConstant.instance.poppins,
        ),
        filled: true,
        fillColor: AppColors.instance.transparent,

        /// 🔹 Outline border styling
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.5), width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.5), width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white, width: 2),
        ),
      ),
      style: const TextStyle(color: Colors.white), // Optional: text color inside input
    );
  }
}
