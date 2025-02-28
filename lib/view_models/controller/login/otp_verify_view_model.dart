import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/otp/otp_bloc.dart';

class OtpVerifyController {


  static void dispose() {

  }



  static void onVerify(GlobalKey<FormState> formkey) {
    if (formkey.currentState!.validate()) {
      
    }
  }

  static void onResendOtp(BuildContext context) {
    context.read<OtpBloc>().add(StartResendTimer());
  }
}
