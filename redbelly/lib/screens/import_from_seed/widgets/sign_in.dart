import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import '../../../theme/color_coding.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final LocalAuthentication _localAuthentication = LocalAuthentication();
  bool _isFingerprintEnabled = false;
  bool _isButtonClicked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Sign in with Face ID?',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          Container(
            width: 68,
            height: 37,
            decoration: BoxDecoration(
              color: _isButtonClicked ? primarySwatch[5] : surfaceSwatch[18],
              borderRadius: BorderRadius.circular(32),
            ),
            child: Transform.scale(
              scale: 1.4,
              child: Switch(
                value: _isButtonClicked,
                onChanged: (value) {
                  setState(() {
                    if (!_isButtonClicked) {
                      _isButtonClicked = true;
                      if (!_isFingerprintEnabled) {
                        _authenticateWithBiometrics();
                      }
                    }
                  });
                },
                activeTrackColor: primarySwatch[5],
                inactiveThumbColor: surfaceSwatch[22],
                inactiveTrackColor: surfaceSwatch[18],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _authenticateWithBiometrics() async {
    bool isAuthenticated = await _localAuthentication.authenticate(
      localizedReason: 'Please complete the biometrics to proceed.',
    );

    setState(() {
      _isFingerprintEnabled = isAuthenticated;
      if (!_isFingerprintEnabled) {
        _isButtonClicked = false;
      }
    });
  }
}
