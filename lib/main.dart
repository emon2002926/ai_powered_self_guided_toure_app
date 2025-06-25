import 'package:ai_powered_self_guided_toure_app/screens/welcome_screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constant/app_colors.dart';
import 'main_entry_app.dart';

void main() {
  //////////// app navigation style set
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // Change this to any color
      systemNavigationBarIconBrightness: Brightness.light, // Icon color
    ),
  );
  runApp(MainEntryApp());
}

