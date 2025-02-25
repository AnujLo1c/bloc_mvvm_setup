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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(fontSize: R.dimensions.textSizeSmall),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: TextStyle(color: Colors.black, fontSize: R.dimensions.textSizeSmall),
          ),
        ),
      ],
    );
  }
}
