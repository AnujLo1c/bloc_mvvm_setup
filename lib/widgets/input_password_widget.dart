import 'package:bloc_setup/cubit/obscure_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../Theme/r.dart';

class InputPasswordWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final FocusNode focusNode;

  const InputPasswordWidget(
      {super.key, required this.textEditingController, required this.focusNode,});

  @override
  Widget build(BuildContext context) {
    FocusNode f = FocusNode();
    return BlocProvider(
      create: (_) => ObscureCubit(),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF7F7F9),
          borderRadius: BorderRadius.circular(R.dimensions.borderRadiusMedium),
        ),
        child: BlocBuilder<ObscureCubit, bool>(
          builder: (context, state) {
            return TextFormField(

              controller: textEditingController,
              focusNode: focusNode,

              validator: (value) {
                if (value!.isEmpty) {
                  Fluttertoast.showToast(msg: "Enter password");
                }
                return null;
              },
              obscureText:state,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    horizontal: R.dimensions.paddingSmall * 2,
                    vertical: R.dimensions.paddingSmall * 1.3),
                hintStyle: TextStyle(color: R.colors.lightText),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: "......",
                suffixIcon: GestureDetector(
                  onTap: () {
                    context.read<ObscureCubit>().toggleVisibility();
                  },
                  child: state?ImageIcon(
                      AssetImage(R.assets.eyeslash)
                  ):Icon(Icons.remove_red_eye,size: 20,),
                ),
              ),
            );
          },
        ),
      ),
    )
    ;
  }
}
