import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/app_colors.dart';
import '../../constant/app_constant.dart';

class AppText extends StatelessWidget {
  const AppText({
    super.key,
    required this.data,
    this.fontSize = 16,
    this.textScaleFactor = 0.9,
    this.color,
    this.fontWeight = FontWeight.w400,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.height,
    this.decoration,
    this.decorationColor,
    this.translate = false,
    this.fontFamily,
  });
  final String data;
  final double? fontSize;
  final double textScaleFactor;
  final Color? color;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final double? height;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final bool translate;
  final String? fontFamily;
  @override
  Widget build(BuildContext context) {
    return Text(
      translate ? data.tr : data,
      maxLines: maxLines ?? 100,
      overflow: overflow ?? TextOverflow.ellipsis,
      textAlign: textAlign,
      style: Theme.of(context).textTheme.displaySmall?.copyWith(
        height: height,
        fontSize: fontSize,
        color: color ?? AppColors.instance.white50,
        fontWeight: fontWeight,
        fontFamily: fontFamily ?? AppConstant.instance.poppins,
        decoration: decoration,
        decorationColor: decorationColor,
      ),
      textScaler: TextScaler.linear(textScaleFactor),
    );
  }
}
