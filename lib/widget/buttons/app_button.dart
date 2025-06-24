import 'package:ai_powered_self_guided_toure_app/constant/app_constant.dart';
import 'package:flutter/material.dart';

import '../../constant/app_colors.dart';

class AppButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? buttonColor;
  final double? borderRadius;
  final String? fontFamily;
  final double? fontSize;
  final double? elevation;
  final double? buttonHeight;
  final Color? borderColor; // 🔹 Added this
  final double? borderWidth; // 🔹 And this

  const AppButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.textColor,
    this.backgroundColor,
    this.buttonColor,
    this.borderRadius,
    this.fontFamily,
    this.fontSize,
    this.elevation,
    this.buttonHeight,
    this.borderColor, // 🔹 Constructor
    this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: buttonHeight ?? 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor ?? AppColors.instance.btnColor,
          elevation: elevation ?? 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 12),
            side: BorderSide(
              color: borderColor ?? Colors.transparent, // 🔹 Outline color
              width: borderWidth ?? 1.5, // 🔹 Outline thickness
            ),
          ),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            color: textColor ?? AppColors.instance.btnTextColor,
            fontFamily: fontFamily ?? AppConstant.instance.poppins,
            fontWeight: FontWeight.w700,
            fontSize: fontSize ?? 16,
          ),
        ),
      ),
    );
  }
}
