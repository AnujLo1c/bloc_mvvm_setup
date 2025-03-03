import 'package:bloc_setup/res/routes/route_names.dart';
import 'package:bloc_setup/view/login/widgets/greeting_text_title.dart';
import 'package:bloc_setup/view/login/widgets/notify_dialog.dart';
import 'package:bloc_setup/view_models/controller/login/recovery_view_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../Theme/r.dart';
import '../../widgets/back_nav.dart';
import '../../widgets/input_title_widget.dart';
import '../../widgets/input_widget.dart';
import '../../widgets/login_button_widget.dart';

class RecoveryView extends StatelessWidget {
   RecoveryView({super.key});
    final formkey = GlobalKey<FormState>();
   final FocusNode focusNode = FocusNode();
final TextEditingController textEditingController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: height,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: R.dimensions.paddingMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(height * .07),
              BackNav(),
              Gap(height * .01),
              GreetingTextWidget(
                title: "Forgot Password",
                subtitle: "Enter your Email account to reset your password",
              ),
              Gap(height * 0.04),
              Form(
                key: formkey,
                child: Column(
                  children: [
                    InputWidget(hint: "xxxxxxxxxx", textEditingController: textEditingController, focusNode: focusNode,),
                    Gap(height * 0.05),

                    LoginButtonWidget(
                      formKey: formkey,
                      title: "Reset password",
                      voidCallback: () => RecoveryViewModel.resetPassword(context,formkey,textEditingController,focusNode),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
