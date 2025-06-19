import 'package:ai_powered_self_guided_toure_app/screens/auth_all_screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreenController extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  // void onGetStarted() {
  //   // Handle navigation or action
  //   Get.to(LoginScreen());
  // }
}