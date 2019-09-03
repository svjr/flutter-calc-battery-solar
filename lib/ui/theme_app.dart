import 'package:flutter/material.dart';

final Color purpleMidle = Color(0xFF7D44AA);
final Color purpleLigth = Color(0xFFE5BDFF);
final Color purpleDark = Color(0xFF4f2671);

class ThemeApp {
  ThemeData getThemeApp() {
    return ThemeData(
        iconTheme: IconThemeData(color: purpleLigth, size: 15),
        backgroundColor: purpleDark,
        appBarTheme: AppBarTheme(color: purpleMidle, elevation: 2.0, actionsIconTheme: IconThemeData(color: purpleLigth)),
        floatingActionButtonTheme: FloatingActionButtonThemeData(elevation: 5.0, backgroundColor: purpleDark),
        scaffoldBackgroundColor: purpleDark,
        primaryColor: purpleDark,
        hintColor: purpleMidle,
        textTheme: TextTheme(body1: TextStyle(fontSize: 13, color: purpleLigth, fontWeight: FontWeight.bold)),
        inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(color: purpleLigth),
            suffixStyle: TextStyle(color: purpleLigth),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(4.0), borderSide: BorderSide(color: purpleMidle)),
            border: OutlineInputBorder(borderSide: BorderSide(color: purpleMidle), borderRadius: BorderRadius.circular(4.0))),
        tabBarTheme: TabBarTheme(
            indicator: BoxDecoration(color: purpleMidle),
            unselectedLabelColor: purpleMidle,
            labelColor: purpleLigth,
            labelStyle: TextStyle(color: purpleLigth)));
  }
}
