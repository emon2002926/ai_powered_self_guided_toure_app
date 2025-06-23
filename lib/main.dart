import 'package:ai_powered_self_guided_toure_app/screens/welcome_screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constant/app_colors.dart';
import 'main_entry_app.dart';

void main() {
  //////////// app navigation style set
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white, statusBarColor: AppColors.instance.transparent, systemNavigationBarDividerColor: Colors.transparent
        ,systemNavigationBarIconBrightness: Brightness.light),
  );

  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //      // Change this to any color
  //     systemNavigationBarIconBrightness: Brightness.light, // Icon color
  //   ),
  // );

  runApp(MainEntryApp());
}

