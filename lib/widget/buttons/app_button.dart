import 'package:flutter/material.dart';

import '../../constant/app_colors.dart';
import 'dart:ui';

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
  final double? buttonWidth;
  final Color? borderColor;
  final double? borderWidth;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final FontWeight? fontWeight;
  final bool? enableFrostEffect; // 🔹 Optional frost glass toggle

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
    this.buttonWidth,
    this.borderColor,
    this.borderWidth,
    this.prefixIcon,
    this.suffixIcon,
    this.fontWeight,
    this.enableFrostEffect = true,  // 🔹 Default is false
  });

  @override
  Widget build(BuildContext context) {
    final radius = borderRadius ?? 12;

    Widget buttonContent = ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: enableFrostEffect == true
            ? Colors.white.withOpacity(0.1)
            : buttonColor ?? AppColors.instance.btnColor,
        elevation: elevation ?? 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
          side: BorderSide(
            color: borderColor ?? Colors.transparent,
            width: borderWidth ?? 1.5,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (prefixIcon != null) ...[
            Icon(
              prefixIcon,
              color: textColor ?? Colors.white,
              size: fontSize ?? 24,
            ),
            const SizedBox(width: 8),
          ],
          Text(
            buttonText,
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontFamily: fontFamily,
              fontWeight: fontWeight ?? FontWeight.w700,
              fontSize: fontSize ?? 16,
            ),
          ),
          if (suffixIcon != null) ...[
            const SizedBox(width: 8),
            Icon(
              suffixIcon,
              color: textColor ?? Colors.white,
              size: fontSize ?? 24,
            ),
          ],
        ],
      ),
    );

    return SizedBox(
      width: buttonWidth ?? double.infinity,
      height: buttonHeight ?? 48,

      child: enableFrostEffect == true
          ? ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: buttonContent,
        ),
      )
          : buttonContent,
    );
  }
}
