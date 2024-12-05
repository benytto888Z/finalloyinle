import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:loyinle/apis/models/GameInfos.dart';
import 'dart:convert';
import 'dart:async';

//const ESP32IP = "192.168.1.166";
const ESP32IP = "192.168.1.114";


/*Future<GameInfos> getPartyInfos() async {
  http.Response res = await http.post(Uri.http(ESP32IP,"/gameinfoschannel"));
  String rawJson = res.body;
  Map<String, dynamic> map = jsonDecode(rawJson);
  GameInfos lv = GameInfos.fromJson(map);

  return lv;
}

Stream<GameInfos> getPartyDatas(Duration refreshTime, BuildContext context) async* {
  while (true) {
    await Future.delayed(refreshTime);
    yield await getPartyInfos();
  }
}*/

Future sendInfosFinishTurn() async {
  await http.get(Uri.http(ESP32IP,"/turnfinish"));
}

Future sendInfosFinishTurnP1() async {
  await http.get(Uri.http(ESP32IP,"/turnfinishP1"));
}

Future sendInfosFinishTurnP2() async {
  await http.get(Uri.http(ESP32IP,"/turnfinishP2"));
}

Future sendInfosFinishParty() async {
  await http.get(Uri.http(ESP32IP,"/endGame"));
}

Future sendInfosStartParty() async {
  await http.get(Uri.http(ESP32IP,"/startGame"));
}



