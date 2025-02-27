import 'package:bloc_setup/bloc/login/login_bloc.dart';
import 'package:bloc_setup/res/routes/route_names.dart';
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
    context.read<SplashBloc>().add(AppStartedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if(state is SplashCompletedL){
          UserModel? userModel=state.userModel;
          if(userModel!=null || userModel?.isLogin==true){
            context.read<LoginBloc>().add(LoginSessionExistEvent(state.userModel));
          Navigator.pushReplacementNamed(context, RouteNames.homeView);
          }
        }
        if(state is SplashCompletedG){
          GoogleUserModel? googleUserModel=state.googleUserModel;
          if(googleUserModel!=null){
            context.read<GoogleBloc>().add(GoogleSessionExistEvent(googleUserModel: googleUserModel));
            Navigator.pushReplacementNamed(context, RouteNames.homeView);
          }
        }
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
