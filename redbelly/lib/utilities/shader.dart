import 'package:flutter/material.dart';

Shader shader(Rect bounds) {
  return const LinearGradient(
    colors: [
      Color.fromRGBO(138, 212, 236, 1),
      Color.fromRGBO(239, 150, 255, 1),
      Color.fromRGBO(255, 86, 169, 1),
      Color.fromRGBO(255, 170, 108, 1),
    ],
    stops: [0.0, 0.2, 0.55, 0.9],
  ).createShader(bounds);
}
