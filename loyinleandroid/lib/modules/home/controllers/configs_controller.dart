import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:belatuk_http_server/belatuk_http_server.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loyinle/apis/models/ApiResponse.dart';
import 'package:loyinle/modules/home/controllers/gameui_ctrl.dart';
import 'package:flutter/services.dart';



class ConfigsController extends GetxController {

  static ConfigsController get find => Get.find();

 final gameStorage = GetStorage();

  Map<String, dynamic> _playersName = {};
  Map<String, dynamic> get playersName => _playersName;

  Map<String, dynamic> _gameConfigs = {};
  Map<String, dynamic> get gameConfigs => _gameConfigs;

  final player1NameTextController = TextEditingController();
  final player2NameTextController = TextEditingController();
  static const GAMESERVER_IP = "192.168.1.228";

  late int timerPeriodic;
   bool partyFinish = false;
   // the two players finish their turn before turntime finish
   bool turnsfinishForPlayers = false;

  // initialize configuration party
  var partyConfigs = {};
 // var partyInfosLive = {"levelNB": 0, "circuitTouchNB": 0, "hasTriggered": false, "startTurn": false};
  var partyInfosLive = {};
  var gameMode = {};

  static const Channel5 = MethodChannel('creamindloyinle3');

  wakeScreenUp(){
    Channel5.invokeListMethod("goWakeUp");
  }

  setTimerPeriodic(int t){
   timerPeriodic = t;
  }

  setPartyFinish(bool val){
    partyFinish = val;
    update();
  }

  setTurnsFinishForPlayers(bool val){
    turnsfinishForPlayers = val;
   // update();
  }

  // create internal server service for game table
  Future<void> createServer() async {

   //var server = await HttpServer.bind('192.168.1.109',8082, shared: true);
   // var server = await HttpServer.bind('192.168.1.112',8082, shared: true);
    var server = await HttpServer.bind(GAMESERVER_IP,8082, shared: true);

    server.transform(HttpBodyHandler(defaultEncoding: utf8)).listen((body) async {
      switch (body.type) {
        case 'text':

         // if(body.request.requestedUri.toString() == "http://192.168.1.112:8082/gameinfos"){
          if(body.request.requestedUri.toString() == "http://$GAMESERVER_IP:8082/gameinfos"){
            var myinfo = body.body;
            print(myinfo);
          }

          break;

        case 'json':

        //  if(body.request.requestedUri.toString() == "http://192.168.1.112:8082/configs"){
          if(body.request.requestedUri.toString() == "http://$GAMESERVER_IP:8082/configs"){
            partyConfigs = body.body;
            print(partyConfigs['players']);

            setPlayersNameFromJson();
            setGameInfosFromJson(partyConfigs['nbTurns'].toString());


            var res = json.encode(const ApiResponse(
                message: "Config info registere to table golf server", statusCode: 200));

            body.request.response
              ..headers.contentType = ContentType("application", "json", charset: "utf-8")
              ..write(res)
              ..close();

            restartApp();

             wakeScreenUp();

            update();
            break;
          }

         // if(body.request.requestedUri.toString() == "http://192.168.1.112:8082/gameinfos"){
          if(body.request.requestedUri.toString() == "http://$GAMESERVER_IP:8082/gameinfos"){

        partyInfosLive = body.body;
            var res = json.encode(const ApiResponse(
                message: "Game infos data receive", statusCode: 200));

            body.request.response
              ..headers.contentType = ContentType("application", "json", charset: "utf-8")
              ..write(res)
              ..close();
        update();
            break;
          }

          //if(body.request.requestedUri.toString() == "http://192.168.1.112:8082/gamemode"){
          if(body.request.requestedUri.toString() == "http://$GAMESERVER_IP:8082/gamemode"){

            gameMode = body.body;
            var res = json.encode(const ApiResponse(
                message: "Game mode data receive", statusCode: 200));

            body.request.response
              ..headers.contentType = ContentType("application", "json", charset: "utf-8")
              ..write(res)
              ..close();
            update();
            print(gameMode["gamemode"]);
            break;
          }

        default:
          throw StateError('bad body type');
      }
      body.request.response.close();
    }, onError: (Object error) {
      throw StateError('bad connection');
    });


  }

  // configuratiion de l'interface de jeu
  // on met ici toute la configuration dans le local storage
  void setGameData(String key, dynamic value) async => await gameStorage.write(key, value);

  setPlayersName(){
    var data = jsonEncode({
      'pln1':  player1NameTextController.text.trim().toString(),
      'pln2':  player2NameTextController.text.trim().toString(),
    });
    setGameData("playersName", data);
    update();
  }
  setGameInfos(nbt,nbpl){
    var data = jsonEncode({
      'nbPlayers': nbpl,
      'nbTurns': nbt
    });
    setGameData("gameInfos", data);
    update();
  }
  void getPlayersName() async {
    final players = await gameStorage.read("playersName");

    if (players == null) {
      return;
    } else {
      var decodedData = jsonDecode(players) as Map<String, dynamic>;
      _playersName= decodedData;
    }
    update();
  }
  void getGameInfos() async {
    final infos = await gameStorage.read("gameInfos");

    if (infos == null) {
      return;
    } else {
      var decodedData = jsonDecode(infos) as Map<String, dynamic>;
      _gameConfigs = decodedData;

      print("gameConfigs");
      print(gameConfigs["nbTurns"]);
    }
    update();
  }


  setPlayersNameFromJson(){

    var nbPLAYR = partyConfigs['nbplayers'];
    String data="";

   switch(nbPLAYR.toString()){
       case "1":
          data = jsonEncode({
           'pln1': (partyConfigs['players'] as List)[0].toString(),
           'pln2':  ""
         });
       break;

     case "2":
        data = jsonEncode({
         'pln1':  (partyConfigs['players'] as List)[0].toString(),
         'pln2':  (partyConfigs['players'] as List)[1].toString(),
       });
       break;


   }

    setGameData("playersName", data);
    update();
  }
  setGameInfosFromJson(nbt){

    var nbPLAYR = partyConfigs['nbplayers'];
    String gamemode;

    switch(nbPLAYR.toString()){
      case "1":
       gamemode = GameModes.oneplayer.toString();
        break;
      default:
        gamemode = GameModes.twoplayers.toString();
        break;

    }

    var data = jsonEncode({
      'nbPlayers': gamemode,
      'nbTurns': nbt
    });
    setGameData("gameInfos", data);
    update();
  }
  setThemeModeFromJson(gmtheme){
    AppThemeModes thmode;
    if(gmtheme == 'dark'){
      thmode = AppThemeModes.bendark;
    }else if(gmtheme == 'green'){
      thmode = AppThemeModes.natgreen;
    }else if(gmtheme == 'purple'){
      thmode = AppThemeModes.alnpurple;
    }else{
      thmode = AppThemeModes.defaultt;
    }
   /* gamectrl.setThemeMode(thmode);
    gamectrl.getThemeMode();*/
  }


  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    getPlayersName();
    getGameInfos();
     createServer();
     update();
  }

  Future<void> restartApp() async {
    await Get.deleteAll(force: true); //deleting all controllers
    Phoenix.rebirth(Get.context!); // Restarting app
    Get.reset(); // resetting getx
  }

  @override
  Future<void> onClose() async {
  }

}

