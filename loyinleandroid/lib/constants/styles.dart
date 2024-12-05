import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loyinle/constants/colors.dart';
import 'package:loyinle/constants/dimens.dart';

abstract class AppStyles {
  static String get defaultFontFamily => 'Power Grotesk';
  static double get defaultHeight => 1.25;

  static TextStyle style16RegularHint = TextStyle(
    fontFamily: 'Power Grotesk Reg',
    fontSize: Dimens.sixTeen,
    color: ColorValues.txtFieldHintColor,
    height: defaultHeight,
  );

  static TextStyle style33Bold = TextStyle(
    fontFamily: 'Power Grotesk Bold',
    fontSize: Dimens.elevenH*3,
    color: ColorValues.txtFieldTxtColor,
    height: defaultHeight,
  );

  static TextStyle style55Bold = TextStyle(
    fontFamily: 'Power Grotesk Bold',
    fontSize: Dimens.elevenH*5,
    color: Colors.redAccent,
    height: defaultHeight,
  );

  static TextStyle style15Bold = TextStyle(
    fontSize: 15.r,
    fontWeight: FontWeight.w700,
    fontFamily: defaultFontFamily,
    height: defaultHeight,
  );

  static TextStyle style16Normal = TextStyle(
    fontSize: Dimens.sixTeen,
    fontWeight: FontWeight.w400,
    fontFamily: defaultFontFamily,
    height: defaultHeight,
  );

  static TextStyle style16NormalWhite = TextStyle(
    fontSize: Dimens.sixTeen,
    fontWeight: FontWeight.w400,
    fontFamily: 'Power Grotesk Reg',
    color: const Color(0xffFEFEFE),
    height: defaultHeight,
  );

  static TextStyle style24NormalWhite = TextStyle(
    fontSize: Dimens.twenty,
    fontWeight: FontWeight.w500,
    fontFamily: 'Power Grotesk Reg',
    color: const Color(0xffFEFEFE),
    height: defaultHeight,
  );

  static TextStyle style33BoldWhitily = TextStyle(
    fontFamily: 'Power Grotesk Bold',
    fontSize: Dimens.eleven*3,
    color: ColorValues.txtFieldTxtColor,
    height: defaultHeight,
    shadows: const [
      Shadow(color: Color(0xff000029), offset: Offset(0, 3), blurRadius: 6)
    ],
  );

  static TextStyle style16RegularTxt = TextStyle(
    fontFamily: 'Power Grotesk Reg',
    fontSize: Dimens.sixTeen,
    color: ColorValues.txtFieldTxtColor,
    height: defaultHeight,
  );

  //-----------------------------

  static TextStyle style10NormalGrey = TextStyle(
    fontSize: Dimens.tenH,
    fontWeight: FontWeight.w400,
    fontFamily: 'Power Grotesk Reg',
    height: defaultHeight,
  );

  static TextStyle style14NormalWhitily = TextStyle(
    fontSize: Dimens.fourTeenH,
    fontWeight: FontWeight.w400,
    fontFamily: defaultFontFamily,
    color: ColorValues.txtFieldTxtColor,
    shadows: const [
      Shadow(color: Color(0xff000029), offset: Offset(0, 3), blurRadius: 6)
    ],
    height: defaultHeight,
  );



  static TextStyle styleGeneral(ftz, ftw, c) => TextStyle(
        fontSize: ftz,
        fontWeight: ftw,
        fontFamily: defaultFontFamily,
        color: c,
        height: defaultHeight,
      );

  static TextStyle styleGeneralWhitily(ftz, ftw, c , {double? ltsp=1}) => TextStyle(
        fontSize: ftz,
        fontWeight: ftw,
        fontFamily: defaultFontFamily,
        color: c,
        letterSpacing: ltsp,
        shadows: const [
          Shadow(color: Color(0xff000029), offset: Offset(0, 3), blurRadius: 6)
        ],
        height: defaultHeight,
      );


  static TextStyle style16NormalWhiteEllipsis = TextStyle(
    fontSize: Dimens.sixTeen,
    fontWeight: FontWeight.w400,
    fontFamily: 'Power Grotesk Reg',
    color: const Color(0xffFEFEFE),
    overflow: TextOverflow.ellipsis,
    height: defaultHeight,
  );

  static TextStyle style16NormalBlack = TextStyle(
    fontSize: Dimens.sixTeen,
    fontWeight: FontWeight.w400,
    fontFamily: 'Power Grotesk Reg',
    color: ColorValues.bottomNavBgColor,
    height: defaultHeight,
  );

  static TextStyle style16Bold = TextStyle(
    fontSize: Dimens.sixTeen,
    fontWeight: FontWeight.w700,
    fontFamily: defaultFontFamily,
    height: defaultHeight,
  );


  //----------------------------

}
