import 'package:flutter/material.dart';
import '../theme/color_coding.dart';
import 'typography.dart';

InputDecorationTheme inputDecorationTheme() {
  return InputDecorationTheme(
    contentPadding: const EdgeInsets.only(
      left: 16.0,
    ),
    labelStyle: textTheme.bodyMedium!.copyWith(
      fontWeight: FontWeight.w600,
      color: surfaceSwatch[12],
    ),
    hintStyle: textTheme.bodySmall!.copyWith(
      fontWeight: FontWeight.w600,
    ),
    helperStyle: textTheme.bodySmall!.copyWith(
      color: surfaceSwatch[12],
    ),
    suffixIconColor: primarySwatch,
    border: InputBorder.none,
    constraints: const BoxConstraints(
      maxHeight: 40,
    ),
  );
}
