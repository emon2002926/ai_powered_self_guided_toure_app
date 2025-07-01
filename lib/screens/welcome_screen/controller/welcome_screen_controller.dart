import 'package:flutter/material.dart';

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