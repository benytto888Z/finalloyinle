import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/// Contains the dimensions and padding used
/// all over the application.
abstract class Dimens {
  static double screenHeight = Get.mediaQuery.size.height;
  static double screenWidth = Get.mediaQuery.size.width;

  static double screenWidthXD =1024;
  static double screenHeightXD =768;

  // static double screenWidthXD =414;
  // static double screenHeightXD = 896;

  static double screenPaddingW = screenWidth/(screenWidthXD/27);  // 27.w


  // common widget dim

  static double commonWidgetHeight = screenHeight/(screenHeightXD/59); //59.h
  static double commonWidgetWidth = screenWidth/(screenWidthXD/364); //364.h



  /// heights

  static double oneH = screenHeight/(screenHeightXD/1); //1.h
  static double maxsizeH = screenHeight/(screenHeightXD/0.9); //0.9.h
  static double minsizeH = screenHeight/(screenHeightXD/0.8); //0.8.h
  static double twoH = screenHeight/(screenHeightXD/2); //2.h
  static double threeH = screenHeight/(screenHeightXD/3); //3.h
  static double fourH = screenHeight/(screenHeightXD/4); //4.h
  static double fiveH = screenHeight/(screenHeightXD/5); //5.h
  static double sixH = screenHeight/(screenHeightXD/6); //6.h
  static double sevenH = screenHeight/(screenHeightXD/7); //7.h
  static double eightH = screenHeight/(screenHeightXD/8); //8.h
  static double nineH = screenHeight/(screenHeightXD/9); //9.h

  static double tenH = screenHeight/(screenHeightXD/10); //10.h
  static double elevenH = screenHeight/(screenHeightXD/11); //11.h
  static double twelveH = screenHeight/(screenHeightXD/12); //12.h
  static double thirteenH = screenHeight/(screenHeightXD/13); //13.h
  static double fourTeenH = screenHeight/(screenHeightXD/14); //14.h
  static double fifTeenH = screenHeight/(screenHeightXD/15); //15.h
  static double sixTeenH = screenHeight/(screenHeightXD/16); //16.h
  static double sixteenH = screenHeight/(screenHeightXD/16); //16.h
  static double sevenTeenH = screenHeight/(screenHeightXD/17); //17.h
  static double eigtheenH = screenHeight/(screenHeightXD/18); //18.h
  static double nineTeenH = screenHeight/(screenHeightXD/19); //19.h
  static double twentyH = screenHeight/(screenHeightXD/20); //20.h
  static double twentyFirstH = screenHeight/(screenHeightXD/21); //21.h
  static double twentyTwoH = screenHeight/(screenHeightXD/22); //22.H
  static double twentyThirdH = screenHeight/(screenHeightXD/23); //23.H
  static double twentyFourH = screenHeight/(screenHeightXD/24); //24.H
  static double twentyFiveH = screenHeight/(screenHeightXD/25); //25H
  static double twentySixH = screenHeight/(screenHeightXD/26); //26.h
  static double twentySevenH = screenHeight/(screenHeightXD/27);  // 27.h
  static double twentyEightH = screenHeight/(screenHeightXD/28); //28.h
  static double twentyNineH = screenHeight/(screenHeightXD/29); //29.h
  static double thirtyH = screenHeight/(screenHeightXD/30); //30.h
  static double bootomSheetLGH = screenHeight/(screenHeightXD/710); //710.h
  static double disappearLGH = screenHeight/(screenHeightXD/550); //550.h
  static double filtertopGrillH = screenHeight/(screenHeightXD/300); //300.h





  /// widths
  static double oneW = screenWidth/(screenWidthXD/1); //1.w
  static double twoW = screenWidth/(screenWidthXD/2); //2.w
  static double threeW = screenWidth/(screenWidthXD/3); //3.w
  static double fourW = screenWidth/(screenWidthXD/4); //4.w
  static double fiveW = screenWidth/(screenWidthXD/5); //5.w
  static double sixW = screenWidth/(screenWidthXD/6); //6.w
  static double sevenW = screenWidth/(screenWidthXD/7); //7.w
  static double eightW = screenWidth/(screenWidthXD/8); //8.w
  static double nineW = screenWidth/(screenWidthXD/9); //9.w

