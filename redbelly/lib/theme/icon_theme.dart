import 'package:flutter/material.dart';
import '/theme/color_coding.dart';

IconThemeData iconThemeData({
  double? size,
  Color? color,
}) {
  return IconThemeData(
    size: size ?? 24,
    color: color ?? primarySwatch,
  );
}

IconButtonThemeData iconButtonThemeData({
  double? size,
  Color? color,
  double? elevation,
  EdgeInsets? padding,
}) {
  return IconButtonThemeData(
    style: ButtonStyle(
      iconColor: MaterialStatePropertyAll(color ?? primarySwatch),
      iconSize: MaterialStatePropertyAll(size ?? 24),
      elevation: MaterialStatePropertyAll(elevation ?? 0),
      padding: MaterialStatePropertyAll(
        padding ?? const EdgeInsets.only(left: 16.0),
      ),
      splashFactory: NoSplash.splashFactory,
    ),
  );
}
