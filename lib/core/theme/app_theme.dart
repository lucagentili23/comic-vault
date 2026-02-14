import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const primaryColor = Color(0xFF121212);
  static const onPrimaryColor = Color(0xFFF3F3F3);

  static ThemeData get darkTheme {
    return ThemeData(
      textTheme: GoogleFonts.montserratTextTheme().apply(
        bodyColor: onPrimaryColor,
      ),

      iconTheme: IconThemeData(color: onPrimaryColor),

      scaffoldBackgroundColor: primaryColor,

      appBarTheme: AppBarTheme(
        backgroundColor: primaryColor,
        foregroundColor: onPrimaryColor,
        shape: Border(bottom: BorderSide(color: Colors.white, width: 0.5)),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: onPrimaryColor,
          foregroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }
}
