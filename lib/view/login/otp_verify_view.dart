import 'package:bloc_setup/view/login/widgets/greeting_text_title.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../Theme/r.dart';
import '../../res/routes/route_names.dart';
import '../../widgets/back_nav.dart';
import '../../widgets/input_title_widget.dart';
import '../../widgets/input_widget.dart';
import '../../widgets/login_button_widget.dart';

class OtpVerifyView extends StatelessWidget {
  const OtpVerifyView({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var formkey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: height,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: R.dimensions.paddingMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(height * .08),
              BackNav(),
              Gap(height * .01),
              GreetingTextWidget(
                title: "OTP Verification",
                subtitle: "Please Check Your Email To See The Verification Code",
              ),
              Gap(height * 0.04),
              Align(
                alignment: Alignment.topLeft,
                child: Text('OTP Code',

                style: TextStyle(
fontWeight: FontWeight.w600,
                  fontFamily: R.fonts.ralewaySemiBold,
                  fontSize: R.dimensions.textSizeSemiMedium
                ),
                textAlign: TextAlign.left,),
              ),
              Form(
                key: formkey,
                child: Column(
                  children: [
                    InputWidget(hint: "xxxxxxxxxx"),
                    Gap(height * 0.05),

                    LoginButtonWidget(
                      formKey: formkey,
                      title: "Verify",
                      voidCallback: () {
                        // showDialog(
                        //   context: context,
                        //   builder: (context) {
                        //     return NotifyDialog();
                        //     },
                        // );
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero, 
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            visualDensity: VisualDensity.compact,
                          ),
                          child: Text(
                            "Resend Code",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: R.fonts.ralewayMedium,
                              fontSize: R.dimensions.textSizeVerySmall,
                              color: R.colors.lightText,
                            ),
                          ),
                        ),
                        Text("00:30",style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: R.fonts.ralewayMedium,
                          fontSize: R.dimensions.textSizeVerySmall,
                          color: R.colors.lightText,
                        ),)
                      ],
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
