import 'package:bloc_setup/res/routes/route_names.dart';
import 'package:bloc_setup/view/login/widgets/bottom_text_widget.dart';
import 'package:bloc_setup/view/login/widgets/greeting_text_title.dart';
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

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return BlocListener<GoogleBloc, GoogleState>(
      listener: (context, state) {
        if (state is GoogleCompleted) {
          FocusScope.of(context).unfocus();
          Navigator.pushNamed(context, RouteNames.homeView);
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
                  BackNav(),
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
                          textEditingController: _emailController,
                          focusNode: _emailFocusNode,
                        ),
                        Gap(20),
                        InputTitleWidget(title: "Password"),
                        Gap(height * 0.01),
                        InputPasswordWidget(
                          textEditingController: _passwordController,
                          focusNode: _passwordFocusNode,
                        ),
                      ],
                    ),
                  ),

                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteNames.recoveryView);
                      },
                      child: Text(
                        "Recovery Password",
                        style: TextStyle(color: R.colors.lightText),
                      ),
                    ),
                  ),
                  Gap(height * 0.01),
                  BlocBuilder<GoogleBloc, GoogleState>(
                    builder: (context, state) {
                      return LoginButtonWidget(
                        formKey: formKey,
                        title:
                            state is GoogleLoading
                                ? "Signing In..."
                                : "Sign In",
                        voidCallback: () {
                          if (formKey.currentState!.validate()) {

                          }
                        },
                      );
                    },
                  ),

                  Gap(height * 0.03),

                  GoogleLoginButton(function:(){ context.read<GoogleBloc>().add(GoogleSignInEvent());}),
                  Spacer(),
                  BottomTextWidget(
                    text: "New User?",
                    buttonText: "Create Account",
                    onPressed: () {
                      Navigator.pushNamed(context, RouteNames.registerView);
                    },
                  ),
                  Gap(20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
