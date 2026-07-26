import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {

  static ThemeData lightTheme = ThemeData(

    useMaterial3: true,

    textTheme: GoogleFonts.poppinsTextTheme(),

    scaffoldBackgroundColor: const Color(0xffF5F7FB),

    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xff00A86B),
    ),


    appBarTheme: AppBarTheme(

      backgroundColor: Colors.white,

      elevation: 0,

      titleTextStyle: GoogleFonts.poppins(

        fontSize: 22,

        fontWeight: FontWeight.bold,

        color: Colors.black87,

      ),

      iconTheme: const IconThemeData(
        color: Colors.black87,
      ),

    ),



    cardTheme: CardThemeData(

      elevation: 5,

      shadowColor: Colors.black12,

      shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.circular(24),

      ),

    ),


    elevatedButtonTheme: ElevatedButtonThemeData(

      style: ElevatedButton.styleFrom(

        backgroundColor: const Color(0xff00A86B),

        foregroundColor: Colors.white,

        minimumSize: const Size(
          double.infinity,
          55,
        ),

        shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.circular(18),

        ),

      ),

    ),

  );
}