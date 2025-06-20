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

  const AppButton({super.key, required this.buttonText,
    required this.onPressed, this.textColor, this.backgroundColor, this.buttonColor, this.borderRadius, this.fontFamily, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed, // this is enough
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor ?? AppColors.instance.green500,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 12),
          ),
        ),

        child:  Text(
          buttonText,
          style: TextStyle(
            color: textColor ?? AppColors.instance.btnColor,
            fontFamily: fontFamily ?? AppConstant.instance.poppins ,
            fontWeight: FontWeight.w700,
            fontSize: fontSize ?? 16,
          ),
        ),
      ),
    );
  }
}
