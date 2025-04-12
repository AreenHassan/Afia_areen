
import 'package:flutter/material.dart';

import 'color.dart';

ThemeData lightThem = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey),
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      elevation: 40,
        iconTheme: IconThemeData(color: Appcolor.whitecolor),
        backgroundColor: Appcolor.appBar),
    textTheme: const TextTheme(
        titleLarge: TextStyle(
      fontSize: 28,
    )),
    inputDecorationTheme:  InputDecorationTheme(
        border: OutlineInputBorder(borderSide: const BorderSide(color: Appcolor.border),borderRadius:BorderRadius.circular(10)),
        enabledBorder:
            OutlineInputBorder(borderSide: const BorderSide(color:  Appcolor.border),borderRadius:BorderRadius.circular(10)),
        focusedBorder:
            OutlineInputBorder(borderSide: const BorderSide(color:  Appcolor.border),borderRadius:BorderRadius.circular(10))),
    colorScheme:
        const ColorScheme.light(surface: Colors.white, primary: Colors.black));

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black),
    colorScheme:
        const ColorScheme.dark(surface: Colors.black, primary: Colors.white),
    inputDecorationTheme:  InputDecorationTheme(
        border: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white),borderRadius:BorderRadius.circular(20)),
        enabledBorder:
            OutlineInputBorder(borderSide: const BorderSide(color: Colors.white),borderRadius:BorderRadius.circular(20)),
        focusedBorder:
            OutlineInputBorder(borderSide: const BorderSide(color: Colors.white),borderRadius:BorderRadius.circular(20))),
    textTheme: const TextTheme(titleLarge: TextStyle(fontSize: 28)),
    useMaterial3: true,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey),
    scaffoldBackgroundColor: Colors.black);
