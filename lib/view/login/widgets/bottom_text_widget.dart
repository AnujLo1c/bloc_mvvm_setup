import 'package:flutter/material.dart';

import '../../../Theme/r.dart';

class BottomTextWidget extends StatelessWidget {
  final String text;
  final String buttonText;
  final VoidCallback onPressed;

  const BottomTextWidget({
    super.key,
    required this.text,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: TextStyle(fontSize: R.dimensions.textSizeSmall,fontFamily: R.fonts.raleway,
          color: R.colors.lightText),
        ),
        GestureDetector(
          onTap: onPressed,
          child: Text(
            buttonText,
            style: TextStyle(color: Colors.black, fontSize: R.dimensions.textSizeSmall,fontFamily: R.fonts.raleway),
          ),
        ),
      ],
    );
  }
}
