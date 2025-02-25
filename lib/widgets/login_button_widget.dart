import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Theme/r.dart';

class LoginButtonWidget extends StatelessWidget {
  final formKey;
  final String title;
  final VoidCallback voidCallback;
 const LoginButtonWidget({super.key,required this.formKey, required this.title, required this.voidCallback});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      if(formKey.currentState!.validate()){

      }
      voidCallback();

    },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(R.dimensions.borderRadiusMedium)),
          foregroundColor: Colors.white,
          backgroundColor: R.colors.primary,
            minimumSize: Size(MediaQuery.of(context).size.width-R.dimensions.paddingMedium, 50),
        ),

        child:  false?CircularProgressIndicator():Text(title,style: TextStyle(fontSize: R.dimensions.textSizeSmall),)
    );
  }
}
