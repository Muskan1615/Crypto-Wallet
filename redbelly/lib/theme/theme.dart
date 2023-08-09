import 'package:flutter/material.dart';
import 'input_decoration_theme.dart';
import 'checkbox_theme.dart';
import 'button_theme.dart';
import '../theme/color_coding.dart';
import 'color_scheme.dart';
import 'text_theme.dart';
import 'app_bar_theme.dart';
import 'icon_theme.dart';

ThemeData theme = ThemeData(
  scaffoldBackgroundColor: surfaceSwatch[24],
  appBarTheme: appBarTheme(textTheme),
  textTheme: textTheme,
  colorScheme: colorScheme,
  elevatedButtonTheme: elevatedButtonTheme(),
  checkboxTheme: checkboxTheme,
  inputDecorationTheme: inputDecorationTheme(),
  iconTheme: iconThemeData(),
  iconButtonTheme: iconButtonThemeData(),
);