  static double tenW = screenWidth/(screenWidthXD/10); //10.w
  static double elevenW = screenWidth/(screenWidthXD/11); //11.w
  static double twelveW = screenWidth/(screenWidthXD/12); //12.w
  static double thirteenW = screenWidth/(screenWidthXD/13); //13.w
  static double fourTeenW = screenWidth/(screenWidthXD/14); //14.w
  static double fifTeenW = screenWidth/(screenWidthXD/15); //15.w
  static double sixTeenW = screenWidth/(screenWidthXD/16); //16.w
  static double sevenTeenW = screenWidth/(screenWidthXD/17); //17.w
  static double eigtheenW = screenWidth/(screenWidthXD/18); //18.w
  static double nineTeenW = screenWidth/(screenWidthXD/19); //19.w
  static double twentyW = screenWidth/(screenWidthXD/20); //20.w
  static double twentyFirstW = screenWidth/(screenWidthXD/21); //21.w
  static double twentyTwoW = screenWidth/(screenWidthXD/22); //22.w
  static double twentyThirdW = screenWidth/(screenWidthXD/23); //23.w
  static double twentyFourW = screenWidth/(screenWidthXD/24); //24.w
  static double twentyFiveW = screenWidth/(screenWidthXD/25); //25.w
  static double twentySixW = screenWidth/(screenWidthXD/26); //26.w
  static double twentySevenW = screenWidth/(screenWidthXD/27);  // 27.w
  static double twentyEightW = screenWidth/(screenWidthXD/28); //28.w
  static double twentyNineW = screenWidth/(screenWidthXD/29); //29.w
  static double thirtyW = screenWidth/(screenWidthXD/30); //30.w
  static double SpaceicoBottomnavBar = screenWidth/(screenWidthXD/25); //25.w
  static double w760w = screenWidth/(screenWidthXD/760); //760.w
  static double w800w = screenWidth/(screenWidthXD/800); //800.w







  //-----measure for sp and radius only
  static double zero = 0.r;
  static double one = 1.r;
  static double two = 2.r;
  static double three = 3.r;
  static double four = 4.r;
  static double five = 5.r;
  static double six = 6.r;
  static double seven = 7.r;
  static double eight = 8.r;
  static double nine = 9.r;
  static double ten = 10.r;
  static double eleven = 11.r;
  static double twelve = 12.r;
  static double thirteen = 13.r;
  static double fourteen = 14.r;
  static double fifTeen = 15.r;
  static double sixTeen = 16.r;
  static double sevenTeen = 17.r;
  static double eighteen = 18.r;
  static double nineteen = 19.r;
  static double twenty = 20.r;
  static double twentyFirst = 21.r;
  static double twentyTwo = 22.r;
  static double twentyThree = 23.r;
  static double twentyFour = 24.r;
  static double twentyFive = 25.r;
  static double twentySix = 26.r;
  static double twentySeven = 27.r;



  static double twentyEight = 28.r;

  static double thirtySix = 36.r;
  static double thirtySeven = 37.r;


  static double sixty = 60.r;

  static double fifty = 50.r;



  static double thirtyNine = 39.r;

  static double thirty = 30.r;
  static double eighty = 80.r;
  static double pointFive = 0.5.r;

  static double sixtyFour = 64.r;








  static double thirtyTwo = 32.r;
  static double thirtyFive = 35.r;
  static double seventy = 70.r;
  static double fourty = 40.r;
  static double fourtyEight = 48.r;
  static double thirtyFour = 34.r;

  static double ninetyEight = 98.r;
  static double ninetyFive = 95.r;
  static double fiftyFive = 55.r;
  static double fiftyFour = 54.r;
  static double fiftySix = 56.r;
  static double hundred = 100.r;
  static double oneHundredFifty = 150.r;
  static double oneHundredTwenty = 120.r;
  static double seventyEight = 78.r;

  static EdgeInsets edgeInsets16 = EdgeInsets.all(sixTeen);

  //SizedBoxes

  static SizedBox boxHeight2 = SizedBox(height: twoH);

  static SizedBox boxHeight4 = SizedBox(height: fourH);

  static SizedBox boxHeight8 = SizedBox(height: eightH);

  static SizedBox boxHeight10 = SizedBox(height: tenH);

  static SizedBox boxHeight12 = SizedBox(height: twelveH);

  static SizedBox boxHeight16 = SizedBox(height: sixTeenH);

  static SizedBox boxHeight20 = SizedBox(height: twentyH);


