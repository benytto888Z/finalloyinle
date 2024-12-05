
import 'dart:math';

import 'package:flutter/material.dart';

abstract class AppUtility {
  /// Logger


  /// --------------------------------------------------------------------------

  static void printLog(message) {
    debugPrint(
        "=======================================================================");
    debugPrint(message.toString(), wrapWidth: 1024);
    debugPrint(
        "=======================================================================");
  }

/// --------------------------------------------------------------------------


  /// Random String
  static String generateUid(int length) {
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890@!%&_';
    var rnd = Random();

    return String.fromCharCodes(
      Iterable.generate(
        16,
            (_) => chars.codeUnitAt(rnd.nextInt(chars.length)),
      ),
    );
  }


static String formatPseudo(dynamic pseudo){
    if(pseudo==null) return "AMAK";
    if(pseudo.length == 5) return pseudo.toUpperCase();
      String ps = pseudo.substring(0,5);
    return ps.toUpperCase();
   }

   static String scoreFormat(int sc, int nbInt){

    return sc.toString().padLeft(nbInt, '0');
  }


  static int calculateScore(int levels , int faults){
    var points = [5,8,13,20,30];
    int score = 0 ;
    for(int i=0 ; i < levels ; i++){
      score = score + points[i];
    }
    score = score - faults * 5;
    return score;
  }

}