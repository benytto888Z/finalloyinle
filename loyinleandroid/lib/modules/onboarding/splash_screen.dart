import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:loyinle/constants/dimens.dart';
import 'package:loyinle/constants/styles.dart';
import 'package:wakelock/wakelock.dart';
import 'package:flutter/services.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  static const Channel6 = MethodChannel('creamindloyinle4');

  wakeScreenUp(){
    Channel6.invokeListMethod("goWakeUp2");
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Wakelock.enable();
    //wakeScreenUp();
    _playSplash();
  }

  void _playSplash() async {
    await Future.delayed(const Duration(seconds: 7));
    //RouteManagement.goToHomeView();
   // Navigator.pushNamed(context, '/home');
    Navigator.pushNamed(context, '/dashboardScreen');
   // Navigator.pushNamed(context, '/gameScreen');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
          child: Stack(
                alignment: Alignment.topCenter,
                  children: [
                    Lottie.asset(
                    //  "assets/animations/mapdelivery.json",
                      "assets/animations/circuitblue.json",
                      width:  Dimens.screenWidth,
                      height: Dimens.screenHeight
                    ),
                    Text(
                      "L O Y I N L E \n\n by AMAK System",
                      style: AppStyles.styleGeneralWhitily(24.0, FontWeight.w600, Colors.amber),
                      textAlign: TextAlign.center,
                    )
                  ],
                )
    ),);
  }
}
