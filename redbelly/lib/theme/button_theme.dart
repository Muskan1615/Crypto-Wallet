import 'package:flutter/material.dart';
import 'text_theme.dart';

ElevatedButtonThemeData elevatedButtonTheme({
  VoidCallback? onPressed,
  double? width,
  double? height,
  EdgeInsetsGeometry? padding,
  Color? backgroundColor,
  Color? foregroundColor,
}) {
  return ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(
          backgroundColor ?? Colors.transparent),
      foregroundColor:
          MaterialStateProperty.all<Color>(foregroundColor ?? Colors.white),
      elevation: MaterialStateProperty.all<double>(0),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80),
        ),
      ),
      splashFactory: NoSplash.splashFactory,
      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
      textStyle: MaterialStateProperty.all(
        textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w700),
      ),
      padding: MaterialStateProperty.all(
        padding ??
            const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
      ),
      fixedSize: MaterialStateProperty.all<Size>(
        Size(width ?? 500, height ?? 48),
      ),
    ),
  );
}
