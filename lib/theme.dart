import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      primaryColor: Color(0xFF3F51B5),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: Color(0xFF3F51B5),
        secondary: Colors.tealAccent,
      ),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFF3F51B5),
        titleTextStyle: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        headlineSmall: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 16,
        ),
        bodyMedium: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 14,
        ),
        titleMedium: GoogleFonts.poppins(
          color: Colors.black54,
          fontSize: 16,
        ),
        titleSmall: GoogleFonts.poppins(
          color: Colors.black54,
          fontSize: 14,
        ),
        labelLarge: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        bodySmall: GoogleFonts.poppins(
          color: Colors.black54,
          fontSize: 12,
        ),
        labelSmall: GoogleFonts.poppins(
          color: Colors.black54,
          fontSize: 10,
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Color(0xFF3F51B5),
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF3F51B5),
          foregroundColor: Colors.white,
          textStyle: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Color(0xFF3F51B5),
          side: BorderSide(color: Color(0xFF3F51B5)),
          textStyle: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Color(0xFF3F51B5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Color(0xFF3F51B5)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Color(0xFF3F51B5)),
        ),
        labelStyle: GoogleFonts.poppins(
          color: Color(0xFF3F51B5),
        ),
        hintStyle: GoogleFonts.poppins(
          color: Colors.black54,
        ),
      ),
      iconTheme: IconThemeData(
        color: Color(0xFF3F51B5),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Color(0xFF3F51B5),
        foregroundColor: Colors.white,
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: Color(0xFF3F51B5),
        inactiveTrackColor: Colors.tealAccent,
        thumbColor: Color(0xFF3F51B5),
        overlayColor: Color(0xFF3F51B5).withOpacity(0.2),
        valueIndicatorTextStyle: GoogleFonts.poppins(
          color: Colors.white,
        ),
      ),
    );
  }
}