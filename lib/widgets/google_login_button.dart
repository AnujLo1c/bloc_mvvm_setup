import 'package:flutter/material.dart';

import '../../../Theme/r.dart';

class GoogleLoginButton extends StatelessWidget {
  const GoogleLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(R.dimensions.borderRadiusMedium),
        ),
        foregroundColor: Colors.white,
        backgroundColor: R.colors.secondary,
        minimumSize: Size(
          MediaQuery.of(context).size.width - R.dimensions.paddingMedium,
          50,
        ),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset(R.assets.google,height: R.dimensions.iconSizeMedium,), Text("Sign In With Google",style: TextStyle(color: Colors.black,fontSize: R.dimensions.textSizeSmall),)]),
    );
  }
}
