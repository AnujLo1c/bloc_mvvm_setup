import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../Theme/r.dart';

class NotifyDialog extends StatelessWidget {
  const NotifyDialog({super.key});

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;

    return Dialog(
      backgroundColor: Colors.white,
      child: SizedBox(
        width: width *.9,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: R.colors.primary,
                  borderRadius: BorderRadius.circular(R.dimensions.borderRadiusLarge),
                ),
                child: const Icon(Icons.mail, color: Colors.white),
              ),
              const Gap(20),
              Text(
                "Check Your Email",
                style: TextStyle(
                  fontSize: R.dimensions.textSizeSmall,
                  fontFamily: R.fonts.ralewayBold,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Gap(10),
              SizedBox(
                width: width * 0.7,
                child: Text(
                  "We Have Sent Password Recovery Code To Your Email",
                  style: TextStyle(
                    color: R.colors.lightText,
                    fontSize: R.dimensions.textSizeSmall,
                    fontFamily: R.fonts.poppinsMedium,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}
