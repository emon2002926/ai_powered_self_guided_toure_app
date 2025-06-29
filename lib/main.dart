import 'package:ai_powered_self_guided_toure_app/screens/welcome_screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constant/app_colors.dart';
import 'main_entry_app.dart';

void main() {
  //////////// app navigation style set
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // Optional: makes status bar transparent
    statusBarIconBrightness: Brightness.light, // ⚪ White icons and text
    statusBarBrightness: Brightness.dark, // For iOS
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp(MainEntryApp());
}

