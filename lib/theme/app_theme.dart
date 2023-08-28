import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData().copyWith(
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    elevatedButtonTheme:  ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(Colors.indigo),
        minimumSize: const MaterialStatePropertyAll(Size.fromHeight(50)),
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))
      )
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.indigo
    )
  );
}
