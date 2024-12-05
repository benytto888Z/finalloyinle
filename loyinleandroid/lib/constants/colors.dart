import 'package:flutter/material.dart';


abstract class ColorValues {
  static const MaterialColor primarySwatch = MaterialColor(
    0xFF2878F0,
    {
      50: Color.fromRGBO(40, 120, 240, .1),
      100: Color.fromRGBO(40, 120, 240, .2),
      200: Color.fromRGBO(40, 120, 240, .3),
      300: Color.fromRGBO(40, 120, 240, .4),
      400: Color.fromRGBO(40, 120, 240, .5),
      500: Color.fromRGBO(40, 120, 240, .6),
      600: Color.fromRGBO(40, 120, 240, .7),
      700: Color.fromRGBO(40, 120, 240, .8),
      800: Color.fromRGBO(40, 120, 240, .9),
      900: Color.fromRGBO(40, 120, 240, 1),
    },
  );


  static const kprimarycolor = '#8ACB88';
  static const ksecondarycolor = '#026873';
  //static const ksecondarycolor = '#025940';
  //static const ksecondarycolor = '#648381';
  static const ktxtcolor = '#e4fde1';

  static const kprimarycolor2 = '#DD009F';
  static const ksecondarycolor2 = '#5C0051';
  static const kssecondarycolor2 =Color(0xff5C0051);
  //static const ktxtcolor2 = '#FFC356';
  static const ktxtcolor2 = '#ffd9da';

/*
  static const kprimarycolor3 = '#bfbdc1';
  static const ksecondarycolor3 = '#6d6a75';
  static const kthirdcolor3 = '#37323e';
  static const ktxtcolor3 = '#bfbdc1';  */



  //static const kprimarycolor3 = '#30343f';
 // static const kprimarycolor3 = '#6f768c';
  static const kprimarycolor3 = '#6f768c';
  static const ksprimarycolor3 = Color(0xff6f768c);
  static const ksecondarycolor3 = '#1b2021';
  static const kssecondarycolor3 = Color(0xff1b2021);
  static const kthirdcolor3 = '#37323e';
  //static const ktxtcolor3 = '#bfbdc1';
  static const ktxtcolor3 = '#ffffff';
  static const kstxtcolor3 = Color(0xffe6d6f5);


  static const langagebtnbgcolor = Color(0xffffbf46);



  static const kprimarycolor4 = '#51A94D';
  static const ksecondarycolor4 = '#648381';
  static const ktxtcolor4 = '#FFC356';




  static const Color linkColor = Color(0xFF2878F0);

  static const Color lightChatBubbleColor = Color.fromARGB(255, 242, 242, 242);
  static const Color darkChatBubbleColor = Color.fromARGB(255, 18, 66, 148);

  // textField
  static const Color txtFieldBgColor = Color(0xFF191919);
  static const Color txtFieldTxtColor = Color(0xffFEFEFE);
  static const Color txtFieldBorderColor = Color(0x003d3d3d);
  static const Color txtFieldHintColor = Color(0xff8E8E8E);
  static const Color btnTxtColor =Color(0xff171717);
  static const Color greyTxtColor =Color(0xff565656);
  static const Color greyTxtInfoColor =Color(0xFFB1B1B1);
  static const Color btnBgColorGrey = Color(0xff636363);
  static const Color btnBgColorYellow =Color(0xffffff54);
  static const Color bottomNavBgColor =Color(0xff232323);
  //static const Color DividerColor =Color(0xff363535);
  //static const Color DividerColor =Color(0xff232323);
  static const Color DividerColor = Color(0xff171717);

  /// keym theme colors
  // bgcolor

  static const Color appPrimaryBgColor = Color(0xff101010);
  static const Color appSecondaryBgColor = Color(0xff232323);
  static const Color DividerColorSec = Color(0xff171717);
  // icons svg
  static const Color kmWhiteColor = Color(0xFFFEFEFE);
  // widgets
  static const Color darkBgColor = Color(0xff101010);
  static const Color darkDialogColor =Color(0xff101010);



  static const Color primaryColor = Color(0xFFFFFF54);

  static const Color primaryLightColor = Color(0xFF629AEE);

  static const Color successColor = Color(0xFF4CAF50);
  static const Color errorColor = Color(0xFFF44336);
  static const Color warningColor = Color(0xFFF09C00);

  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF000000);

  static const Color grayColor = Color(0xFFb4b4b4);
  static const Color darkGrayColor = Color(0xff787878);
  static const Color darkerGrayColor = Color(0xff505050);
  static const Color lightGrayColor = Color(0xffd2d2d2);

  static const Color darkDividerColor = Color(0xff707070);
  static const Color lightDividerColor = Color(0xffc2c2c2);

  static const Color lightBodyTextColor = Color(0xFF323232);
  static const Color lightSubtitleTextColor = Color(0xFF737373);
  static const Color darkBodyTextColor = Color(0xFFE8E8E8);
  static const Color darkSubtitleTextColor = Color(0xFFA0A0A0);
  static const Color accountTextColor = Color(0xFFb4b4b4);
  static const Color darkSubtitleTextColor2 = Color(0xFF565656);


  static const Color lightBgColor = Color.fromRGBO(236, 236, 236, 1.0);
  static const Color lightDialogColor = Color.fromRGBO(250, 250, 250, 1.0);


  static const primaryGrad = LinearGradient(
    colors: [primaryColor, primaryLightColor],
  );
}
