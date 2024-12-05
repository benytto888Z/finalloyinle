import 'package:flutter/material.dart';
import 'package:loyinle/constants/dimens.dart';
import 'package:loyinle/constants/styles.dart';

class AcText extends StatelessWidget {
  final text;
  final number;
  const AcText({super.key, this.text, this.number});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$text.   ",
          style: AppStyles.style33BoldWhitily, /*TextStyle(
            fontSize: Dimens.twentySixW,
            color: Colors.white.withOpacity(0.56),
          ),*/
        ),
        Text(
          "$number/5",
          style: TextStyle(
            fontSize: Dimens.twentySixW * 1.3,
            color:  Colors.yellowAccent.withOpacity(0.9),
          ),
        ),
      ],
    );
  }
}
