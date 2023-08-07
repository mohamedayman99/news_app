import 'package:flutter/material.dart';

class AppTheme{
  static ThemeData lightTheme =ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
    ,

  );
  static final darkTheme=ThemeData(
    brightness: Brightness.dark,

  );

}