import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../Theme/r.dart';

class BackNav extends StatelessWidget {
  const BackNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
        icon: SvgPicture.asset(R.assets.back),
        onPressed: (){},
        style: IconButton.styleFrom(
          iconSize: R.dimensions.iconSizeMedium,
          shape: CircleBorder(),
            padding: EdgeInsets.symmetric(
              vertical: R.dimensions.paddingMedium,
              horizontal: R.dimensions.paddingMedium-2,
          ),
          backgroundColor: Color(0xFFF7F7F9)
        ),

      ),
    );
  }
}
