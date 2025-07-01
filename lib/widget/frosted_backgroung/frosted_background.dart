import 'package:flutter/material.dart';

import '../../constant/app_assert_image.dart';

Widget frostedBackground(){
  return Positioned.fill(
    child: Image.asset(
      AppAssertImage.instance.backgroundImage,
      fit: BoxFit.cover,
      filterQuality: FilterQuality.low,
    ),
  );
}
