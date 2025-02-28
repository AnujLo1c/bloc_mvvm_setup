import 'package:bloc_setup/bloc/login/login_bloc.dart';
import 'package:bloc_setup/res/routes/route_names.dart';
import 'package:bloc_setup/view_models/controller/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Theme/r.dart';
import '../bloc/google_auth/google_bloc.dart';
import '../bloc/splash/splash_bloc.dart';
import '../domain/models/google_user_model.dart';
import '../domain/models/user.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    SplashViewModel.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        SplashViewModel.handleState(context, state);
      },
      child: Scaffold(
        backgroundColor: R.colors.primary,
        body: Center(
            child: Image.asset(
                R.assets.nike, color: Colors.white
            )),
      ),
    );
  }
}
