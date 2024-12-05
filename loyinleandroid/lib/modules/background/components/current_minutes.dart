import 'package:flutter/material.dart';
import 'package:loyinle/constants/dimens.dart';


class CurrentMinutes extends StatelessWidget {
  const CurrentMinutes({
    Key? key,
    this.minutes = 00,
  }) : super(key: key);
  final int minutes;

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
        ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) => LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.white.withOpacity(0),
            ],
          ).createShader(
           Rect.fromLTWH(0.0, 0.0, bounds.width, bounds.height),
          ),
          child: Text(
            "0$minutes",
            style:  TextStyle(
              fontSize: Dimens.tenW * 15,
              fontWeight: FontWeight.w500,
              height: 8/Dimens.tenH,
            ),
          ),
        ),
    );
  }
}