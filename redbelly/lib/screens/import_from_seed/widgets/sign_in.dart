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
          GestureDetector(
            onTap: () {
              setState(() {
                if (!_isButtonClicked) {
                  _isButtonClicked = true;
                  if (!_isFingerprintEnabled) {
                    _authenticateWithBiometrics();
                  }
                }
              });
            },
            child: Container(
              width: 68,
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                color: _isButtonClicked ? primarySwatch[5] : surfaceSwatch[18],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    left: _isButtonClicked ? 40 : 5,
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _isButtonClicked
                            ? primarySwatch
                            : surfaceSwatch[22],
                      ),
                    ),
                  ),
                ],
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
