import 'package:bloc_setup/bloc/google_auth/google_bloc.dart';
import 'package:bloc_setup/view_models/controller/user_shared_pref/user_shared_pref.dart';
import 'package:bloc_setup/view/home/widgets/logout_dialog.dart';
import 'package:bloc_setup/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../bloc/login/login_bloc.dart';
import '../../domain/models/user.dart';
import '../../view_models/controller/home/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiBlocListener(listeners: [
        BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
        if (state is LogOutCompleted || state is LoginCompleted) {
      CustomSnackbar.show(context, "Logout Successfully");
      Navigator.pop(context);
    }
  }),
        BlocListener<GoogleBloc, GoogleState>(
        listener: (context, state) {
      if (state is GoogleSignOut) {
        CustomSnackbar.show(context, "Logout form google successfully");
        Navigator.pop(context);
      }
    })
    ],
    child:  Scaffold(
          body: Column(

            children: [
              Gap(100),
              ElevatedButton(
                  onPressed: () async {
UserSharedPref.getGoogleUser();
UserSharedPref.getUser();
                  },
                  child: Text("Fetch user details")),
              ElevatedButton(
                  onPressed: () {
                    final loginState = BlocProvider.of<LoginBloc>(context).state;
                    final googleLoginState = BlocProvider.of<GoogleBloc>(context).state;
                    showDialog(context: context, builder: (context) =>
                        LogoutDialog(
                            title: 'Logout',
                            desc: 'Are you sure you want to log out?',
                            onConfirm: () {
                              print(loginState);
                              if(loginState is LoginCompleted) {
                                print("login block");
                                context.read<LoginBloc>().add(LogOutEvent());
                              }
                              else if(googleLoginState is GoogleCompleted){
                                print("Google login block");
                                context.read<GoogleBloc>().add(GoogleSignOutEvent());
                              }
                              else{
                                print("both ");
                              }
                            }
                          // controller.logoutUser(),
                        ));
                  },
                  child: Text("Logout"))
            ],
          ),
        ),

    );
  }
}
