import 'package:flutter/material.dart';
import '../theme/color_coding.dart';
import '../theme/input_decoration_theme.dart';

class InputField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final InputDecoration? decoration;
  final TextStyle? style;
  final bool obscureText;
  final String? obscuringCharacter;
  final int? maxLines;
  final String? labelText;
  final String? hintText;
  final Widget? helperText;
  final String? errorText;
  final IconButton? suffixIcon;

  const InputField({
    this.controller,
    this.validator,
    this.onChanged,
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
          padding: const EdgeInsets.only(top: 12, bottom: 12),
          decoration: BoxDecoration(
            border: Border.all(
              color: surfaceSwatch[22]!,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: TextFormField(
            controller: controller,
            validator: validator,
            onChanged: onChanged,
            decoration: InputDecoration(
              contentPadding: inputDecorationTheme().contentPadding,
              labelText: decoration?.labelText,
              labelStyle: inputDecorationTheme().labelStyle,
              hintText: decoration?.hintText,
              hintStyle: inputDecorationTheme().hintStyle,
              helperText: decoration?.helperText != null ? null : null,
              errorText: decoration?.errorText != null ? null : null,
              suffixIcon: decoration?.suffixIcon,
              suffixIconColor: inputDecorationTheme().suffixIconColor,
              border: inputDecorationTheme().border,
              constraints: maxLines != null
                  ? inputDecorationTheme().constraints
                  : const BoxConstraints(),
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
                      style: inputDecorationTheme().helperStyle,
                    ),
                  ),
                ],
              )
            : Container(),
        decoration?.errorText != null
            ? Column(
                children: [
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      decoration?.errorText as String,
                      style: inputDecorationTheme().errorStyle,
                    ),
                  ),
                ],
              )
            : Container()
      ],
    );
  }
}
