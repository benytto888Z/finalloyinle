import 'package:flutter/material.dart';

import 'package:loyinle/constants/dimens.dart';

class RotateScoreText extends StatelessWidget {
  final String score;
  final double textAngle;
  const RotateScoreText({super.key, required this.score, required this.textAngle});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: textAngle,
      child: Container(
        padding: EdgeInsets.all(Dimens.eightW),
        child:  Text(
          score.toString() ,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: Dimens.tenW * 9,
            color:  Colors.yellowAccent.withOpacity(0.9),
          ),),
      ),
    );
  }
}
