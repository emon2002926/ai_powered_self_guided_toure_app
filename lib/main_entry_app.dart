import 'package:ai_powered_self_guided_toure_app/routes/app_routes_file.dart';
import 'package:ai_powered_self_guided_toure_app/screens/welcome_screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class MainEntryApp extends StatelessWidget {
  const MainEntryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Your App Name',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            useMaterial3: true,
          ),
          home: const WelcomeScreen(),
          getPages: appRootRoutesFile,
        );
      },
    );
  }
}
