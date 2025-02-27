import 'package:flutter/material.dart';

class OtpVerifyController {
  final BuildContext context;
  final GlobalKey<FormState> formKey;


  OtpVerifyController(this.context,this.formKey);

  void dispose() {

  }

  void onOtpChanged(String otp) {
    
  }

  void onVerify() {
    if (formKey.currentState!.validate()) {
      
    }
  }

  void onResendOtp() {
    
  }
}
