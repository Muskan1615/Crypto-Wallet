import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:redbelly/theme/color_coding.dart';

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
            isSelected: [_isFingerprintEnabled],
            onPressed: (index) async {
              if (_isFingerprintEnabled) {
                setState(() {
                  _isFingerprintEnabled = false;
                });
              } else {
                try {
                  bool authenticated = await _localAuthentication.authenticate(
                    localizedReason: 'Authenticate with fingerprint',
                    options: const AuthenticationOptions(biometricOnly: true),
                  );
                  if (authenticated) {
                    setState(() {
                      _isFingerprintEnabled = true;
                    });
                  }
                } catch (e) {
                  print('Error authenticating with fingerprint: $e');
                }
              }
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
