import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../Theme/r.dart';

class InputWidget extends StatefulWidget {
  final String hint;
  final TextEditingController textEditingController;
  final FocusNode focusNode;

  const InputWidget({super.key,

    required this.hint,
    required this.textEditingController, required this.focusNode,
  });

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F9),
        borderRadius: BorderRadius.circular(R.dimensions.borderRadiusMedium),
      ),
      child: TextFormField(

focusNode: widget.focusNode,
        controller: widget.textEditingController,
        textInputAction: TextInputAction.done,
        validator: (value) {
          if (value!.isEmpty) {
            Fluttertoast.showToast(msg: "Enter email");
          }
          return null;
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: R.dimensions.paddingSmall * 2),
          hintText: widget.hint,
          hintStyle: TextStyle(fontFamily: R.fonts.poppins,color: R.colors.lightText),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
