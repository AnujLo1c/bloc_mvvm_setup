import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../Theme/r.dart';


class InputWidget extends StatelessWidget {

  final String hint;
   const InputWidget({super.key,  required this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: R.colors.secondary,
        color: Color(0xFFF7F7F9),
        borderRadius:BorderRadius.circular(R.dimensions.borderRadiusMedium)
      ),
      child: TextFormField(
        controller: TextEditingController(),
        focusNode: FocusNode(),
        validator: (value) {
          if (value!.isEmpty) {
            Fluttertoast.showToast(msg: "Enter email");
          }
          return null;
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: R.dimensions.paddingSmall*2),
          hintText: hint,
          hintStyle: TextStyle(color: R.colors.lightText),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    )
    ;
  }
}
