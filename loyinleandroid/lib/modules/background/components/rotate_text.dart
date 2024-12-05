import 'package:flutter/material.dart';

import 'package:loyinle/constants/dimens.dart';

class RotateText extends StatelessWidget {
  final String playerName;
  final double textAngle;
  const RotateText({super.key, required this.playerName, required this.textAngle});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: textAngle,
      child: Container(
        alignment: Alignment.bottomCenter,
        height: Dimens.tenH * 8,
        width: Dimens.tenW * 21,
       // color: Colors.white,
        padding: EdgeInsets.all(Dimens.eightW),
        child:  Text(
          playerName ,
          style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: Dimens.fourW + Dimens.fourW * 10,
               color:  Colors.purpleAccent.withOpacity(1),
          ),),
      ),
    );
  }
}
