import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import '../theme/color_coding.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final LocalAuthentication _localAuthentication = LocalAuthentication();
  bool _isFingerprintEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        children: [
          Text(
            'Sign in with Face ID?',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          const Spacer(),
          ToggleButtons(
            renderBorder: false,
            isSelected: const [false],
            onPressed: (int index) {
              setState(() {});
            },
            children: [
              Icon(
                Icons.toggle_on,
                color: primarySwatch[5],
                size: 68,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