  /*
  static SizedBox boxHeight24 = SizedBox(height: twentyFour);

  static SizedBox boxHeight32 = SizedBox(height: thirtyTwo);

  static SizedBox boxHeight40 = SizedBox(height: fourty);

  static SizedBox boxHeight48 = SizedBox(height: fourtyEight);

  static SizedBox boxHeight64 = SizedBox(height: sixtyFour);

  */



  static SizedBox boxWidth2 = SizedBox(width: twoW);

  static SizedBox boxWidth4 = SizedBox(width: fourW);

  static SizedBox boxWidth8 = SizedBox(width: eightW);

  static SizedBox boxWidth10 = SizedBox(width: tenW);

  static SizedBox boxWidth12 = SizedBox(width: twelveW);

  static SizedBox boxWidth16 = SizedBox(width: sixTeenW);

  static SizedBox boxWidth20 = SizedBox(width: twentyW);


  static SizedBox boxWidth24 = SizedBox(width: twentyFour);

  static SizedBox boxWidth32 = SizedBox(width: thirtyTwo);

  static SizedBox boxWidth40 = SizedBox(width: fourty);

  static SizedBox boxWidth60 = SizedBox(width: sixty);

  static SizedBox boxHeight60 = SizedBox(height: sixty);

  static SizedBox boxWidth80 = SizedBox(width: eighty);

  static SizedBox boxHeight80 = SizedBox(height: eighty);


  static SizedBox shrinkBox = const SizedBox.shrink();

  static Divider divider = const Divider(height: 0.0, thickness: 0.4);

  static Divider dividerWithHeight = const Divider(thickness: 0.5);





  static EdgeInsets edgeInsets4_0 = EdgeInsets.symmetric(
    vertical: four,
    horizontal: zero,
  );

  static EdgeInsets edgeInsets4_8 = EdgeInsets.symmetric(
    vertical: four,
    horizontal: eight,
  );

  static EdgeInsets edgeInsets0_4 = EdgeInsets.symmetric(
    vertical: zero,
    horizontal: four,
  );


  static EdgeInsets edgeInsets0_8 = EdgeInsets.symmetric(
    vertical: zero,
    horizontal: eight,
  );

  static EdgeInsets edgeInsets8_0 = EdgeInsets.symmetric(
    vertical: eight,
    horizontal: zero,
  );
  static EdgeInsets edgeInsets4 = EdgeInsets.all(fourH);

  static EdgeInsets edgeInsets8 = EdgeInsets.all(eightH);

  static EdgeInsets edgeInsets10 = EdgeInsets.all(tenH);

  static EdgeInsets edgeInsets12 = EdgeInsets.all(twelveH);


  static EdgeInsets edgeInsets20 = EdgeInsets.all(twentyH);

  static EdgeInsets edgeInsetsOnlyTop2 = EdgeInsets.only(top: twoH);

  static EdgeInsets edgeInsetsOnlyTop4 = EdgeInsets.only(top: fourH);

  static EdgeInsets edgeInsetsOnlyTop8 = EdgeInsets.only(top: eightH);

  static EdgeInsets edgeInsetsOnlyTop16 = EdgeInsets.only(top: sixTeenH);

  static EdgeInsets edgeInsets0 = EdgeInsets.zero;


  static EdgeInsets edgeInsets12_0 = EdgeInsets.symmetric(
    vertical: twelveH,
    horizontal: zero,
  );

  static EdgeInsets edgeInsets0_12 = EdgeInsets.symmetric(
    vertical: zero,
    horizontal: twelveW,
  );

  static EdgeInsets edgeInsets16_0 = EdgeInsets.symmetric(
    vertical: sixTeenH,
    horizontal: zero,
  );

  static EdgeInsets edgeInsets0_16 = EdgeInsets.symmetric(
    vertical: zero,
    horizontal: sixTeenW,
  );

  static EdgeInsets edgeInsets8_16 = EdgeInsets.symmetric(
    vertical: eightH,
    horizontal: sixTeenW,
  );

  static EdgeInsets edgeInsets6_12 = EdgeInsets.symmetric(
    vertical: sixH,
    horizontal: twelveW,
  );


  static EdgeInsets edgeInsets2_0 = EdgeInsets.symmetric(
    vertical: two,
    horizontal: zero,
  );

  static EdgeInsets edgeInsets0_2 = EdgeInsets.symmetric(
    vertical: zero,
    horizontal: two,
  );


}