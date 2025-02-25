import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../Theme/r.dart';

class InputPasswordWidget extends StatelessWidget {
final TextEditingController textEditingController;
  const InputPasswordWidget({super.key, required this.textEditingController,});

  @override
  Widget build(BuildContext context) {

    FocusNode f=FocusNode();
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF7F7F9),
        borderRadius: BorderRadius.circular(R.dimensions.borderRadiusMedium),
      ),
      child: TextFormField(

        controller: textEditingController,


        validator: (value) {
          if (value!.isEmpty) {
            Fluttertoast.showToast(msg: "Enter password");
          }
          return null;
        },
        obscureText: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: R.dimensions.paddingSmall * 2,vertical: R.dimensions.paddingSmall*1.3),
          hintStyle: TextStyle(color: R.colors.lightText),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: "......",
          suffixIcon: GestureDetector(
            onTap: () {
              // controller.obscurePassword.value = !controller.obscurePassword.value;
            },
            child: SizedBox(
              child: Icon(Icons.remove_red_eye)
            ),
          ),
        ),
      ),
    )
    ;
  }
}
