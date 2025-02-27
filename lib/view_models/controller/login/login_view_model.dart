import 'package:bloc_setup/bloc/login/login_bloc.dart';
import 'package:bloc_setup/bloc/google_auth/google_bloc.dart';
import 'package:bloc_setup/res/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginController {
  final BuildContext context;
  final GlobalKey<FormState> formKey;
  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;


  LoginController(this.context, this.formKey, this.emailFocusNode, this.passwordFocusNode);

  // void dispose() {
  //   emailController.dispose();
  //   passwordController.dispose();
  //   emailFocusNode.dispose();
  //   passwordFocusNode.dispose();
  // }

  void onLogin() {
    if (formKey.currentState!.validate()) {
      context.read<LoginBloc>().add(LoginUserEvent(email: 'emilys', password: 'emilyspass'));
    }
  }

  void onGoogleLogin() {
    context.read<GoogleBloc>().add(GoogleSignInEvent());

  }

  void navigateToRecovery() {

    navigate(RouteNames.recoveryView);
  }
  void navigateToHome() {

    navigate(RouteNames.homeView);
  }
  void navigateToRegister() {

    navigate(RouteNames.registerView);
  }
  void navigate(String route){
    looseFocus();
    // dispose();
    Navigator.pushNamed(context, route);
  }
  void looseFocus(){
emailFocusNode.unfocus();
passwordFocusNode.unfocus();
  }
}
