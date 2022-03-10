import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckpointTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.quicksand(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    bodyText2: GoogleFonts.quicksand(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
    headline1: GoogleFonts.quicksand(
      fontSize: 36.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headline2: GoogleFonts.quicksand(
      fontSize: 30.0,
      fontWeight: FontWeight.w900,
      color: Colors.black,
    ),
    headline3: GoogleFonts.quicksand(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headline4: GoogleFonts.quicksand(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headline5: GoogleFonts.quicksand(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  );
  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.poppins(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodyText2: GoogleFonts.poppins(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
    headline1: GoogleFonts.poppins(
      fontSize: 36.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline2: GoogleFonts.poppins(
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline3: GoogleFonts.poppins(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline4: GoogleFonts.poppins(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline5: GoogleFonts.poppins(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
  );

  static ThemeData light() {
    return ThemeData(
      primaryColor: Colors.white,
      brightness: Brightness.light,
      primaryTextTheme: lightTextTheme,
      scaffoldBackgroundColor: Colors.white, // const Color(0xfff2f3f8),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith(
          (states) {
            return Colors.deepOrange;
          },
        ),
      ),
      appBarTheme: const AppBarTheme(
          foregroundColor: Colors.white,
          backgroundColor: Color(0xFFFAA516),
          shadowColor: Colors.black,
          elevation: 4.0,
          iconTheme: IconThemeData(color: Colors.white)),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Color(0xFFFAA516),
          unselectedItemColor: Colors.white70,
          selectedLabelStyle: TextStyle(color: Colors.white),
          unselectedLabelStyle: TextStyle(color: Colors.white70)),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: const Color(0xFFFAA516), //Colors.deepOrange,
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(36.0),
          ),
        ),
      ),
      // chipTheme: ChipThemeData(
      //   padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
      //   backgroundColor: Colors.white70,
      //   secondaryLabelStyle: const TextStyle(color: Colors.black12),
      //   brightness: Brightness.light,
      //   labelStyle: const TextStyle(color: Colors.black87),
      //   secondarySelectedColor: null,
      // ),
      textTheme: lightTextTheme,
      canvasColor: Colors.white,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
          foregroundColor: Colors.white,
          backgroundColor: Colors.grey[900],
          iconTheme: const IconThemeData(color: Colors.white)),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
      ),
      textTheme: darkTextTheme,
    );
  }
}
