import 'package:banking_app/src/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeData = ThemeData(
    // scaffoldBackgroundColor: Colors.grey[200],
    inputDecorationTheme: InputDecorationTheme(
        border: const OutlineInputBorder(), labelStyle: GoogleFonts.heebo()),
    textTheme: TextTheme(
      headline1: GoogleFonts.raleway(
        fontSize: 26,
        color: CustomColors.deepBlue,
        fontWeight: FontWeight.w800,
      ),
      bodyText1: GoogleFonts.heebo(
        fontSize: 16,
      ),
      headline3: GoogleFonts.barlowSemiCondensed(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
);
