import 'package:flutter/material.dart';
import 'package:loyinle/constants/styles.dart';

class RichieText extends StatelessWidget {
  final text;
  final number;
  const RichieText({super.key, this.text, this.number});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "$text.   ",
        style: AppStyles.style33BoldWhitily, /*TextStyle(
          fontSize: Dimens.twentyFourW * 1.4,
          color: Colors.white.withOpacity(0.8),
        ),*/
        children: [
          TextSpan(
            text: number.toString(),
            style: TextStyle(
              color: Colors.yellowAccent.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }
}
