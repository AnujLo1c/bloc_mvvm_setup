import 'package:bloc_setup/res/routes/route_names.dart';
import 'package:bloc_setup/view/login/widgets/bottom_text_widget.dart';
import 'package:bloc_setup/view/login/widgets/greeting_text_title.dart';
import 'package:bloc_setup/widgets/back_nav.dart';
import 'package:bloc_setup/widgets/google_login_button.dart';
import 'package:bloc_setup/widgets/login_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../Theme/r.dart';
import '../../widgets/input_password_widget.dart';
import '../../widgets/input_title_widget.dart';
import '../../widgets/input_widget.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    var formkey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: height ,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: R.dimensions.paddingMedium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Gap(height*.08),
                      BackNav(),
            GreetingTextWidget(title: "Register Account", subtitle: "Fill your details or continue with social media"),
                Gap(height*0.03),
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      InputTitleWidget(title: "Your Name"),
                      Gap(height*0.01),
                      InputWidget(hint:"xxxxxxxxxx"),
                      Gap(height*0.01),
                      InputTitleWidget(title: "Email Address"),
                      Gap(height*0.01),
                      InputWidget(hint:"xyz@gmail.com"), Gap(20),
                      InputTitleWidget(title: "Password"),
                      Gap(height*0.01),

                      InputPasswordWidget(),
                    Gap(height*0.05),
                    LoginButtonWidget(formKey: formkey, title: "Sign Up", voidCallback: () {  },),

                    ],
                  ),
                ),
                Gap(height*0.02),
                GoogleLoginButton(),
                Spacer(),
                BottomTextWidget(
                    text: "Already Have Account? ",
                    buttonText: "Log In",
                    onPressed: (){
                      Navigator.pushNamed(context, RouteNames.loginView);
                    }),
                Gap(20)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
