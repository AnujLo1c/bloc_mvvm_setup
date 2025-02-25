
import 'package:bloc_setup/res/routes/route_names.dart';
import 'package:bloc_setup/view/login/widgets/bottom_text_widget.dart';
import 'package:bloc_setup/view/login/widgets/greeting_text_title.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';

import '../../Theme/r.dart';
import '../../widgets/back_nav.dart';
import '../../widgets/google_login_button.dart';
import '../../widgets/input_password_widget.dart';
import '../../widgets/input_title_widget.dart';
import '../../widgets/input_widget.dart';
import '../../widgets/login_button_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final FocusNode _emailFocusNode = FocusNode();
  // final FocusNode _passwordFocusNode = FocusNode();

  final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();



    _emailFocusNode.addListener(() {
      print("Email Focus: ${_emailFocusNode.hasFocus}");
    });

  //   _passwordFocusNode.addListener(() {
  //     print("Password Focus: ${_passwordFocusNode.hasFocus}");
  //   });
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    // _passwordFocusNode.dispose();
    _emailController.dispose();
    // _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var formkey = GlobalKey<FormState>();
    final height=MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: R.dimensions.paddingMedium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap(height*.08),
                BackNav(),
                GreetingTextWidget(title: "Hello Again!", subtitle: "Fill Your Details Or Continue With Social Media"),
                Gap(height*0.03),
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      InputTitleWidget(title: "Email Address"),
                Gap(height*0.01),
                      InputWidget(hint:"xyz@gmail.com", textEditingController: _emailController, focusNode: _emailFocusNode),
                      Gap(20),
                      InputTitleWidget(title: "Password"),
                Gap(height*0.01),

                       // InputPasswordWidget(textEditingController: TextEditingController(),),


                    ],
                  ),
                ),
                // Container(
                //   decoration: BoxDecoration(
                //     color: const Color(0xFFF7F7F9),
                //     borderRadius: BorderRadius.circular(R.dimensions.borderRadiusMedium),
                //   ),
                //   child: TextFormField(
                //     controller: TextEditingController(),
                //     textInputAction: TextInputAction.done,
                //     validator: (value) {
                //       if (value!.isEmpty) {
                //         Fluttertoast.showToast(msg: "Enter email");
                //       }
                //       return null;
                //     },
                //     decoration: InputDecoration(
                //       contentPadding: EdgeInsets.symmetric(horizontal: R.dimensions.paddingSmall * 2),
                //       hintText: "hint",
                //       hintStyle: TextStyle(color: R.colors.lightText),
                //       border: InputBorder.none,
                //     ),
                //   ),
                // ),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      NavNamed(context, RouteNames.recoveryView);
                    },
                    child: Text(
                      "Recovery Password",
                      style: TextStyle(color: R.colors.lightText),
                    ),
                  ),
                ),
                Gap(height*0.01),
                // Gap(40),
                LoginButtonWidget(formKey: formkey,title: "Sign In",voidCallback: () {

                },),
                // Gap(heigh),
                Gap(height*0.03),
                GoogleLoginButton(),
                Spacer(),
                BottomTextWidget(text: "New User?",
                    buttonText: "Create Account", onPressed: (){
                 NavNamed(context, RouteNames.registerView);
                    }),

                Gap(20)
              ],
            ),
          ),
        ),
      ),
    );
  }

  NavNamed(BuildContext context, String name){
    Navigator.pushNamed(context, name);
  }
}
