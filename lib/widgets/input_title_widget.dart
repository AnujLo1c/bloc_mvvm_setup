import 'package:flutter/material.dart';

import '../../../Theme/r.dart';

class InputTitleWidget extends StatelessWidget {
  final String title;
  const InputTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomLeft,
        child: Text(title,style: TextStyle(fontSize: R.dimensions.textSizeSmall),));
  }
}
