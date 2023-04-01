import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeThisApp {
  static const Color textInButtonColor = Colors.white;
  static const Color borderColor = Color(0xfff1592a);
  static const Color fillButton = Color(0xff105BAB);
  static const styleButton =
      ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(fillButton));
  static const styleTextButton =
      TextStyle(color: textInButtonColor, fontWeight: FontWeight.bold);
  static var styleTextBase = TextStyle(color: fillButton, fontSize: 14.sp);
  static var styleTextHeader = TextStyle(
      color: fillButton, fontWeight: FontWeight.bold, fontSize: 16.sp);
  static var borderTextField = OutlineInputBorder(
    borderSide: BorderSide(color: borderColor, width: 1.0.w),
    borderRadius: BorderRadius.circular(20.0.r),
  );
  static var borderDecoration = BoxDecoration(
      border: Border.all(color: borderColor, width: 2.0.w),
      borderRadius: BorderRadius.circular(20.0.sp));
}
