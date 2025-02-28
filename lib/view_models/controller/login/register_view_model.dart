import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/google_auth/google_bloc.dart';
import '../../../res/routes/route_names.dart';

class RegisterViewModel{

  static void signUp(BuildContext context, GlobalKey<FormState> formkey, String name, String email, String pass) {
    if (formkey.currentState!.validate()) {

      debugPrint("User Registered: ${name}, ${email}");
    }
  }

  static void googleSignIn(BuildContext context) {
    context.read<GoogleBloc>().add(GoogleSignInEvent());
  }

  static void navigateToLogin(BuildContext context) {
    Navigator.pushNamed(context, RouteNames.loginView);
  }
}