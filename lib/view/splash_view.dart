import 'package:bloc_setup/res/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Theme/r.dart';
import '../bloc/splash/splash_bloc.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    context.read<SplashBloc>().add(AppStartedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if(state is SplashCompleted){
          Navigator.pushReplacementNamed(context, RouteNames.loginView);
        }
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
