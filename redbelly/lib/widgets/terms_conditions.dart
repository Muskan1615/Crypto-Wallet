import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:redbelly/theme/color_coding.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      child: RichText(
        text: TextSpan(
          text: 'By proceeding, you agree to these ',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 18,
                color: surfaceSwatch[9],
                height: 1.5,
              ),
          children: [
            TextSpan(
              text: 'Terms and Conditions.',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 18,
                    color: secondarySwatch[5],
                    decoration: TextDecoration.underline,
                  ),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
          ],
        ),
      ),
    );
  }
}
