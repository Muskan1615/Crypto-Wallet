import 'package:flutter/material.dart';
import '../theme/checkbox.dart';
import '../theme/button.dart';
import '../theme/color_coding.dart';
import '../theme/color.dart';
import '../theme/typography.dart';
import 'app_bar.dart';

final ThemeData theme = ThemeData(
  scaffoldBackgroundColor: surfaceSwatch[24],
  appBarTheme: appBarTheme(textTheme),
  textTheme: textTheme,
  colorScheme: colorScheme,
  elevatedButtonTheme: elevatedButtonTheme(),
  checkboxTheme: checkboxTheme,
);
