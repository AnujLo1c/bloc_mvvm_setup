import 'package:bloc_setup/res/routes/route_names.dart';
import 'package:bloc_setup/view/login/login_view.dart';
import 'package:bloc_setup/view/login/otp_verify_view.dart';
import 'package:bloc_setup/view/splash_view.dart';

import '../../view/home/home_view.dart';
import '../../view/login/register_view.dart';
import '../../view/login/recovery_view.dart';

class AppRoutes{
  static var routes={
    RouteNames.splashView:(context)=>SplashView(),
    RouteNames.loginView:(context)=>LoginView(),
    RouteNames.registerView:(context)=>RegisterView(),
    RouteNames.recoveryView:(context)=>RecoveryView(),
    RouteNames.otpView:(context)=>OtpVerifyView(),
    RouteNames.homeView:(context)=>HomeView(),
  };

}