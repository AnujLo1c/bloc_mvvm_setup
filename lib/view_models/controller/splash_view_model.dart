import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/google_auth/google_bloc.dart';
import '../../bloc/login/login_bloc.dart';
import '../../bloc/splash/splash_bloc.dart';
import '../../domain/models/google_user_model.dart';
import '../../domain/models/user.dart';
import '../../res/routes/route_names.dart';

class SplashViewModel{
  static void init(BuildContext context) {
    context.read<SplashBloc>().add(AppStartedEvent());
  }

  static void handleState(BuildContext context, SplashState state) {
    if (state is SplashCompletedL) {
      UserModel? userModel = state.userModel;
      if (userModel != null && userModel.isLogin==true) {
        context.read<LoginBloc>().add(LoginSessionExistEvent(userModel));
        _navigateTo(context, RouteNames.homeView);
      }
    } else if (state is SplashCompletedG) {
      GoogleUserModel? googleUserModel = state.googleUserModel;
      if (googleUserModel != null) {
        context.read<GoogleBloc>().add(GoogleSessionExistEvent(googleUserModel: googleUserModel));
        _navigateTo(context, RouteNames.homeView);
      }
    } else if (state is SplashCompleted) {
      _navigateTo(context, RouteNames.loginView);
    }
  }

  static void _navigateTo(BuildContext context, String route) {
    Navigator.pushReplacementNamed(context, route);
  }
}