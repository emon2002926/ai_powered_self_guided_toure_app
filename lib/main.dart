import 'package:ai_powered_self_guided_toure_app/screens/welcome_screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constant/app_colors.dart';
import 'main_entry_app.dart';

void main() {
  //////////// app navigation style set
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(systemNavigationBarColor: AppColors.instance.transparent, statusBarColor: AppColors.instance.transparent, systemNavigationBarDividerColor: Colors.transparent),
  );

  runApp(MainEntryApp());
}

