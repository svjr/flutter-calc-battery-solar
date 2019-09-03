import 'package:flutter/material.dart';
import 'package:flutter_calculo_bateria/ui/home.dart';
import 'package:flutter_calculo_bateria/ui/theme_app.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BateriasCalc",
      home: Home(),
      theme: new ThemeApp().getThemeApp()));
}
