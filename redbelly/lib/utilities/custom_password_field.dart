import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final EdgeInsets padding;
  final double width;
  final double height;
  final String prefixText;
  final String hintText;
  final String? helperText;
  final bool? obscureText;
  final Icon suffixIcon;
  final Color suffixIconColor;

  const CustomPasswordField({
    super.key,
    required this.controller,
    required this.padding,
    required this.width,
    required this.height,
    required this.prefixText,
    required this.hintText,
    this.helperText,
    this.obscureText,
    required this.suffixIcon,
    required this.suffixIconColor,
  });

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: TextFormField(
        controller: widget.controller,
        obscureText: true,
        obscuringCharacter: '*',
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        decoration: InputDecoration(
          label: Text(
            widget.prefixText,
            style: const TextStyle(
              color: Color.fromRGBO(106, 132, 160, 1),
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 16.0,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
            borderSide: BorderSide(
              color: Color.fromRGBO(24, 30, 37, 1),
            ),
          ),
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          helperText: widget.helperText,
          helperStyle: const TextStyle(
            color: Color.fromRGBO(106, 132, 160, 1),
            fontSize: 12,
          ),
          suffixIcon: widget.suffixIcon,
          suffixIconColor: widget.suffixIconColor,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
            borderSide: BorderSide(color: Color.fromRGBO(24, 30, 37, 1)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
            borderSide: BorderSide(
              color: Color.fromRGBO(24, 30, 37, 1),
            ),
          ),
        ),
      ),
    );
  }
}
