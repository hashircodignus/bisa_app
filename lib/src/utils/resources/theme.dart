import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();
  //**************************
  //colors
  //**************************

  static const Color backColor = Colors.white;
  static const Color textColor = Colors.black;
  static const Color smallText = Colors.grey;
  static const Color blueColor = Color(0xff4B73E1);

//*************************************************
//*************************************************

  //***************************
  //fonts
  //***************************

  static final figTreeFont = GoogleFonts.figtree();

//*************************************************
//*************************************************

  //**************************
  //textStyle
  //**************************

  static TextStyle navigationText = TextStyle(
      color: backColor,
      fontFamily: figTreeFont.fontFamily,
      fontSize: 12.sp,
      fontWeight: FontWeight.w600);
  static TextStyle navigationTextGrey = TextStyle(
      color: smallText,
      fontFamily: figTreeFont.fontFamily,
      fontSize: 12.sp,
      fontWeight: FontWeight.w600);
  static TextStyle errorTextRed = TextStyle(
      color: Colors.red,
      fontFamily: figTreeFont.fontFamily,
      fontSize: 10.sp,
      fontWeight: FontWeight.w600);
  static TextStyle optionsText = TextStyle(
      color: smallText,
      fontFamily: figTreeFont.fontFamily,
      fontSize: 12.sp,
      fontWeight: FontWeight.w500);

  static TextStyle profilePageTab = TextStyle(
      color: textColor,
      fontFamily: figTreeFont.fontFamily,
      fontSize: 14.sp,
      fontWeight: FontWeight.w600);

  static TextStyle smallHead = TextStyle(
      color: smallText,
      fontFamily: figTreeFont.fontFamily,
      fontSize: 16.sp,
      fontWeight: FontWeight.w500);
  static TextStyle smallHeadWhite = TextStyle(
      color: backColor,
      fontFamily: figTreeFont.fontFamily,
      fontSize: 16.sp,
      fontWeight: FontWeight.w500);

  static TextStyle smallHeadGreen = TextStyle(
      color: Colors.green,
      fontFamily: figTreeFont.fontFamily,
      fontSize: 16.sp,
      fontWeight: FontWeight.w500);
  static TextStyle smallHeadBlue = TextStyle(
      color: blueColor,
      fontFamily: figTreeFont.fontFamily,
      fontSize: 16.sp,
      fontWeight: FontWeight.w500);

  static TextStyle titleText = TextStyle(
      color: textColor,
      fontFamily: figTreeFont.fontFamily,
      fontSize: 16.sp,
      fontWeight: FontWeight.w500);
  static TextStyle fieldText = TextStyle(
      color: textColor,
      fontFamily: figTreeFont.fontFamily,
      fontSize: 16.sp,
      fontWeight: FontWeight.w600);

  static TextStyle buttonText = TextStyle(
      color: backColor,
      fontFamily: figTreeFont.fontFamily,
      fontSize: 16.sp,
      fontWeight: FontWeight.w600);
  static TextStyle fieldText2 = TextStyle(
      color: smallText,
      fontFamily: figTreeFont.fontFamily,
      fontSize: 16.sp,
      fontWeight: FontWeight.w600);

  static TextStyle tabText = TextStyle(
      color: textColor,
      fontFamily: figTreeFont.fontFamily,
      fontSize: 18.sp,
      fontWeight: FontWeight.w600);

  static TextStyle tabText2 = TextStyle(
      color: smallText,
      fontFamily: figTreeFont.fontFamily,
      fontSize: 18.sp,
      fontWeight: FontWeight.w600);

  static TextStyle labelText = TextStyle(
      color: smallText,
      fontFamily: figTreeFont.fontFamily,
      fontSize: 18.sp,
      fontWeight: FontWeight.w500);
  static TextStyle labelTextBlack = TextStyle(
      color: textColor,
      fontFamily: figTreeFont.fontFamily,
      fontSize: 18.sp,
      fontWeight: FontWeight.w500);

  static TextStyle labelTextWhite = TextStyle(
      color: backColor,
      fontFamily: figTreeFont.fontFamily,
      fontSize: 18.sp,
      fontWeight: FontWeight.w500);

  static TextStyle menuButtonText = TextStyle(
      color: backColor,
      fontFamily: figTreeFont.fontFamily,
      fontSize: 20.sp,
      fontWeight: FontWeight.w500);

  static TextStyle pageHead = TextStyle(
      color: textColor,
      fontFamily: figTreeFont.fontFamily,
      fontSize: 20.sp,
      fontWeight: FontWeight.w600);

  static TextStyle headText = TextStyle(
      color: textColor,
      fontFamily: figTreeFont.fontFamily,
      fontSize: 22.sp,
      fontWeight: FontWeight.w600);
  static TextStyle headTextWhite = TextStyle(
      color: backColor,
      fontFamily: figTreeFont.fontFamily,
      fontSize: 22.sp,
      fontWeight: FontWeight.w600);
}

//************************************************
//************************************************
