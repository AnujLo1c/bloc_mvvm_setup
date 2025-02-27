import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Theme/r.dart';

class BackNav extends StatelessWidget {
  final bool? closeApp;

  const BackNav({super.key, this.closeApp});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 0), // Ensures it is flush to the left
        child: IconButton(
          icon: SvgPicture.asset(R.assets.back),
          onPressed: () {
            if(closeApp??false){
              exit(0);
            }
            Navigator.pop(context);
          },
          style: IconButton.styleFrom(
            iconSize: R.dimensions.iconSizeMedium,
            shape: const CircleBorder(),
            padding: EdgeInsets.zero, // Removes default internal padding
            backgroundColor: const Color(0xFFF7F7F9),
            minimumSize: const Size(44, 44), // Ensures consistent size
          ),
        ),
      ),
    );
  }
}
