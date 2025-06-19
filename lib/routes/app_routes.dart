class AppRoutes{
  AppRoutes._AppRoutes();
  static final _instance = AppRoutes._AppRoutes();
  static AppRoutes get instance => _instance;

  /////////////  initial or splash screen
  static const String initial = '/';
  static const String welcome = '/welcome';

  ///////////////// Auth related all screens
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgotPasswordRoute = '/forgotPassword';
  static const String verifyCodeRoute = '/verifyCode';


}