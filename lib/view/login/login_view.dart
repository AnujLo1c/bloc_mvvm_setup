import 'dart:math';

import 'package:bloc_setup/bloc/login/login_bloc.dart';
import 'package:bloc_setup/res/routes/route_names.dart';
import 'package:bloc_setup/view/login/widgets/bottom_text_widget.dart';
import 'package:bloc_setup/view/login/widgets/greeting_text_title.dart';
import 'package:bloc_setup/view_models/controller/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../Theme/r.dart';
import '../../bloc/google_auth/google_bloc.dart';
import '../../widgets/back_nav.dart';
import '../../widgets/google_login_button.dart';
import '../../widgets/input_password_widget.dart';
import '../../widgets/input_title_widget.dart';
import '../../widgets/input_widget.dart';
import '../../widgets/login_button_widget.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final formKey = GlobalKey<FormState>();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final LoginController loginController=LoginController(context,formKey,emailFocusNode,passwordFocusNode);
    final height = MediaQuery.of(context).size.height;

    return BlocListener<LoginBloc, LoginState>(
  listener: (context, state) {
    if (state is LoginCompleted) {
      FocusScope.of(context).unfocus();
      loginController.navigateToHome();
    } else if (state is LoginError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.message), backgroundColor: Colors.red),
      );
    }
  },
  child: BlocListener<GoogleBloc, GoogleState>(
      listener: (context, state) {
        if (state is GoogleCompleted) {
          FocusScope.of(context).unfocus();
          loginController.navigateToHome();
        } else if (state is GoogleError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SizedBox(
            height: height,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: R.dimensions.paddingMedium,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Gap(height * 0.07),
                  BackNav(closeApp:true),
                  GreetingTextWidget(
                    title: "Hello Again!",
                    subtitle: "Fill Your Details Or Continue With Social Media",
                  ),
                  Gap(height * 0.03),

                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        InputTitleWidget(title: "Email Address"),
                        Gap(height * 0.01),
                        InputWidget(
                          hint: "xyz@gmail.com",
                          textEditingController: emailController,
                          focusNode: emailFocusNode,
                        ),
                        Gap(20),
                        InputTitleWidget(title: "Password"),
                        Gap(height * 0.01),
                        InputPasswordWidget(
                          textEditingController: passwordController,
                          focusNode: passwordFocusNode,
                        ),
                      ],
                    ),
                  ),

                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {
                       loginController.navigateToRecovery();
                      },
                      child: Text(
                        "Recovery Password",
                        style: TextStyle(
                          fontSize: R.dimensions.textSizeVerySmall,
                            fontFamily: R.fonts.poppins,
                            color: R.colors.lightText),
                      ),
                    ),
                  ),
                  Gap(height * 0.01),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      return LoginButtonWidget(
                        formKey: formKey,
                        title:
                            state is LoginLoading
                                ? "Signing In..."
                                : "Sign In",
                        voidCallback: () => loginController.onLogin(),
                      );
                    },
                  ),

                  Gap(height * 0.03),
                  GoogleLoginButton(function:()=>loginController.onGoogleLogin()),
                  Spacer(),
                  BottomTextWidget(
                    text: "New User?",
                    buttonText: "Create Account",
                    onPressed: () {
                      loginController.navigateToRegister();
                    },
                  ),
                  Gap(20),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
);
  }
}
