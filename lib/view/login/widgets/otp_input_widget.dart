import 'package:flutter/material.dart';

import '../../../Theme/r.dart';

class OtpInputWidget extends StatelessWidget {
  final List<TextEditingController> controllers;
  final List<FocusNode> focusNodes;
  final ValueChanged<String> onChanged;

  final dynamic formKey;

  const OtpInputWidget({
    super.key,
    required this.controllers,
    required this.focusNodes,
    required this.onChanged, required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(4, (index) {
        return Container(
          width: 70,
          height: 56,
decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(R.dimensions.borderRadiusMedium                 ),
  color: R.colors.secondary
),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: TextField(

            controller: controllers[index],
            focusNode: focusNodes[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            style:  TextStyle(fontFamily: R.fonts.poppins, fontWeight: FontWeight.w600,
            fontSize: R.dimensions.textSizeSmall+2,color: Colors.black),//
            decoration: InputDecoration(
              counterText: "",
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none
            ),
            onChanged: (value) {
              if (value.isNotEmpty && index < 3) {
                FocusScope.of(context).nextFocus();
              } else if (value.isEmpty && index > 0) {
                FocusScope.of(context).previousFocus();
              }
              onChanged(controllers.map((e) => e.text).join());
            },
          ),
        );
      }),
    );
  }
}
