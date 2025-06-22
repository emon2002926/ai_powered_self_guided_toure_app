import 'package:ai_powered_self_guided_toure_app/screens/welcome_screen/welcome_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../screens/auth_all_screens/forgot_screen/forgot_password_page.dart';
import '../screens/auth_all_screens/forgot_screen/screens/otp_verification_page.dart';
import '../screens/auth_all_screens/login_screen/login_screen.dart';
import '../screens/auth_all_screens/sign_up_screen/sign_up_screen.dart';
import '../screens/city_selection/city_selection_screen.dart';
import 'app_routes.dart';

List<GetPage> appRootRoutesFile = <GetPage>[
  GetPage(name: AppRoutes.initial, page: () => const WelcomeScreen(), transition: Transition.rightToLeftWithFade, transitionDuration: const Duration(milliseconds: 250),),
  GetPage(name: AppRoutes.login, page: () => const LoginScreen(), transition: Transition.rightToLeftWithFade, transitionDuration: const Duration(milliseconds: 250)),
  GetPage(name: AppRoutes.register, page: () => const SignUpScreen(), transition: Transition.rightToLeftWithFade, transitionDuration: const Duration(milliseconds: 250)),
  GetPage(name: AppRoutes.forgotPassword, page: () => const ForgotPasswordPage(), transition: Transition.rightToLeftWithFade, transitionDuration: const Duration(milliseconds: 250)),
  GetPage(name: AppRoutes.verifyCodePage, page: () =>  OtpVerificationPage(email: Get.arguments), transition: Transition.rightToLeftWithFade, transitionDuration: const Duration(milliseconds: 250)),
  GetPage(name: AppRoutes.home, page: () => const CitySelectionScreen(), transition: Transition.rightToLeftWithFade, transitionDuration: const Duration(milliseconds: 250)),

];