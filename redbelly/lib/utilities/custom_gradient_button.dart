import 'package:flutter/material.dart';

class CustomGradientButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final VoidCallback onPressed;
  final Color textColor;
  final double borderRadius;
  final TextStyle textStyle;

  const CustomGradientButton({
    super.key,
    required this.text,
    required this.width,
    required this.height,
    required this.onPressed,
    this.textColor = Colors.white,
    this.borderRadius = 80.0,
    this.textStyle = const TextStyle(
      fontFamily: 'Archivo',
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(138, 212, 236, 1),
            Color.fromRGBO(239, 150, 255, 1),
            Color.fromRGBO(255, 86, 169, 1),
            Color.fromRGBO(255, 170, 108, 1),
          ],
          stops: [0.0, 0.2174, 0.5403, 0.8528],
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: Size(width, height),
          backgroundColor: Colors.transparent,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          textStyle: textStyle,
        ),
        child: Container(
          alignment: Alignment.center,
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}
