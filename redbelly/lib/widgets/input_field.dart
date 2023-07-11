import 'package:flutter/material.dart';
import '../theme/color_coding.dart';
import '../theme/input_decoration_theme.dart';

class InputField extends StatelessWidget {
  final TextEditingController? controller;
  final InputDecoration? decoration;
  final TextStyle? style;
  final bool obscureText;
  final String? obscuringCharacter;
  final int? maxLines;
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final Icon? suffixIcon;

  const InputField({
    this.controller,
    this.decoration,
    this.style,
    this.obscureText = false,
    this.obscuringCharacter,
    this.maxLines,
    this.labelText,
    this.hintText,
    this.helperText,
    this.errorText,
    this.suffixIcon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(top: 15,bottom: 15),
          decoration: BoxDecoration(
            border: Border.all(
              color: surfaceSwatch[22]!,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              contentPadding: inputDecorationTheme().contentPadding,
              labelText: decoration?.labelText,
              labelStyle: inputDecorationTheme().labelStyle,
              hintText: decoration?.hintText,
              hintStyle: inputDecorationTheme().hintStyle,
              helperText: decoration?.helperText != null ? "" : null,
              helperStyle: inputDecorationTheme().helperStyle,
              errorStyle: const TextStyle(height: 1, fontSize: 1),
              errorText: decoration?.errorText != null ? "" : null,
              suffixIcon: decoration?.suffixIcon,
              suffixIconColor: inputDecorationTheme().suffixIconColor,
              border: inputDecorationTheme().border,
              constraints: maxLines != null ? inputDecorationTheme().constraints : const BoxConstraints(),
            ),
            obscureText: obscureText,
            obscuringCharacter: '*',
            maxLines: maxLines,
          ),
        ),
        decoration?.helperText != null
            ? Column(
                children: [
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      decoration?.helperText as String,
                      style: Theme.of(context).inputDecorationTheme.helperStyle,
                    ),
                  ),
                ],
              )
            : Container()
      ],
    );
  }
}
