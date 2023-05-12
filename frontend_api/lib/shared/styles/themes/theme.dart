import 'package:flutter/material.dart';

ThemeData darkTheme=ThemeData(
  primarySwatch: Colors.deepOrange,
  scaffoldBackgroundColor: Colors.black,
  bottomNavigationBarTheme:const  BottomNavigationBarThemeData(
    unselectedItemColor: Colors.white,
    backgroundColor: Colors.black,
  ),
);

ThemeData lightTheme=ThemeData(
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: Colors.white,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    elevation: 0,
    unselectedItemColor: Colors.black,
    backgroundColor: Colors.white,
    selectedItemColor: Colors.blue,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
    ),
    centerTitle: false,
    elevation: 0,
  ),
);