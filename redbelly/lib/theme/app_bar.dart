import 'package:flutter/material.dart';
import '../theme/color_coding.dart';

AppBarTheme appBarTheme(TextTheme textTheme) {
  return AppBarTheme(
    backgroundColor: surfaceSwatch[24],
    foregroundColor: primarySwatch,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(
      size: 24,
      color: primarySwatch,
    ),
    titleTextStyle: textTheme.titleMedium!.copyWith(
      fontWeight: FontWeight.w600,
    ),
  );
}
