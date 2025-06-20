import 'package:ai_powered_self_guided_toure_app/screens/welcome_screen/welcome_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../screens/auth_all_screens/login_screen/login_screen.dart';
import '../screens/auth_all_screens/sign_up_screen/sign_up_screen.dart';
import 'app_routes.dart';

List<GetPage> appRootRoutesFile = <GetPage>[
  GetPage(name: AppRoutes.initial, page: () => const WelcomeScreen(), transition: Transition.rightToLeftWithFade, transitionDuration: const Duration(milliseconds: 250),),
  GetPage(name: AppRoutes.login, page: () => const LoginScreen(), transition: Transition.rightToLeftWithFade, transitionDuration: const Duration(milliseconds: 250)),
  GetPage(name: AppRoutes.register, page: () => const SignUpScreen(), transition: Transition.rightToLeftWithFade, transitionDuration: const Duration(milliseconds: 250)),

];