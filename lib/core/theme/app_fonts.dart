
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static TextStyle primaryStyle({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) =>
      GoogleFonts.openSans(
        fontSize: fontSize,
        color: color,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
        height: height,
      );
  static TextStyle semiBoldStyle({
    double fontSize = 21,
    Color? color,
    FontWeight fontWeight = FontWeight.w600,
    double? letterSpacing,
    double? height,
  }) =>
      GoogleFonts.openSans(
        fontSize: fontSize,
        color: color,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
        height: height,
      );
  static TextStyle regularStyle({
    double fontSize = 12,
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) =>
      GoogleFonts.openSans(
        fontSize: fontSize,
        color: color,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
        height: height,
      );
}
