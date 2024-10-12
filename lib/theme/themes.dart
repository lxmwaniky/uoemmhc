import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const String backgroundImage = 'assets/images/background.png';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.green,
  textTheme: TextTheme(
    displayLarge: GoogleFonts.poppins(
      fontSize: 26,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    titleMedium: GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    labelLarge: GoogleFonts.poppins(
      fontSize: 20,
      color: Colors.white,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.green, // Button color
    ),
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.green,
  textTheme: TextTheme(
    displayLarge: GoogleFonts.poppins(
      fontSize: 26,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    titleMedium: GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    labelLarge: GoogleFonts.poppins(
      fontSize: 20,
      color: Colors.white,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.green,
    ),
  ),
);
