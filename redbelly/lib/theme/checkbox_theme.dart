import 'package:flutter/material.dart';
import '../theme/color_coding.dart';

CheckboxThemeData checkboxTheme = CheckboxThemeData(
  checkColor: MaterialStatePropertyAll(primarySwatch),
  fillColor: MaterialStatePropertyAll(primarySwatch[5]),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(4.0),
    side: BorderSide(
      color: primarySwatch[5]!,
    ),
  ),
);
