import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../Theme/r.dart';

class GreetingTextWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const GreetingTextWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: R.fonts.raleway,
            color: Colors.black,
            fontSize: R.dimensions.textSizeLarge,
            fontWeight: FontWeight.w700,

          ),
        ),
        const Gap(5),
        SizedBox(
          width: 250,
          child: Text(
            subtitle,
            style: TextStyle(
              fontFamily: R.fonts.poppins,
              color: R.colors.lightText,
              fontSize: R.dimensions.textSizeSmall,
              fontWeight: FontWeight.w400
            ),
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}