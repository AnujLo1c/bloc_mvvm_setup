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
            fontFamily: R.fonts.poppinsMedium,
            color: Colors.black,
            fontSize: R.dimensions.textSizeLarge,
            fontWeight: FontWeight.bold,

          ),
        ),
        const Gap(5),
        SizedBox(
          width: 250,
          child: Text(
            subtitle,
            style: TextStyle(
              color: R.colors.lightText,
              fontSize: R.dimensions.textSizeSmall,
            ),
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}