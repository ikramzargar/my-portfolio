import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles{
  static TextStyle headerTextStyle(){
    return GoogleFonts.signikaNegative(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );
  }

  static TextStyle heroTextStyle(){
    return GoogleFonts.oswald(
      fontSize: 24,
      fontWeight: FontWeight.w800,
      color: Colors.white,
    );
  }

  static TextStyle headingTextStyle(){
    return GoogleFonts.rubikMoonrocks(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      letterSpacing: 2,
    );
  }
}