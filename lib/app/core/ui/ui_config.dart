import 'package:flutter/material.dart';

class UiConfig {
  UiConfig._();

  static String get title => 'Cuidapet';
  static ThemeData get theme => ThemeData(
        primaryColor: const Color(0XFFA8CE4B),
        primaryColorDark: const Color(0XFF689F38),
        primaryColorLight: const Color(0XFFDDE9C7),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0XFFA8CE4B),
        ),
      );
}
