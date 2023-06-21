import 'package:flutter/material.dart';

final ThemeData theme = ThemeData(
  scaffoldBackgroundColor: const Color.fromRGBO(8, 10, 12, 1),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontFamily: 'AvenirNextLT',
      fontSize: 74,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Archivo',
      fontSize: 40,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    titleSmall: TextStyle(
      fontFamily: 'Archivo',
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
);
