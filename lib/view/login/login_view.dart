
import 'package:bloc_setup/res/routes/route_names.dart';
import 'package:bloc_setup/view/login/widgets/bottom_text_widget.dart';
import 'package:bloc_setup/view/login/widgets/greeting_text_title.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../Theme/r.dart';
import '../../widgets/back_nav.dart';
import '../../widgets/google_login_button.dart';
import '../../widgets/input_password_widget.dart';
import '../../widgets/input_title_widget.dart';
import '../../widgets/input_widget.dart';
import '../../widgets/login_button_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    // LoginViewModel controller=Get.put(LoginViewModel());
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
                      InputWidget(hint:"xyz@gmail.com"), Gap(20),
                      InputTitleWidget(title: "Password"),
                Gap(height*0.01),

                       InputPasswordWidget()],
                  ),
                ),
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
