import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:loyinle/apis/api_provider.dart';
import 'package:loyinle/constants/dimens.dart';
import 'package:loyinle/constants/styles.dart';
import 'package:loyinle/modules/background/components/acText.dart';
import 'package:loyinle/modules/background/components/current_minutes.dart';
import 'package:loyinle/modules/background/components/richText.dart';
import 'package:loyinle/modules/background/components/rotate_score_text.dart';
import 'package:loyinle/modules/home/components/slide_count_down.dart';
import 'package:loyinle/modules/home/controllers/configs_controller.dart';
import 'package:loyinle/utils/utilities.dart';
import 'package:wakelock/wakelock.dart';
import 'dart:ui' as ui;

import 'components/animated_countdown.dart';
import 'components/gear_battery.dart';
import 'components/rotate_text.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  ConfigsController configsCtrl = Get.put(ConfigsController());

  final gameStorage = GetStorage();
  var gamePlayers = {};
  var gameInfos = {};
  var nbturns = "";
  int currentTurn = 1;
  int lastTurn = 0;
  var nbplayers = "";
  bool firstLoad = true;

  int minutes = 0;
  String turnTimeP1 = "00 M : 00 S";
  String turnTimeP2 = "00 M : 00 S";
  bool finishTurnP1 = false;
  bool finishTurnP2 = false;
  bool finishParty = false;

  int nbP1Fault = 0 ;
  int nbP2Fault = 0 ;

  int nbP1Level = 0 ;
  int nbP2Level = 0 ;

  int scoreP1 = 0;
  int scoreP2 = 0;


  int oldScoreP1 = 0;
  int oldScoreP2 = 0;

  int bestScore = 0;
  String bestPlayer = "";
  bool isPlayersEqual = false;

  bool startCircuitTime = false;
  bool startPartyTime = false;
  //int minutesTurn = 2;
  int minutesTurn = 3;
  bool turnStart = false;

  int secDuration = 60;


  @override
  initState() {
    // TODO: implement initState
    super.initState();
    getPlayersName();
   // getGameInfos();
  }

  // retrieve game players name from localstorage
  getPlayersName() async {
    final players = await gameStorage.read("playersName");

    if (players == null) {
      return;
    } else {
      var decodedData = jsonDecode(players) as Map<String, dynamic>;
      gamePlayers = decodedData;
      print("gamePlayers");
      print(gamePlayers);
    }
  }

  getGameInfos()  async {
    final infos = await gameStorage.read("gameInfos");

    if (infos == null) {
      return 5;
    } else {
      var decodedData = jsonDecode(infos) as Map<String, dynamic>;

        gameInfos = decodedData;
    }
   setState(() {

   });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Wakelock.disable();
  }

  //List<double> speedLineOpacities = [0.8, 0.7, 0.6, 0.4, 0.3, 0.2, 0.15, 0.1];
  //List<double> speedLineOpacities = [1, 1, 1, 1, 1, 1, 1, 1,1,1];
  List<double> speedLineOpacities = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

  @override
  Widget build(BuildContext context) {
    if (firstLoad) {
      getPlayersName();
      getGameInfos();
      setState(() {});
      firstLoad = false;
    }

    final Size size = Get.mediaQuery.size;
    return GetBuilder<ConfigsController>(
      assignId: true,
      builder: (cfgCtrl) {

        if(!cfgCtrl.partyFinish){
          sendInfosStartParty();
        }
        print("partyInfosLive");
        print(cfgCtrl.partyInfosLive);
        print(gameInfos);

        if(cfgCtrl.partyInfosLive["startTurn"] == true) {
          print("enable starting turn");
          startCircuitTime = true;
          startPartyTime = true;
          if(!turnStart){
            nbP1Fault = 0 ;
            nbP2Fault = 0;
            nbP1Level = 0;
            nbP2Level = 0;

            finishTurnP1 = false;
            finishTurnP2 = false;

            turnTimeP1 = "00 M : 00 S";
            turnTimeP2 = "00 M : 00 S";


            // cfgCtrl.setTurnsFinishForPlayers(false);

            turnStart = true;
            minutes = 0;
          }

          if (cfgCtrl.partyInfosLive["hasTriggered"] == true) {
            // print("some player touch the circuitt in loyinleesp32");
           // int playerCircuit = stream.data!.circuitTouchNB;
            var playerCircuit = cfgCtrl.partyInfosLive["circuitTouchNB"];
            var levelTouchNumberPos =  cfgCtrl.partyInfosLive["levelNB"];

            if (playerCircuit == 1 && levelTouchNumberPos == 0) {
              nbP1Fault = nbP1Fault + 1;
            }

            if (playerCircuit == 1 && levelTouchNumberPos != 0) {
              nbP1Level = levelTouchNumberPos;
            }

            if (playerCircuit == 2 && levelTouchNumberPos == 0) {
              nbP2Fault = nbP2Fault + 1;
            }

            if (playerCircuit == 2 && levelTouchNumberPos != 0) {
              nbP2Level = levelTouchNumberPos;
            }


            // finish last level for P1 and P2


            if (playerCircuit == 1 && levelTouchNumberPos == 5 && finishTurnP1==false) {
              int nbsec = secDuration - cfgCtrl.timerPeriodic;
              turnTimeP1 = "0$minutes mn:${nbsec.toString().padLeft(1, '0')} s";
              finishTurnP1 = true;
              sendInfosFinishTurnP1();

            }

            if (playerCircuit == 2 && levelTouchNumberPos == 5 && finishTurnP2==false) {
              int nbsec = secDuration - cfgCtrl.timerPeriodic;
              turnTimeP2 = "0$minutes mn : ${nbsec.toString().padLeft(1, '0')} s";
              finishTurnP2 = true;
              sendInfosFinishTurnP2();
            }

            /* print(stream.data!.levelNB.toString());
                        print(stream.data!.circuitTouchNB.toString());*/

            scoreP1 = oldScoreP1 + AppUtility.calculateScore(nbP1Level, nbP1Fault);
            scoreP2 = oldScoreP2 + AppUtility.calculateScore(nbP2Level, nbP2Fault);

            if (scoreP1 > scoreP2) {
              bestScore = scoreP1;
              bestPlayer = cfgCtrl.playersName['pln1'];
              isPlayersEqual = false;
            } else if (scoreP2 > scoreP1) {
              bestScore = scoreP2;
              bestPlayer = cfgCtrl.playersName['pln2'];
              isPlayersEqual = false;
            } else {
              isPlayersEqual = true;
            }

            if(finishTurnP1 && finishTurnP2){
              cfgCtrl.setTurnsFinishForPlayers(true);
              oldScoreP1 = scoreP1;
              oldScoreP2 = scoreP2;
              sendInfosFinishTurn();
            }

          }
        }else{
          startCircuitTime = false;
          turnStart = false;
          cfgCtrl.setTurnsFinishForPlayers(false);
        }

        return Scaffold(
          backgroundColor: Colors.black,
          body: Container(
            child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Positioned(
                            top: Dimens.tenH*2,
                            left: Dimens.tenW*4 ,
                            child: Container(
                              alignment: Alignment.topCenter,
                              padding: EdgeInsets.all(9),
                             /* width: 300,
                              height: 120,*/
                              decoration:const BoxDecoration(
                                color:Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(9.0)),
                              ),
                              child: Column(
                                children: [
                                  Text("GAME MODE", style: AppStyles.styleGeneralWhitily(Dimens.fiveW * 8, FontWeight.w900, Colors.red),),
                                  SizedBox(height: Dimens.sevenH,),
                                  Text(cfgCtrl.gameMode["gamemode"] ?? "| ADVENTURE |", style: AppStyles.styleGeneralWhitily(Dimens.fiveW * 7, FontWeight.w800, Colors.black),),
                                //  Text("| EASY |", style: AppStyles.styleGeneralWhitily(Dimens.fiveW * 6, FontWeight.w800, Colors.black),),
                                ],
                              ),
                            )),
                        Positioned(
                            top: Dimens.tenH * 8,
                            right: Dimens.tenW * 5,
                            child: GSlideCountdown(
                              topGo: startPartyTime,
                                //duration: int.parse(gameInfos['nbTurns'] ?? "1") != 1 ? int.parse(gameInfos['nbTurns']) : 1)),
                                duration: int.parse(gameInfos['nbTurns']))),

                        Positioned(
                          top: Dimens.twentyH * 20 +
                              Dimens.oneH,
                          left: Dimens.tenW * 12,
                          child:  Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AcText(text: "LEV", number:"$nbP1Level") ,
                              RichieText(
                                text: "FAULTS",
                                number: "$nbP1Fault",
                              ),
                               RichieText(
                                text: "TURN-TIME",
                                number: "\n    $turnTimeP1",
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: Dimens.twentyH * 20 +
                              Dimens.oneH,
                          right: Dimens.tenW * 12,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AcText(text: "LEV", number: "$nbP2Level"),
                              RichieText(
                                text: "FAULTS",
                                number: "$nbP2Fault",
                              ),
                              RichieText(
                                text: "TURN-TIME",
                                number: "\n   $turnTimeP2",
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                            top: Dimens.twentyFirstH * 9,
                            left: Dimens.twelveW * 10 + Dimens.sevenW,
                            child: RotateScoreText(
                              score: scoreP1 >= 0 ? AppUtility.scoreFormat(scoreP1,3) : "-${AppUtility.scoreFormat(-1 * (scoreP1),3)}",
                              textAngle: -pi / 43.4.r,
                            )),
                        Positioned(
                            top: Dimens.twentyFirstH * 9,
                            right: Dimens.elevenW * 10,
                            child: RotateScoreText(
                              score: scoreP2 >= 0 ? AppUtility.scoreFormat(scoreP2,3) : "-${AppUtility.scoreFormat(-1 * (scoreP2),3)}",
                              textAngle: -pi / -43.3.r,
                            )),
                        Positioned(
                            top: Dimens.tenH * 37,
                            left: -Dimens.tenW * 4.9,
                            child: RotateText(
                              // playerName: cfgCtrl.partyConfigs['players'] != null ? cfgCtrl.partyConfigs['players'][0] : "", textAngle: -pi / 3.75,)),
                            playerName:AppUtility.formatPseudo(cfgCtrl.playersName['pln1']) ?? "",
                            // playerName:"AMAKN",
                              textAngle: -pi / 3.75,
                            )),
                        Positioned(
                            top: Dimens.tenH * 38 + Dimens.threeH * 1.4,
                            right: -Dimens.thirtyW * 2,
                            child: RotateText(
                              playerName: AppUtility.formatPseudo(cfgCtrl.playersName['pln2']) ?? "",
                            // playerName: "LOPITA",
                              textAngle: pi / 3.5,
                            )),
                        Positioned(
                          top: Dimens.fifTeenH * 10 + Dimens.fiveH,
                          child: SizedBox(
                            height: Dimens.twentyH * 20,
                            child: CountDownWidget(
                              startCount: startCircuitTime,
                              textStyle: TextStyle(
                                fontSize: Dimens.tenW * 20,
                                fontWeight: FontWeight.w700,
                                height: 9 / Dimens.tenH,
                              ),
                              totalDuration: secDuration,
                              maxTextSize: Dimens.tenW * 20,
                              minTextSize: 0,
                              onEnd: () async {
                                // do some job if needed
                                AppUtility.printLog("END TURN");
                                if(turnStart){
                                  setState((){
                                    minutes = minutes + 1;
                                  });
                                }

                                if(minutes >= minutesTurn){
                                  oldScoreP1 = scoreP1;
                                  oldScoreP2 = scoreP2;
                                  await sendInfosFinishTurn(); // send finish turn info to esp32 to stop channel
                                }
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          top: -Dimens.fifTeenH * 10 + Dimens.fiveH,
                          child: SizedBox(
                            // color: Colors.blue,
                            height: Dimens.tenH * 70,
                            child: Lottie.asset(
                              "assets/animations/circlelottie2.json",
                              width: Dimens.tenW * 70,
                            ),
                          ),
                        ),
                        ( scoreP1 != scoreP2 && cfgCtrl.partyFinish) ? Positioned(
                          top: Dimens.tenH * 8,
                          left: scoreP1 > scoreP2 ? -Dimens.tenW * 11 : Dimens.tenW * 45,
                          child: SizedBox(
                            // color: Colors.blue,
                            height: Dimens.tenH * 70,
                            child: Lottie.asset(
                              "assets/animations/Confetti3.json",
                              width: Dimens.tenW * 70,
                            ),
                          ),
                        ):  const SizedBox(),
                        SizedBox(
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.all(Dimens.sixTeenH),
                                  child: AspectRatio(
                                    aspectRatio: 24 / Dimens.tenH,
                                    child: LayoutBuilder(
                                      builder: (context, constraints) =>
                                          CustomPaint(
                                        painter: PathPainter(),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Stack(
                                                fit: StackFit.loose,
                                                children: [
                                                  ...List.generate(
                                                    speedLineOpacities.length,
                                                    (index) => Positioned(
                                                      bottom: Dimens.twentyH +
                                                          (2 * index).toDouble(),
                                                      left: constraints.maxWidth *
                                                              0.13 -
                                                          (Dimens.thirtyW *
                                                              index),
                                                      height:
                                                          constraints.maxHeight *
                                                              0.8,
                                                      width:
                                                          constraints.maxWidth *
                                                              0.31,
                                                      child: Opacity(
                                                        opacity:
                                                            speedLineOpacities[
                                                                index],
                                                        child: CustomPaint(
                                                          painter:
                                                              SpeedLinePainter(),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  ...List.generate(
                                                    speedLineOpacities.length,
                                                    (index) => Positioned(
                                                      bottom: Dimens.twentyH +
                                                          (2 * index).toDouble(),
                                                      right:
                                                          constraints.maxWidth *
                                                                  0.13 -
                                                              (Dimens.thirtyW *
                                                                  index),
                                                      height:
                                                          constraints.maxHeight *
                                                              0.8,
                                                      width:
                                                          constraints.maxWidth *
                                                              0.31,
                                                      child: Transform.scale(
                                                        scaleX: -1,
                                                        child: Opacity(
                                                          opacity:
                                                              speedLineOpacities[
                                                                  index],
                                                          child: CustomPaint(
                                                            painter:
                                                                SpeedLinePainter(),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      Positioned(
                                                          top: Dimens.sevenTeenH *
                                                              5,
                                                          child: CurrentMinutes(
                                                              minutes: minutes)),
                                                      Positioned(
                                                          bottom: -Dimens.eightH *
                                                              2.1,
                                                          child: !isPlayersEqual ? GearAndBattery(
                                                              bestPlayer:
                                                              bestPlayer,
                                                             // "LOPITA",
                                                              score: bestScore >= 0 ? AppUtility.scoreFormat(bestScore,3) : "-${AppUtility.scoreFormat(-1 * bestScore,3)}",
                                                              constraints:
                                                                  constraints)
                                                      :  Text("SCORES EQUAL",
                                                              style: AppStyles.styleGeneralWhitily(Dimens.elevenW * 5, FontWeight.bold, Colors.yellow.withOpacity(1),),),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )

                            ),
                      ],
                    ),
          ),
        );
      },
    );
  }
}

class PathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, size) {
    Paint paint = Paint()
      // ..color = Colors.red
      ..shader = const LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.bottomRight,
        // end: a,
        colors: [
          Color(0xFF6B4339),
          //  Color(0xff3ecb39),
          Color(0xFF52342C),
        ],
      ).createShader(const Offset(0, 0) & size)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6.0;

    // paint.shader = LinearGradient(colors: colors)

    Path path = Path();
    path.moveTo(0, size.height / 2);
    path.lineTo(size.width * 0.13, size.height * 0.05);
    path.lineTo(size.width * 0.31, 0);
    path.lineTo(size.width * 0.39, size.height * 0.11);
    path.lineTo(size.width * 0.60, size.height * 0.11);
    path.lineTo(size.width * 0.69, 0);
    path.lineTo(size.width * 0.87, size.height * 0.05);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width * 0.87, size.height);
    path.lineTo(size.width * 0.13, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.0005689770, size.height * 0.3041205);
    path_0.lineTo(size.width * 0.2497788, size.height * 0.001075241);
    path_0.lineTo(size.width * 0.02446195, size.height * 0.3041205);
    path_0.lineTo(size.width * 0.9998265, size.height * 0.9989247);
    path_0.lineTo(size.width * 0.0005689770, size.height * 0.3041205);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.2325310, size.height * 0.1075232),
        Offset(size.width * 0.05690000, size.height * 0.3567081),
        [const Color(0xff6B4339).withOpacity(1), const Color(0xff8B7268)],
        [0, 1]);
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.0005689770, size.height * 0.3041205);
    path_1.lineTo(size.width * 0.2497788, size.height * 0.001075241);
    path_1.lineTo(size.width * 0.02446195, size.height * 0.3041205);
    path_1.lineTo(size.width * 0.9998265, size.height * 0.9989247);
    path_1.lineTo(size.width * 0.0005689770, size.height * 0.3041205);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.shader = ui.Gradient.radial(
      const Offset(0, 0),
      size.width * 0.001769912,
      [
        const Color(0xffE2BDAD).withOpacity(0.85),
        const Color(0xffE2BDAD).withOpacity(0),
      ],
      [0, 1],
    );
    canvas.drawPath(path_1, paint1Fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.0005689770, size.height * 0.3041205);
    path_2.lineTo(size.width * 0.2497788, size.height * 0.001075241);
    path_2.lineTo(size.width * 0.02446195, size.height * 0.3041205);
    path_2.lineTo(size.width * 0.9998265, size.height * 0.9989247);
    path_2.lineTo(size.width * 0.0005689770, size.height * 0.3041205);
    path_2.close();

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.shader = ui.Gradient.linear(
        Offset(size.width * 1.251189, size.height * 1.259853),
        Offset(size.width * 0.1584545, size.height * 0.01942938), [
      const Color(0xff6B4339).withOpacity(1),
      const Color(0xff6B4339).withOpacity(0)
    ], [
      0,
      1
    ]);
    canvas.drawPath(path_2, paint2Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class AverageMillagePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.28, size.height * 0);
    path_0.lineTo(size.width, size.height * 0.00);
    path_0.lineTo(size.width * 0.295, size.height * 0.086);
    path_0.lineTo(size.width * 0.00, size.height * 0.98);
    path_0.lineTo(size.width * 0.28, size.height * 0.00);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.9125874, size.height * -0.000008129217),
        Offset(size.width * 0.8369860, size.height * 1.762893), [
      const Color(0xff6B4339).withOpacity(1),
      const Color(0xff7D7472).withOpacity(0.79)
    ], [
      0,
      1
    ]);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class GearPrinter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xFF52342C)
      ..style = PaintingStyle.fill;

    // paint.shader = LinearGradient(colors: colors)
    const double strokeWidth = 2;
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width * 0.17, size.height * 0.5);
    path.lineTo(size.width * 0.34, size.height * 0.5);
    path.lineTo(size.width * 0.42, 0);
    path.lineTo(size.width * 0.48, 0);
    path.lineTo(size.width * 0.48, strokeWidth);
    path.lineTo(size.width * 0.42, strokeWidth);
    path.lineTo(size.width * 0.34, size.height * 0.5 + strokeWidth);
    path.lineTo(size.width * 0.17, size.height * 0.5 + strokeWidth);
    // path.moveTo(size.width * 0.52, 0);

    path.close();
    canvas.drawPath(path, paint);

    Path path2 = Path();
    path2.moveTo(size.width * 0.52, 0);
    path2.lineTo(size.width * 0.58, 0);
    path2.lineTo(size.width * 0.66, size.height * 0.5);
    path2.lineTo(size.width * 0.83, size.height * 0.5);
    path2.lineTo(size.width, size.height);
    path2.lineTo(size.width * 0.83, size.height * 0.5 + strokeWidth);
    path2.lineTo(size.width * 0.66, size.height * 0.5 + strokeWidth);
    path2.lineTo(size.width * 0.58, strokeWidth);
    path2.lineTo(size.width * 0.52, strokeWidth);

    path2.close();
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class DashLinePainter extends CustomPainter {
  final double progress;

  DashLinePainter({required this.progress});

  final Paint _paint = Paint()
    ..color = const Color(0xFF52342C)
    ..strokeWidth = 10.0
    ..style = PaintingStyle.stroke
    ..strokeJoin = StrokeJoin.round;

  @override
  void paint(Canvas canvas, size) {
    var path = Path()
      ..moveTo(0, size.height / 2)
      ..lineTo(size.width * progress, size.height / 2);

    Path dashPath = Path();

    double dashWidth = 24.0;
    double dashSpace = 2.0;
    double distance = 0.0;

    for (ui.PathMetric pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        dashPath.addPath(
          pathMetric.extractPath(distance, distance + dashWidth),
          Offset.zero,
        );
        distance += dashWidth;
        distance += dashSpace;
      }
    }
    canvas.drawPath(dashPath, _paint);
  }

  @override
  bool shouldRepaint(DashLinePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

class SpeedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, size) {
    const double stockWidth = 8;
    Path path_0 = Path()
      ..moveTo(size.width * 0.76, 0)
      ..lineTo(size.width, size.height * 0.30)
      ..lineTo(size.width - stockWidth, size.height * 0.30)
      ..close();

    Path path1 = Path()
      ..moveTo(size.width, size.height * 0.30)
      ..lineTo(40, size.height - 20)
      ..lineTo(size.width - stockWidth, size.height * 0.30)
      ..close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.9125874, size.height * -0.000008129217),
        Offset(size.width * 0.8369860, size.height * 1.762893), [
      const Color(0xff6B4339).withOpacity(1),
      const Color(0xff7D7472).withOpacity(0.79)
    ], [
      0,
      1
    ]);
    canvas.drawPath(path_0, paint0Fill);
    canvas.drawPath(path1, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
