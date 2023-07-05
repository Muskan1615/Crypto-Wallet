import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  final TextEditingController controller;
  final EdgeInsets padding;
  final double width;
  final double height;
  final String prefixText;
  final String hintText;
  final Icon suffixIcon;
  final Color suffixIconColor;

  const CustomInputField({
    super.key,
    required this.controller,
    required this.padding,
    required this.width,
    required this.height,
    required this.prefixText,
    required this.hintText,
    required this.suffixIcon,
    required this.suffixIconColor,
  });

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  @override
  Widget build(BuildContext context) {
    return 
    Padding(
      padding: widget.padding,
      child: 
      TextFormField(
        controller: widget.controller,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        keyboardType: TextInputType.multiline,
        maxLines: null,
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
