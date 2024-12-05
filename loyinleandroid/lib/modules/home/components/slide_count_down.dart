import 'package:flutter/material.dart';
import 'package:loyinle/apis/api_provider.dart';
import 'package:loyinle/constants/dimens.dart';
import 'package:loyinle/constants/styles.dart';
import 'package:loyinle/modules/home/controllers/configs_controller.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:wakelock/wakelock.dart';

const defaultDuration = Duration(minutes: 45);
const defaultPadding = EdgeInsets.symmetric(horizontal: 10, vertical: 5);

class GSlideCountdown extends StatefulWidget {
  const GSlideCountdown({super.key, required this.duration, this.topGo = false});
  final int duration;
   final bool topGo ;

  @override
  State<GSlideCountdown> createState() => _GSlideCountdownState();
}

class _GSlideCountdownState extends State<GSlideCountdown> {

  late final StreamDuration _streamDuration;
  bool startGame = false;

  @override
  void initState() {
    super.initState();
    _streamDuration = StreamDuration(
      config: StreamDurationConfig(
        countDownConfig: CountDownConfig(
          duration: Duration(minutes: widget.duration, seconds: 2),

        ),
      ),
    );


      _streamDuration.pause();

  }

  @override
  void didUpdateWidget(covariant GSlideCountdown oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);

    if (widget.topGo && startGame == false){
      startGame = true;
       sendInfosStartParty();
      _streamDuration.play();
    }

  }

  @override
  void dispose() {
    super.dispose();
    _streamDuration.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideCountdown(
              streamDuration: _streamDuration,
              slideDirection: SlideDirection.down,
              separatorStyle: AppStyles.styleGeneralWhitily(Dimens.fiveW * 11, FontWeight.w500, Colors.white),
              decoration:const BoxDecoration(
              //  color:Colors.redAccent,
                color:Colors.blueGrey,
                borderRadius: BorderRadius.all(Radius.circular(9.0)),
              ),
              style: AppStyles.styleGeneralWhitily(Dimens.fiveW * 11, FontWeight.w500, Colors.white),
              icon:  Padding(
                padding: EdgeInsets.only(right: Dimens.fiveW),
                child: Icon(
                  Icons.alarm,
                  color: Colors.black45,
                  size: Dimens.fiveW * 11,
                ),
              ),
             onChanged: (duration){
                //0:00:00.000000
                print(duration);
               // if(duration.toString() == "0:00:00.000000"){
                if(duration == const Duration(minutes: 0, seconds: 0)){
                  ConfigsController.find.setPartyFinish(true);
                  sendInfosFinishParty();
                  Wakelock.disable();
                }
             },
              onDone: ()  {
               // ConfigsController.find.setPartyFinish(true);

               // print(ConfigsController.find.partyFinish);
               //  sendInfosFinishParty();

              },
            ),
          ],
        );
  }
}