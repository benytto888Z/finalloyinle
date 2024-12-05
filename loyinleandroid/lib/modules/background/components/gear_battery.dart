import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:loyinle/constants/dimens.dart';
import 'package:loyinle/constants/styles.dart';

import '../dashboard.dart';

class GearAndBattery extends StatelessWidget {
  const GearAndBattery({
    Key? key,
    required this.constraints, required this.score, required this.bestPlayer,
  }) : super(key: key);

  final BoxConstraints constraints;
  final String score;
  final String bestPlayer;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.blueGrey.withOpacity(0.15),
      width: constraints.maxWidth * 74/Dimens.tenW * 10,
      height: constraints.maxHeight * 3/Dimens.tenH,
      child: LayoutBuilder(
        builder: (context, gearConstraints) => Stack(
          fit: StackFit.expand,
          children: [
            CustomPaint(
              painter: GearPrinter(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 // const Gears(),
                  Text(bestPlayer.toUpperCase() , style: AppStyles.styleGeneralWhitily(Dimens.elevenW * 5, FontWeight.bold, Colors.purpleAccent.withOpacity(1),)),
                 // SizedBox(width: Dimens.elevenW,),
                  SizedBox(
                    height: Dimens.tenH * 20,
                    child: Lottie.asset(
                      "assets/animations/Cup.json",
                     // width: Dimens.tenW * 20,
                    ),
                  ),
                  //SizedBox(width: Dimens.elevenW,),
                  Text.rich(
                    TextSpan(
                   //   text: ": ",
                     // text: "   ",
                      style: TextStyle(
                        fontSize: Dimens.twelveW * 5,
                        color: Colors.blueAccent.withOpacity(0.9),
                      ),
                      children: [
                        TextSpan(
                          text: score,
                          style: AppStyles.styleGeneralWhitily(Dimens.elevenW * 6, FontWeight.bold, Colors.yellowAccent.withOpacity(1),)
                        ),
                      ],
                    ),
                  ),
                 /* Padding(
                    padding: EdgeInsets.only(bottom: Dimens.fiveH),
                    child: SizedBox(
                      width: gearConstraints.maxWidth * 0.72,
                      child: Row(
                        children: [
                          Text(
                            "E",
                            style: TextStyle(
                              fontSize: Dimens.twentyW,
                              fontWeight: FontWeight.w500,
                              color: Colors.white.withOpacity(0.16),
                            ),
                          ),
                           SizedBox(width: Dimens.tenW),
                          Expanded(
                            child: SizedBox(
                              height: Dimens.eightH,
                              child: ClipPath(
                                clipper: BatteryStatusCliper(),
                                child: CustomPaint(
                                  painter: DashLinePainter(progress: 1),
                                ),
                              ),
                            ),
                          ),
                           Padding(
                            padding: EdgeInsets.only(left: Dimens.tenW),
                            child: const Text(
                              "100%",
                              style: TextStyle(
                                color: Color(0xFF77C000),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),*/
                ],
              ),
            ),
            Positioned(
    /* top: gearConstraints.maxHeight * 0.10,
              left: gearConstraints.maxWidth * 0.16,
              width: gearConstraints.maxWidth * 0.17,
              height: gearConstraints.maxHeight * 0.38,*/

              top: gearConstraints.maxHeight * 10/Dimens.tenH * 10,
              left: gearConstraints.maxWidth * 16/Dimens.tenW * 10,
              width: gearConstraints.maxWidth * 17/Dimens.tenW * 10,
              height: gearConstraints.maxHeight * 38/Dimens.tenH * 10,

              child: CustomPaint(
                painter: AvgWattPerKmPrinter(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: gearConstraints.maxWidth * 0.025),
                    Text(
                      "Ac. ",
                      style: TextStyle(
                        fontSize: Dimens.sixTeenW,
                        color: Colors.white.withOpacity(0.16),
                      ),
                    ),
                    Text(
                      "5/10",
                      style: TextStyle(
                        fontSize:  Dimens.sixTeenW,
                        color: Colors.white.withOpacity(0.32),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
    /*top: gearConstraints.maxHeight * 0.10,
              right: gearConstraints.maxWidth * 0.16,
              width: gearConstraints.maxWidth * 0.17,
              height: gearConstraints.maxHeight * 0.38 ,*/
              top: gearConstraints.maxHeight * 10/Dimens.tenH * 10,
              right: gearConstraints.maxWidth * 16/Dimens.tenW * 10,
              width: gearConstraints.maxWidth * 17/Dimens.tenW * 10,
              height: gearConstraints.maxHeight * 38/Dimens.tenH * 10,

              child: CustomPaint(
                painter: OdoPrinter(),
                child: Row(
                  children: [
                    Text(
                      "Ac. ",
                      style: TextStyle(
                        fontSize: Dimens.sixTeenW,
                        color: Colors.white.withOpacity(0.16),
                      ),
                    ),
                    Text(
                      "2/10",
                      style: TextStyle(
                        fontSize: Dimens.sixTeenW,
                        color: Colors.white.withOpacity(0.32),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BatteryStatusCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width * 0.05, 0)
      ..lineTo(size.width * 0.95, 0)
      ..lineTo(size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class AvgWattPerKmPrinter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xFF6B4339)
      ..style = PaintingStyle.fill;

    // paint.shader = LinearGradient(colors: colors)
     double strokeWidth = 4.r;
    Path path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width * 0.27, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width * 0.27, strokeWidth);

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class OdoPrinter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xFF6B4339)
      ..style = PaintingStyle.fill;

    // paint.shader = LinearGradient(colors: colors)
     double strokeWidth = 4.r;
    Path path = Path()
      ..lineTo(size.width * 0.73, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width * 0.73, strokeWidth);
    // ..lineTo(size.width, 0);

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
