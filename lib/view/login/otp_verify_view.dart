import 'package:bloc_setup/view/login/widgets/greeting_text_title.dart';
import 'package:bloc_setup/view/login/widgets/otp_input_widget.dart';
import 'package:bloc_setup/view_models/controller/login/otp_verify_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../Theme/r.dart';
import '../../bloc/otp/otp_bloc.dart';
import '../../widgets/back_nav.dart';

import '../../widgets/login_button_widget.dart';

class OtpVerifyView extends StatefulWidget {
  const OtpVerifyView({super.key});

  @override
  State<OtpVerifyView> createState() => _OtpVerifyViewState();
}

class _OtpVerifyViewState extends State<OtpVerifyView> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    context.read<OtpBloc>().add(ScreenInitialized());
  }

  @override
  Widget build(BuildContext context) {
    final OtpVerifyController otpVerifyController = OtpVerifyController(  );
    final double height = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: height,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: R.dimensions.paddingMedium,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(height * .07),
              BackNav(),
              Gap(height * .01),
              GreetingTextWidget(
                title: "OTP Verification",
                subtitle:
                "Please Check Your Email To See The Verification Code",
              ),
              Gap(height * 0.04),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  ' OTP Code',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: R.fonts.raleway,
                    fontSize: R.dimensions.textSizeSemiMedium,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Gap(height * 0.01),
              Form(
                key: formkey,
                child: Column(
                  children: [
                    OtpInputWidget(
                      controllers: List.generate(
                        4,
                            (index) => TextEditingController(),
                      ),
                      focusNodes: List.generate(4, (index) => FocusNode()),
                      onChanged: (otp) {
                        context.read<OtpBloc>().add(UpdateOtp(otp));
                      },
                      formKey: formkey,
                    ),
                    Gap(40),

                    LoginButtonWidget(
                      formKey: formkey,
                      title: "Verify",
                      voidCallback: () {
                        OtpVerifyController.onVerify(formkey);
                        // showDialog(
                        //   context: context,
                        //   builder: (context) {
                        //     return NotifyDialog();
                        //     },
                        // );
                      },
                    ),
                    Gap(3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () =>OtpVerifyController.onResendOtp(context),
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
                              fontFamily: R.fonts.raleway,
                              fontSize: R.dimensions.textSizeVerySmall,
                              color: R.colors.lightText,
                            ),
                          ),
                        ),
                        BlocBuilder<OtpBloc, OtpState>(
                          builder: (context, state) {
                            if (state is TimerRunning) {
                              return Text(
                                "00:${state.duration}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontFamily: R.fonts.raleway,
                                  fontSize: R.dimensions.textSizeVerySmall,
                                  color: R.colors.lightText,
                                ),
                              );
                            }

                            return Text(
                              "00:00",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: R.fonts.raleway,
                                fontSize: R.dimensions.textSizeVerySmall,
                                color: R.colors.lightText,
                              ),
                            );
                          },
                        ),
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
