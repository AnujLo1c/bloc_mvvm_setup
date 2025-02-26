import 'package:bloc_setup/bloc/google_auth/google_bloc.dart';
import 'package:bloc_setup/view/home/widgets/logout_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../view_models/controller/home/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // HomeViewModel controller = Get.put(HomeViewModel());
    return BlocListener<GoogleBloc, GoogleState>(
      listener: (context, state) {
        if(state is GoogleSignOut){
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        body: Column(

          children: [
            Gap(100),
            ElevatedButton(
                onPressed: () {
                  // controller.fetchUserDetails();
                },
                child: Text("Fetch user details")),
            ElevatedButton(
                onPressed: () {
                  showDialog(context: context,builder: (context) => LogoutDialog(
                      title: 'Logout',
                      desc: 'Are you sure you want to log out?',
                      onConfirm: () {
                        // Navigator.pop(context);
                        context.read<GoogleBloc>().add(GoogleSignOutEvent());
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
