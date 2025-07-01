import 'package:ai_powered_self_guided_toure_app/screens/brief_page/brief_screen.dart';
import 'package:ai_powered_self_guided_toure_app/screens/city_selection_screen/city_selection_screen.dart';
import 'package:ai_powered_self_guided_toure_app/screens/landmark_screen/landmark_screen.dart';
import 'package:ai_powered_self_guided_toure_app/screens/submit_page/submit_page.dart';
import 'package:ai_powered_self_guided_toure_app/screens/welcome_screen/welcome_screen.dart';
import 'package:get/get.dart';

import '../screens/auth_all_screens/forgot_screen/forgot_password_page.dart';
import '../screens/auth_all_screens/forgot_screen/screens/otp_verification_page.dart';
import '../screens/auth_all_screens/login_screen/login_screen.dart';
import '../screens/auth_all_screens/sign_up_screen/sign_up_screen.dart';
import '../screens/clue_page/clue_screen.dart';
import '../screens/map_page/map_screen.dart';
import '../screens/tourist_attraction/tourist_attraction_screen.dart';
import 'app_routes.dart';

List<GetPage> appRootRoutesFile = <GetPage>[
  GetPage(name: AppRoutes.initial, page: () => const WelcomeScreen(), transition: Transition.rightToLeftWithFade, transitionDuration: const Duration(milliseconds: 250),),
  GetPage(name: AppRoutes.login, page: () => const LoginScreen(), transition: Transition.rightToLeftWithFade, transitionDuration: const Duration(milliseconds: 250)),
  GetPage(name: AppRoutes.register, page: () => const SignUpScreen(), transition: Transition.rightToLeftWithFade, transitionDuration: const Duration(milliseconds: 250)),
  GetPage(name: AppRoutes.forgotPassword, page: () => const ForgotPasswordPage(), transition: Transition.rightToLeftWithFade, transitionDuration: const Duration(milliseconds: 250)),
  GetPage(name: AppRoutes.verifyCodePage, page: () =>  OtpVerificationPage(email: Get.arguments), transition: Transition.rightToLeftWithFade, transitionDuration: const Duration(milliseconds: 250)),
  GetPage(name: AppRoutes.citySearch, page: () => const CitySelectionScreen(), transition: Transition.rightToLeftWithFade, transitionDuration: const Duration(milliseconds: 250)),
  GetPage(name: AppRoutes.landMark, page: () => const LandmarkPage(), transition: Transition.rightToLeftWithFade, transitionDuration: const Duration(milliseconds: 250)),
  GetPage(name: AppRoutes.landmarkBrief, page: () => const BriefScreen(), transition: Transition.rightToLeftWithFade, transitionDuration: const Duration(milliseconds: 250)),
  GetPage(name: AppRoutes.touristAttraction, page: () =>  TouristAttractionScreen(), transition: Transition.rightToLeftWithFade, transitionDuration: const Duration(milliseconds: 250)),
  GetPage(name: AppRoutes.submitPage, page: () =>  SubmitPage(), transition: Transition.rightToLeftWithFade, transitionDuration: const Duration(milliseconds: 250)),
  GetPage(name: AppRoutes.mapPage, page: () =>  MapScreen(), transition: Transition.rightToLeftWithFade, transitionDuration: const Duration(milliseconds: 250)),
  GetPage(name: AppRoutes.clues, page: () =>  ClueScreen(), transition: Transition.rightToLeftWithFade, transitionDuration: const Duration(milliseconds: 250)),

];