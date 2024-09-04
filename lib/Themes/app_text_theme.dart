import 'package:flutter/material.dart';

class AppTextTheme {
  static TextTheme getTextTheme() {
    return const TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        fontFamily: 'Ubuntu',
        //letterSpacing: -2.0,
        color: Colors.white,
      ),
      displayMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
         fontFamily: 'Ubuntu',
        //letterSpacing: -2.0,
        //color: Colors.black,
      ),
      displaySmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
         fontFamily: 'Ubuntu',
        //letterSpacing: -2.0,
        //color: Colors.black,
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
       // fontWeight: FontWeight.bold,
         fontFamily: 'Ubuntu',
        //letterSpacing: -2.0,
        //color: Colors.black,
      ),
      headlineSmall: TextStyle(
        fontSize: 18,
        //fontWeight: FontWeight.bold,
         fontFamily: 'Ubuntu',
        //letterSpacing: -2.0,
        //color: Colors.black,
      ),
      titleLarge: TextStyle(
        fontSize: 16,
        //fontWeight: FontWeight.bold,
         fontFamily: 'Ubuntu',
         color: Colors.white
        //letterSpacing: -2.0,
       // color: Colors.black,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        //fontWeight: FontWeight.w800,
         fontFamily: 'Ubuntu',
        //letterSpacing: -2.0,
       // color: Colors.black54,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
         fontFamily: 'Ubuntu',
        //letterSpacing: -2.0,
        //color: Colors.black54,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
         fontFamily: 'Ubuntu',
        //letterSpacing: -2.0,
        //color: Colors.black45,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
         fontFamily: 'Ubuntu',
        //letterSpacing: -2.0,
        color: Colors.white,
      ),
    );
  }
}