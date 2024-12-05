import 'package:flutter/material.dart';


class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  //channel name, used in android code to invoke method
 /* static const Channel = MethodChannel('creamindloyinle');
  static const Channel2 = MethodChannel('creamindloyinle2');
  var color = "0xffffffff";


  setColor(clr){
    setState(() {
      color = clr;
    });
  }

  changeColor() async{
   var res  =  await Channel2.invokeMethod("changeColor");
   setColor(res);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(int.parse(color)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Call Native Code to show Toast Message"),
            ElevatedButton(onPressed: (){
              _showToast();
            },child: Text("Show Toast"),),

            ElevatedButton(onPressed: (){
              setColor("0xff1f212c");
            },child: Text("Flutter"),),

            ElevatedButton(onPressed: changeColor,child: Text("Native"),),
          ],
        ),
      ),
    );
  }

  //a method that invoke native code
 /*Future<void> _showToast() async{
    final int batteryLevel = await Channel.invokeMethod('showToast',<String,String>{
      'message':'This is a Toast from From Flutter to Android Native Code Yes, It is working'
    });

    print(batteryLevel);
  }*/

_showToast(){
  // without argument
 // Channel.invokeListMethod("showToast");

  // with argument
  Channel.invokeListMethod("showToast",{'message' : 'Subscribe to this channel'});
}*/

}